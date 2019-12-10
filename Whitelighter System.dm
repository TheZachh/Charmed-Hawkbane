mob/proc
	Whitelighter_Death()
		src.overlays += /obj/whitelighter/whitelighterdie
		src.icon = null
		src.density = 0
		src.Selforb = ""
		src.Freeze = 1
		sleep(5)
		src.overlays = null
		src.Freeze = 0
		sleep(20)
		src.overlays += /obj/whitelighter/whitelighterlive
		sleep(4)
		src.icon = new /mob/Whitelighter()
		src.density = 1
		src.Selforb = ""
		sleep(1)
		src.overlays = null
		return

mob/var
	charge1 = ""
	charge2 = ""
	charge3 = ""
	whitelightername = ""
	haswhitelighter = 0
	hascharge = 0

mob/whitelighter/verb
	Choose_charge(mob/M in world)
		set category = "Skills"
		if(M.client)
			if(M.Witch==1)
				if(M.haswhitelighter==1)
					usr<<"[M] already has a whitelighter guide"
					return
				if(M.haswhitelighter==0)
					usr<<"You have choosen [M] to be your charge"
					if(usr.hascharge==0)
						usr.charge1 = M.name
						usr.hascharge += 1
					else if(usr.hascharge==1)
						usr.charge2 = M.name
						usr.hascharge += 1
					else if(usr.hascharge==2)
						usr<<"You already have 2 charges and only a elder can give you anotherone"
						return
					M<<"[usr] has taken the responsibility to be your whitelighter guide"
					M.whitelightername = usr.name
					M.haswhitelighter = 1
			else
				usr<<"[M] is no witch"
	No_Charge()
		set category = "Skills"
		set desc = "Removes all charges"
		usr.charge1 = null
		usr.charge2 = null
		usr.hascharge = 0

mob/Elder/verb
	Force_Charge(mob/M in view(9))
		set category = "Skills"
		if(M.Whitelighter==0)
			usr<<"[M] isnt a whitelighter."
			return
		else
			if(M.hascharge==3)
				usr<<"[M] already has 3 charges"
				return
			var/mob/M2 = input("Choose a witch:","Choose Witch:") as mob
			if(M2.Witch==1)
				if(M2.haswhitelighter==0)
					M.charge3 = M2.name
					M2.whitelightername = M.name
					M2.haswhitelighter = 1
					M<<"The Elder [usr] has given you [M2] as a new charge."
					M2<<"[M] has become your whitelighter guide."
					usr<<"[M2] is now [M]'s new charge."
					return
				else
					usr<<"[M2] already has a whitelighter guide."
			else
				usr<<"[M2] is no witch"

	Go_To_Council_Room()
		set category = "Skills"
		set name = "Go To Council Room"
		if(usr.Freeze==1)
			usr<<"Your frozen, you can't use magic"
			return
		if(usr.RolePlaying == 0)
			usr<<"Your not roleplaying"
			return
		if(usr.death==1)
			usr<<"You are death"
			return
		if(usr.erased==1)
			return
		view(9)<< "[usr] go's to Council Room"
		usr.loc = locate(/turf/Area/CouncilRoom)
		usr.inheaven = 1

	Call_Council()
		set category = "Skills"
		set name = "Call Council Members"
		for(var/mob/M in world)if(M.client)
			if(M.rank=="Whitelighter Council")
				M<<"<I><FONT COLOR=#00ffff>Y</FONT><FONT COLOR=#00ffff>o</FONT><FONT COLOR=#00ffff>u</FONT><FONT COLOR=#00ffff> </FONT><FONT COLOR=#00ffff>h</FONT><FONT COLOR=#00ffff>e</FONT><FONT COLOR=#00ffff>a</FONT><FONT COLOR=#00ffff>r</FONT><FONT COLOR=#00ffff> </FONT><FONT COLOR=#00ffff>t</FONT><FONT COLOR=#00ffff>h</FONT><FONT COLOR=#00ffff>e</FONT><FONT COLOR=#00ffff> </FONT><FONT COLOR=#00ffff>C</FONT><FONT COLOR=#00ffff>o</FONT><FONT COLOR=#00ffff>u</FONT><FONT COLOR=#00ffff>n</FONT><FONT COLOR=#00ffff>c</FONT><FONT COLOR=#00ffff>i</FONT><FONT COLOR=#00ffff>l</FONT><FONT COLOR=#00ffff> </FONT><FONT COLOR=#00ffff>c</FONT><FONT COLOR=#00ffff>a</FONT><FONT COLOR=#00ffff>l</FONT><FONT COLOR=#00ffff>l</FONT>"

	Call_Single_Whitelighter(mob/M as mob in world)
		set category = "Skills"
		if(M.Whitelighter==1)
			M<<"<i><font color=blue>You hear ringing in your ears."


	Call_Whitelighters()
		set category = "Skills"
		for(var/mob/M in world)if(M.client)
			if(M.Whitelighter==1)
				M<<"<i><font color=blue>You hear ringing in your ears."

	Clip_Wings(mob/M in world)
		set category = "Skills"
		if(M.Whitelighter==1)
			if(M.rank=="Elder")
				return
			M.race = "Human"
			M.Human = 1
			M.Whitelighter = 0
			M.verbs-=typesof(/mob/whitelighter/verb)
			M<<"The elders have clipped your wings."
			usr<<"You have clipped [M]'s wings."
			world.log<<"[usr] has clipped [M]'s wings."
		else
			usr<<"[M] is not a whitelighter."
	Give_Wings(mob/M in view(9)-usr)
		set category = "Skills"
		if(M.Human==1)
			M.verbs+=typesof(/mob/whitelighter/verb)
			M.verbs -= /mob/whitelighter/verb/Orb_object
			M.Whitelighter = 1
			M<<"The elders have restored your wings."
			world.log<<"[usr] has given [M]'s wings back."
		else
			usr<<"[M] is not a human or fallen whitelighter."