mob/monster
	New()//when a mob is created
		sleep(20)
		if(isnull(src.client))//if it's not human
			ai_random_wander()//wander
			return..()//continue on with normal New() (create and whatnot)
		else
			return..()


mob/monster
	proc//core procs for the system

		ai_random_wander()//random wander if no mobs are in range to attack
			if(src.key)//if the source is human
				return//don't call the rest
			else
				walk_rand(src,6)//walk randomly with 5 lag
				src.ai_run_away()//checks for run away
				spawn(10)//delay for one tick
					ai_random_wander()//wander some more


		ai_run_away()//used for checking to see if it should run or attack
			if(src.client)
				return
			else
				for(var/mob/M in oview(5,src))//loops over all mobs within 5 tiles of the monster
					if(M.client)//if the mob is human
						if(get_dist(src,M) <= 5 && src.health < M.health)//if the player is close, and the monster is weaker
							walk_away(src,M,5,5)//run away
						else
							src.ai_walk_to()//calls the walk_to (for attacking) proc
					else
						continue//if it's a monster keep looping

		ai_walk_to()
			if(src.client)
				return 0
			else
				for(var/mob/M in oview(5,src))
					if(M.client)
						if(M.Demon==1||M.Warlock==1||M.Darklighter==1||M.HalfDemon==1)
							return
						if(get_dist(src,M) <= 5)//within 5 tiles
							walk_to(src,M,1,5)//walk to the player
							ai_check_dist(src,M)//checks distance
							break//stops the loop
						else
							continue
					else
						continue

		ai_check_dist(mob/monster/NPC,mob/M)
			if(NPC.client)
				return
			else
				if(get_dist(NPC,M) <= 1)//if the monster is one tile away from the player
					NPC.attack(M)//attack!
				else
					return

		attack(mob/M)
			if(M.Selforb==1)
				return
			if(src.race == "Darklighter")
				M.health -= src.Strength
				src.deathcheck(M)
				return
			if(M.Whitelighter==1)
				M.Whitelighter_Death()
				return
			M.health -= src.Strength
			src.deathcheck(M)
			if(!src.client)//it it's not human
				sleep(10)
				src.ai_random_wander()//wander

/*		death(mob/player)//handles death
			src << "You kill [player]!"
			player << "You have been killed!"
			player.loc = locate(rand(1,world.maxx),rand(1,world.maxy),rand(1,world.maxz))
			//relocates the player to a random location
			player.health = initial(health)//resets health
*/

mob/monster
	Demon
		name = "Bounty Hunter"
		Strength = 1000
		power = 1000
		maxhealth = 1000
		health = 1000
		race = "Low Demon"
		gender1 = "Male"
		icon = 'Goodwitchs.dmi'
		icon_state = "Demon"
		align = 90
		age = "?"
		kills
		level = 4
		Intelligence
		Money = 11
		RolePlaying = 1
		NPC = 1
		evil=1
	Demon2
		name = "Upper Level Demon"
		Strength = 100000
		power = 100000
		maxhealth = 50000
		health = 50000
		race = "Upper Level Demon"
		gender1 = "Male"
		icon = 'Goodwitchs.dmi'
		icon_state = "Demon"
		align = 90
		age = "?"
		kills
		level = 12
		Intelligence
		Money = 45
		RolePlaying = 1
		NPC = 1
		evil=1
	Demon3
		name = "Low Level Demon"
		Strength = 3
		power = 6
		maxhealth = 10
		health = 10
		race = "Low Level Demon"
		gender1 = "Male"
		icon = 'Goodwitchs.dmi'
		icon_state = "Demon"
		align = 90
		age = "?"
		kills
		Intelligence
		Money = 6
		level = 1
		RolePlaying = 1
		NPC = 1
		evil=1
	Demon4
		name = "Upper Level Half Demon"
		Strength = 100000
		power = 100000
		maxhealth = 100000
		health = 100000
		race = "Upper Level Half Demon"
		gender1 = "Male"
		icon = 'Goodwitchs.dmi'
		icon_state = "Demon-2"
		align = 90
		age = "?"
		kills
		Intelligence
		level = 13
		Money = 60
		RolePlaying = 1
		NPC = 1
		evil=1
	Warlock
		name = "Weak Warlock"
		Strength = 17
		power = 14
		maxhealth = 40
		health = 40
		race = "Warlock"
		gender1 = "Female"
		icon = 'Goodwitchs.dmi'
		icon_state = "badwitch"
		align = 90
		age = "?"
		kills
		Intelligence
		Money = 15
		RolePlaying = 1
		level = 2
		NPC = 1
		evil=1
	Demon5
		name = "Low Level Half Demon"
		Strength = 3000
		power = 3000
		maxhealth = 3000
		health = 3000
		race = "Half Demon"
		gender1 = "Male"
		icon = 'Goodwitchs.dmi'
		icon_state = "Demon-2"
		align = 90
		age = "?"
		kills
		Intelligence
		Money = 23
		level = 4
		RolePlaying = 1
		NPC = 1
		evil=1
	Demon6
		name = "Low Level Half Demon"
		Strength = 600
		power = 500
		maxhealth = 600
		health = 600
		race = "Half Demon"
		gender1 = "Female"
		icon = 'Goodwitchs.dmi'
		icon_state = "evilchange"
		align = 90
		age = "?"
		kills
		Intelligence
		level = 2
		Money = 40
		RolePlaying = 1
		NPC = 1
		evil=1
	Ultimate_Guard
		name = "Guard of the Ultimate"
		Strength = 1000000
		power = 1000000
		maxhealth = 1200000
		health = 1200000
		race = "Demon"
		gender1 = "Male"
		icon = 'Goodwitchs.dmi'
		icon_state = "Darklighter"
		align = 90
		age = "?"
		kills
		Intelligence = 10000
		Money = 200
		RolePlaying = 1
		NPC = 1
		evil=1
	Darklighter1
		name = "Renegade Darklighter"
		Strength = 100000
		power = 100000
		maxhealth = 100000
		health = 100000
		race = "Darklighter"
		gender1 = "Male"
		icon = 'Goodwitchs.dmi'
		icon_state = "Darklighter"
		align = 90
		age = "?"
		kills = 0
		Intelligence = 5000
		Money = 170
		level = 11
		RolePlaying = 1
		NPC = 1
		evil=1
	Darklighter2
		name = "Low Darklighter"
		Strength = 500
		power = 500
		maxhealth = 800
		health = 800
		race = "Darklighter"
		gender1 = "Male"
		icon = 'Goodwitchs.dmi'
		icon_state = "Darklighter"
		align = 90
		age = "?"
		kills = 0
		Intelligence = 5000
		Money = 50
		level = 2
		RolePlaying = 1
		NPC = 1
		evil=1

mob/var
	NPC

turf/NPCDeadzone
	name = "DeadZone"

turf/npc/NPC_Respawn1//the name of our turf
	Entered(mob/M)
		if(istype(M,/mob))//is it a mob that entered?
			M.loc=locate(/turf/npc/spawn1)
turf/npc/NPC_Respawn2//the name of our turf
	Entered(mob/M)
		if(istype(M,/mob))//is it a mob that entered?
			M.loc=locate(/turf/npc/spawn2)
turf/npc/NPC_Respawn3//the name of our turf
	Entered(mob/M)
		if(istype(M,/mob))//is it a mob that entered?
			M.loc=locate(/turf/npc/spawn3)
turf/npc/NPC_Respawn4//the name of our turf
	Entered(mob/M)
		if(istype(M,/mob))//is it a mob that entered?
			M.loc=locate(/turf/npc/spawn4)

turf/npc/spawn1
turf/npc/spawn2
turf/npc/spawn3
turf/npc/spawn4