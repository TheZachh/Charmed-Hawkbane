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
turf/myarea
//////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////
var/const/help = {"
<html>
<head><title>Help</title></head>
<body>
<STYLE>
BODY {background: black; color: #4682b4}
</STYLE>
<h2>~~~Help File~~~</font></h2>
<b><i>~under construction~</i></b><br><br>
</body>
</html>
"}
var/const/abuse = {"
<html>
<head><title>Whats abuse?</title></head>
<body>
<STYLE>
BODY {background: black; color: #green}
</STYLE>
<h2>~~~GM Rules~~~</font></h2>
<b><i>1. GM's are there to help people who need them</i></b><br><br>
<b><i>2. Sometimes a gm can be busy helping someone else, so be patient</i></b><br><br>
<b><i>3. If your a gm, do NOT abuse powers</i></b><br><br>
<b><i>--Whats abusing?---</i></b><br><br>
<b><i>1. GM verbs are ment for helping people when they ask for help,</i></b><br><br>
<b><i>do not use them unless needed.</i></b><br><br>
<b><i>2. Renaming, Muting, Booting, Summoning for fun is categorized as abuse,</i></b><br><br>
<b><i>this will no longer be tolerated and might result in loos of gm or gm verb.</i></b><br><br>
<b><i>3. GM Create is ment to create something when needed,</i></b><br><br>
<b><i>no need to have copys of certain things</i></b><br><br>
<b><i>4. Using GM powers to take revenge or</i></b><br><br>
<b><i>going to places your not ment to be according RP is not tolerated</i></b><br><br>
<b><i>--------</i></b><br><br>
<b><i>If any of these rules get broken, report them to a other gm or admin</i></b><br><br>
</body>
</html>
"}
//////////////////////////////////////////////////////////////
var/const/spire8989 = {"
<html>
<head><title>Welcome!</title></head>
<body>
<STYLE>
BODY {background: black; color: green}
</STYLE>
<h2>~~~Welcome to Charmed~~~</font></h2>
<b><i>RULES :</i></b><br><br>
<b><i>1.NO ASKING FOR SPELLS, POWERS, MONEY, BOOST OR EDIT.</i></b><br><br>
<b><i>2.NO SPAMMING OR SPEAKING IN CAPS</i></b><br><br>
<b><i>3.NO SPAMMING KILLING</i></b><br><br>
<b><i>4.NO SPAWN KILLING</i></b><br><br>
<b><i>5.NO ASKING FOR RANKS</i></b><br><br>
<b><i>6.NO ABUSING BUGS, report any found to a GM</i></b><br><br>
<b><i>7.STAY IN CHARACTER AND TRY TO RP AT ALL TIMES</i></b><br><br>
<b><i>8.NO ASKING FOR GM OR HOSTING STATUS</i></b><br><br>
<b><i>9.NO MAKING FUN OF OR INSULTING OTHER PEOPLE</i></b><br><br>
<b><i>10.HAVE ALOT OF FUN!!!!</i></b><br><br>

</body>
</html>
"}
client/proc/client.Welcome()
   usr << browse(spire8989,"window=spire8989,[worldwho()],size=400x300")

var/const/RolePlay = {"
<html>
<head><title>Role Playing</title></head>
<body>
<STYLE>
BODY {background: black; color: #4682b4}
</STYLE>
<h2>===Welcome to Charmed: Battle Over Ancient Magic===</font></h2>
<b><i>The year is 2045, the humans had rebuild most of all and magic started to search for help, your help. Join forces of good or evil and make your side win.</b></i>
<p>The most important thing is that you act as your character would, this can be done on a width scale, as your all humans to the surface.<BR>
Exposing magic will result in being erased, if this is the case, a cleaner or a admin will have to get you out.<P>
Now go have fun and get your powers from the schools.
</body>
</html>
"}


mob/verb/help()
	usr << browse(help,"window=help,[worldwho()],size=520x480")
mob/verb/abuse()
	set name = "GM Abuse?"
	usr << browse(abuse,"window=Abuse?,[worldwho()],size=520x480")
mob/verb/rules()
	set name = "Rules"
	usr << browse(spire8989,"window=Rules,[worldwho()],size=520x480")
mob/verb/RP_Rules()
      usr << browse(RolePlay,"window=Role Playing,size=520x480")
proc/worldwho()
	for(var/mob/M in world)//Checks all the players in the world
		if(!M.client)
			continue
		else
			src << "Key name:[M.key]-[M]"//then is tells the player
client
    script={"
<STYLE>
BODY {background: black; color: white}
</STYLE>
"}
//////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////

mob/proc/delall()
    usr.astroproj = 0