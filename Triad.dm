/*************************/
//	Triad Turfs
turf/Triad
	name = "Triad Pedal"
	icon = 'General.dmi'
	icon_state = "triad1"
	density = 0
turf/Triad/Triad_Corner1
	name = "Triad Pedal"
	icon = 'General.dmi'
	icon_state = "triad2"
	density = 0
turf/Triad/Triad_Corner2
	name = "Triad Pedal"
	icon = 'General.dmi'
	icon_state = "triad3"
	density = 0
turf/Triad/Triad_Corner3
	name = "Triad Pedal"
	icon = 'General.dmi'
	icon_state = "triad4"
	density = 0
turf/Triad/Triad_Corner4
	name = "Triad Pedal"
	icon = 'General.dmi'
	icon_state = "triad5"
	density = 0
turf/Triad/Triad_Side1
	name = "Triad Pedal"
	icon = 'General.dmi'
	icon_state = "triad6"
	density = 0
turf/Triad/Triad_Side2
	name = "Triad Pedal"
	icon = 'General.dmi'
	icon_state = "triad7"
	density = 0
turf/Triad/Triad_Side3
	name = "Triad Pedal"
	icon = 'General.dmi'
	icon_state = "triad9"
	density = 0
turf/Triad/Triad_Side4
	name = "Triad Pedal"
	icon = 'General.dmi'
	icon_state = "triad8"
	density = 0

turf/Triad/Pedal_Center
		name = "Triad Pedal"
		icon = 'General.dmi'
		icon_state = "blanc"

turf/Triad/Hell10ToTriad//the name of our turf
	icon = 'General.dmi'
	icon_state = "blanc"
	Entered(mob/M)
		if(istype(M,/mob))//is it a mob that entered?
			M.loc=locate(/turf/Triad/TriadToHell10)
turf/Triad/TriadToHell10//the name of our turf
	icon = 'General.dmi'
	icon_state = "blanc"
	Entered(mob/M)
		if(istype(M,/mob))//is it a mob that entered?
			M.loc=locate(/turf/Triad/Hell10ToTriad)


/**************************/
mob/Triad/verb
	Triad_Summon_Pedal(mob/M in world)
		set name = "Summon to Pedal"
		set category = "Skills"
		set desc = "Summons a personne to the Triad Pedal"
		if(usr.Freeze==1)
			usr<<"Your frozen, you can't use magic"
			return
		if(usr.RolePlaying == 0)
			usr<<"Your not roleplaying"
			return
		if(M.RolePlaying == 0)
			usr<<"[M] isnt roleplaying"
			return
		if(usr.death==1)
			usr<<"You are death"
			return
		if(M.death==1)
			usr<<"[M] is death"
			return
		if(M.erased==1)
			usr<<"[M] has been erased from time and space"
			return
		if(usr.erased==1)
			usr<<"You has been erased from time and space"
			return
		if(M.alignment=="Evil"||M.alignment=="Neutral"||M.align <= 100)
			M.Freeze = 1
			M.loc = locate(/turf/Triad/Pedal_Center)
			M<<"You have been summoned by the Triad"
			view(9)<<"[M] appears at the Triad Pedal"
			M.inhell = 1
			sleep(20)
			M.Freeze = 0
		else
			usr<<"[M] is not evil or neutral"

	Force_visability(mob/M in view(9))
		set name = "Force Visibility"
		set category = "Skills"
		if(M.Selforb == 1)
			M.density = 1
			M.Selforb = 0
			M.icon = new /mob/goodwitch()
			view(9)<<"[M] becomes visible"
		else
			usr<<"[M] isnt in orb"


