#include <deadron/basecamp>

#define BASE_MENU_CREATE_CHARACTER	"Create New Character"
#define BASE_MENU_DELETE_CHARACTER	"Delete Character"
#define BASE_MENU_CANCEL			"Cancel"
#define BASE_MENU_QUIT				"Quit"

world/New()
	..()
	OpenPort(0)
//	Load_World()
	return ..()
/*proc
	Load_World()
		var/savefile/X = new ("World.sav")
		var/list/objs=list()
	/*	X["well"] >> well
		X["PS1stock"] >> PS1stock
		X["PS1cash"] >> PS1cash
		X["PS1"] >> PS1
		X["PS2stock"] >> PS2stock
		X["PS2cash"] >> PS2cash
		X["PS2"] >> PS2
		X["PS3stock"] >> PS3stock
		X["PS3cash"] >> PS3cash
		X["PS3"] >> PS3
		X["PS4stock"] >> PS4stock
		X["PS4cash"] >> PS4cash
		X["PS4"] >> PS4
		X["PS5stock"] >> PS5stock
		X["PS5cash"] >> PS5cash
		X["PS5"] >> PS5
		X["PH1"] >> PH1
		X["PH2"] >> PH2
		X["PH3"] >> PH3
		X["PH4"] >> PH4
		X["PH5"] >> PH5
		X["PH6"] >> PH6
		X["PH7"] >> PH7
		X["PH8"] >> PH8
		X["PH9"] >> PH9
		X["PH10"] >> PH10
		X["PH11"] >> PH11
		X["PH12"] >> PH12
		X["PH13"] >> PH13
		X["PH14"] >> PH14
		X["PH15"] >> PH15
		X["objs"] >> objs
		X["FH1"] >> FH1
		X["FH2"] >> FH2
		X["FH3"] >> FH3 */
	//	for(var/obj/O in objs)
	//		O.loc = locate(O.lastx, O.lasty, O.lastz)
	Save_World()
		var/savefile/X = new("World.sav")
		var/list/objs=list()
	/*	X["well"] << well
		X["PS1stock"] << PS1stock
		X["PS1cash"] << PS1cash
		X["PS1"] << PS1
		X["PS2stock"] << PS2stock
		X["PS2cash"] << PS2cash
		X["PS2"] << PS2
		X["PS3stock"] << PS3stock
		X["PS3cash"] << PS3cash
		X["PS3"] << PS3
		X["PS4stock"] << PS4stock
		X["PS4cash"] << PS4cash
		X["PS4"] << PS4
		X["PS5stock"] << PS5stock
		X["PS5cash"] << PS5cash
		X["PS5"] << PS5
		X["PH1"] << PH1
		X["PH2"] << PH2
		X["PH3"] << PH3
		X["PH4"] << PH4
		X["PH5"] << PH5
		X["PH6"] << PH6
		X["PH7"] << PH7
		X["PH8"] << PH8
		X["PH9"] << PH9
		X["PH10"] << PH10
		X["PH11"] << PH11
		X["PH12"] << PH12
		X["PH13"] << PH13
		X["PH14"] << PH14
		X["PH15"] << PH15
		X["FH1"] << FH1
		X["FH2"] << FH2
		X["FH3"] << FH3 */
		for(var/obj/O in world)
		//	if(O.dontsave)
		//		continue
			else if(O.z==10)
				O.lastx = O.x
				O.lasty = O.y
				O.lastz = O.z
				objs.Add(O)
			else if(O.z==20)
				O.lastx = O.x
				O.lasty = O.y
				O.lastz = O.z
				objs.Add(O)
			else if(O.z==21)
				O.lastx = O.x
				O.lasty = O.y
				O.lastz = O.z
				objs.Add(O)
			else
				continue
		X["objs"] << objs
world/Del()
	Save_World()
	return ..()
                    */
client/var/tmp
	base_num_characters_allowed = 1
	base_autoload_character = 0
	base_autosave_character = 1
	base_autodelete_mob = 1
	base_save_verbs = 1

mob
	var/tmp
		base_save_allowed = 1
		base_save_location = 1

	var/list/base_saved_verbs

	proc/base_InitFromSavefile()
		return


	Write(savefile/F)
		..()

		if (base_save_location && world.maxx)
			F["last_x"] << x
			F["last_y"] << y
			F["last_z"] << z

			F["class"] << usr.class
		return

	Read(savefile/F)
		..()

		if (base_save_location && world.maxx)
			var/last_x
			var/last_y
			var/last_z
			F["last_x"] >> last_x
			F["last_y"] >> last_y
			F["last_z"] >> last_z
			F["class"] >> src.class
			var/destination = locate(last_x, last_y, last_z)
			Move(destination)
mob/BaseCamp
	base_save_allowed = 0
	Login()
		RemoveVerbs()
		return

	Stat()
		return

	proc/RemoveVerbs()
		for (var/my_verb in verbs)
			verbs -= my_verb

mob/BaseCamp/FirstTimePlayer
	proc/FirstTimePlayer()
		return 1

world
	mob = /mob/BaseCamp/ChoosingCharacter

mob/BaseCamp/ChoosingCharacter
	Login()
		loc=locate(/turf/Area/Login2)
	//	usr<<"You begin to hear a voice in your head."
	//	sleep(20)
	//	usr<<"<font color=green>Welcome to Psionica® Journey through the Mindscape. To enter the Mindscape, you will need to move around and click on the buttons around your mind."
		..()

	proc/Choose_Character()
		var/list/available_char_names=client.base_CharacterNames()
		if(length(available_char_names) < client.base_num_characters_allowed)
			if(client.base_num_characters_allowed == 1)
				src<<"<b>HGM Computer:</b> You don't have a character to load, forwarding to creation process."
				src.sight=1
				client.base_NewMob()
				del(src)
				return
		else
			client.base_LoadMob(available_char_names[1])
			del(src)
			return


	proc/New_Character()
		src.sight=1
		var/list/names=client.base_CharacterNames()
		if(length(names) < client.base_num_characters_allowed)
			client.base_NewMob()
			src.sight=0
			del(src)
			return
		else
			switch(input(src,"You have the maximum amount of allowed characters. Delete one?","Psionica HGM Security Protocol") in list ("Yes","No"))
				if("Yes")
					DeleteCharacter()
					usr.sight=0
					return
				if("No")
					usr.sight=0
					return
	proc/ChooseCharacter()
		var/list/available_char_names = client.base_CharacterNames()
		var/list/menu = new()
		menu += available_char_names

		if (length(available_char_names) < client.base_num_characters_allowed)
			if (client.base_num_characters_allowed == 1)
				client.base_NewMob()
				del(src)
				return
			else
				menu += BASE_MENU_CREATE_CHARACTER

		if (length(available_char_names))
			menu += BASE_MENU_DELETE_CHARACTER

		menu += BASE_MENU_QUIT

		var/default = null
		var/result = input(src, "Who do you want to be today?", "Welcome to [world.name]!", default) in menu

		switch(result)
			if (0, BASE_MENU_QUIT)
				del(src)
				return

			if (BASE_MENU_CREATE_CHARACTER)
				client.base_NewMob()
				del(src)
				return

			if (BASE_MENU_DELETE_CHARACTER)
				DeleteCharacter()
				ChooseCharacter()
				return

		var/mob/Mob = client.base_LoadMob(result)
		if (Mob)
			del(src)
		else
			ChooseCharacter()

	proc/DeleteCharacter()
		var/list/available_char_names = client.base_CharacterNames()
		var/list/menu = new()
		menu += available_char_names

		menu += BASE_MENU_CANCEL
		menu += BASE_MENU_QUIT

		var/default = null
		var/result = input(src, "Which character do you want to delete?", "Deleting Character", default) in menu

		switch(result)
			if (0, BASE_MENU_QUIT)
				del(src)
				return

			if (BASE_MENU_CANCEL)
				return

		client.base_DeleteMob(result)
		sight=0
		return






client
	var/tmp/savefile/_base_player_savefile

	New()
		.=..()
		if (base_autoload_character)
			base_ChooseCharacter()
			base_Initialize()
			return
		return ..()

	Del()
		if (base_autosave_character)
			base_SaveMob()

		if (base_autodelete_mob)
			del(mob)
		return ..()


	proc/base_PlayerSavefile()
		if (!_base_player_savefile)
			var/start = 1
			var/end = 2
			var/first_initial = copytext(ckey, start, end)
			var/filename = "players/[first_initial]/[ckey].sav"
			_base_player_savefile = new(filename)
		return _base_player_savefile


	proc/base_FirstTimePlayer()
		var/mob/BaseCamp/FirstTimePlayer/first_mob = new()
		first_mob.name = key
		first_mob.gender = gender
		mob = first_mob
		return first_mob.FirstTimePlayer()


	proc/base_ChooseCharacter()
		base_SaveMob()

		var/mob/BaseCamp/ChoosingCharacter/chooser

		var/list/names = base_CharacterNames()
		if (!length(names))
			var/result = base_FirstTimePlayer()
			if (!result)
				del(src)
				return

			chooser = new()
			mob = chooser

			return

		if (base_num_characters_allowed == 1)
			base_LoadMob(names[1])
			return

		chooser = new()
		mob = chooser
		return


	proc/base_CharacterNames()
		var/list/names = new()
		var/savefile/F = base_PlayerSavefile()

		F.cd = "/players/[ckey]/mobs/"
		var/list/characters = F.dir
		var/char_name
		for (var/entry in characters)
			F["[entry]/name"] >> char_name
			names += char_name
		return names


	proc/base_NewMob()
		base_SaveMob()
		var/mob/new_mob
		new_mob = new /mob/create_character
		new_mob.name = key
		new_mob.gender = gender
		mob = new_mob
		_base_player_savefile = null
		return new_mob


	proc/base_SaveMob()
		if (!mob || !mob.base_save_allowed)
			return

		if (base_save_verbs)
			mob.base_saved_verbs = mob.verbs

		var/savefile/F = base_PlayerSavefile()

		var/mob_ckey = ckey(mob.name)

		var/directory = "/players/[ckey]/mobs/[mob_ckey]"
		F.cd = directory
		F["name"] << mob.name
		F["mob"] << mob
		_base_player_savefile = null


	proc/base_LoadMob(char_name)
		var/mob/new_mob
		var/char_ckey = ckey(char_name)
		var/savefile/F = base_PlayerSavefile()
		_base_player_savefile = null

		F.cd = "/players/[ckey]/mobs/"
		var/list/characters = F.dir
		if (!characters.Find(char_ckey))
			world.log << "[key]'s client.LoadCharacter() could not locate character [char_name]."
			mob << "<b><font color=red>Critical Information:</b></font> HGM System detects no character with the name of [char_name]. Please re-create your character to proceed into the server."
			return null

		F["[char_ckey]/mob"] >> new_mob
		if (new_mob)
			mob = new_mob
			new_mob.base_InitFromSavefile()
			if (base_save_verbs && new_mob.base_saved_verbs)
				for (var/item in new_mob.base_saved_verbs)
					new_mob.verbs += item
			return new_mob
		return null


	proc/base_DeleteMob(char_name)
		var/char_ckey = ckey(char_name)
		var/savefile/F = base_PlayerSavefile()

		F.cd = "/players/[ckey]/mobs/"
		F.dir.Remove(char_ckey)

