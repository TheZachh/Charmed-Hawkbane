//////////////////////////////////////////////////////
/////////////////   	NPCS	   ///////////////////
mob/DemonSchool
	Teacher_Teleport1
		name = "Teleport Teacher"
		icon = 'Goodwitchs.dmi'
		icon_state = "whitelighter"
		density = 1

mob/MagicSchool
	Teacher_Teleport1
		name = "Teleport Teacher"
		icon = 'Goodwitchs.dmi'
		icon_state = "godwitch"
		density = 1

//////////////////////////////////////////////////////
////////////////	HeadMaster	//////////////////////

mob/Teach/verb/
	Teleport_Good(mob/M in view(9))
		set name = "Teach Teleport"
		set category = "Teacher"
		var/default_value = ""
		var/list/teleportlist = list("Whitelighter Orb", "Shimmer","Blink", "Cancel")
		teleportteach = input(usr, default_value) in teleportlist
		switch(teleportteach)
			if("Whitelighter Orb")
				if(M.Whitelighter==1||M.HalfWhitelighter==1)
					if(M.power>=1250)
						M.verbs+=new/mob/whitelighter/verb/Orb
						M.verbs+=new/mob/whitelighter/verb/Join_orb
					if(M.power>=15000)
						M.verbs+=new/mob/whitelighter/verb/Orb_with_people
						M.verbs+=new/mob/whitelighter/verb/Orb_longdist
					if(M.power>=25000)
						M.verbs+=new/mob/whitelighter/verb/Choose_charge
						M.verbs+=new/mob/whitelighter/verb/No_Charge
					if(M.power>=75000)
						M.verbs+=new/mob/whitelighter/verb/Orb_place
					if(M.power>=250000)
						M.verbs+=new/mob/Elder/verb/Orb_other
					if(M.power>=300000)
						M.verbs+=new/mob/Elder/verb/Orb_player_place
					else
						usr<<"[M] does not meet the requirements yet"
				else
					usr<<"[M] is not a Whitelighter or Half Whitelighter"
			if("Shimmer")
				if(M.Demon==1||M.Witch==1||M.Warlock==1||M.HalfDemon==1)
					if(M.HalfWhitelighter==1)
						usr<<"A Half Whitelighter cannot learn Shimmer"
						return
					if(M.power>=1250)
						M.verbs+=new/mob/demon/verb/shimmer
						M.verbs+=new/mob/demon/verb/Join_shimmer
					if(M.power>=15000)
						M.verbs+=new/mob/demon/verb/shimmer_long
						M.verbs+=new/mob/demon/verb/shimmer_with_people
					if(M.power>=75000)
						M.verbs+=new/mob/demon/verb/shimmer_place
					if(M.power>=250000)
						M.verbs+=new/mob/demon/verb/Shimmer_other
					else
						usr<<"[M] does not meet the requirements yet"
				else
					usr<<"[M] is not a Demon, Half Demon, Warlock or Witch"
			if("Blink")
				if(M.Witch==1||M.Warlock==1)
					if(M.HalfWhitelighter==1)
						usr<<"A Half Whitelighter cannot learn Blink"
						return
					if(M.power>=1250)
						M.verbs+=new/mob/witch/verb/Blink
					if(M.power>=15000)
						M.verbs+=new/mob/witch/verb/Blink_Long
					if(M.power>=75000)
						M.verbs+=new/mob/witch/verb/Blink_place
					else
						usr<<"[M] does not meet the requirements yet"
				else
					usr<<"[M] is not a Warlock or Witch"
			if("Cancel")
				..()

	Teleport_Evil(mob/M in view(9))
		set name = "Teach Teleport"
		set category = "Teacher"
		var/default_value = ""
		var/list/teleportlist = list("Darklighter Orb", "Shimmer","Blink","Flame Orb", "Cancel")
		teleportteach = input(usr, default_value) in teleportlist
		switch(teleportteach)
			if("Darklighter Orb")
				if(M.Darklighter==1)
					if(M.power>=1250)
						M.verbs+=new/mob/darklighter/verb/DL_Orb
						M.verbs+=new/mob/darklighter/verb/Join_black_orb
					if(M.power>=15000)
						M.verbs+=new/mob/darklighter/verb/DL_Orb_with_people
						M.verbs+=new/mob/darklighter/verb/DL_Orb_longdist
					if(M.power>=75000)
						M.verbs+=new/mob/darklighter/verb/DL_Orb_place
					if(M.power>=250000)
						M.verbs+=new/mob/darklighter/verb/DL_orb_other
					else
						usr<<"[M] does not meet the requirements yet"
				else
					usr<<"[M] is not a Darklighter"
			if("Shimmer")
				if(M.Demon==1||M.Warlock==1||M.HalfDemon==1)
					if(M.power>=1250)
						M.verbs+=new/mob/demon/verb/shimmer
						M.verbs+=new/mob/demon/verb/Join_shimmer
					if(M.power>=15000)
						M.verbs+=new/mob/demon/verb/shimmer_long
						M.verbs+=new/mob/demon/verb/shimmer_with_people
					if(M.power>=75000)
						M.verbs+=new/mob/demon/verb/shimmer_place
					if(M.power>=250000)
						M.verbs+=new/mob/demon/verb/Shimmer_other
					else
						usr<<"[M] does not meet the requirements yet"
				else
					usr<<"[M] is not a Demon, Half Demon or Warlock"
			if("Blink")
				if(M.Witch==1||M.Warlock==1)
					if(M.HalfWhitelighter==1)
						usr<<"A Half Whitelighter cannot learn Blink"
						return
					if(M.power>=1250)
						M.verbs+=new/mob/witch/verb/Blink
					if(M.power>=15000)
						M.verbs+=new/mob/witch/verb/Blink_Long
					if(M.power>=75000)
						M.verbs+=new/mob/witch/verb/Blink_place
					else
						usr<<"[M] does not meet the requirements yet"
				else
					usr<<"[M] is not a Warlock or Witch"
			if("Flame Orb")
				if(M.Demon==1)
					if(M.power>=1250)
						M.verbs+=new/mob/demon/verb/Flame_orb
						M.verbs+=new/mob/demon/verb/Join_shimmer
					if(M.power>=15000)
						M.verbs+=new/mob/demon/verb/Flame_orb_longdist
						M.verbs+=new/mob/demon/verb/flame_with_people
					if(M.power>=75000)
						M.verbs+=new/mob/demon/verb/Flame_orb_place
					if(M.power>=250000)
						M.verbs+=new/mob/demon/verb/Flame_orb_other
					if(M.power>=300000)
						M.verbs+=new/mob/demon/verb/Flame_orb_player_place
					else
						usr<<"[M] does not meet the requirements yet"
				else
					usr<<"[M] is not a Demon"
			if("Cancel")
				..()

	Attack_Good(mob/M in view(9))
		set name = "Teach Attack"
		set category = "Teacher"
		var/default_value = ""
		var/list/attacklist = list("Energybolt", "Waterball","Electric Bolt","Summon Athame", "Cancel")
		attackteach = input(usr, default_value) in attacklist
		switch(attackteach)
			if("Energybolt")
				M.verbs+=new/mob/demon/verb/Energybolt
				M<<"<FONT COLOR=yellow>Client information</FONT>: You learned <B>Energybolt</B>!"
				usr<<"<FONT COLOR=yellow>Client information</FONT>: [M] learned <B>Energybolt</B>!"
			if("Waterball")
				M.verbs+=new/mob/witch/verb/Waterball
				M<<"<FONT COLOR=yellow>Client information</FONT>: You learned <B>Waterball</B>!"
				usr<<"<FONT COLOR=yellow>Client information</FONT>: [M] learned <B>Waterball</B>!"
			if("Electric Bolt")
				M.verbs+=new/mob/witch/verb/EletricBolt
				M<<"<FONT COLOR=yellow>Client information</FONT>: You learned <B>Electricbolt</B>!"
				usr<<"<FONT COLOR=yellow>Client information</FONT>: [M] learned <B>Electricbolt</B>!"
			if("Summon Athame")
				M.verbs+=new/mob/demon/verb/Summon_Athame
				M<<"<FONT COLOR=yellow>Client information</FONT>: You learned <B>Summon Athame</B>!"
				usr<<"<FONT COLOR=yellow>Client information</FONT>: [M] learned <B>Summon Athame</B>!"

	Attack_Evil(mob/M in view(9))
		set name = "Teach Attack"
		set category = "Teacher"
		var/default_value = ""
		var/list/attacklist = list("Energybolt", "Firebolt","Dark Energyball","Summon Athame","Ignite","Pyrokinesis","Shapeshift", "Cancel")
		attackteach = input(usr, default_value) in attacklist
		switch(attackteach)
			if("Energybolt")
				M.verbs+=new/mob/demon/verb/Energybolt
				M<<"<FONT COLOR=yellow>Client information</FONT>: You learned <B>Energybolt</B>!"
				usr<<"<FONT COLOR=yellow>Client information</FONT>: [M] learned <B>Energybolt</B>!"
			if("Firebolt")
				M.verbs+=new/mob/demon/verb/Firebolt
				M<<"<FONT COLOR=yellow>Client information</FONT>: You learned <B>Firebolt</B>!"
				usr<<"<FONT COLOR=yellow>Client information</FONT>: [M] learned <B>Firebolt</B>!"
			if("Dark Energyball")
				M.verbs+=new/mob/demon/verb/DarkEnergyball
				M<<"<FONT COLOR=yellow>Client information</FONT>: You learned <B>Dark Energyball</B>!"
				usr<<"<FONT COLOR=yellow>Client information</FONT>: [M] learned <B>Dark Energyball</B>!"
			if("Summon Athame")
				M.verbs+=new/mob/demon/verb/Summon_Athame
				M<<"<FONT COLOR=yellow>Client information</FONT>: You learned <B>Summon Athame</B>!"
				usr<<"<FONT COLOR=yellow>Client information</FONT>: [M] learned <B>Summon Athame</B>!"
			if("Ignite")
				M.verbs+=new/mob/demon/verb/Ignite
				M<<"<FONT COLOR=yellow>Client information</FONT>: You learned <B>Ignite</B>!"
				usr<<"<FONT COLOR=yellow>Client information</FONT>: [M] learned <B>Ignite</B>!"
			if("Pyrokinesis")
				M.verbs+=new/mob/demon/verb/Pyrokinesis
				M.Pyrokinesis = 2
				M<<"<FONT COLOR=yellow>Client information</FONT>: You learned <B>Pyrokinesis</B>!"
				usr<<"<FONT COLOR=yellow>Client information</FONT>: [M] learned <B>Pyrokinesis</B>!"
			if("Shapeshift")
				M.verbs+=new/mob/demon/verb/Shapeshift
				M<<"<FONT COLOR=yellow>Client information</FONT>: You learned <B>Shapeshift</B>!"
				usr<<"<FONT COLOR=yellow>Client information</FONT>: [M] learned <B>Shapeshift</B>!"

