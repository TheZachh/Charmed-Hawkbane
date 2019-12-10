/******************************************************************/
//			This system teaches the skills when needed

/**********************/
//		Vars
/**********************/
mob/var
	teleport_shimmer = 0
	teleport_flame = 0
	teleport_dlorb = 0
	teleport_wlorb = 0
	teleport_blink = 0
	teleportteach
	Teleport_List
	attack_energybolt = 0
	attack_firebolt = 0
	attack_waterball = 0
	attack_dlenergybolt = 0
	attack_electricbolt = 0
	attack_lightning = 0
	attack_blowup = 0
	attack_tod = 0
	attack_athame = 0
	attack_pyro = 0
	attack_shock = 0
	attackteach
	magic_freeze1 = 0
	magic_freeze2 = 0
	magic_tk1 = 0
	magic_tk2 = 0
	magic_tkdrag = 0
	magic_prem = 0
	magic_empath = 0
	magic_telepath = 0
	magic_shield = 0
	magic_change = 0
	magic_shapeshift = 0
	magicteach
	choosen_teleport = 0
	choosen_attack = 0
	choosen_magic = 0
/**********************/
mob/proc
	TeleportCheck()
		if(src.teleport_shimmer == 1)
			src.verbs+=new/mob/demon/verb/shimmer
			src.verbs+=new/mob/demon/verb/Join_shimmer
			if(src.power>=3500)
				src.verbs+=new/mob/demon/verb/shimmer_long
				src.verbs+=new/mob/demon/verb/shimmer_with_people
			if(src.power>=15000)
				src.verbs+=new/mob/demon/verb/shimmer_place
		else if(src.teleport_flame == 1)
			src.verbs+=new/mob/demon/verb/Flame_orb
			if(src.power>=3500)
				src.verbs+=new/mob/demon/verb/Flame_orb_longdist
				src.verbs+=new/mob/demon/verb/flame_with_people
			if(src.power>=15000)
				src.verbs+=new/mob/demon/verb/Flame_orb_place
		else if(src.teleport_dlorb == 1)
			src.verbs+=new/mob/darklighter/verb/DL_Orb
			src.verbs+=new/mob/darklighter/verb/Join_black_orb
			if(src.power>=3500)
				src.verbs+=new/mob/darklighter/verb/DL_Orb_longdist
				src.verbs+=new/mob/darklighter/verb/DL_Orb_with_people
			if(src.power>=15000)
				src.verbs+=new/mob/darklighter/verb/DL_Orb_place
		else if(src.teleport_wlorb == 1 && src.Whitelighter == 1)
			src.verbs+=new/mob/whitelighter/verb/Join_orb
			src.verbs+=new/mob/whitelighter/verb/Orb
			if(src.power>=3500)
				src.verbs+=new/mob/whitelighter/verb/Orb_with_people
				src.verbs+=new/mob/whitelighter/verb/Orb_longdist
			if(src.power>=15000)
				src.verbs+=new/mob/whitelighter/verb/Orb_place
		else if(src.teleport_blink == 1)
			src.verbs+=new/mob/witch/verb/Blink
			if(src.power>=3500)
				src.verbs+=new/mob/witch/verb/Blink_Long
			if(src.power>=15000)
				src.verbs+=new/mob/witch/verb/Blink_place

	RaceSetting()

/**********************/
mob/PowerNPC/
	Demon_Teleport
		name = "Teleport Teacher (Evil)"
		Demon = 1
		icon = 'Goodwitchs.dmi'
		icon_state = "Darklighter-2"
		density = 1
		RolePlaying = 1
		maxhealth = 10000000000000
		health = 10000000000000
		race = "Demon"
		age = "?"
		gender1 = "Male"
		evil = 1
		NPC = 1
		indemonschool = 1
		align = 90
		verb
			Speak()
				set src in oview(1)
				switch(alert(usr,"What is it you want?","Teleport learning","Choose Teleport","Learn Teleport"))
					if("Choose Teleport")
						if(usr.choosen_teleport==1)
							usr<<"Teleport Teacher: You have already choosen what sort of teleport you want!"
							return
						else
							usr<<"Teleport Teacher: Choose what teleport way you want to learn."
							usr<<"Teleport Teacher: However, you may only choose once, so select it carefully"
							sleep(10)
							var/default_value = "Flame"
							var/list/Teleport_List = list("Flame", "Shimmer", "Blink", "Black Orb")
							teleportteach = input(usr, default_value) in Teleport_List
							switch(teleportteach)
								if("Flame")
									if(usr.Demon==1)
										usr.teleport_flame = 1
										usr.choosen_teleport = 1
										usr<<"<FONT COLOR=yellow>Client information</FONT>: You have choosen <B>Flame</B> as your teleport."
									else
										usr<<"<FONT COLOR=yellow>Client information</FONT>: You are no Demon"
								if("Shimmer")
									if(usr.Demon==1||usr.HalfDemon==1)
										usr.teleport_shimmer = 1
										usr.choosen_teleport = 1
										usr<<"<FONT COLOR=yellow>Client information</FONT>: You have choosen <B>Shimmer</B> as your teleport."
									else
										usr<<"<FONT COLOR=yellow>Client information</FONT>: You are not demonic."
								if("Blink")
									if(usr.Warlock==1||usr.Demon==1)
										usr.teleport_blink = 1
										usr.choosen_teleport = 1
										usr<<"<FONT COLOR=yellow>Client information</FONT>: You have choosen <B>Blink</B> as your teleport."
									else
										usr<<"<FONT COLOR=yellow>Client information</FONT>: You are no Warlock or Demon."
								if("Black Orb")
									usr.teleport_dlorb = 1
									usr.choosen_teleport = 1
									usr<<"<FONT COLOR=yellow>Client information</FONT>: You have choosen <B>Black Orb</B> as your teleport."
					if("Learn Teleport")
						usr<<"Teleport Teacher: Let's see what powers await you"
						usr.TeleportCheck()

	Evil_Power_Informant
		name = "Information Teacher (Evil)"
		Demon = 1
		icon = 'Goodwitchs.dmi'
		icon_state = "badwitch"
		density = 1
		maxhealth = 100000000000000
		health = 10000000000000
		race = "Demon"
		age = "?"
		gender1 = "Female"
		evil = 1
		NPC = 1
		indemonschool = 1
		alignpoint = 90
		verb
			Speak()
				set src in oview(1)
				usr << "Information Teacher: There are a few things i can tell you about."
				var/default_value = "Choose your powers"
				var/list/evil_powers = list("Demonic Telekinesis","Demonic Fire", "Half Demon","Darklighter Telepathy", "Darklighter Energy", "Warlock Shapeshift", "Warlock Telepathy", "Vampire", "Mysticlighter", "Werewolf", "Cancel")
				power_choice = input(usr,default_value) in evil_powers
				switch(power_choice)
					if("Demonic Telekinesis")
						usr << "Information Teacher: The first set of Demonic power are to be teached to any demon or half demon."
						usr << "Information Teacher: The powers that are teached are the Energybolt and later the Telekinetic powers."
					if("Demonic Fire")
						usr << "Information Teacher: The second set of Demonic power are to be teached to demons only."
						usr << "Information Teacher: The powers that are teached are the Firebolt and later more fire powers, but you will see."
					if("Half Demon")
						usr << "Information Teacher: The third set of Demonic power are to be teached to half demons only."
						usr << "Information Teacher: The powers that are learned are the Energybolt and the ability to summon athames and adjust to freeze."
					if("Darklighter Energy")
						usr << "Information Teacher: The first set of Darklighter power are to be teached to darklighters only."
						usr << "Information Teacher: The powers that are teached are the Energybolt and later the Touch of Death. They also learn to Sense whitelighters."
					if("Darklighter Telepathy")
						usr << "Information Teacher: The second set of Darklighter power are to be teached to darklighters only."
						usr << "Information Teacher: The powers that they learn are Telepathic and you'll obtain a crossbow. They also learn to Sense whitelighters."
					if("Warlock Shapeshift")
						usr << "Information Teacher: The first set of Warlock power are to be teached to any warlock."
						usr << "Information Teacher: The powers that are teached are the ability to summon athames and to shapeshift."
					if("Warlock Telepathy")
						usr << "Information Teacher: The second set of Warlock power are to be teached to any warlock."
						usr << "Information Teacher: The powers that are teached are Eletricbolt and Telepathic."
					if("Vampire")
						usr << "Information Teacher: Vampire powers are unique"
						usr << "Information Teacher: The powers that you learn are to Bite and eventually transform into a Bat, youll become smarter as a Vampire."
					if("Werewolf")
						usr << "Information Teacher: There is no known way to turn into a werewolf."
					if("Mysticlighter")
						usr << "Information Teacher: Mysticlighters are strange creatures, there powers cannot be teached, only unlocked."
						usr << "Information Teacher: They are people born with mystical blood, they do not choose the power, it chooses them."
						usr << "Information Teacher: If you are a Mystical creature, you must speak with the headmaster, im sure he can help you."

	Evil_Powers
		name = "Skill Teacher (Evil)"
		Demon = 1
		icon = 'Goodwitchs.dmi'
		icon_state = "goodwitch"
		density = 1
		maxhealth = 100000000000000
		health = 10000000000000
		race = "Demon"
		age = "?"
		gender1 = "Female"
		evil = 1
		NPC = 1
		indemonschool = 1
		alignpoint = 90
		verb
			Speak()
				set src in oview(1)
				usr << "Skill Teacher: There are a few skills i can learn you."
				if(usr.gainedrace==0)
					usr<<"<FONT COLOR=yellow>Client information</FONT>: You must choose a race first."
					return
				var/default_value = "Choose your powers"
				var/list/evil_powers = list("Demonic Telekinesis","Demonic Fire", "Half Demon","Telepathic Darklighter", "Darklighter Energy", "Shapeshifting Warlock", "Telepathic Warlock", "Vampire","Werewolf", "Cancel")
				power_choice = input(usr,default_value) in evil_powers
				switch(power_choice)
					if("Demonic Telekinesis")
						if(usr.Demon==1||usr.HalfDemon==1)
							if(usr.powerchoice == 0)
								usr.powerchoice = 1
							if(usr.powerchoice == 1)
								if(usr.power >= 10000)
									usr.verbs+=new/mob/demon/verb/Energybolt
									usr << "<FONT COLOR=yellow>Client information</FONT>: You learned <B>Energybolt</B>!"
								if(usr.power >= 15000)
									usr.verbs+=new/mob/witch/verb/Telekinesis_basic
									usr << "<FONT COLOR=yellow>Client information</FONT>: You learned to move <B>Objects</B>!"
/*								if(usr.power >= 20000)
									usr.verbs+=new/mob/witch/verb/Telekinesis_Reversal
									usr << "<FONT COLOR=yellow>Client information</FONT>: You learned to move <B>Objects</B> away from you!"
								if(usr.power >= 22500)
									usr.verbs+=new/mob/witch/verb/Telekinesis_Advanced
									usr << "<FONT COLOR=yellow>Client information</FONT>: You learned to move <B>Personnes</B>!"*/
								if(usr.power >= 27500)
									usr.TelekinesisAdvanced=2
									usr << "<FONT COLOR=yellow>Client information</FONT>: You mastered <B>Telekinesis</B>!"
/*								if(usr.power >= 35000)
									usr.verbs+=new/mob/witch/verb/Telekinesis_Blast
									usr << "<FONT COLOR=yellow>Client information</FONT>: You learned to use <B>Telekinesis</B> as a attack!"
								if(usr.power >= 50000)
									usr.verbs+=new/mob/witch/verb/Telekinesis_Rage
									usr << "<FONT COLOR=yellow>Client information</FONT>: You learned to use <B>Telekinesis</B> as rage!"*/
								else
									usr << "<FONT COLOR=yellow>Client information</FONT>: You do not yet meet the requirements"
							else if(usr.powerchoice >= 2)
								usr << "<FONT COLOR=yellow>Client information</FONT>: You have choosen a other skill tree"
						else
							usr<<"<FONT COLOR=yellow>Client information</FONT>: You are not fit for these powers"
					if("Demonic Fire")
						if(usr.Demon==1)
							if(usr.powerchoice == 0)
								usr.powerchoice = 2
							if(usr.powerchoice == 2)
								if(usr.power >= 8000)
									usr.verbs+=new/mob/demon/verb/Firebolt
									usr << "<FONT COLOR=yellow>Client information</FONT>: You learned <B>Firebolt</B>!"
								if(usr.power >= 14000)
									usr.verbs+=new/mob/demon/verb/Flame
									usr << "<FONT COLOR=yellow>Client information</FONT>: You learned <B>Flame</B>!"
								if(usr.power >= 21000)
									usr.verbs+=new/mob/demon/verb/Pyrokinesis
									usr.Pyrokinesis = 2
									usr << "<FONT COLOR=yellow>Client information</FONT>: You learned <B>Pyrokinesis</B>!"
								if(usr.power >= 30000)
									usr.verbs+=new/mob/demon/verb/Ignite
									usr << "<FONT COLOR=yellow>Client information</FONT>: You learned <B>Ignite</B>!"
								else
									usr << "<FONT COLOR=yellow>Client information</FONT>: You do not yet meet the requirements"
							else if(usr.powerchoice >= 3||usr.powerchoice<=1)
								usr << "<FONT COLOR=yellow>Client information</FONT>: You have choosen a other skill tree"
						else
							usr<<"<FONT COLOR=yellow>Client information</FONT>: You are not fit for these powers"
					if("Half Demon")
						if(usr.HalfDemon==1)
							if(usr.powerchoice == 0)
								usr.powerchoice = 3
							if(usr.powerchoice == 3)
								if(usr.power >= 7500)
									usr.verbs+=new/mob/demon/verb/Summon_Athame
									usr << "<FONT COLOR=yellow>Client information</FONT>: You learned to <B>Summon Athames</B>!"
								if(usr.power >= 12500)
									usr.verbs+=new/mob/demon/verb/Energybolt
									usr << "<FONT COLOR=yellow>Client information</FONT>: You learned <B>Energybolt</B>!"
								if(usr.power >= 15000)
									usr.verbs+=new/mob/halfdemon/verb/Change
									usr << "<FONT COLOR=yellow>Client information</FONT>: You learned to <B>Change</B> into demon form!"
								if(usr.power >= 25000)
									usr.adjust = 1
									usr << "<FONT COLOR=yellow>Client information</FONT>: You learned to <B>Adjust</B>!"
								else
									usr << "<FONT COLOR=yellow>Client information</FONT>: You do not yet meet the requirements"
							else if(usr.powerchoice >= 4||usr.powerchoice<=2)
								usr << "<FONT COLOR=yellow>Client information</FONT>: You have choosen a other skill tree"
						else
							usr<<"<FONT COLOR=yellow>Client information</FONT>: You are not fit for these powers"
					if("Darklighter Energy")
						if(usr.Darklighter==1)
							if(usr.powerchoice == 0)
								usr.powerchoice = 4
							if(usr.powerchoice == 4)
								if(usr.power >= 6500)
									usr.verbs+=new/mob/darklighter/verb/DL_Sense
									usr << "<FONT COLOR=yellow>Client information</FONT>: You learned to <B>Sense</B> whitelighters!!"
								if(usr.power >= 9000)
									usr.verbs+=new/mob/darklighter/verb/Energybolt
									usr << "<FONT COLOR=yellow>Client information</FONT>: You learned <B>Energybolt</B>!"
								if(usr.power >= 20000)
									usr.verbs+=new/mob/darklighter/verb/DL_Touch_of_Death
									usr << "<FONT COLOR=yellow>Client information</FONT>: You learned <B>Touch of Death</B>!"
								else
									usr << "<FONT COLOR=yellow>Client information</FONT>: You do not yet meet the requirements"
							else if(usr.powerchoice >= 5||usr.powerchoice<=3)
								usr << "<FONT COLOR=yellow>Client information</FONT>: You have choosen a other skill tree"
					if("Telepathic Darklighter")
						if(usr.Darklighter==1)
							if(usr.powerchoice == 0)
								usr.powerchoice = 5
							if(usr.powerchoice == 5)
								if(usr.power >= 6500)
									usr.verbs+=new/mob/darklighter/verb/DL_Sense
									usr << "<FONT COLOR=yellow>Client information</FONT>: You learned to <B>Sense</B> whitelighters!!"
								if(usr.power >= 9000)
									usr.verbs+=new/mob/witch/Telepath/verb/Mind_Talk
									usr << "<FONT COLOR=yellow>Client information</FONT>: You learned to speak <B>Telepathically</B>!!"
								if(usr.power >= 16000)
									usr.verbs+=new/mob/darklighter/verb/Summondarkbow
									usr << "<FONT COLOR=yellow>Client information</FONT>: You obtained the ability to <B>Summon Darklighter Crossbow</B>!"
								else
									usr << "<FONT COLOR=yellow>Client information</FONT>: You do not yet meet the requirements"
							else if(usr.powerchoice >= 6||usr.powerchoice<=4)
								usr << "<FONT COLOR=yellow>Client information</FONT>: You have choosen a other skill tree"
					if("Shapeshifting Warlock")
						if(usr.Warlock==1)
							if(usr.powerchoice == 0)
								usr.powerchoice = 6
							if(usr.powerchoice == 6)
								if(usr.power >= 5000)
									usr.verbs+=new/mob/demon/verb/Summon_Athame
									usr << "<FONT COLOR=yellow>Client information</FONT>: You learned to <B>Summon Athames</B>!"
								if(usr.power >= 15000)
									usr.verbs+=new/mob/demon/verb/Shapeshift
									usr << "<FONT COLOR=yellow>Client information</FONT>: You learned to <B>Shapeshift</B>!"
								else
									usr << "<FONT COLOR=yellow>Client information</FONT>: You do not yet meet the requirements"
							else if(usr.powerchoice >= 7||usr.powerchoice<=5)
								usr << "<FONT COLOR=yellow>Client information</FONT>: You have choosen a other skill tree"
					if("Telepathic Warlock")
						if(usr.Warlock==1)
							if(usr.powerchoice == 0)
								usr.powerchoice = 7
							if(usr.powerchoice == 7)
								if(usr.power >= 7000)
									usr.verbs+=new/mob/witch/verb/EletricBolt
									usr << "<FONT COLOR=yellow>Client information</FONT>: You learned to <B>EletricBolt</B>!"
								if(usr.power >= 14500)
									usr.verbs+=new/mob/witch/Telepath/verb/Mind_Talk
									usr << "<FONT COLOR=yellow>Client information</FONT>: You learned to speak <B>Telepathically</B>!"
								else
									usr << "<FONT COLOR=yellow>Client information</FONT>: You do not yet meet the requirements"
							else if(usr.powerchoice >= 8||usr.powerchoice<=6)
								usr << "<FONT COLOR=yellow>Client information</FONT>: You have choosen a other skill tree"
					if("Vampire")
						if(usr.Vampire==1)
							if(usr.powerchoice == 0)
								usr.powerchoice = 8
							if(usr.powerchoice == 8)
								if(usr.power >= 2500)
									usr.verbs+=new/mob/vampire/verb/Bite
									usr << "<FONT COLOR=yellow>Client information</FONT>: You learned to <B>Bite</B>!"
								if(usr.power >= 5000)
									if(usr.hasintellbonus==0)
										usr.Intelligence += 1250
										usr.hasintellbonus = 1
								if(usr.power >= 10000)
									usr.verbs+=new/mob/vampire/verb/Transform
									usr << "<FONT COLOR=yellow>Client information</FONT>: You learned to <B>Transform</B>!"
									usr.Intelligence += 750
								else
									usr << "<FONT COLOR=yellow>Client information</FONT>: You do not yet meet the requirements"
							else if(usr.powerchoice >= 9||usr.powerchoice<=7)
								usr << "<FONT COLOR=yellow>Client information</FONT>: You have choosen a other skill tree"



	Evil_Race
		name = "Class Teacher (Evil)"
		Darklighter = 1
		icon = 'Goodwitchs.dmi'
		icon_state = "whitelighter"
		density = 1
		maxhealth = 1000000000000000
		health = 1000000000000000
		race = "Darklighter"
		age = "?"
		gender1 = "Male"
		evil = 1
		NPC = 1
		indemonschool = 1
		align = 90
		verb
			Speak()
				set src in oview(1)
				usr << "Class Teacher: Hmm, what powers do you want to learn?"
				if(usr.gainedrace==1)
					usr<<"<FONT COLOR=yellow>Client information</FONT>: You already choose a race."
					return
				var/default_value = "Choose your race"
				var/list/evil_races = list("Demon","Half Demon", "Darklighter", "Warlock", "Vampire", "Werewolf", "Mysticlighter", "Cancel")
				race_choice = input(usr, default_value) in evil_races
				switch(race_choice)
					if("Demon")
						if(gainedrace==1)
							usr<<"<FONT COLOR=yellow>Client information</FONT>: You already choose a race."
							return
						if(usr.evil==0)
							usr<<"<FONT COLOR=yellow>Client information</FONT>: You are not evil"
							return
						else
							usr.race = "Demon"
							usr.choosenrace = "Demon"
							usr.Demon = 1
							usr.Human = 0
							usr.gainedrace=1
							usr<<"<FONT COLOR=yellow>Client information</FONT>: You have become a Demon"
					if("Half Demon")
						if(gainedrace==1)
							usr<<"<FONT COLOR=yellow>Client information</FONT>: You already choose a race."
							return
						if(usr.evil==0)
							usr<<"<FONT COLOR=yellow>Client information</FONT>: You are not evil"
							return
						else
							usr.race = "Half Demon"
							usr.choosenrace = "Half Demon"
							usr.Human = 0
							usr.HalfDemon = 1
							usr.gainedrace=1
							usr<<"<FONT COLOR=yellow>Client information</FONT>: You have become a Half Demon"
					if("Darklighter")
						if(gainedrace==1)
							usr<<"<FONT COLOR=yellow>Client information</FONT>: You already choose a race."
							return
						if(usr.evil==0)
							usr<<"<FONT COLOR=yellow>Client information</FONT>: You are not evil"
							return
						else
							usr.race = "Darklighter"
							usr.choosenrace = "Darklighter"
							usr.Darklighter = 1
							usr.Human = 0
							usr.gainedrace=1
							usr<<"<FONT COLOR=yellow>Client information</FONT>: You have become a Darklighter"
					if("Warlock")
						if(gainedrace==1)
							usr<<"<FONT COLOR=yellow>Client information</FONT>: You already choose a race."
							return
						if(usr.evil==0)
							usr<<"<FONT COLOR=yellow>Client information</FONT>: You are not evil"
							return
						else
							usr.race = "Warlock"
							usr.choosenrace = "Warlock"
							usr.Warlock = 1
							usr.Human = 0
							usr.gainedrace=1
							usr<<"<FONT COLOR=yellow>Client information</FONT>: You have become a Warlock"
					if("Vampire")
						if(gainedrace==1)
							usr<<"<FONT COLOR=yellow>Client information</FONT>: You already choose a race."
							return
						if(usr.evil==0)
							usr<<"<FONT COLOR=yellow>Client information</FONT>: You are not evil"
							return
						else
							usr.race = "Vampire"
							usr.choosenrace = "Vampire"
							usr.Human = 0
							usr.Vampire = 1
							usr.gainedrace=1
							usr<<"<FONT COLOR=yellow>Client information</FONT>: You have become a Vampire"
					if("Werewolf")
						if(gainedrace==1)
							usr<<"<FONT COLOR=yellow>Client information</FONT>: You already choose a race."
							return
						if(usr.evil==0)
							usr<<"<FONT COLOR=yellow>Client information</FONT>: You are not evil"
							return
						else
							usr.race = "Werewolf"
							usr.choosenrace = "Werewolf"
							usr.Werewolf = 1
							usr.Human = 0
							usr.gainedrace=1
							usr<<"<FONT COLOR=yellow>Client information</FONT>: You have become a Werewolf"
					if("Mysticlighter")
						if(gainedrace==1)
							usr<<"<FONT COLOR=yellow>Client information</FONT>: You already choose a race."
							return
						if(usr.Mystical==0)
							usr<<"<FONT COLOR=yellow>Client information</FONT>: You do not have Mystical blood in you"
							return
						if(usr.evil==0)
							usr<<"<FONT COLOR=yellow>Client information</FONT>: You are not evil, visit magic school"
							return
						else
							usr.race = "Mysticlighter"
							usr.choosenrace = "Mysticlighter"
							usr.Mysticlighter = 1
							usr.icon = 'Goodwitchs.dmi'
							usr.icon_state = "Cupid"
							usr.original_icon = "Cupid"
							usr.Human = 0
							usr.gainedrace=1
							usr<<"<FONT COLOR=yellow>Client information</FONT>: You have become a Mysticlighter"

	Good_Race
		name = "Class Teacher (Good)"
		Darklighter = 1
		icon = 'Goodwitchs.dmi'
		icon_state = "whitelighter"
		density = 1
		maxhealth = 1000000000000000
		health = 1000000000000000
		race = "whitelighter"
		age = "?"
		gender1 = "Male"
		good = 1
		NPC = 1
		inmagicschool = 1
		align = 110
		verb
			Speak()
				set src in oview(1)
				usr << "Hmm, what powers do you want to learn?"
				if(gainedrace==1)
					usr<<"<FONT COLOR=yellow>Client information</FONT>: You already choose a race."
					return
				var/default_value = "Choose your race"
				var/list/good_races = list("Witch", "Half Demon", "Whitelighter", "Halfblood Whitelighter", "Mysticlighter", "Cancel")
				race_choice = input(usr, default_value) in good_races
				switch(race_choice)
					if("Half Demon")
						if(gainedrace==1)
							usr<<"<FONT COLOR=yellow>Client information</FONT>: You already choose a race."
							return
						if(usr.good==0)
							usr<<"<FONT COLOR=yellow>Client information</FONT>: You are not good"
							return
						else
							usr.race = "Half Demon"
							usr.choosenrace = "Half Demon"
							usr.Human = 0
							usr.HalfDemon = 1
							usr.gainedrace=1
							usr<<"<FONT COLOR=yellow>Client information</FONT>: You have become a Half Demon"
					if("Whitelighter")
						if(gainedrace==1)
							usr<<"<FONT COLOR=yellow>Client information</FONT>: You already choose a race."
							return
						if(usr.good==0)
							usr<<"<FONT COLOR=yellow>Client information</FONT>: You are not good"
							return
						else
							usr.race = "Whitelighter"
							usr.choosenrace = "Whitelighter"
							usr.icon = 'Goodwitchs.dmi'
							usr.icon_state = "Lighter"
							usr.original_icon = "Lighter"
							usr.Whitelighter = 1
							usr.verbs+=new/mob/Rank/verb/Change_to_robe
							usr.Human = 0
							usr.gainedrace=1
							usr<<"<FONT COLOR=yellow>Client information</FONT>: You have become a Whitelighter"
					if("Halfblood Whitelighter")
						if(gainedrace==1)
							usr<<"<FONT COLOR=yellow>Client information</FONT>: You already choose a race."
							return
						if(usr.good==0)
							usr<<"<FONT COLOR=yellow>Client information</FONT>: You are not good"
							return
						else
							usr.race = "Half Whitelighter"
							usr.choosenrace = "Half Whitelighter"
							usr.HalfWhitelighter = 1
							usr.verbs+=new/mob/whitelighter/verb/Meditate
							usr.Human = 0
							usr.gainedrace=1
							usr<<"<FONT COLOR=yellow>Client information</FONT>: You have become a Half Whitelighter"
					if("Witch")
						if(gainedrace==1)
							usr<<"<FONT COLOR=yellow>Client information</FONT>: You already choose a race."
							return
						if(usr.good==0)
							usr<<"<FONT COLOR=yellow>Client information</FONT>: You are not good"
							return
						else
							usr.race = "Witch"
							usr.choosenrace = "Witch"
							usr.Witch = 1
							usr.Human = 0
							usr.gainedrace=1
							usr<<"<FONT COLOR=yellow>Client information</FONT>: You have become a Witch"
					if("Mysticlighter")
						if(gainedrace==1)
							usr<<"<FONT COLOR=yellow>Client information</FONT>: You already choose a race."
							return
						if(usr.Mystical==0)
							usr<<"<FONT COLOR=yellow>Client information</FONT>: You do not have Mystical blood in you"
							return
						if(usr.good==0)
							usr<<"<FONT COLOR=yellow>Client information</FONT>: You are not good, become good first"
							return
						else
							usr.race = "Mysticlighter"
							usr.choosenrace = "Mysticlighter"
							usr.icon = 'Goodwitchs.dmi'
							usr.icon_state = "Cupid"
							usr.original_icon = "Cupid"
							usr.Mysticlighter = 1
							usr.Human = 0
							usr.gainedrace=1
							usr<<"<FONT COLOR=yellow>Client information</FONT>: You have become a Mysticlighter"

	Good_Teleport
		name = "Teleport Teacher (Good)"
		Demon = 1
		icon = 'Goodwitchs.dmi'
		icon_state = "Darklighter"
		density = 1
		RolePlaying = 1
		maxhealth = 10000000000000
		health = 10000000000000
		race = "Demon"
		age = "?"
		gender1 = "Male"
		good = 1
		NPC = 1
		inmagicschool = 1
		align = 110
		verb
			Speak()
				set src in oview(1)
				switch(alert(usr,"What is it you want?","Teleport learning","Choose Teleport","Learn Teleport"))
					if("Choose Teleport")
						if(usr.choosen_teleport==1)
							usr<<"Teleport Teacher: You have already choosen what sort of teleport you want!"
							return
						else
							usr<<"Teleport Teacher: Choose what teleport way you want to learn."
							usr<<"Teleport Teacher: However, you may only choose once, so select it carefully"
							sleep(10)
							var/default_value = "Flame"
							var/list/Teleport_List = list("Shimmer", "Blink", "Whitelighter Orb")
							teleportteach = input(usr, default_value) in Teleport_List
							switch(teleportteach)
								if("Shimmer")
									if(usr.Demon==1||usr.HalfDemon==1)
										usr.teleport_shimmer = 1
										usr.choosen_teleport = 1
										usr<<"<FONT COLOR=yellow>Client information</FONT>: You have choosen <B>Shimmer</B> as your teleport."
									else
										usr<<"<FONT COLOR=yellow>Client information</FONT>: You are not demonic."
								if("Blink")
									if(usr.Warlock==1||usr.Demon==1||usr.Witch==1)
										usr.teleport_blink = 1
										usr.choosen_teleport = 1
										usr<<"<FONT COLOR=yellow>Client information</FONT>: You have choosen <B>Blink</B> as your teleport."
									else
										usr<<"<FONT COLOR=yellow>Client information</FONT>: You are no Warlock, Witch or Demon."
								if("Whitelighter Orb")
									if(usr.Whitelighter==1||usr.HalfWhitelighter==1)
										usr.teleport_wlorb = 1
										usr.choosen_teleport = 1
										usr<<"<FONT COLOR=yellow>Client information</FONT>: You have choosen <B>Whitelighter Orb</B> as your teleport."
									else
										usr<<"<FONT COLOR=yellow>Client information</FONT>: You are no Whitelighter or Half whitelighter."
					if("Learn Teleport")
						usr<<"Teleport Teacher: Let's see what powers await you"
						usr.TeleportCheck()

	Good_Powers
		name = "Skill Teacher (Good)"
		Demon = 1
		icon = 'Goodwitchs.dmi'
		icon_state = "godwitch"
		density = 1
		maxhealth = 100000000000000
		health = 10000000000000
		race = "Witch"
		age = "?"
		gender1 = "Female"
		good = 1
		NPC = 1
		inmagicschool = 1
		alignpoint = 110
		verb
			Speak()
				set src in oview(1)
				usr << "Skill Teacher: There are a few skills i can learn you."
				if(usr.gainedrace==0)
					usr<<"<FONT COLOR=yellow>Client information</FONT>: You must choose a race first."
					return
				var/default_value = "Choose your powers"
				var/list/evil_powers = list("Telekinetic Witch","Molecular Witch","Premonition Witch", "Half Demon","Supportive Whitelighter","Half Whitelighter", "Cancel")
				power_choice = input(usr,default_value) in evil_powers
				switch(power_choice)
					if("Telekinetic Witch")
						if(usr.Witch==1)
							if(usr.powerchoice == 0)
								usr.powerchoice = 9
							if(usr.powerchoice == 9)
								if(usr.power >= 8000)
									usr.verbs+=new/mob/witch/verb/Telekinesis_basic
									usr << "<FONT COLOR=yellow>Client information</FONT>: You learned to move <B>Objects</B>!"
								if(usr.power >= 12000)
									usr.verbs+=new/mob/witch/verb/Telekinesis_Reversal
									usr << "<FONT COLOR=yellow>Client information</FONT>: You learned to move <B>Objects</B> away from you!"
								if(usr.power >= 18000)
									usr.verbs+=new/mob/witch/verb/Telekinesis_Advanced
									usr << "<FONT COLOR=yellow>Client information</FONT>: You learned to move <B>Personnes</B>!"
								if(usr.power >= 20500)
									usr.TelekinesisAdvanced=2
									usr << "<FONT COLOR=yellow>Client information</FONT>: You mastered <B>Telekinesis</B>!"
								if(usr.power >= 26000)
									usr.verbs+=new/mob/witch/verb/Telekinesis_Blast
									usr << "<FONT COLOR=yellow>Client information</FONT>: You learned to use <B>Telekinesis</B> as a attack!"
								if(usr.power >= 52000)
									usr.verbs+=new/mob/witch/verb/Telekinesis_Repel
									usr << "<FONT COLOR=yellow>Client information</FONT>: You learned to use <B>Telekinesis</B> to throw people!"
								if(usr.power >= 35000)
/*									usr.verbs+=new/mob/witch/verb/Telekinesis_Rage
									usr << "<FONT COLOR=yellow>Client information</FONT>: You learned to use <B>Telekinesis</B> as rage!"*/
								else
									usr << "<FONT COLOR=yellow>Client information</FONT>: You do not yet meet the requirements"
							else if(usr.powerchoice >= 10||usr.powerchoice<=8)
								usr << "<FONT COLOR=yellow>Client information</FONT>: You have choosen a other skill tree"
						else
							usr<<"<FONT COLOR=yellow>Client information</FONT>: You are not fit for these powers"
					if("Molecular Witch")
						if(usr.Witch==1)
							if(usr.powerchoice == 0)
								usr.powerchoice = 10
							if(usr.powerchoice == 10)
								if(usr.power >= 7000)
									usr.verbs+=new/mob/witch/verb/Freeze
									usr << "<FONT COLOR=yellow>Client information</FONT>: You learned how to <B>Freeze</B> the enviroment!"
								if(usr.power >= 9000)
									usr.verbs+=new/mob/witch/verb/Unfreeze
									usr << "<FONT COLOR=yellow>Client information</FONT>: You learned how to <B>Unfreeze</B> the enviroment!"
								if(usr.power >= 14000)
									usr.verbs+=new/mob/witch/verb/Freeze_Player
									usr << "<FONT COLOR=yellow>Client information</FONT>: You learned to <B>Freeze People</B>!"
								if(usr.power >= 14500)
									usr.verbs+=new/mob/witch/verb/Unfreeze_Player
									usr << "<FONT COLOR=yellow>Client information</FONT>: You learned to <B>Unfreeze People</B>!"
								if(usr.power >= 17000)
									usr.adjust = 1
									usr << "<FONT COLOR=yellow>Client information</FONT>: You learned to <B>Adjust</B>!"
								if(usr.power >= 15000)
									usr.verbs+=new/mob/witch/verb/Freeze_Object
									usr << "<FONT COLOR=yellow>Client information</FONT>: You learned to <B>Freeze Objects</B>!"
								if(usr.power >= 20000)
									usr.verbs+=new/mob/witch/verb/Freeze_Body
									usr << "<FONT COLOR=yellow>Client information</FONT>: You learned to <B>Freeze Body</B> so they can still talk!"
								if(usr.power >= 25000)
									usr.verbs+=new/mob/witch/verb/Blow_Up
									usr << "<FONT COLOR=yellow>Client information</FONT>: You learned to <B>Blow up</B>!"
								else
									usr << "<FONT COLOR=yellow>Client information</FONT>: You do not yet meet the requirements"
							else if(usr.powerchoice >= 11||usr.powerchoice<=9)
								usr << "<FONT COLOR=yellow>Client information</FONT>: You have choosen a other skill tree"
						else
							usr<<"<FONT COLOR=yellow>Client information</FONT>: You are not fit for these powers"
					if("Half Demon")
						if(usr.HalfDemon==1)
							if(usr.powerchoice == 0)
								usr.powerchoice = 3
							if(usr.powerchoice == 3)
								if(usr.power >= 7500)
									usr.verbs+=new/mob/demon/verb/Summon_Athame
									usr << "<FONT COLOR=yellow>Client information</FONT>: You learned to <B>Summon Athames</B>!"
								if(usr.power >= 12500)
									usr.verbs+=new/mob/demon/verb/Energybolt
									usr << "<FONT COLOR=yellow>Client information</FONT>: You learned <B>Energybolt</B>!"
								if(usr.power >= 15000)
									usr.verbs+=new/mob/halfdemon/verb/Change
									usr << "<FONT COLOR=yellow>Client information</FONT>: You learned to <B>Change</B> into demon form!"
								if(usr.power >= 25000)
									usr.adjust = 1
									usr << "<FONT COLOR=yellow>Client information</FONT>: You learned to <B>Adjust</B>!"
								else
									usr << "<FONT COLOR=yellow>Client information</FONT>: You do not yet meet the requirements"
							else if(usr.powerchoice >= 4||usr.powerchoice<=2)
								usr << "<FONT COLOR=yellow>Client information</FONT>: You have choosen a other skill tree"
						else
							usr<<"<FONT COLOR=yellow>Client information</FONT>: You are not fit for these powers"
					if("Supportive Whitelighter")
						if(usr.Whitelighter==1)
							if(usr.powerchoice == 0)
								usr.powerchoice = 11
							if(usr.powerchoice == 11)
								if(usr.power >= 2000)
									usr.verbs+=new/mob/whitelighter/verb/Choose_charge
									usr.verbs+=new/mob/whitelighter/verb/Meditate
									usr << "<FONT COLOR=yellow>Client information</FONT>: You can now <B>Meditate</B>!"
									usr << "<FONT COLOR=yellow>Client information</FONT>: You can now have <B>Charges</B>!"
								if(usr.power >= 9000)
									usr.verbs+=new/mob/whitelighter/verb/Heal
									usr << "<FONT COLOR=yellow>Client information</FONT>: You learned to <B>Heal</B>!"
								if(usr.power >= 16500)
									usr.verbs+=new/mob/whitelighter/verb/Glamor
									usr << "<FONT COLOR=yellow>Client information</FONT>: You learned to <B>Glamor</B>!"
								else
									usr << "<FONT COLOR=yellow>Client information</FONT>: You do not yet meet the requirements"
							else if(usr.powerchoice >= 12||usr.powerchoice<=10)
								usr << "<FONT COLOR=yellow>Client information</FONT>: You have choosen a other skill tree"
					if("Premonition Witch")
						if(usr.Witch==1)
							if(usr.powerchoice == 0)
								usr.powerchoice = 12
							if(usr.powerchoice == 12)
								if(usr.power >= 4000)
									usr.verbs+=new/mob/witch/Prem/verb/Premonition
									usr << "<FONT COLOR=yellow>Client information</FONT>: You now posses the power of <B>Premonitions</B>!"
								if(usr.power >= 7500)
									usr.verbs+=new/mob/demon/verb/Summon_Athame
									usr << "<FONT COLOR=yellow>Client information</FONT>: You learned to <B>Summon Athames</B>!"
								if(usr.power >= 10000)
									usr.verbs+=new/mob/shield/verb/Shield
									usr << "<FONT COLOR=yellow>Client information</FONT>: You can now create a <B>Shield</B>!"
								if(usr.power >= 14500)
									usr.verbs+=new/mob/witch/Telepath/verb/Mind_Talk
									usr << "<FONT COLOR=yellow>Client information</FONT>: You learned to speak <B>Telepathically</B>!"
								else
									usr << "<FONT COLOR=yellow>Client information</FONT>: You do not yet meet the requirements"
							else if(usr.powerchoice >= 13||usr.powerchoice<=11)
								usr << "<FONT COLOR=yellow>Client information</FONT>: You have choosen a other skill tree"
					if("Half Whitelighter")
						if(usr.HalfWhitelighter==1)
							if(usr.powerchoice == 0)
								usr.powerchoice = 13
							if(usr.powerchoice == 13)
								if(usr.power >= 3000)
									usr.verbs+=new/mob/whitelighter/verb/Choose_charge
									usr << "<FONT COLOR=yellow>Client information</FONT>: You can now have <B>Charges</B>!"
								if(usr.power >= 6500)
									usr.verbs+=new/mob/darklighter/verb/DL_Sense
									usr << "<FONT COLOR=yellow>Client information</FONT>: You learned to <B>Sense</B> whitelighters!!"
								if(usr.power >= 9000)
									usr.verbs+=new/mob/whitelighter/verb/Orb_object
									usr << "<FONT COLOR=yellow>Client information</FONT>: You learned to <B>Orb Objects</B>!"
								else
									usr << "<FONT COLOR=yellow>Client information</FONT>: You do not yet meet the requirements"
							else if(usr.powerchoice >= 14||usr.powerchoice<=12)
								usr << "<FONT COLOR=yellow>Client information</FONT>: You have choosen a other skill tree"

	Good_Power_Informant
		name = "Information Teacher (Good)"
		Demon = 1
		icon = 'Goodwitchs.dmi'
		icon_state = "whitelighter"
		density = 1
		maxhealth = 100000000000000
		health = 10000000000000
		race = "Witch"
		age = "?"
		gender1 = "Male"
		good = 1
		NPC = 1
		inmagicschool = 1
		alignpoint = 110
		verb
			Speak()
				set src in oview(1)
				usr << "Information Teacher: There are a few things i can tell you about."
				var/default_value = "Choose your powers"
				var/list/evil_powers = list("Witch 1","Witch 2","Witch 3", "Half Demon","Whitelighter 1", "Whitelighter 2", "Mysticlighter", "Cancel")
				power_choice = input(usr,default_value) in evil_powers
				switch(power_choice)
					if("Witch 1")
						usr << "Information Teacher: The first set of Witch power are to be teached to witches only."
						usr << "Information Teacher: The powers that are teached are Telekinetic powers."
					if("Witch 2")
						usr << "Information Teacher: The second set of Witch power are to be teached to witches only."
						usr << "Information Teacher: The powers that are teached are the power to Freeze and eventually Blowup personnes."
					if("Witch 3")
						usr << "Information Teacher: The second set of Witch power are to be teached to witches only."
						usr << "Information Teacher: The powers that are teached are varieus, like Premonition, Telepath, summoning Athames and a Shield!"
					if("Half Demon")
						usr << "Information Teacher: The third set of Demonic power are to be teached to half demons only."
						usr << "Information Teacher: The powers that are learned are the Energybolt and the ability to summon athames and adjust to freeze."
					if("Whitelighter 1")
						usr << "Information Teacher: The first set of Whitelighter power are to be teached to whitelighters only."
						usr << "Information Teacher: The powers that are teached are the ability to heal and later to glamor into others!"
					if("Whitelighter 2")
						usr << "Information Teacher: The second set of Whitelighter power are to be teached to whitelighters only."
						usr << "Information Teacher: The powers that are teached are the ability to sense other whitelighters and later to orb objects!"
					if("Mysticlighter")
						usr << "Information Teacher: Mysticlighters are strange creatures, there powers cannot be teached, only unlocked."
						usr << "Information Teacher: They are people born with mystical blood, they do not choose the power, it chooses them."
						usr << "Information Teacher: If you are a Mystical creature, you must speak with the headmaster, im sure he can help you."
