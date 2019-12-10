mob/Car/Move()
	..()
	for(var/mob/M in world)
		if(M.vehicle == src)
			M.loc = locate(src.x,src.y,src.z)

mob/Move()
	if(src.vehicle)
		return 0
	..()
	if(src.client)
		for(var/mob/Car/M in world)
			if(M.driver == src)
				M.loc = locate(src.x,src.y,src.z)
				M.dir = usr.dir
				M.Move(locate(src.x,src.y,src.z))

mob/var
	driver
	maxpassengers = 0
	currentpassengers = 0
	vehicle = null

mob/Car
	name = "Grey Car"
	race = "Construction"
	age = 8
	gender1 = "N/A"
	nationality = "?"
	maxpassengers = 10
	see_invisible = 100 // So the driver and passengers get a message that anybody got in.
	icon = 'General.dmi'
	icon_state = "car"
	verb/Hop_In()
		set src in oview(1)
		if(src.driver == null && !usr.vehicle)
			view(src) << "[usr] hops into the [src] and begins driving!"
			usr.invisibility = 100 // To simulate 'inside' the vehicle, can't have it showing the mob, can we!"
			usr.loc = locate(src.x,src.y,src.z)
			src.driver = usr

	verb/Get_Out()
		set src in view(0) // The only way to get into the same location as the bus is to be on the bus, or have no density, thus we have it as this.
		if(src.driver == usr) // Incase it is the driver exiting.
			view(src) << "The driver of the [src] ([usr]) hops out, leaving no driver behind!"
			usr.vehicle = null
			src.driver = null
			walk_rand(usr,2)
			sleep(2)
			walk(usr,0)
			usr.invisibility = 0
			world << usr.vehicle

	Click() // If someone clicks on the bus.
		usr << "The [src] is being driven by [src.driver] along with [src.currentpassengers] passengers."
	DblClick() // If someone DOUBLE clicks on the bus.
		usr << "The current passengers of the [src] driven by [src.driver].."
		for(var/mob/M in world)
			if(M.client)
				if(M.vehicle == src)
					usr << "[M]"
mob/Car2
	name = "Mitsubishi Lancer EVO"
	maxpassengers = 10
	see_invisible = 100 // So the driver and passengers get a message that anybody got in.
	icon = 'General.dmi'
	icon_state = "car9"
	verb/Hop_In()
		set src in oview(1)
		if(src.driver == null && !usr.vehicle)
			view(src) << "[usr] hops into the [src] and begins driving!"
			usr.invisibility = 100 // To simulate 'inside' the vehicle, can't have it showing the mob, can we!"
			usr.loc = locate(src.x,src.y,src.z)
			src.driver = usr

	verb/Get_Out()
		set src in view(0) // The only way to get into the same location as the bus is to be on the bus, or have no density, thus we have it as this.
		if(src.driver == usr) // Incase it is the driver exiting.
			view(src) << "The driver of the [src] ([usr]) hops out, leaving no driver behind!"
			usr.vehicle = null
			src.driver = null
			walk_rand(usr,2)
			sleep(2)
			walk(usr,0)
			usr.invisibility = 0
			world << usr.vehicle

	Click() // If someone clicks on the bus.
		usr << "The [src] is being driven by [src.driver] along with [src.currentpassengers] passengers."
	DblClick() // If someone DOUBLE clicks on the bus.
		usr << "The current passengers of the [src] driven by [src.driver].."
		for(var/mob/M in world)
			if(M.client)
				if(M.vehicle == src)
					usr << "[M]"

///////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////
mob/proc/deathcheck(mob/M as mob)//handles death
	if(M.health<=0)//if is a player
		M.overlays += new /obj/explosion
		M.health = M.maxhealth//resets powerlevel
		M<<"[src] killed you!"//tells you, you were killed.
		M.Deaths += 1//resets powerlevel
		src << "You killed [M]"
		if(M.seenmagic==1)
			src.exposed-=1
			src<<"You killed someone who was exposed to magic"
			M.seenmagic=0
		if(M.Rajin==1)
			src.Rajin_defeated = 1
			src<<"You vanquished Rajin"
			src.Experience += 500
		if(M.Furio==1)
			src.Furio_defeated = 1
			src<<"You vanquished Furio"
			src.Experience += 200
		src.kills += 1
		src.Intelligence += 2
		src.Money += M.Money
		M.Money = 0
		M.death=1
		src.maxhealth += 10
		M.maxhealth -= 5
		M.Strength -= 5
		M.power -= 5
		M.Freeze = 1
		M.Freeze = 0
		src.Experience += (125 * M.level)
		src.Levelup()
		M.exposed=0
		M.inmagicschool=0
		M.indemonschool=0
		sleep(1)
		if(M.rank=="Dark Force Cultist")
			M.Experience+=1000
			M.Levelup()
		if(M.NPC >= 1)
			M.overlays = null
			M.loc = locate(/turf/NPCDeadzone)
			if(M.good==1)
				src.alignpoint -= 1
			if(M.evil==1)
				src.alignpoint += 1
			M.death=0
			M.Money += 50
			if(M.Source==1)
				world<<"<FONT COLOR=red>War information</FONT>: The Source has been vanquished by [src.name] [src.lastname]"
				src.Experience += 5000
				src.Levelup()
			return
		if(M.race=="Kittie")
			world<<"<FONT COLOR=red>War information</FONT>: [src.name] [src.lastname] has killed Kittie!"
		if(M.good == 1)
			src.alignpoint -= 3
			M.loc = locate(/turf/Area/GoodDeath)
			M.overlays = null
			M.icon = 'Goodwitchs.dmi'
			M.icon_state = "death-good"
			src.Experience += 10
			return
		else
			if(M.evil==1)
				src.alignpoint += 3
			M.loc = locate(/turf/Area/EvilDeath)
			M.icon = 'Goodwitchs.dmi'
			M.icon_state = "death-evil"
			src.Experience += 10
			M.overlays = null
		src.AlignmentChecker()
/////////////////////////////
/////////////////////////////
/////////////////////////////
mob
	proc
		Levelup()
			if(src.Experience>=src.maxExperience)//If your exp var equals, or passes your Experience var
				src.level++//Add to your level
				src.Experience=0//resets your exp to 0
				src.maxExperience*=1.1//makes your Experience double
				src.maxEnergy += rand(75,100)
				src.Intelligence += rand(400,500)
				src.maxhealth += rand(450,650)
				src.Strength += rand(425,550)
				src.power += rand(375,425)
				src.Money += rand(75,125)
				src<<"<FONT COLOR=yellow>Client Information</FONT>: You gained a level!"
				src.Statup()
				src.AlignmentChecker()
				src.Class_Checker()
			else
				..()//defaults if the if() doesn't return it's arguments
mob
	proc
		Statup()
			src.maxhealth+=(80 * src.level)//adds to your powerlevel
			src.power+=(50 * src.level)
			src.Strength+=(50 * src.level)
			src.Intelligence+=(45 * src.level)
			src<<"Your stats increase!"//Outputs a message telling you that you gained stats
//Call both of these procs in your attack process here's an example
///////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////

turf/teleport/Heavengate

obj
	GrandElder
		icon = 'Goodwitchs.dmi'
		icon_state = "Elder"
		density = 1
		ranked = 1
/*		verb/Talk()
			set src in oview(1)
			var/a = input("What do you want?")in list("To return home","To become a whitelighter")
			if(a=="To return home")
				usr << "Back to Earth you go"
				usr.loc=locate(/turf/myareagood)
			else
				if(usr.Demon==1)
					usr<<"Your a demon, idiot, now leave"
					usr.loc=locate(/turf/myareaevil)
					return
				if(usr.Darklighter==1)
					usr<<"Your a darklighter, idiot, now leave"
					usr.loc=locate(/turf/myareaevil)
					return
				if(usr.Warlock==1)
					usr<<"Your a warlock, idiot, now leave"
					usr.loc=locate(/turf/myareaevil)
					return
				if(usr.Human==1)
					usr<<"How did you get here?"
					return
				usr << "Ok , here you go, i will inbed you with the powers of a whitelighter, you will lose you're previous powers, and you will need to find a charge for you to protect and assist at all times.."
				usr.race = "Whitelighter"
				usr.Whitelighter = 1
				usr.verbs -= (typesof(/mob/witch/verb/))
				usr.verbs += (typesof(/mob/whitelighter/verb/))
				usr.verbs -= (typesof(/mob/demon/verb/))
				usr.verbs -= (typesof(/mob/darklighter/verb/))
				usr.verbs -= /mob/whitelighter/verb/Orb_object
*/


mob/NPC_redeyes2//Defines a /mob/NPC
	icon = 'Goodwitchs.dmi'
	icon_state = "triad"
	maxhealth = 9000000//different powerlevel than the main mob
	proc/move()//Now, this proc handles NPC movement
		for(var/mob/M in oview())//loops over all mobs in view
			if(get_step_away(src,M,10))//checks distance
				if(!M.client)//Not a player
					continue//continues through the loop
				else//Player
					var/obj/Fastenergy/F = new /obj/Firebolt(src.loc)
					F:owner = "[usr.key]"
					walk_towards(F,M,2)
					sleep(20)
					del(F)
		spawn(5) move()//loops the proc after 2 seconds
	New()//When created
		move()
//////////////
client/Northwest()return 0
client/Northeast()return 0
client/Southwest()return 0
client/Southeast()return 0
///////////////
mob/verb/challenge(mob/M as mob in world)
	set category = "Commands"
	if(usr.erased==1)
		usr<<"You cannot do this while erased"
		return
	if(usr.death==1)
		usr<<"You cannot do this while deadth"
		return
	if(usr.RolePlaying==0)
		usr<<"Your not Role Playing"
		return
	if(M.erased==1)
		usr<<"[M] is erased"
		return
	if(M.death==1)
		usr<<"[M] is death"
		return
	if(M.RolePlaying==0)
		usr<<"[M] isnt Role Playing"
		return
	switch(alert(M,"You have been challenged by [src] do you exept??. Would you like to fight?","","Yes","No"))//If they arent in a guild we ask them to join
		if("Yes")
			if(!M.client)
				return
			else
				src.loc = locate(/turf/teleport/arena)
				src.dir = WEST
				M.loc=locate(/turf/teleport/arena2)
				M.dir = EAST

turf/teleport/arena
turf/teleport/arena2
////////////////////

mob/Shopkeeper
	name = "Shopkeeper"
	icon = 'Goodwitchs.dmi'
	icon_state = "rpnpc"
	density = 1
	race = "Human"
	gender1 = "Male"
	nationality = "Netherlands"
	alignment = "Neutral"
	RolePlaying = 1
	dir = WEST
	maxhealth = 10000000000000000000
	health = 10000000000000000000
	age = 20
	verb
		Buy()
			set src in oview(2)
			set category = "Shop"
			switch(input("What do you want to buy?","Shop",text) in list ("Cellphone (200)", "Nothing"))
				if("Cellphone (200)")
					if(usr.Money>=200)
						usr.contents += new /obj/Cellphone
						usr.hasgsm = 1
						usr.Money -= 200
						usr<<"You bought a cell phone"
					else
						usr<<"You dont have enough money"
				if("Nothing")
					..()
mob/proc
	statuschecker()
		if(usr.RolePlaying==1)
			usr.status = "Role Playing"
		if(usr.RolePlaying==0)
			usr.status = "Safe Zone"

	DemonicNameChecker()
		if(usr.changenames == 0)
			usr.demonname = input("What is your demon name?","Demonic name") as text
			usr.humanname = usr.name
			usr.lastname2 = usr.lastname
			usr.changenames = 1
			..()
		if(usr.changed==1)
			usr.name = usr.demonname
			usr.lastname = null
		if(usr.changed==0)
			usr.name = usr.humanname
			usr.lastname = usr.lastname2
	VampireNameChecker()
		if(usr.changenames == 0)
			usr.vampirename = "Bat"
			usr.humanname = usr.name
			usr.lastname2 = usr.lastname
			usr.changenames = 1
			..()
		if(usr.changed==1)
			usr.name = usr.vampirename
			usr.lastname = null
		if(usr.changed==0)
			usr.name = usr.humanname
			usr.lastname = usr.lastname2
	AlignmentChecker()
		if(usr.alignpoint==100)
			usr.alignstatus = "Neutral"
			usr.neutral = 1
			usr.good = 0
			usr.evil = 0
		if(usr.alignpoint<=99)
			usr.alignstatus = "Evil"
			usr.neutral = 0
			usr.good = 0
			usr.evil = 1
		if(usr.alignpoint>=101)
			usr.alignstatus = "Good"
			usr.neutral = 0
			usr.good = 1
			usr.evil = 0
		src.Class_Checker()
	WerewolfNameChecker()
		if(usr.changenames == 0)
			usr.werewolfname = "Werewolf"
			usr.humanname = usr.name
			usr.lastname2 = usr.lastname
			usr.changenames = 1
			..()
		if(usr.changed==1)
			usr.name = usr.werewolfname
			usr.lastname = null
		if(usr.changed==0)
			usr.name = usr.humanname
			usr.lastname = usr.lastname2
