client
	command_prompt = "Charmed Online II © 2006 YOUR NAME HERE. All Rights Reserved. Original Charmed Material property of Constance M. Burge"
	script = "<STYLE>BODY {background: black; color: white}</STYLE>"
	command_text = "say "
//	macros return "Attack"
world
    name = "Charmed: Battle Over Ancient Magic"
/*    hub="Hawkbane.Charmed"*/
    hub="KyrosX19.CharmedBattleOverAncientMagic"
    view = 9
    status="<font color =black FACE=Charming Font>Charmed: <font color = orange>Battle Over Ancient Magic</font></font>] <br>Version: <font color=blue>2</font color><br>Status: <font color=green>Public Alpha Test</font color><br>Host: <font color = green FACE=Balthazar>Chewyy </FONT FACE></font color>"
    version = 2
    loop_checks=0
////////////////////////////////////////////
mob//Basicly this is you or another person.
	create_character
		Login()//Calls the login proc which is already built into dream seeker.
			if(src.key == "YOUR NAME HERE")
				src.TelekinesisAdvanced = 2
				src.verbs+=typesof(/mob/master_admin_verbs/verb)
				src.verbs+=typesof(/mob/GM_verbs/verb)
				src.verbs+=typesof(/mob/MGM_verbs/verb)
				src.verbs+=typesof(/mob/admin_GM_verbs/verb)
				src.verbs+=typesof(/mob/Owner_verbs/verb)
				src.verbs+=typesof(/mob/whitelighter/verb)
				src.verbs+=typesof(/mob/darklighter/verb)
				src.verbs+=typesof(/mob/witch/verb)
				src.verbs += typesof(/mob/Elder/verb/)
				src.verbs += typesof(/mob/Triad/verb/)
				src.verbs += typesof(/mob/Destiny/verb/)
				src.verbs += typesof(/mob/Cleaner/verb/)
				src.verbs += typesof(/mob/avatar/verb/)
				src.verbs += typesof(/mob/Teach/verb/)
			if(newcomer==1)
				switch(input("Enter Charmed Online II with a new character?") in list("Yes", "Quit"))//Calls a list and asks what you want to do New Game,Load Game Or quit
					if("Yes")//If a user choose new game it goes to this
						src.ChooseCharacter2()//Calls the Proc so the mob can create a character
				//	if("Load Game")//if a user chooses Load Game it comes to this
				//		src.Load()//Calls the Load proc so a mob can load an old save
					if("Quit")//This is basicly quit so it logs the mob out.
						src.Logout()//Calls the logout proc which is already built in dream maker but it safe to have it in your code anyways.
			else
				src.Load()

		proc/ChooseCharacter2()//This is the ChooseCharacter proc when it is called it will all the coding up below so a mob can create his/her character.
			src.name = input("What would you like your name to be?","Name input")//Asks a mob what they want their name to be.
			switch(input("What sex do you want to be?") in list("Male","Female"))//A list asking what gender they want to be.
				if("Male")//If the mob picks Male their mob is now a male
					icon = 'Goodwitchs.dmi'//This becomes the mobs icons.
					icon_state = "whitelighter"//chooses the icon state of the mob so they dont become another gender.
					world << "<small><font color = red><b>Server: <font color=white>[src]/[key] is a first time player."//Says to the world that a mob has logged in for the first time.
					loc = locate(/turf/Area/Earth)//Plants the mob in this location
					newcomer=0
				if("Female")//If the mob picks female their mob is now a female
					icon = 'Goodwitchs.dmi'//This becomes the mobs icon.
					icon_state = "goodwitch"//Choose the icon state of the mob so they dont become the wrong gender.
					world << "<small><font color = red><b>Login info: <font color = white>[src]/[key] is a first time player."//Says to the world that a mob has logged in for the first time.
					loc = locate(/turf/Area/Earth)//Puts the mob in this location.
					Save()//Calls the save proc so the mob can load the next time they login.
					newcomer=0
		proc/Load()//This is the Load proc so when a mob clicks load it gives them their old character.
			var/savefile/F = new("saves/[src.key].sav")//Overwrites their last save file to show they logged in again.
			cansave = 1//This a var show that the mob can save their game.
			Read(F)//Read the mobs save file.
			var/lx,ly,lz//vars to that we dont have to put last_x and so on making it much easier
			F["last_x"] >> lx//This is a desplay of what i have done above. These means your last locations.
			F["last_y"] >> ly
			F["last_z"] >> lz
			loc = locate(lx,ly,lz)//Puts the mob in their last location,
			world << "<small><font color = red><b>Login info: <font color = white>[src]/[key] has logged in."//Show the world a mob has logged in with an old save file.
			Save()//Calls the save proc so the mob can save.
		proc/Save()//The Save proc is inuse when called.
			var/savefile/F = new("saves/[src.key].sav")//Overwrites their file with another location now
			Write(F)//Write over their save file
			F["last_x"] << x//Writes over their last with their new one.
			F["last_y"] << y
			F["last_z"] << z
		//	src << "<small><font color = red><b>Save info: <font color = white>Your game has been saved. "//says to the mob their game has been save
			sleep(900)//sleep for 1 minute and a half.
			Save()//Calls the proc again so that it will save the mobs x,y,z.
			..()//Calls the history.
		Logout()//The logout proc which is inbuilt in dream maker but is always save to have
			if(cansave)//if the mob can save save them also if you put !cansave it means the mob cant save so bare this in mind.
				Save()//Call the save proc.
			world << "<small><font color = red><b>[src] has logged out."//Tell the world a mob has logged out of the world
			..()//Call all the histy before logging out
			del(src)//Delete the mob from the world note their save file will not go lol.

//////////////////////////////////////////////////////////////////////////////////////////
turf/myareagood
turf/myareaevil


mob/godwitch
	icon = 'Goodwitchs.dmi'
	icon_state ="godwitch"
	original_icon = "godwitch"
mob/goodwitch
	icon = 'Goodwitchs.dmi'
	icon_state ="goodwitch"
	original_icon = "goodwitch"
mob/Whitelighter
	icon = 'Goodwitchs.dmi'
	icon_state ="whitelighter"
	original_icon = "whitelighter"
mob/Demon
	icon = 'Goodwitchs.dmi'
	icon_state ="Demon"
	original_icon = "Demon"
	race = "Demon"
	gender1 = "Male"
	nationality = "Underworld"
	age = "?"
mob/badwitch
	icon = 'Goodwitchs.dmi'
	icon_state ="badwitch"
	original_icon = "badwitch"
mob/Darklighter
	icon = 'Goodwitchs.dmi'
	icon_state = "Darklighter"
	original_icon = "Darklighter"
mob/var/newcomer=1
mob/var/cansave