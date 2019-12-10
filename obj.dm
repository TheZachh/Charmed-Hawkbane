obj
	tile44
		icon = 'General.dmi'
		icon_state = "tile44"
		density = 1
obj
	tile4433
		icon = 'General.dmi'
		icon_state = "tile42"
		density = 1

obj
	Elder
		icon = 'Goodwitchs.dmi'
		icon_state = "Elder"
		density = 1
		ranked = 1
obj
	Triad
		icon = 'Goodwitchs.dmi'
		icon_state = "triad"
		density = 1
		ranked = 1
obj
	Triad_master
		name = "Triad"
		icon = 'Goodwitchs.dmi'
		icon_state = "triad"
		ranked = 1
		density = 1
		verb/Talk()
			set src in oview(1)
			var/a = input("What do you want?")in list("To return home","To kill you!!")
			if(a=="To return home")
				usr << "Back to Earth you go"
				usr.loc=locate(/turf/myareaevil)
			if(a=="To kill you!!")
				usr << "Dont make me laugh, im the source of all evills right hand man, now be gone"
				usr.loc=locate(/turf/myareaevil)
obj
	Upper_Demon_Vanquish_Potion
		var/thrownby
		icon = 'Items.dmi'
		icon_state = "vanquish_potion"
		density=1
		verb
			Throw()
				thrownby = usr
				walk(src,usr.dir,0)
				sleep(8)
				if(src)
					del(src)
			Get()
				set src in oview(1)
				src.loc = usr
				usr << "You pickup [src]."
			Drop()
				set src in usr
				src.loc = usr.loc
				usr << "You drop [src]."
		Bump(atom/M)
			if(istype(M,/mob/))
				for(var/mob/N in world)
					if(M:race=="Upper Level Demon")
						N<<"You hit [M]!"
						M<<"You were hit by [N]!"
						M:health -= M:maxhealth*2
						N.power += 1
						N:deathcheck(M)
				del(src)
			else
				..()
			if(istype(M,/obj/))
				spawn(1)
					M.overlays = null
					spawn(1)
						M.overlays = null
						spawn(1)
							M.overlays = null
							del(M)

				del(src)
			else
				..()

	Low_Demon_Vanquish_Potion
		var/thrownby
		icon = 'Items.dmi'
		icon_state = "vanquish_potion"
		density=1
		verb
			Throw()
				thrownby = usr
				walk(src,usr.dir,0)
				sleep(8)
				if(src)
					del(src)
			Get()
				set src in oview(1)
				src.loc = usr
				usr << "You pickup [src]."
			Drop()
				set src in usr
				src.loc = usr.loc
				usr << "You drop [src]."
		Bump(atom/M)
			if(istype(M,/mob/))
				for(var/mob/N in world)
					if(M:race=="Low Level Demon")
						N<<"You hit [M]!"
						M<<"You were hit by [N]!"
						M:health -= M:maxhealth*2
						N.power += 1
						N:deathcheck(M)
				del(src)
			else
				..()
			if(istype(M,/obj/))
				spawn(1)
					M.overlays = null
					spawn(1)
						M.overlays = null
						spawn(1)
							M.overlays = null
							del(M)

				del(src)
			else
				..()

	Darklighter_Vanquish_Potion
		var/thrownby
		icon = 'Items.dmi'
		icon_state = "vanquish_potion"
		density=1
		verb
			Throw()
				thrownby = usr
				walk(src,usr.dir,0)
				sleep(8)
				if(src)
					del(src)
			Get()
				set src in oview(1)
				src.loc = usr
				usr << "You pickup [src]."
			Drop()
				set src in usr
				src.loc = usr.loc
				usr << "You drop [src]."
		Bump(atom/M)
			if(istype(M,/mob/))
				for(var/mob/N in world)
					if(M:race=="Darklighter")
						N<<"You hit [M]!"
						M<<"You were hit by [N]!"
						M:health -= M:maxhealth*2
						N.power += 1
						N:deathcheck(M)
				del(src)
			else
				..()
			if(istype(M,/obj/))
				spawn(1)
					M.overlays = null
					spawn(1)
						M.overlays = null
						spawn(1)
							M.overlays = null
							del(M)

				del(src)
			else
				..()

	Warlock_Vanquish_Potion
		var/thrownby
		icon = 'Items.dmi'
		icon_state = "vanquish_potion"
		density=1
		verb
			Throw()
				thrownby = usr
				walk(src,usr.dir,0)
				sleep(8)
				if(src)
					del(src)
			Get()
				set src in oview(1)
				src.loc = usr
				usr << "You pickup [src]."
			Drop()
				set src in usr
				src.loc = usr.loc
				usr << "You drop [src]."
		Bump(atom/M)
			if(istype(M,/mob/))
				for(var/mob/N in world)
					if(M:race=="Warlock")
						N<<"You hit [M]!"
						M<<"You were hit by [N]!"
						M:health -= M:maxhealth*2
						N.power += 1
						N:deathcheck(M)
				del(src)
			else
				..()
			if(istype(M,/obj/))
				spawn(1)
					M.overlays = null
					spawn(1)
						M.overlays = null
						spawn(1)
							M.overlays = null
							del(M)

				del(src)
			else
				..()

	Magic_School_Potion
		icon = 'Items.dmi'
		icon_state = "teleport_potion"
		density = 1
		verb
			Throw()
				usr << "You throw the potion below you."
				usr.loc = locate(/turf/NewWorld/Teleport/School/MagicSchool)
				del(src)
			Get()
				set src in oview(1)
				src.loc = usr
				usr << "You pickup [src]"
			Drop()
				set src in usr
				src.loc = usr.loc
				usr << "You drop [src]"

var
	mob
		randommagic

obj
	book_of_secretarts
		icon = 'General.dmi'
		icon_state = "book4"
		density = 1
		verb/Get_Book()
			set src in oview(1)
			set name = "Get book"
			if(usr.power>=150000)
				Move(usr)
				view(9)<<"[usr] takes the [src]"
			else
				usr<<"Your dont have the power to take the book"
		verb/Drop_book()
			usr<<"You drop the book"
			src.loc=locate(usr.x,usr.y+1,usr.z)
		verb/Read_book()
			set src in oview(1)
			var/a = input("Do you wont to study or search for spell?")in list("study")
			if(a=="study")
				if(usr.Energy >= 0)
					if(usr.reading==1)
						return
					usr << "You begin to study"
					usr.reading = 1
					spawn(6)
						usr << "You finnish studying"
						usr.maxEnergy += 4
						usr.power += rand(0,3)
						usr.Energy -= 4

						usr.Intelligence += 25
						usr.reading=0
				else
					usr << "You are to tired to do this"
			if(a=="search for spell")
				usr << "you begin to search"
				usr.Freeze = !usr.Freeze
				sleep(20)
				usr.Freeze = 0
				usr << "you stoped searching"
				randommagic = rand(1,10)
				if(randommagic == 1)
					usr.Freeze = 0
					spawn(15)
					if(usr.Spellsfound1 == 1)
						usr << "you found a spell you already have, good luck next time"
						usr.Freeze = 0
						return
					else
						usr.Freeze = 0
						usr.Spellsfound1 = 1
						usr.Spells += "Spell : to summon a demon"
						usr.Spells += "Magic forces black and white Reach out though space and light Be he far or be he near Bring us the demon (persons name) here"
						usr.Spells += "...May need more than one witch..."
				if(randommagic == 7)
					usr.Freeze = 0
					spawn(15)
					if(usr.Spellsfound2 == 1)
						usr << "you found a spell you already have, good luck next time"
						usr.Freeze = 0
						return
					else
						usr.Freeze = 0
						usr.Spellsfound2 += 1
						usr.Spells += "Spell : to form a powerfull force field"
						usr.Spells += "Knowledge and reverence"
						usr.Spells += "...need 2 good witch's, the more you have the stronger it gets..."

///
obj
	Book_of_demons
		icon = 'General.dmi'
		icon_state = "book5"
		density = 1
		verb/Get_Book()
			set src in oview(1)
			set name = "Get book"
			if(usr.power>=250000)
				Move(usr)
				view(9)<<"[usr] takes the [src]"
			else
				usr<<"Your dont have the power to take the book"
		verb/Drop_book()
			usr<<"You drop the book"
			src.loc=locate(usr.x,usr.y+1,usr.z)
		verb/Read_book()
			set src in oview(1)
			var/a = input("Do you wont to study or search for spell?")in list("study","search for spell")
			if(a=="study")
				if(usr.Energy >= 0)
					if(usr.reading==1)
						return
					usr << "You begin to study"
					usr.reading = 1
					usr.Freeze = 0
					spawn(6)
						usr << "You finnish studying"
						usr.Freeze = 0
						usr.maxEnergy += 4
						usr.power += rand(0,6)
						usr.Energy -= 4

						usr.Strength += rand(16,28)
						usr.reading = 0
				else
					usr << "You are to tired to do this"

			if(a=="search for spell")
				usr << "you begin to search"
				usr.Freeze = !usr.Freeze
				sleep(20)
				usr.Freeze = 0
				usr << "you stoped searching"
				randommagic = rand(1,10)
				if(randommagic == 3)
					usr.Freeze = 0
					spawn(15)
					if(usr.Spellsfound3 == 1)
						usr << "you found a spell you already have, good luck next time"
						usr.Freeze = 0
						return
					else
						usr.Freeze = 0
						usr.Spellsfound3 += 1
						usr.Spells += "Spell : to return a demon to hell"
						usr.Spells += "Spirits of air, forest and sea, set us of this demon free, beasts of hoof and beasts of shell, drive this (name) back to hell"
						usr.Spells += "...can only be used on a demon once per login..."
obj
	Book_of_Light
		icon = 'General.dmi'
		icon_state = "book2"
		density = 1
		verb/Get_Book()
			set src in oview(1)
			set name = "Get book"
			if(usr.power>=150000)
				Move(usr)
				view(9)<<"[usr] takes the [src]"
			else
				usr<<"Your dont have the power to take the book"
		verb/Drop_book()
			usr<<"You drop the book"
			src.loc=locate(usr.x,usr.y+1,usr.z)
		verb/Read_book()
			set src in oview(1)
			var/a = input("Do you wont to study or search for spell?")in list("study","search for spell")
			if(a=="study")
				if(usr.Energy <= 0)
					if(usr.reading==1)
						return
					usr << "You begin to study"
					usr.reading = 1
					usr.Freeze = !usr.Freeze
					spawn(5)
						usr << "You finnish studying"
						usr.Freeze = 0
						usr.maxEnergy += 4
						usr.Energy -= 4

						usr.Intelligence += rand(0,3)
						usr.maxhealth += rand(10,25)


						usr.reading = 0

			if(a=="search for spell")
				usr << "you begin to search"
				usr.Freeze = !usr.Freeze
				sleep(20)
				usr.Freeze = 0
				usr << "you stoped searching"
				randommagic = rand(1,10)
				if(randommagic == 4)
					usr.Freeze = 0
					spawn(15)
					if(usr.Spellsfound4 == 1)
						usr << "you found a spell you already have, good luck next time"
						usr.Freeze = 0
						return
					else
						usr.Freeze = 0
						usr.Spellsfound4 += 1
						usr.Spells += "Spell : to search for a demon"
						usr.Spells += "Let the piercing cry that feeds on pain, and leaves more sorrow then it gains. Shall now be heard by one who seeks, to stop the havoc that it wreaks"

				if(randommagic == 6)
					usr.Freeze = 0
					spawn(15)
					if(usr.Spellsfound6 == 1)
						usr << "you found a spell you already have, good luck next time"
						usr.Freeze = 0
						return
					else
						usr.Freeze = 0
						usr.Spellsfound6 += 1
						usr.Spells += "Spell : To sence good or evil in the room"
						usr.Spells += "As the flame lights shadows, and truth ends fear, open lost thoughts, to my willing ear"

obj
	The_Grim
		name = "Grimoire"
		icon = 'General.dmi'
		icon_state = "book1"
		density = 1
		source = 0
		ceremonyperformer = ""
		verb/Get_Book()
			set src in oview(1)
			set name = "Get book"
			if(usr.evil==1)
				if(usr.power>=1000000)
					Move(usr)
					view(9)<<"[usr] takes the [src]"
				else
					usr<<"Your dont have the power to take the book"
			else if(usr.power >=150000)
				Move(usr)
				view(9)<<"[usr] takes the [src]"
		verb/Drop_book()
			usr<<"You drop the book"
			src.loc=locate(usr.x,usr.y+1,usr.z)
		verb/Read_book()
			set src in oview(1)
			var/a = input("Do you wont to study or search for spell?")in list("study","search for spell")
			if(a=="study")
				if(usr.Energy >= 0)
					if(usr.reading==1)
						return
					usr << "You begin to study"
					usr.reading = 1
					usr.Freeze = 0
					spawn(6)
						usr << "You finnish studying"
						usr.power += rand(16,21)
						usr.Freeze = 0
						usr.maxEnergy += 3

						usr.Energy -= 3
						usr.Intelligence += rand(0,3)


						usr.reading = 0
				else
					usr << "You are to tired to do this"
			if(a=="search for spell")
				usr << "you begin to search"
				usr.Freeze = !usr.Freeze
				sleep(20)
				usr.Freeze = 0
				usr << "you stoped searching"
				randommagic = rand(1,10)
				if(randommagic == 5)
					usr.Freeze = 0
					spawn(15)
					if(usr.Spellsfound5 == 1)
						usr << "you found a spell you already have, good luck next time"
						usr.Freeze = 0
						return
					else
						usr.Freeze = 0
						usr.Spellsfound5 += 1

		verb/Say_Spell(msg as text)
			set src in oview(1)
			if(findtext(msg,"Msolus into exitus omne"))
				if(src.source==0)
					usr<<"You have passed the ceremony to absorb the Source power"
					src.source += 1
					world<<"<i><font color=yellow>[usr] has used the Grimoire to obtain the sources power</font color></i>"
					usr<<"contact a admin to give you the power"
					usr.obtainsource = 1
					src.ceremonyperformer = usr.name
				else
					usr<<"Someone already performed the ceremony"
			else
				usr<<"Nothing happens"



obj
	The_Book_Of_Shadows
		icon = 'Goodwitchs.dmi'
		icon_state = "book6"
		density = 1
		verb/Get_Book()
			set src in oview(1)
			set name = "Get book"
			if(usr.good==1)
				if(usr.power>=245000)
					Move(usr)
					view(9)<<"[usr] takes the [src]"
				else
					usr<<"Your dont have the power to take the book"
			else if(usr.power>=500000)
				Move(usr)
				view(9)<<"[usr] takes the [src]"
		verb/Drop_book()
			usr<<"You drop the book"
			src.loc=locate(usr.x,usr.y+1,usr.z)
		verb/Read_book()
			set src in oview(1)
			var/a = input("Do you wont to study or search for spell?")in list("study","search for spell")
			if(a=="study")
				if(usr.Energy >= 0)
					if(usr.reading==1)
						return
					usr << "You begin to study"
					usr.reading = 1
					usr.Freeze = !usr.Freeze
					spawn(6)
						usr << "You finnish studying"
						usr.Freeze = 0
						usr.maxEnergy += 4
						usr.power += rand(5,13)

						usr.Energy -= 3
						usr.Strength += rand(6,14)
						usr.maxhealth += 2
						usr.Intelligence += 3


						usr.reading = 0
				else
					usr << "You are to tired to do this"

			if(a=="search for spell")
				usr << "you begin to search"
				usr.Freeze = 0
				sleep(20)
				usr.Freeze = 0
				usr << "you stoped searching"
				randommagic = rand(1,10)
				if(randommagic == 7)
					usr.Freeze = 0
					spawn(15)
					if(usr.Spellsfound7 == 1)
						usr << "you found a spell you already have, good luck next time"
						usr.Freeze = 0
						return
					else
						usr.Freeze = 0
						usr.Spellsfound7 += 1
						usr.Spells += "Spell : To call for youre lost power"
						usr.Spells += "Powers of the witches, rise unseen across the skies, come to us who call you near, come to us and settle here"
				if(randommagic == 4)
					usr.Freeze = 0
					spawn(15)
					if(usr.Spellsfound8 == 1)
						usr << "you found a spell you already have, good luck next time"
						usr.Freeze = 0
						return
					else
						usr.Freeze = 0
						usr.Spellsfound8 += 1
						usr.Spells += "Spell : To reveal a hidden personne"
						usr.Spells += "In this tween time, this darkest hour I call upon the sacred power. I myself stand alone command name to be shown."
//////////////////////////////
mob
	var
		Training_machine
mob
	Training_machine
		icon = 'General.dmi'
		icon_state = "Training machine"
		density = 1
		key = "Training machine"
		race = "Construction"
		gender1 = "N/A"
		age = "?"
		health = 9999999999999999999999
		nationality = "N/A"
		verb/Train()
			set src in oview(1)
			if(usr.Selforb==1)
				return
			var/a = input("Do you want to Train?")in list("yes","no")
			if(a=="yes")
				if(usr.Energy >= 0)
					if(usr.Selforb==1)
						usr<<"You may not start out in orb"
						return
					usr.Training_machine = 1
					usr << "Your training will start in a few seconds ,stay in the blue box"
					spawn(10)
						for(var/mob/M in view(7,src))
							if(M.Training_machine == 1)
								var/obj/Fastenergy/F = new /obj/Firebolt3(src.loc)
								F:owner = "[usr.key]"
								walk_towards(F,M,2)
								sleep(15)
								del(F)
								var/obj/Fastenergy/D = new /obj/Firebolt3(src.loc)
								D:owner = "[src.key]"
								walk_towards(D,M,2)
								for(var/mob/P in view(7,src))
									if(P.Training_machine == 1)
										P.Training_machine = 2
								sleep(20)
								del(D)
								sleep(10)
								if(M.Training_machine == 2)
									M << "Well done"
									M.maxhealth += rand(5,20)
									M.maxEnergy += rand(3,20)
									M.Experience += rand(50,75)
									M.Strength += rand(3,20)

									M.power += rand(3,20)
									M.Training_machine = 0
									M.Levelup()

								else
									M << "You were ever hit or you left the training area marked out, read the rules to the side for more info, better luck next time"
				else
					usr << "You are to tired to do this"

	Training_machine2
		icon = 'General.dmi'
		icon_state = "Training machine 2"
		density = 1
		key = "Training machine"
		race = "Construction"
		gender1 = "N/A"
		age = "?"
		health = 9999999999999999999999
		nationality = "N/A"
		verb/Train()
			set src in oview(1)
			if(usr.Selforb==1)
				return
			var/a = input("Do you want to Train?")in list("yes","no")
			if(a=="yes")
				if(usr.power <= 750)
					usr << "Your not ready for this training yet, come back when your a bit stronger"
					return
				if(usr.Energy >= 0)
					if(usr.Selforb==1)
						usr<<"You may not start out in orb"
						return
					usr.Training_machine = 1
					usr << "Your training will start in a few seconds ,stay in the red box"
					spawn(10)
						for(var/mob/M in view(7,src))
							if(M.Training_machine == 1)
								var/obj/Fastenergy/F = new /obj/waterball(src.loc)
								F:owner = "[usr.key]"
								walk_towards(F,M,2)
								sleep(15)
								del(F)
								var/obj/Fastenergy/D = new /obj/waterball(src.loc)
								D:owner = "[src.key]"
								walk_towards(D,M,2)
								for(var/mob/P in view(7,src))
									if(P.Training_machine == 1)
										P.Training_machine = 2
								sleep(20)
								del(D)
								sleep(10)
								if(M.Training_machine == 2)
									M << "Nice done"
									M.maxhealth += rand(15,35)
									M.maxEnergy += rand(12,25)
									M.Experience += rand(100,150)
									M.Strength += rand(14,33)
									M.power += rand(14,33)
									M.Training_machine = 0
									M.Levelup()

								else
									M << "You were ever hit or you left the training area marked out, read the rules to the side for more info, better luck next time"
				else
					usr << "You are to tired to do this"
	Training_machine3
		icon = 'General.dmi'
		icon_state = "Training machine 3"
		density = 1
		key = "Training machine"
		race = "Construction"
		gender1 = "N/A"
		age = "?"
		nationality = "N/A"
		health = 9999999999999999999999
		verb/Train()
			set src in oview(1)
			if(usr.Selforb==1)
				return
			var/a = input("Do you want to Train?")in list("yes","no")
			if(a=="yes")
				if(usr.power <= 2000)
					usr << "Your not ready for this training yet, come back when your a bit stronger"
					return
				if(usr.Energy >= 0)
					if(usr.Selforb==1)
						usr<<"You may not start out in orb"
						return
					usr.Training_machine = 1
					usr << "Your training will start in a few seconds ,stay in the green box"
					spawn(10)
						for(var/mob/M in view(7,src))
							if(M.Training_machine == 1)
								var/obj/Fastenergy/F = new /obj/darkenergyball(src.loc)
								F:owner = "[usr.key]"
								walk_towards(F,M,2)
								sleep(15)
								del(F)
								var/obj/Fastenergy/D = new /obj/darkenergyball(src.loc)
								D:owner = "[src.key]"
								walk_towards(D,M,2)
								for(var/mob/P in view(7,src))
									if(P.Training_machine == 1)
										P.Training_machine = 2
								sleep(20)
								del(D)
								sleep(10)
								if(M.Training_machine == 2)
									M << "Great done"
									M.maxhealth += rand(30,50)
									M.maxEnergy += rand(15,40)
									M.Experience += rand(200,275)
									M.Strength += rand(25,45)
									M.power += rand(25,45)
									M.Training_machine = 0
									M.Levelup()

								else
									M << "You were ever hit or you left the training area marked out, read the rules to the side for more info, better luck next time"
				else
					usr << "You are to tired to do this"

obj
	Firebolt3
		var
			power = 10

		icon='General.dmi'
		icon_state = "fireball"
		density = 1
		Bump(atom/M)
			if(istype(M,/mob/))
				for(var/mob/N in world)
					if(src.owner == "[N.key]")
						N<<"You hit Training_machine!"

						M:Training_machine = 0
						for(var/obj/Firebolt/T in world)
							if(T:owner == "[N.key]")
								del(T)
				del(src)
			else
				..()
			if(istype(M,/obj/))
				spawn(1)
					M.overlays = null
					spawn(1)
						M.overlays = null
						spawn(1)
							M.overlays = null
							del(M)


				del(src)
			else
				..()
mob
	Training_machine4
		icon = 'General.dmi'
		icon_state = "Training machine 4"
		density = 1
		key = "Training machine"
		race = "Construction"
		gender1 = "N/A"
		age = "?"
		nationality = "N/A"
		indemonschool = 1
		health = 9999999999999999999999
		verb/Train()
			set src in oview(1)
			if(usr.Selforb==1)
				return
			var/a = input("Do you want to Train?")in list("yes","no")
			if(a=="yes")
				if(usr.power <= 5000)
					usr << "Your not ready for this training yet, come back when your a bit stronger"
					return
				if(usr.Energy >= 0)
					if(usr.Selforb==1)
						usr<<"You may not start out in orb"
						return
					usr.Training_machine = 1
					usr << "Your training will start in a few seconds ,stay in the purple box"
					spawn(10)
						for(var/mob/M in view(7,src))
							if(M.Training_machine == 1)
								var/obj/Fastenergy/F = new /obj/HiVoBolt(src.loc)
								F:owner = "[usr.key]"
								walk_towards(F,M,2)
								sleep(15)
								del(F)
								var/obj/Fastenergy/D = new /obj/DarkBolt(src.loc)
								D:owner = "[src.key]"
								walk_towards(D,M,2)
								for(var/mob/P in view(7,src))
									if(P.Training_machine == 1)
										P.Training_machine = 2
								sleep(20)
								del(D)
								sleep(10)
								if(M.Training_machine == 2)
									M << "Good job"
									M.maxhealth += rand(45,75)
									M.maxEnergy += rand(25,50)
									M.Experience += rand(450,500)
									M.Strength += rand(25,40)
									M.power += rand(25,40)
									M.Training_machine = 0
									M.Levelup()

								else
									M << "You were ever hit or you left the training area marked out, read the rules to the side for more info, better luck next time"
				else
					usr << "You are to tired to do this"

turf
	Training_book
		icon = 'magicitems.dmi'
		icon_state = "openbook2"
		density = 1
		verb/Read_book()
			set src in oview(1)
			if(usr.Energy >= 0)
				if(usr.reading==1)
					return
				usr << "You begin to study"
				usr.reading = 1
				usr.Freeze = !usr.Freeze
				spawn(8)
					usr << "You finnish studying"
					usr.Freeze = 0
					usr.maxEnergy += 2

					usr.Energy -= 4
					usr.Intelligence += 3
					usr.power += rand(1,4)
					usr.Experience += rand(0,1)
					usr.reading = 0
					usr.Levelup()
turf
	Training_book_Strength
		icon = 'magicitems.dmi'
		icon_state = "openbook4"
		density = 1
		verb/Read_book()
			set src in oview(1)
			if(usr.Energy >= 0)
				if(usr.reading==1)
					return
				usr << "You begin to study"
				usr.reading = 1
				usr.Freeze = !usr.Freeze
				spawn(8)
					usr << "You finnish studying"
					usr.Freeze = 0
					usr.maxEnergy += 3

					usr.Energy -= 4
					usr.Strength += rand(15,30)
					usr.power += 5
					usr.reading = 0
turf
	Training_book_Intelligence
		icon = 'magicitems.dmi'
		icon_state = "openbook5"
		density = 1
		verb/Read_book()
			set src in oview(1)
			if(usr.Energy >= 0)
				if(usr.reading==1)
					return
				usr << "You begin to study"
				usr.reading = 1
				usr.Freeze = !usr.Freeze
				spawn(8)
					usr << "You finnish studying"
					usr.Freeze = 0
					usr.maxEnergy += 3

					usr.Energy -= 4
					usr.Intelligence += rand(15,30)
					usr.power += rand(1,5)
					usr.reading = 0
turf
	Training_book_Intelligence_2
		icon = 'magicitems.dmi'
		icon_state = "openbook3"
		density = 1
		verb/Read_book()
			set src in oview(1)
			if(usr.Energy >= 0)
				if(usr.reading==1)
					return
				usr << "You begin to study"
				usr.reading = 1
				usr.Freeze = !usr.Freeze
				spawn(8)
					usr << "You finnish studying"
					usr.Freeze = 0
					usr.maxEnergy += 5

					usr.Energy -= 6
					usr.Intelligence += rand(25,43)
					usr.power += rand(2,8)
					usr.reading = 0
turf
	Training_book_Health
		icon = 'magicitems.dmi'
		icon_state = "openbook3"
		density = 1
		verb/Read_book()
			set src in oview(1)
			if(usr.Energy >= 0)
				if(usr.reading==1)
					return
				usr << "You begin to study"
				usr.reading = 1
				usr.Freeze = 0
				spawn(8)
					usr << "You finnish studying"
					usr.Freeze = 0
					usr.maxEnergy += 3

					usr.Energy -= 4
					usr.maxhealth += rand(10,25)
					usr.power += 5
					usr.reading = 0
obj
	Training_book2
		name = "Intelligence book"
		icon = 'magicitems.dmi'
		icon_state = "openbook1"
		density = 1
		verb/Read_book()
			set src in oview(1)
			if(usr.Energy >= 0)
				if(usr.power<=150000)
					usr<<"Your not strong enough to use this yet"
					return
				if(usr.reading==1)
					return
				usr << "You begin to study"
				usr.reading = 1
				usr.Freeze = 0
				spawn(6)
					usr << "You finnish studying"
					usr.Freeze = 0
					usr.maxEnergy += 20

					usr.Strength += rand(0,4)
					usr.maxhealth += rand(1,6)
					usr.Energy -= 9
					usr.Intelligence += rand(18,25)
					usr.Experience += rand(1,7)
					usr.power += rand(0,4)

					usr.reading = 0
					usr.Levelup()
obj
	Book_of_The_HGM
		icon = 'General.dmi'
		icon_state = "book3"
		density = 1
		verb/Get_Book()
			set src in oview(1)
			set name = "Get book"
			if(usr.key=="YOUR NAME HERE")
				Move(usr)
				view(9)<<"[usr] takes the [src]"
			else if(usr.power>=500000)
				Move(usr)
				view(9)<<"[usr] takes the [src]"
		verb/Drop_book()
			usr<<"You drop the book"
			src.loc=locate(usr.x,usr.y+1,usr.z)
		verb/Read_book()
			set src in oview(1)
			if(usr.Energy >= 0)
				if(usr.reading==1)
					return
				usr << "You begin to study"
				usr.reading = 1
				usr.Freeze = 0
				spawn(6)
					usr << "You finnish studying"
					usr.Freeze = 0
					usr.maxEnergy += 5
					usr.power += rand(25,45)
					usr.Strength += rand(15,25)
					usr.Energy -= 10

					usr.Intelligence += rand(5,15)
					usr.maxhealth += rand(20,25)
					usr.Experience += rand(1,7)
					usr.Levelup()


					usr.reading = 0
			else
				usr << "You are to tired to do this"
obj
	Book_of_Zeniox
		icon = 'General.dmi'
		icon_state = "book3"
		name = "Book of Kyros"
		density = 1
		verb/Get_Book()
			set src in oview(1)
			set name = "Get book"
			if(usr.key=="Zeniox")
				Move(usr)
				view(9)<<"[usr] takes the [src]"
				return
			else if(usr.power>=500000)
				Move(usr)
				view(9)<<"[usr] takes the [src]"
		verb/Drop_book()
			usr<<"You drop the book"
			src.loc=locate(usr.x,usr.y+1,usr.z)
		verb/Read_book()
			set src in oview(1)
			if(usr.Energy >= 0)
				if(usr.reading==1)
					return
				usr << "You begin to study"
				usr.reading = 1
				usr.Freeze = 0
				spawn(6)
					usr << "You finnish studying"
					usr.Freeze = 0
					usr.maxEnergy += 4
					usr.power += rand(8,17)
					usr.Strength += rand(1,7)
					usr.Energy -= 5

					usr.Intelligence += rand(3,11)
					usr.maxhealth += 3
					usr.Experience += rand(0,2)
					usr.Levelup()


					usr.reading = 0
			else
				usr << "You are to tired to do this"
/*obj/key
	SyncWolfs_Key
		density = 1
		icon = 'Items.dmi'
		icon_state = "key"
		verb
			Drop_Key(src in usr.contents)
				usr<<"You drop the key"
				src.loc=locate(usr.x,usr.y+1,usr.z)
			Get_Key()
				set src in view(1)
				view(9)<<"[usr] has picked up the key"
				Move(usr)
obj/key
	Zeniox_Key
		density = 1
		icon = 'Items.dmi'
		icon_state = "key"
		verb
			Drop_Key(src in oview(1))
				usr<<"You drop the key"
				src.loc=locate(usr.x,usr.y+1,usr.z)
			Get_Key()
				set src in oview(1)
				view(9)<<"[usr] has picked up the key"
				Move(usr)

obj/key
	Charmed_Key
		name = "Charmed manor key"
		density = 1
		icon = 'Items.dmi'
		icon_state = "key"
		verb
			Drop_Key(src in oview(1))
				usr<<"You drop the key"
				src.loc=locate(usr.x,usr.y+1,usr.z)
			Get_Key()
				set src in oview(1)
				view(9)<<"[usr] has picked up the key"
				Move(usr)*/

obj
	Avatar_Potion
		icon = 'Items.dmi'
		icon_state = "avatar_potion"
		density = 0
		Bump(atom/M)
			if(istype(M,/mob/))
				for(var/mob/N in world)
					if(src.owner == "[N.key]")
						if(M:rank=="Avatar")
							N<<"You hit [M]!"
							M<<"You were hit by [N]!"
							M:health -= M:maxhealth*2
							N.power += 1
							N:deathcheck(M)
							for(var/obj/Fastenergy/T in world)
								if(T:owner == "[N.key]")
									del(T)


				del(src)
			else
				..()
			if(istype(M,/obj/))
				spawn(1)
					M.overlays = null
					spawn(1)
						M.overlays = null
						spawn(1)
							M.overlays = null
							del(M)

				del(src)
			else
				..()
		verb/Get_Potion()
			set src in oview(1)
			view(9) << "[usr] has taken the [src]"
			usr.verbs += new /mob/Potion/verb/AvatarPotion
			Move(usr)
		verb/Drop_Potion()
			usr << "You dropped the potion"
			src.loc=locate(usr.x,usr.y+1,usr.z)

obj
	Book_of_DragoWing
		icon = 'General.dmi'
		icon_state = "book3"
		density = 1
		verb/Get_Book()
			set src in oview(1)
			set name = "Get book"
			if(usr.key=="Dragowing")
				Move(usr)
				view(9)<<"[usr] takes the [src]"
			else if(usr.power>=500000)
				Move(usr)
				view(9)<<"[usr] takes the [src]"
		verb/Drop_book()
			usr<<"You drop the book"
			src.loc=locate(usr.x,usr.y+1,usr.z)
		verb/Read_book()
			set src in oview(1)
			if(usr.Energy >= 0)
				if(usr.reading==1)
					return
				usr << "You begin to study"
				usr.reading = 1
				usr.Freeze = !usr.Freeze
				spawn(6)
					usr << "You finnish studying"
					usr.Freeze = 0
					usr.maxEnergy += 5
					usr.power += rand(18,30)
					usr.Strength += rand(2,9)
					usr.Energy -= 7

					usr.Intelligence += 5
					usr.maxhealth += rand(3,10)
					usr.Experience += rand(0,6)
					usr.Levelup()


					usr.reading = 0
			else
				usr << "You are to tired to do this"

obj
	Book_of_Explodie
		icon = 'General.dmi'
		icon_state = "book3"
		name = "Book of Explodie"
		density = 1
		verb/Get_Book()
			set src in oview(1)
			set name = "Get book"
			if(usr.key=="Explodie")
				Move(usr)
				view(9)<<"[usr] takes the [src]"
				return
			else if(usr.power>=500000)
				Move(usr)
				view(9)<<"[usr] takes the [src]"
		verb/Drop_book()
			usr<<"You drop the book"
			src.loc=locate(usr.x,usr.y+1,usr.z)
		verb/Read_book()
			set src in oview(1)
			if(usr.Energy >= 0)
				if(usr.reading==1)
					return
				usr << "You begin to study"
				usr.reading = 1
				usr.Freeze = !usr.Freeze
				spawn(6)
					usr << "You finnish studying"
					usr.Freeze = 0
					usr.maxEnergy += 4
					usr.power += rand(8,17)
					usr.Strength += rand(1,7)
					usr.Energy -= 5

					usr.Intelligence += rand(3,11)
					usr.maxhealth += 3
					usr.Experience += rand(0,2)
					usr.Levelup()
					usr.reading = 0
			else
				usr << "You are to tired to do this"

obj
	Book_of_Shuugo
		icon = 'General.dmi'
		icon_state = "book3"
		name = "Book of Shuugo"
		density = 1
		verb/Get_Book()
			set src in oview(1)
			set name = "Get book"
			if(usr.key=="Shuugo")
				Move(usr)
				view(9)<<"[usr] takes the [src]"
				return
			else if(usr.power>=500000)
				Move(usr)
				view(9)<<"[usr] takes the [src]"
		verb/Drop_book()
			usr<<"You drop the book"
			src.loc=locate(usr.x,usr.y+1,usr.z)
		verb/Read_book()
			set src in oview(1)
			if(usr.Energy >= 0)
				if(usr.reading==1)
					return
				usr << "You begin to study"
				usr.reading = 1
				usr.Freeze = !usr.Freeze
				spawn(6)
					usr << "You finnish studying"
					usr.Freeze = 0
					usr.maxEnergy += 4
					usr.power += rand(8,17)
					usr.Strength += rand(1,7)
					usr.Energy -= 5

					usr.Intelligence += rand(3,11)
					usr.maxhealth += 3
					usr.Experience += rand(0,2)
					usr.Levelup()

					usr.reading = 0
			else
				usr << "You are to tired to do this"


obj/ComputerConsole
	name = "Computer Console"
	icon = 'Turfs 2.dmi'
	icon_state = "computer1"
	density = 1
	verb
		Check_Player(mob/M in world)
			set src in oview(1)
			set desc = "Get data on a player"
			usr.CheckID = input("Enter ID number to check") as num
			if(usr.CheckID==M.ID_number)
				usr<<"------------------"
				usr<<"Name:			[M.name]"
				usr<<"ID:			[M.ID_number]"
				usr<<"Race:			[M.race]"
				if(usr.good==1)
					usr<<"Alignment:		Good"
				if(usr.evil==1)
					usr<<"Alignment:		Evil"
				if(usr.evil==0&&usr.good==0)
					usr<<"Alignment:		Neutral"
				usr<<"Rank:			[M.rank]"
				usr<<"Gender:		[M.gender1]"
				usr<<"Age:			[M.age]"
				usr<<"Nationality:		[M.nationality]"
				usr<<"Level:			[M.level]"
				if(M.block_tele==0)
					usr<<"Blocking tele:		No"
				if(M.block_tele==1)
					usr<<"Blocking tele:		Yes"
				usr<<"------------------"
				return
			else
				usr<<"<FONT COLOR=red>Acces Denied</FONT>"
		Play_Game()
			set src in oview(1)
			switch(alert(usr,"What game you wanna play?","Choose game","BYOND","Counter Strike","TES3"))
				if("BYOND")
					view(9)<<"<i>[usr] starts playing BYOND's first charmed game"
				if("Counter Strike")
					view(9)<<"<i>[usr] starts playing Counter Strike using Steam"
				if("TES3")
					view(9)<<"<i>[usr] starts playing The Elder Scrolls: Morrowind"

obj
	Magical_Scroll
		icon = 'Objects.dmi'
		icon_state = "magicpaper"
		density = 1
		verb/Get_Scroll()
			set src in oview(1)
			set name = "Get book"
			Move(usr)
			view(9)<<"[usr] takes the [src]"
		verb/Drop_Scroll()
			usr<<"You drop the scroll"
			src.loc=locate(usr.x,usr.y+1,usr.z)
		verb/Read_Scroll()
			usr<<"This scroll contains the following text"
			usr<<"<i>Nos dico super inconcesses,vox bonus quod malum.Ultirusque a profugus,addo is hic, addo is iam."

	Paintings
		Painting_01
			name = "Painting"
			icon = 'Turfs 2.dmi'
			icon_state = "painting3"
			density = 1
		Painting_02
			name = "Painting"
			icon = 'Turfs 2.dmi'
			icon_state = "painting4"
			density = 1
		Painting_03
			name = "Painting"
			icon = 'Turfs 2.dmi'
			icon_state = "painting5"
			density = 1
		Painting_04
			name = "Painting"
			icon = 'Turfs 2.dmi'
			icon_state = "painting6"
			density = 1

obj
	Book_of_Ultimate
		icon = 'General.dmi'
		icon_state = "book3"
		name = "The Ultimate Book"
		density = 1
		verb/Get_Book()
			set src in oview(1)
			set name = "Get book"
			if(usr.rank=="The Ultimate")
				Move(usr)
				view(9)<<"[usr] takes the [src]"
				return
			else
				usr<<"Somehow this book seems to be stuck to the floor"
				return
		verb/Drop_book()
			usr<<"You drop the book"
			src.loc=locate(usr.x,usr.y+1,usr.z)
		verb/Read_book()
			set src in oview(1)
			if(usr.Energy >= 0)
				if(usr.reading==1)
					return
				usr << "You begin to study"
				usr.reading = 1
				usr.Freeze = !usr.Freeze
				spawn(6)
					usr << "You finnish studying"
					usr.Freeze = 0
					usr.maxEnergy += 15
					usr.power += rand(45,75)
					usr.Strength += rand(30,50)
					usr.Energy -= 15

					usr.Intelligence += rand(25,35)
					usr.maxhealth += 65
					usr.Experience += rand(10,25)
					usr.Levelup()
					usr.reading = 0
			else
				usr << "You are to tired to do this"
obj/Cellphone
	icon = 'Objects.dmi'
	icon_state = "gsm"
	density = 0
	verb
		Speak(msg as text)
			set name = "Speak"
			set category = "Commands"
			for(var/mob/M in world)
				if(M.cellnumber==usr.callnumber)
					if(M.hasgsm==1)
						usr << "Phone: to [M] - [msg]"
						M << "Phone: [usr] - [msg]"
					else
						usr<<"[M] doesnt have a cell phone"
		Dial_Number()
			usr.callnumber=input("Dial number","Cell phone") as text
		Set_Number()
			set name = "Set Number"
			set category = "Commands"
			set desc = "Set your own Cell number"
			usr.cellnumber=input("Whats your number?","Telephone number") as text
			usr<<"Your number has been set to [usr.cellnumber]"
		Get_gsm()
			set src in oview(1)
			set name = "Take cellphone"
			Move(usr)
			view(9)<<"[usr] takes the [src]"
			usr.hasgsm = 1
			return
		Drop_gsm()
			set name = "Drop cellphone"
			usr<<"You drop the [src]"
			src.loc=locate(usr.x,usr.y+1,usr.z)
			usr.hasgsm = 0

obj/startscreen
	name = "Choosing Character"
obj/explosion
	icon = 'Temp2.dmi'
	icon_state = "explosion"
	layer = MOB_LAYER

obj
	Book_of_Spells
		icon = 'General.dmi'
		icon_state = "book4"
		name = "Spell Book"
		density = 1
		verb/Get_Book()
			set src in oview(1)
			set name = "Get book"
			if(usr.power>=300000)
				Move(usr)
				view(9)<<"[usr] takes the [src]"
				return
			else
				usr<<"I should leave this for other witches"
				return
		verb/Drop_book()
			usr<<"You drop the book"
			src.loc=locate(usr.x,usr.y+1,usr.z)
		verb/Read_book()
			set src in oview(1)
			if(usr.Energy >= 0)
				usr << "you begin to search"
				usr.Freeze = !usr.Freeze
				sleep(20)
				usr.Freeze = 0
				usr << "you stoped searching"
				randommagic = rand(1,12)
				if(randommagic == 1)
					usr.Freeze = 0
					spawn(15)
					if(usr.Spellsfound1 == 1)
						usr << "you found a spell you already have, good luck next time"
						usr.Freeze = 0
						return
					else
						usr.Freeze = 0
						usr.Spellsfound1 = 1
						usr.Spells += "Spell : to summon a demon"
						usr.Spells += "Magic forces black and white Reach out though space and light Be he far or be he near Bring us the demon (persons name) here"
						usr.Spells += "...May need more than one witch..."
				if(randommagic == 7)
					usr.Freeze = 0
					spawn(15)
					if(usr.Spellsfound2 == 1)
						usr << "you found a spell you already have, good luck next time"
						usr.Freeze = 0
						return
					else
						usr.Freeze = 0
						usr.Spellsfound2 += 1
						usr.Spells += "Spell : to form a powerfull force field"
						usr.Spells += "Knowledge and reverence"
						usr.Spells += "...need 2 good witch's, the more you have the stronger it gets..."
				if(randommagic == 3)
					usr.Freeze = !usr.Freeze
					spawn(15)
					if(usr.Spellsfound3 == 1)
						usr << "you found a spell you already have, good luck next time"
						usr.Freeze = 0
						return
					else
						usr.Freeze = 0
						usr.Spellsfound3 += 1
						usr.Spells += "Spell : to return a demon to hell"
						usr.Spells += "Spirits of air, forest and sea, set us of this demon free, beasts of hoof and beasts of shell, drive this (name) back to hell"
						usr.Spells += "...can only be used on a demon once per login..."
				if(randommagic == 12)
					usr.Freeze = !usr.Freeze
					spawn(15)
					if(usr.Spellsfound12 == 1)
						usr << "you found a spell you already have, good luck next time"
						usr.Freeze = 0
						return
					else
						usr.Freeze = 0
						usr.Spellsfound12 += 1
						usr.Spells += "Spell : vanquish a demon"
						usr.Spells += "Hellspawn demon, Creature of death, Fire shall take (Name) very last breath"
				if(randommagic == 8)
					usr.Freeze = !usr.Freeze
					spawn(15)
					if(usr.Spellsfound8 == 1)
						usr << "you found a spell you already have, good luck next time"
						usr.Freeze = 0
						return
					else
						usr.Freeze = 0
						usr.Spellsfound8 += 1
						usr.Spells += "Spell : To reveal a hidden personne"
						usr.Spells += "In this tween time, this darkest hour I call upon the sacred power. I myself stand alone command name to be shown."
				if(randommagic == 4)
					usr.Freeze = !usr.Freeze
					spawn(15)
					if(usr.Spellsfound4 == 1)
						usr << "you found a spell you already have, good luck next time"
						usr.Freeze = 0
						return
					else
						usr.Freeze = 0
						usr.Spellsfound4 += 1
						usr.Spells += "Spell : to search for a demon"
						usr.Spells += "Let the piercing cry that feeds on pain, and leaves more sorrow then it gains. Shall now be heard by one who seeks, to stop the havoc that it wreaks"

				if(randommagic == 6)
					usr.Freeze = 0
					spawn(15)
					if(usr.Spellsfound6 == 1)
						usr << "you found a spell you already have, good luck next time"
						usr.Freeze = 0
						return
					else
						usr.Freeze = 0
						usr.Spellsfound6 += 1
						usr.Spells += "Spell : To sence good or evil in the room"
						usr.Spells += "As the flame lights shadows, and truth ends fear, open lost thoughts, to my willing ear"

obj/darklighter/Arrow
	name = "Arrow"
	icon = 'Items.dmi'
	icon_state = "Arrow"
	density = 1
	Bump(atom/M)
		if(istype(M,/mob/))
			for(var/mob/N in oview(9))
				if(src.owner == "[N.key]")
					M<<"You were hit by [N]!"
					N<<"You hit [M]"
					if(M:Whitelighter==1)
						M<<"You have been fatally wounded by a poisoned arrow"
						M:health -= M:health/1.5
						M:health -= N.Strength
						M:deathcheck(M)
					for(var/obj/Firebolt/T in world)
						if(T:owner == "[N.key]")
							del(T)
					del(src)
				else
obj
	Darklighter_Bow
		var/thrownby
		icon = 'General.dmi'
		icon_state = "crossbow"
		density = 1
		verb
			Shoot()
				if(usr.RolePlaying == 0)
					usr<<"You cannot use magic here"
					return
				if(usr.Energy<=0)
					usr<<"<FONT COLOR=yellow>Client information</FONT>: Your out of energy!"
					return
				if(usr.attacking==1)
					return
				if(usr.Selforb == 0)
					var/obj/darkenergyball/F = new /obj/darklighter/Arrow(src.loc)
					F.loc=usr.loc
					F.dir=usr.dir
					F.owner = usr
					usr.Froze=1
					usr.Freeze=1
					walk(F,usr.dir,0)
					sleep(10)
					if(F)
						if(!F.Freeze)
							del(F)
					usr.Freeze=0
					usr.Froze=1
			Destroy()
				set src in view(1)
				usr<<"You have made your Darklighter Bow disapear..."
				del(src)
			Get()
				set src in oview(1)
				var/counter=0
				for(var/obj/Darklighter_Bow/O in usr.contents)
					counter+=1
				if(counter<=0)
					src.loc = usr
					usr << "You get a [src]."
					return
				else
					usr<<"You already have one..."
					return
			Drop()
				set src in usr
				src.loc = usr.loc
				usr << "You drop a [src]."

obj
	chair1
		name = "Chair"
		icon = 'Objects.dmi'
		icon_state = "chair1"
		layer = MOB_LAYER + 1
	chair2
		name = "Chair"
		icon = 'Objects.dmi'
		icon_state = "chair2"
	chair3
		name = "Chair"
		icon = 'Objects.dmi'
		icon_state = "chair3"
	chair4
		name = "Chair"
		icon = 'Objects.dmi'
		icon_state = "chair4"
	tile80
		name = "Candle"
		icon = 'General.dmi'
		icon_state = "tile80"
		density = 1
	tile72
		name = "Table"
		icon = 'General.dmi'
		icon_state = "tile72"
		density = 1
	tile114
		name = "Flowers"
		icon = 'General.dmi'
		icon_state = "tile114"

	tile115
		name = "Flowers"
		icon = 'General.dmi'
		icon_state = "tile115"
	effects
		icon = 'magicgood.dmi'
		layer = MOB_LAYER +1
		worb
			icon_state = "worb"
		worb
			icon_state = "worb"