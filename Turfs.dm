//The floor, walls, three's and rocks and stuff are coded here.

turf
	Floor
		Grass
			name = ""
			icon = 'Turfs.dmi'
			icon_state = "high grass"
			density = 0
		Sidewalk
			name = ""
			icon = 'Turfs.dmi'
			icon_state = "floor3"
			density = 0
turf
	tile125b
		icon = 'General.dmi'
		icon_state = "tile125b"
		density = 1


turf/Area/
	Graveyard
		name = ""
		density = 0
	Login2
		name=""
		density=0
	Heaven
		name = ""
		density = 0
	Hell
		name = ""
		density = 0
	Earth
		name = ""
		density = 0
	CouncilRoom
		name = ""
		density = 0
	Cleaned
		name = ""
		density = 0
	Avatars
		name = ""
		density = 0
	MeetingRoom
		name = ""
		density = 0
	GoodDeath
		name = ""
		density = 0
	EvilDeath
		name = ""
		density = 0
	Death
		name = ""
		density = 0
	Charmed
		name = ""
		density = 0
	Park
		name = ""
		density = 0
	EmptyHouse
		name = ""
		density = 0
	SyncWolfsHouse
		name = ""
		density = 0
	ZenioxHouse
		name = ""
		density = 0
	Graveyard
		name = ""
		density = 0
	Hollow
		name = " "
		density = 0
	DragowingHouse
		name = ""
		density = 0
	Ultimate
		name = ""
		density = 0
	DemonSchool
		name = ""
		density = 0
	MagicSchool
		name = ""
		density = 0
	DarkForce
		name = "Dark Force Liar"
		density = 0

turf/teleport/DeathToHell//the name of our turf
	Entered(mob/M)
		if(istype(M,/mob))//is it a mob that entered?
			M.loc=locate(/turf/Area/EvilDeath)
			M << "You are starting to get ressurected"
			sleep(25)
			M << "You are transfered to the Safe Zone"
			M.death=0
			M.icon = 'Goodwitchs.dmi'
			M.icon_state = M.original_icon
			M.loc=locate(/turf/Area/Hell)
			world << "<font color=blue>[M] is alive again</font>"
			M.RolePlaying = 1
			M.statuschecker()

turf/teleport/HellFromDeath
	name = ""
	density = 0
turf/teleport/DeathToEarth//the name of our turf
	Entered(mob/M)
		if(istype(M,/mob))//is it a mob that entered?
			M.loc=locate(/turf/Area/GoodDeath)
			M << "You are starting to get ressurected"
			sleep(25)
			M.death=0
			M.icon = 'Goodwitchs.dmi'
			M.icon_state = M.original_icon
			M.loc=locate(/turf/Area/Earth)
			M.RolePlaying = 1
			world << "<FONT COLOR=red>War information</FONT>: [M] is alive again"
turf/teleport/EarthFromDeath
	name = ""
	density = 0

turf/Area/Hell2
	name = ""
	density = 0

turf/Teleport/HeavenSouth//the name of our turf
	Entered(mob/M)
		if(istype(M,/mob) && M.Whitelighter==1)//is it a mob that entered?
			M.loc=locate(/turf/Teleport/HeavenNorth)

turf/Teleport/HeavenNorth//the name of our turf
	Entered(mob/M)
		if(istype(M,/mob) && M.Whitelighter==1)//is it a mob that entered?
			M.loc=locate(/turf/Teleport/HeavenSouth)


turf/Login
	icon='charmed_title2.bmp'


	Buttons
		Load
			icon='Turfs.dmi'
			icon_state="clear"
			Click()
				if(istype(usr,/mob/BaseCamp/ChoosingCharacter))
					var/mob/BaseCamp/ChoosingCharacter/M=usr
					M.Choose_Character()
					return
		New
			icon='Turfs.dmi'
			icon_state="clear"
			Click()
				if(istype(usr,/mob/BaseCamp/ChoosingCharacter))
					var/mob/BaseCamp/ChoosingCharacter/M=usr
					//ChooseCharacter2()
					M.New_Character()
					return
		Quit
			icon='Turfs.dmi'
			icon_state="clear"
			DblClick()
				del usr

		Delete
			icon='Turfs.dmi'
			icon_state="clear"
			Click()
				if(istype(usr,/mob/BaseCamp/ChoosingCharacter))
					var/mob/BaseCamp/ChoosingCharacter/M=usr
					//ChooseCharacter2()
					M.DeleteCharacter()
					return