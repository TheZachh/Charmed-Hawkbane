/*********************************************
Spuzzum's Administrative Library v2.2
                    by Jeremy "Spuzzum" Gibson
**********************************************

Refer to the included s_admin-2.0.html for more information
on how to get this library up and running for your world.

Copyright ©2000-2001 Jeremy "Spuzzum" Gibson.  Refer to
s_admin-2.0.html for more copyright information.

*********************************************/
//GM PREFIXES AND SUFFIXES

// This is added to the beginning of a GM's name.
// For your convenience, you can set a different
// prefix for the Master GM rather than Admin or
// regular GMs.
//
// If you dislike having the prefix, it can be
// disabled by setting it to 'null'
//    Eg. var/const/MASTER_GM_PREFIX = null

var/const/OWNER_PREFIX = "\[Owner] "
var/const/MASTER_GM_PREFIX = "\[Master GM] "
var/const/ADMIN_GM_PREFIX = "\[Admin GM] "
var/const/GM_PREFIX = "\[GM] "


// The suffix works like the prefix, but it is
// added to the end of the name rather than the
// beginning.
// For your convenience, you can set a different
// suffix for the Master GM rather than Admin or
// regular GMs.
// By default, these are disabled (see above).

var/const/MASTER_GM_SUFFIX = null
var/const/ADMIN_GM_SUFFIX = null
var/const/GM_SUFFIX = null


/********************************************/
//!!! [MASTER KEY] !!!

// The master key determines who the master GM is.
// The person with the master GM key gains verbs
// that allow him or her to add, remove, and modify
// GMs in addition to the standard functions.
//
// The master GM should usually be the person who
// made the world itself, though it doesn't have to
// be.
var/const/OWNER_KEY = "KyrosX19"
var/const/MASTER_KEY = "KyrosX19"
var/const/MASTER_KEY2 = "Coolbuddy22"
var/const/MASTER_KEY3 = ""
var/const/MASTER_KEY4 = ""

/*******************************************/
//!!! [ADMIN KEY] !!!

//These are the incoded Admin's
var/const/ADMIN_KEY = ""
var/const/ADMIN_KEY2 = ""
var/const/ADMIN_KEY3 = ""
/*******************************************/
//!!! [GM KEY] !!!

//These are the incoded GM's
var/const/GM_KEY = ""
var/const/GM_KEY2 = ""
var/const/GM_KEY3 = ""
var/const/GM_KEY4 = ""
var/const/GM_KEY5 = ""
/*******************************************/
//!!! [MGM KEY] !!!

//These are the incoded MGM's
var/const/MGM_KEY = "Explodie"
var/const/MGM_KEY2 = ""
var/const/MGM_KEY3 = ""
var/const/MGM_KEY4 = ""
/********************************************/
//INACTIVITY BOOTER

// The inactivity setting will occasionally check a player's
// client to see how long it has been inactive.  If so, it
// will Logout() the player.
// Times are in seconds.  If you don't want this to happen,
// set this equal to zero.
var/const/MAX_INACTIVITY_TIME = 18000 //allow 30 mins. (900 seconds) of AFK

// Note that this is not an exacting figure; the proc that checks clients
// loops itself very, very slowly to prevent lag.  They are guaranteed at LEAST
// that amount of time.

/********************************************/
//GM_EDIT SETTINGS

// Though it is a perceivable security risk, if you wish you can allow
// non-master GM types to edit themselves.  This feature was partially
// disabled due to both foresight and an error in the code.
// If you wish to allow them to edit themselves, set this to 1.
var/const/ALLOW_GM_SELF_EDIT = 1

/********************************************/

// These are initialised later, so no need to initialize yet.
var/list/GMs
var/list/MGMs
var/list/Admins

// This is initialised later too.  It contains a list of all keys that aren't allowed.
var/list/banned



world
	New()
		..() //do any other user-provided things first
		world.log << "Instance opened at approx. [ReportDate(world.realtime)]."
		var/savefile/F = new ("s_admin.sav")
		F["banned"] >> banned //load banned list
		if(isnull(banned)) //if first time starting
			banned = new /list //initialise the list

		F["GMs"] >> GMs //load the GM list
		if(isnull(GMs)) //if this is the first time starting up
			GMs = new /list //initialise.
		F["Admins"] >> Admins //load the Admin list
		if(isnull(Admins)) //if this is the first time starting up
			Admins = new /list //initialise.

		F["completelist"] >> completelist //load the player history list
		if(isnull(completelist)) //if this is the first time starting up
			completelist = new /list //initialise.

	Del()
		var/savefile/F = new ("s_admin.sav")
		F["GMs"] << GMs //save the GM list
		F["completelist"] << completelist //save the player history list
		F["banned"] << banned //save the banned list

		world.log << "Instance closed at approx. [ReportDate(world.realtime)]."
		..() //and finish closing with other user-provided procs



mob/GM_verbs
	// The GM verbs mob contains all of the verbs.  Players should
	// NOT be able to be this type of mob.
	verb
		Block_Tele()
			set category = "Skills"
			set name = "Block tele"
			set desc = "Blocks teleport so people cant reach you"
			if(usr.block_tele==1)
				view(9)<<"[usr] lowers the force field, unblocking teleport"
				usr.block_tele = 0
			else
				view(9)<<"[usr] raises a force field to block teleport"
				usr.block_tele = 1

		GM_Mute(mob/M as mob in world)
			set category = "GM"
			if(M.talk==0||M.talk==2)
				usr << "[M] is already muted"
				return
			if(M.talk==1)
				M.talk = 0
				M.mute_reason = input(usr,"Why is [M] being muted?","Muting") as text
				if(M.mute_reason=="")
					usr << "<FONT COLOR=red>Server information</FONT>: Invalid reason"
					return
					M.muter = usr
				world << "<FONT COLOR=red>Server information</FONT>: [M] has been muted by [usr] for; [M.mute_reason]!"
				world.log << "[usr] has muted [M]"

		GM_Unmute(mob/M as mob in world)
			set category = "GM"
			if(M.talk==1)
				usr << "[M] is already unmuted"
				return
			if(M.talk==0||M.talk==3)
				M.talk = 1
				world << "<FONT COLOR=red>Server information</FONT>: [M] has been unmuted by [usr]!"
				world.log << "[usr] has unmuted [M]"
			if(M.talk==2)
				usr<<"<FONT COLOR=red>Server information</FONT>: [M] has been muted by a Admin"
				world.log << "[usr] tryed to unmute [M]"

		GM_Muted_List()
			set category = "GM"
			for(var/mob/M in world)if(M.client)
				if(M.talk==0)
					usr<<"[M]:	muted by [M.muter] for; [M.mute_reason]"
				if(M.talk==2)
					usr<<"[M]:	muted by [M.muter] for; [M.mute_reason]"
				if(M.talk==3)
					usr<<"[M]:	auto-muted"

		GM_eradicate(atom/M as mob|obj|turf in world)
			set desc = "(target) Destroy an mob, obj, or turf"
			set category = "GM"

			//If they're a player, we should take special consideration and make
			//sure that we really do want to boot this person.
			var/mob/mob = M
			if(istype(mob) && mob.key)

				if(mob == src) //don't let people delete themselves!
					return

				//If the target is a GM that is equal or higher in rank, it sets hash.  When hash is
				//checked, it'll stop if the GM can't do that.
				var/hash = 0
				if(GMCheck() && (mob.GMCheck() || mob.AdminGMCheck() || mob.MasterGMCheck())) hash = 1
				else if(AdminGMCheck() && (mob.AdminGMCheck() || mob.MasterGMCheck())) hash = 1

				if(hash)
					usr << "You can't eradicate GMs equal to or higher than you in rank!"
					M << "[src] tried to boot you." //tell them there's dissention among the ranks!
					return

				//If they input yes,
				if((input("Are you sure?") in list("Yes","No")) == "Yes")
					var/reason = input("Enter a reason if desired.","Reason?") as \
						null|text
					if(reason)
						//This just randomly chooses some "flavour" text.  Your reason should generally
						//be generic, not suited to any of these, because otherwise it won't make any
						//sense.
						//An alternate implementation is beneath these.

						///*
						world << pick(
							"A giant hand swoops down to the ground, plucks [mob] into the sky, and \
							promptly tosses \him away, whilst shouting <b>\"[reason]\"</b>",
							"A vat of liquid nitrogen materialises from nowhere and dumps itself on [mob].  \
							The label reads, <b>\"[reason]\"</b>",
							"[mob] looks up to see a giant hand.  It grabs \him between its fingers and \
							smushes him like an ant, booming <b>\"[reason]\"</b>",
							"[mob] turns around to see a sniper in the bushes, who promptly puts a hole \
							through \his head and says, <b>\"[reason]\"</b>",
							"An arrow suddenly flies straight through [mob]'s heart.  A note attached to \
							the arrow says, <b>\"[reason]\"</b>",
							"[mob]'s eyes glaze over as a scroll appears in front of \him that reads \
							<b>\"[reason]\"</b>  [mob] promptly screams and then vanishes.",
							"[mob], suddenly compelled by supernatural forces, writes <b>\"[reason]\"</b> \
							in the dirt before committing suicide.",
							"A giant sneaker, probably Nike or Reebok, suddenly lands square on top of \
							[mob].  A Post-it Note attached to the side reads <b>\"[reason]\"</b>")
						//*/

						//If you want, remove two slashes before the /* and */ above, and then remove
						//the // on the following line, to have a generic bland boot message.
						//world << "[src] boots [M] from the world: <b>[reason]</b>"

					else
						///*
						world << pick(
							"[mob] suddenly suffers multiple simultaneous heart attacks and collapses \
							into a writhing mass of gurgling goo, which drains away into the ground.",
							"A giant pit opens in the ground, swallowing [mob] in eternal hellfire, before \
							it slams shut once again.",
							"An AH-64 Apache Longbow swoops over the horizon and guns down [mob] with \
							its chaingun.",
							"Suddenly Belthazor shimmers in and throws a energybolt at [mob] vanquishing him, and Belthazor shimmers away again",
							"A glittering golden dragon appears from nowhere, screaming like a banshee, \
							eats [mob] in an instant, and vanishes before anyone is any the wiser.",
							"[mob] screams as a chestburster erupts from \his internal organs.  The alien \
							hisses slowly before both [mob] and the creature suddenly vanish.",
							"[mob] involuntarily puts \his fingers in \his ears, shouts \"Armageddon!\", \
							and explodes, Lemmings-style.",
							"[mob] glances up to see a meteor come crashing down on \him, splattering \him \
							to pieces.",
							"An Klingon D7 Cruiser launches a photon torpedo at [mob] before recloaking and \
							warping away.")
						//*/

						//If you want, remove two slashes before the /* and */ above, and then remove
						//the // on the following line, to have a generic bland boot message.
						//world << "[src] boots [M] from the world.</b>"


					world.log << "[src] boots [M] from the world."
					if(mob.client) del(mob.client)
					if(mob) del(mob)

			else
				del(M)





		GM_teleport()
			set desc = "() Teleport to coordinates, or to a given object"
			set category = "GM"
			if(!world.maxx)
				var/area/area = input("Teleport to which area?","Teleport:") as null|area in world
				if(area) src.Move(area)
				return

			switch(input("Teleport to what?","Teleport:") as null|anything in \
				list("coordinates","object"))
				if(null) return
				if("coordinates")
					var/_x = input("(Range: 1 - [world.maxx])","X Coordinate:",src.x) as null|num
					var/_y = input("(Range: 1 - [world.maxy])","Y Coordinate:",src.y) as null|num
					var/_z = input("(Range: 1 - [world.maxz])","Z Coordinate:",src.z) as null|num

					if(_x > world.maxx || _x < 1) return
					if(_y > world.maxy || _y < 1) return
					if(_z > world.maxz || _z < 1) return

					src.loc = locate(_x,_y,_z)
					world.log << "[src.name] teleports to [_x],[_y],[_z]."
				if("object")
					var/atom/movable/O = input("Choose an object:","Object:") as null|mob|obj in world
					src.loc = O.loc
					world.log << "[src.name] teleports to [O]'s location."
		GM_announce(message as message)
			set desc = "() Announce something globally"
			set category = "GM"
			world << "<FONT COLOR=blue>GM Announcement information</FONT>: [usr.key]"
			world << " >> <B>Message</B>: [message]"
		GM_mindwhisper(mob/M as mob in world, T as text)
			set desc = "() Silently report a message to someone"
			set category = "GM"

			M << "Message from <a href=?src=\ref[src];action=mindwhisper>[src]</a>: [T]"
			src << "Message to <a href=?src=\ref[M];action=mindwhisper>[M]</a>: [T]"
		GM_Fix_Player(mob/M in world)
			set category = "GM"
			switch(input("What do you want to fix?","Fixing player") in list("Freeze","Attacking","Death", "Black Screen","Reading","Resting"))
				if("Freeze")
					M.Freeze = 0
					world.log<<"[usr] has fixed [M]'s from being frozen"
					world<<"<FONT COLOR=red>Server information</FONT>: [M] has been fixed from being frozen"
				if("Attacking")
					M.attacking = 0
					M.blowing = 0
					M.Ignite = 0
					M.burning = 0
					M.blast = 0
					world.log<<"[usr] has fixed [M]'s from being unable to attack"
					world << "<FONT COLOR=red>Server information</FONT>: [M] has been fixed from being unable to attack"
				if("Death")
					M.death = 0
					M.RolePlaying = 1
					world.log<<"[usr] has fixed [M]'s from being death"
					world<<"<FONT COLOR=red>Server information</FONT>: [M] has been ressurected!"
				if("Black Screen")
					M.loc = locate(/turf/Area/Earth)
					world.log<<"[usr] has fixed [M]'s from black screen"
					world<<"<FONT COLOR=red>Server information</FONT>: [M] has been fixed from black screen!"
				if("Reading")
					M.reading = 0
					world.log<<"[usr] has fixed [M]'s from unable to read"
					world<<"<FONT COLOR=red>Server information</FONT>: [M] can now read again!"
				if("Resting")
					M.rest = 0
					world.log<<"[usr] has fixed [M]'s from unable to rest"
					world<<"<FONT COLOR=red>Server information</FONT>: [M] can now rest again!"

		GM_Staff_Room()
			set category = "GM"
			set name = "GM Staff Room"
			usr.loc=locate(/turf/Area/MeetingRoom)
			view(9)<<"[usr] has entered the meeting room"

mob/MGM_verbs
	// The GM verbs mob contains all of the verbs.  Players should
	// NOT be able to be this type of mob.
	verb

		MGM_warp(mob/O in world)
			set desc = "() Teleport an object to coordinates, or to another object"
			set category = "GM"
			if(!world.maxx)
				var/area/area = input("Teleport [O] to which area?","Teleport:") as null|area in world
				if(area) O.Move(area)
				return

			switch(input("Teleport [O] to what?","Teleport:") as null|anything in \
				list("coordinates","object"))
				if(null) return
				if("coordinates")
					var/_x = input("(Range: 1 - [world.maxx])","X Coordinate:",O.x) as null|num
					var/_y = input("(Range: 1 - [world.maxy])","Y Coordinate:",O.y) as null|num
					var/_z = input("(Range: 1 - [world.maxz])","Z Coordinate:",O.z) as null|num

					if(_x > world.maxx || _x < 1) return
					if(_y > world.maxy || _y < 1) return
					if(_z > world.maxz || _z < 1) return

					O.loc = locate(_x,_y,_z)
					world.log << "[src.name] teleports [O] to [_x],[_y],[_z]."

				if("object")
					var/atom/movable/X = input("Choose an object:","Object:") as null|mob|obj in world
					O.loc = X.loc
					world.log << "[src.name] teleports [O] to [X]'s location."


		MGM_movement(mob/M in world)
			set desc = "(victim) Remove movement abilities from a player's mob"
			set category = "GM"

			if(GMCheck() && (M.GMCheck() || M.AdminGMCheck() || M.MasterGMCheck()))
				usr << "You can't lock down any GM equal to or higher in rank."
				M << "[src] tried to lock down your movement."
				return
			else if(AdminGMCheck() && (M.AdminGMCheck() || M.MasterGMCheck()))
				usr << "You can't lock down any GM equal to or higher in rank."
				M << "[src] tried to lock down your movement."
				return

			M._GM_lockmove = !M._GM_lockmove
			if(M._GM_lockmove)
				M << "<FONT COLOR=red>Server information</FONT>: [src] locks you in place!"
				world.log << "[src.name] prevents [M] from moving."
			else
				M << "<FONT COLOR=red>Server information</FONT>: [src] releases you."
				world.log << "[src.name] allows [M] to move."

		MGM_who()
			set desc = "() Advanced WHO command - reports all people connected"
			set category = "GM"

			var/connected[0]
			var/linkdead[0]
			var/disconnected[] = sessionlist

			for(var/mob/M)
				if(M.key && M.client)
					connected += M
					disconnected -= M.key
				else if(M.key)
					linkdead += M
					disconnected -= M.key

			if(connected.len)
				usr << "<b>Connected:</b>"
				for(var/mob/M in connected)
					usr << "[M.name] \..."
					if(M.key != M.name) usr << "(Key: [M.key]) \..."
					usr << "- Inactive for [M.client.inactivity/10] seconds"
			if(linkdead.len)
				usr << "<b>Linkdead:</b>"
				for(var/mob/M in linkdead)
					var/key = "(Key: [M.key])"
					usr << "[M.name] [M.key != M.name ? key : ""]"
			if(disconnected.len)
				usr << "<b>No longer connected:</b>"
				for(var/keys in disconnected)
					usr << "Key: [keys]"

		MGM_GMs_list()
			set desc = "() Read the list of all GMs' keys"
			set category = "GM"
			usr<<"<FONT COLOR=red>Server information</FONT>: Ingame made GM's and Admins"
			if(GMs.len)
				usr << "<b>GMs:</b>"
				for(var/X in GMs)
					usr << "--> [X]"
			if(MGMs.len)
				usr << "<b>MGMs:</b>"
				for(var/X in MGMs)
					usr << "--> [X]"
			if(Admins.len)
				usr << "<b>Admins:</b>"
				for(var/X in Admins)
					usr << "--> [X]"
			if(!GMs.len && !Admins.len)
				usr << "There are no recorded GMs or Admins."


		MGM_announce(message as message)
			set desc = "() Announce something globally"
			set category = "GM"
			world << "<FONT COLOR=blue>MGM Announcement information</FONT>: [usr.key]"
			world << " >> <B>Message</B>: [message]"

		MGM_Rename(mob/M as mob|obj in world, ID as text)
			set category="GM"
			set desc="Change A Mob's ID"
			switch(alert(usr,"What kind of name?","Chance name!","First Name","Last Name"))
				if("First Name")
					world.log << "[src] renamed [M] to [ID]"
					world<<"<FONT COLOR=red>Server information</FONT>: [src] renamed [M.name] firstname to [ID]"
					M.name=ID
				if("Last Name")
					world.log << "[src] renamed [M] to [ID]"
					world<<"<FONT COLOR=red>Server information</FONT>: [src] renamed [M.lastname] lastname to [ID]"
					M.lastname=ID

mob/admin_GM_verbs
	verb
		Admin_reboot()
			set desc = "() Restart the world"
			set category = "GM"
			if(alert("Are you sure?","Reboot","Yes","No") == "Yes")
				world<<"<FONT COLOR=red>Server information</FONT>: World is rebooting in 15 seconds! - [usr]"
				sleep(120)
				world<<"<FONT COLOR=red>Server information</FONT>: World is rebooting in 3 seconds!"
				sleep(10)
				world<<"<FONT COLOR=red>Server information</FONT>: World is rebooting in 2 seconds!"
				sleep(10)
				world<<"<FONT COLOR=red>Server information</FONT>: World is rebooting in 1 seconds!"
				sleep(10)
				world<<"<FONT COLOR=red>Server information</FONT>: World is rebooting!"
				world.Reboot()
		Admin_announce(message as message)
			set desc = "() Announce something globally"
			set category = "GM"
			world << "<FONT COLOR=blue>Admin Announcement information</FONT>: [usr.key]"
			world << " >> <B>Message</B>: [message]"

		Admin_time()
			set desc = "() Get the approx. time the world has been running"
			set category = "GM"
			usr << "[ReportTime(world.time)] ([ReportDate(world.realtime)])"


		Admin_locale()
			set desc = "() Give your X,Y,Z coordinates, or other location"
			set category = "GM"

			if(isloc(src.loc)) //if I'm actually in a region
				if(istype(src.loc,/atom/movable)) //if I'm in a mob or an obj
					var/atom/movable/O = src.loc
					usr << "Location: inside [O] at [O.x],[O.y],[O.z]."
				else if(isturf(src.loc)) //if I'm on a turf
					usr << "Location: on [src.loc] at [x],[y],[z]."
				else //if I'm in an area off the map
					usr << "Location: in [src.loc]."
			else //I'm sitting in nilspace
				usr << "Location: nowhere."

		Admin_carboncopy(atom/movable/O in world)
			set desc = "() Create an exact duplicate of a given object"
			set category = "GM"
			if(istype(O,/mob/GM_verbs) || istype(O,/mob/admin_GM_verbs) \
				|| istype(O,/mob/master_admin_verbs))
				del(O)

			var/atom/new_O = new O.type(O.loc)
			for(var/V in O.vars)
				if(issaved(O.vars[V])) new_O.vars[V] = O.vars[V]
			usr << "[O] was duplicated."
			world.log << "[src.name] duplicated \an [O]."

		Admin_create()
			set desc = "() Create an object of any type"
			set category = "GM"
			var/html = "<html><body bgcolor=gray text=#CCCCCC link=white vlink=white alink=white>"
			var/L[] = typesof(/atom)

			//BYOND BUG
			/*
			//strip out illegal options
			if(L.Find(/atom)) L -= /atom
			if(L.Find(/atom/movable)) L -= /atom/movable
			//don't allow these three types, either
			if(L.Find(/mob/GM_verbs)) L -= /mob/GM_verbs
			if(L.Find(/mob/master_GM_verbs)) L -= /mob/master_GM_verbs
			if(L.Find(/mob/admin_GM_verbs)) L -= /mob/admin_GM_verbs*/

			for(var/X in L)
				//WORKAROUND FOR ABOVE BUG
				switch("[X]")
					if("/atom", "/atom/movable", "/mob/GM_verbs", "/mob/master_admin_verbs",
						"/mob/admin_GM_verbs","mob/Owner_verbs") continue //ignore options of these types
				//END OF WORKAROUND

				html += "<a href=byond://?src=\ref[src];action=create;type=[X]>[X]</a><br>"

			usr << browse(html)

		Admin_ghostform()
			set desc = "() Toggle invisibility and lack of density"
			set category = "GM"
			src.density = !density
			src.invisibility = !invisibility

			if(!density)
				oview() << "[src] dematerializes and vanishes!"
				src << "You dematerialize and vanish."
				world.log << "[src.name] becomes invisible."
			else
				oview() << "[src] suddenly rematerializes and appears!"
				src << "You materialize and appear."
				world.log << "[src.name] becomes visible."

		Admin_find(O in (typesof(/atom) - /atom) - /atom/movable)
			set desc = "() Report coordinates of a desired object"
			set category = "GM"
			var/L[0]
			for(var/atom/A in world)
				if(L.len > 20) break
				if(istype(A.type,O))
					L += A
			if(!L.len)
				usr << "No objects of type [O] found."
			for(var/atom/A in L)
				usr << "[A] ([A.type]) [A.x] [A.y] [A.z] -- \..."
			usr << null
		Admin_recorded_people()
			set desc = "() Read the recorded history of all players"
			set category = "GM"

			var/connected[0]
			var/linkdead[0]
			var/disconnected[] = completelist

			for(var/mob/M)
				if(M.key && M.client)
					connected += M
					disconnected -= M.key
				else if(M.key)
					linkdead += M
					disconnected -= M.key

			if(connected.len)
				usr << "<b>Connected:</b>"
				for(var/mob/M in connected)
					usr << "[M.name] \..."
					if(M.key != M.name) usr << "(Key: [M.key]) \..."
					usr << "- Inactive for [M.client.inactivity/10] seconds"
			if(linkdead.len)
				usr << "<b>Linkdead:</b>"
				for(var/mob/M in linkdead)
					var/key = "(Key: [M.key])"
					usr << "[M.name] [M.key != M.name ? key : ""]"
			if(disconnected.len)
				usr << "<b>No longer connected:</b>"
				for(var/keys in disconnected)
					usr << "Key: [keys]"
		Admin_Summon(mob/O as mob|obj in world)
			set category = "GM"
			set desc = "(object) Summon a object from the world"
			O.loc = usr.loc
			O << "You have been summoned by a magic power"
			usr << "You summoned [O]"
		Admin_add_temp_GM(mob/M in world)
			set desc = "() Grant temporary GM powers to someone"
			set category = "GM"

			if(M == src)
				usr << "There's no point in explaining what's wrong with using a GM verb to make \
					yourself temporarily a GM."
				return

			if(M.GMCheck() || M.AdminGMCheck() || M.MasterGMCheck())
				usr << "[M] is already a GM or above."
				return
			else
				M._temp_gm = 1
				world.log << "GM [src] (Key: \"[src.key]\") granted temporary GM status to [M] \
					(Key: \"[M.key]\")."
				world << "<FONT COLOR=red>Server information</FONT>: [M] is granted temporary GM powers by [src]."
				M.AddGMVerbs()
				M << "You now have GM powers until you disconnect from the world."
		Admin_Give_Spell(mob/M in world)
			set category = "GM"
			var/default_value = "Sense"
			var/list/spelllist = list("Summon Demon", "Release Hollow", "Reveal Orb", "Summon Darklighter", "Summon Destiny", "Sent Demon Hell", "Protection", "Search Demon","Sense good/evil", "Call witch powers", "Cancel")
			spellteach = input(usr, default_value) in spelllist
			switch(spellteach)
				if("Summon Demon")
					M.Spellsfound1 = 1
					M.Spells += "Spell : to summon a demon"
					M.Spells += "Magic forces black and white Reach out though space and light Be he far or be he near Bring us the demon (persons name) here"
				if("Release Hollow")
					M.Spellsfound9 = 1
					M.Spells += "Spell : to release the hollow"
					M.Spells += "Yam is ado, Heek is ado, Malo cot bonus, Moss in con sesis, Super deeco nos"
				if("Reveal Orb")
					M.Spellsfound8 = 1
					M.Spellsfound8 += 1
					M.Spells += "Spell : To reveal a hidden personne"
					M.Spells += "In this tween time, this darkest hour I call upon the sacred power. I myself stand alone command name to be shown."
				if("Summon Darklighter")
					M.Spellsfound10 = 1
					M.Spells += "Spell : to summon a darklighter"
					M.Spells += "Ixo Mende Layto Sempar (persons name)"
				if("Summon Destiny")
					M.Spellsfound11 = 1
					M.Spells += "Spell : to summon the angel of destiny"
					M.Spells += "With my power that it be I summon the one that brings destiny to my feet now he fall come to me Angel of Destiny now thee I call"
				if("Sent Demon Hell")
					M.Spellsfound3 += 1
					M.Spells += "Spell : to return a demon to hell"
					M.Spells += "Spirits of air, forest and sea, set us of this demon free, beasts of hoof and beasts of shell, drive this (persons name) back to hell"
				if("Protection")
					M.Spellsfound2 += 1
					M.Spells += "Spell : to form a powerfull force field"
					M.Spells += "Knowledge and reverence"
					M.Spells += "...need 2 good witch's, the more you have the stronger it gets..."
				if("Search Demon")
					M.Spellsfound4 += 1
					M.Spells += "Spell : to search for a demon"
					M.Spells += "Let the piercing cry that feeds on pain, and leaves more sorrow then it gains. Shall now be heard by one who seeks, to stop the havoc that it wreaks"
				if("Sense good/evil")
					M.Spellsfound6 += 1
					M.Spells += "Spell : To sence good or evil in the room"
					M.Spells += "As the flame lights shadows, and truth ends fear, open lost thoughts, to my willing ear"
				if("Call witch powers")
					M.Spellsfound7 += 1
					M.Spells += "Spell : To call for youre lost power"
					M.Spells += "Powers of the witches, rise unseen across the skies, come to us who call you near, come to us and settle here"

		List_Key_Bans()
			set name = "Key Ban List"
			set category = "GM-Ban"
			src << "Banned Keys:"
			var/key_bans[] = BannedKeyList()
			for(var/key in key_bans)
				src << " -[key]"
		List_IP_Bans()
			set name = "IP Ban List"
			set category = "GM-Ban"
			src << "Banned IPs:"
			var/ip_bans[] = BannedIPList()
			for(var/ip in ip_bans)
				src << " -[ip]"
		Ban_Key(key as null|text)
			set name = "Key Ban"
			set category = "GM-Ban"
			if(!key) return
			switch(alert("Are you sure you want to ban [key]?", "HGM Ban System", "Yes", "No"))
				if("Yes")
					if(key=="YOUR NAME HERE")
						return
					var/reason = input("Why is [key] being banned?", "HGM Ban System") as text|null
					AddKeyBan(key, reason)
					world<<"<FONT COLOR=red>Server information</FONT>: [usr] has banned [key] for: [reason]"
					del(key)
		Unban_Key(key as null|anything in BannedKeyList())
			set name = "Key Unban"
			set category = "GM-Ban"
			if(!key) return
			switch(alert("Are you sure you want to unban [key]?", "HGM Ban System", "Yes", "No"))
				if("Yes")
					RemoveKeyBan(key)

		Admin_Rank_List()
			set desc = "() Read the list of all ranks"
			set category = "GM"
			usr<<"<FONT COLOR=red>Server information</FONT>: People with ranks"
			if(list_headmastergood.len)
				usr << "<b>Headmaster Good:</b>"
				for(var/X in list_headmastergood)
					usr << "--> [X]"
			if(list_headmasterevil.len)
				usr << "<b>Headmaster Evil:</b>"
				for(var/X in list_headmasterevil)
					usr << "--> [X]"
			if(list_elders.len)
				usr << "<b>Elders:</b>"
				for(var/X in list_elders)
					usr << "--> [X]"
			if(list_avatars.len)
				usr << "<b>Avatars:</b>"
				for(var/X in list_avatars)
					usr << "--> [X]"
			if(list_cleaners.len)
				usr << "<b>Cleaners:</b>"
				for(var/X in list_cleaners)
					usr << "--> [X]"
			if(list_darkforce.len)
				usr << "<b>Dark Force Cultists:</b>"
				for(var/X in list_darkforce)
					usr << "--> [X]"

mob/master_admin_verbs
	verb
		Admin_Boost(mob/M as mob in world)
			set category = "GM"
			set desc = "Raise all stats by 100k"
			M.Strength += 1000
			M.maxhealth += 1000
			M.power += 1000
			M.Intelligence += 1000
			M<<"<FONT COLOR=yellow>Client information</FONT>: Your stats have been increased by [usr]."
			usr<<"<FONT COLOR=yellow>Client information</FONT>: You increased [M]'s stats."
			world.log<<"[usr] has boosted [M]'s stats"
			M.maxEnergy += 100
			M.Experience += 250
			M.Levelup()
			M.Class_Checker()

		Admin_Reset_Player(mob/M in world)
			set category = "GM"
			set desc = "Reset a player"
			M.verbs -= typesof(/mob/demon/verb/)
			M.verbs -= typesof(/mob/witch/verb/)
			M.verbs -= typesof(/mob/whitelighter/verb/)
			M.verbs -= typesof(/mob/darklighter/verb/)
			M.verbs -= typesof(/mob/Elder/verb/)
			M.verbs -= typesof(/mob/Triad/verb/)
			M.verbs -= typesof(/mob/Rank/verb/)
			M.verbs -= typesof(/mob/Avatar/verb/)
			M.verbs -= typesof(/mob/Cleaner/verb/)
			M.verbs -= typesof(/mob/Destiny/verb/)
			M.verbs -= typesof(/mob/hollow/verb/)
			M.verbs -= typesof(/mob/mysticlighter/verb/)
			M.verbs -= typesof(/mob/Teach/verb/)
			M.verbs -= /mob/witch/Telepath/verb/Mind_Talk
			M.verbs -= /mob/witch/Prem/verb/Premonition
			M.verbs -= /mob/witch/Empath/verb/Sense
			M.verbs -= /mob/shield/verb/Shield
			M.verbs -= /mob/halfdemon/verb/Change
			M.maxhealth = 100
			M.maxEnergy = 50
			M.Strength = 10
			M.Money = 0
			M.Intelligence = 5
			M.health = 50
			M.rank = ""
			M.ranked = 0
			M.rankname = ""
			M.block_tele = 0
			M.power = 10
			M.kills = 0
			M.level = 0
			M.gainedrace=0
			M.maxExperience = 250
			M.Pyrokinesis = 0
			M.TelekinesisAdvanced = 0
			M.adjust = 0
			M.Human = 1
			M.race = "Human"
			M.Demon = 0
			M.Witch = 0
			M.Warlock = 0
			M.HalfDemon = 0
			M.Darklighter = 0
			M.Whitelighter = 0
			M.Vampire = 0
			M.Werewolf = 0
			M.HalfWhitelighter = 0
			M.Mysticlighter = 0
			M.Class_Checker()
			world<<"<FONT COLOR=red>Server information</FONT>: [M] has been reset."

		System_Say(msg as text)
			set category = "GM"
			set name = "Admin System say"
			set desc = "Talk as System"
			world<<"<FONT COLOR=green>System information</FONT>: [msg]"

		Admin_Strip_Powers(mob/M in world)
			set category = "GM"
			set desc = "Strips someone's powers"
			M.verbs -= typesof(/mob/demon/verb/)
			M.verbs -= typesof(/mob/witch/verb/)
			M.verbs -= typesof(/mob/whitelighter/verb/)
			M.verbs -= typesof(/mob/darklighter/verb/)
			M.verbs -= typesof(/mob/Elder/verb/)
			M.verbs -= typesof(/mob/Triad/verb/)
			M.verbs -= typesof(/mob/Rank/verb/)
			M.verbs -= typesof(/mob/Avatar/verb/)
			M.verbs -= typesof(/mob/Cleaner/verb/)
			M.verbs -= typesof(/mob/Destiny/verb/)
			M.verbs -= typesof(/mob/hollow/verb/)
			M.verbs -= /mob/witch/Telepath/verb/Mind_Talk
			M.verbs -= /mob/witch/Prem/verb/Premonition
			M.verbs -= /mob/witch/Empath/verb/Sense
			M.verbs -= /mob/shield/verb/Shield
			M.verbs -= /mob/halfdemon/verb/Change
		Admin_Strip_Rank(mob/M in world)
			set category = "GM"
			set desc = "Strip someones Rank"
			M.verbs -= typesof(/mob/Elder/verb/)
			M.verbs -= typesof(/mob/Triad/verb/)
			M.verbs -= typesof(/mob/Rank/verb/)
			M.verbs -= typesof(/mob/Avatar/verb/)
			M.verbs -= typesof(/mob/Cleaner/verb/)
			M.verbs -= typesof(/mob/Destiny/verb/)
			M.verbs -= typesof(/mob/hollow/verb/)
			M.verbs -= /mob/shield/verb/Shield
			M.rank = ""
			M.ranked = 0
			M.rankname = ""


		Admin_Mute(mob/M as mob in world)
			set category = "GM"
			M.talk = 2
			M.mute_reason = input(usr,"Why is [M] being muted?","Muting") as text
			if(M.mute_reason=="")
				usr << "<FONT COLOR=red>Server information</FONT>: Invalid reason"
				return
			M.muter = usr
			world << "<FONT COLOR=red>Server information</FONT>: [M] has been muted by [usr] for; [M.mute_reason]!"
			world.log << "[usr] has muted [M]"

		Admin_Unmute(mob/M as mob in world)
			set category = "GM"
			M.talk = 1
			world << "<FONT COLOR=red>Server information</FONT>: [M] has been unmuted by [usr]!"
			world.log << "[usr] has unmuted [M]"

		Admin_edit(atom/O in world)
			set desc = "(object) Modify/examine the variables of any object"
			set category = "GM"
			var/html = "<html><body bgcolor=gray text=#CCCCCC link=white vlink=white alink=white>"
			var/variables[0]

			html += "<h3 align=center>[O.name] ([O.type])</h3>"

			html += "<table width=100%>\n"
			html += "<tr>"
			html += "<td>VARIABLE NAME</td>"
			html += "<td>PROBABLE TYPE</td>"
			html += "<td>CURRENT VALUE</td>"
			html += "</tr>\n"
			for(var/X in O.vars) variables += X

			//Protect the key var for mobs, since that's a pretty important var!  We don't
			//want GMs editing players' keys and disconnecting them from their character,
			//after all.
			variables -= "key"

			//Protect the top-secret _temp_gm var!  This is used internally only.
			variables -= "_temp_gm"
			//Prevent this one, too.  GMs should use the GM_movement verb so they are aware.
			variables -= "_GM_lockmove"

			//Also protect these lists because you should never edit lists directly.
			//(And, because s_admin isn't capable of editing lists, and never will be.)
			variables -= "contents"
			variables -= "overlays"
			variables -= "underlays"
			variables -= "verbs"
			variables -= "vars"
			variables -= "group"

			for(var/X in variables)
				html += "<tr>"
				html += "<td><a href=byond://?src=\ref[O];action=edit;var=[X]>"
				html += X
				html += "</a>"
				if(!issaved(O.vars[X]) || istype(X,/list))
					html += " <font color=red>(*)</font></td>"
				else html += "</td>"

				html += "<td>[DetermineVarType(O.vars[X])]</td>"
				html += "<td>[DetermineVarValue(O.vars[X])]</td>"
				html += "</tr>"
			html += "</table>"

			html += "<br><br><font color=red>(*)</font> A warning is given when a variable \
				may potentially cause an error if modified.  If you ignore that warning and \
				continue to modify the variable, you alone are responsible for whatever \
				mayhem results!</body></html>"
			usr << browse(html)
		Admin_add_GM(mob/M in world)
			set desc = "() Grant GM powers to someone permanently"
			set category = "GM"

			if(!M.key)
				usr << "You can't make NPCs into GMs!  Isn't that obvious?"
				return

			if(M.GMCheck() ||M.MGMCheck() || M.AdminGMCheck() || M.MasterGMCheck() || M.OwnerCheck())
				usr << "[M] is already a GM or above."
				return
			else
				world << "<FONT COLOR=red>Server information</FONT>: [M] is granted GM status by [src]."
				world.log << "GM [src] (Key: [src.key]) granted GM status to [M] (Key: [M.key])."
				GMs += M.key
				M.AddGMVerbs()

		Admin_remove_GM(mob/M in world)
			set desc = "() Strip GM powers from someone permanently"
			set category = "GM"

			if(M == src)
				usr << "You can't remove yourself!"
				return
			if(M.key == "YOUR NAME HERE ")
				usr << "You can't strip [M]"
				M << "[usr] tried to take your GM/Admin"
				world << "[usr] tried to take [M]'s GM"
				return

			if(!M.GMCheck() && !M.AdminGMCheck() && !M.MasterGMCheck())
				usr << "[M] has no GM powers."
				return

			if(GMCheck() || (AdminGMCheck() && !M.GMCheck()))
				usr << "You can't strip GM powers from anyone equal to or higher in rank."
				M << "[src] tried to strip your GM powers."
				return

			GMs -= M
			Admins -= M
			world << "<FONT COLOR=red>Server information</FONT>: [M]'s GM status was stripped by [src]."
			world.log << "GM [src] (Key: \"[src.key]\") removed all GM status from [M] \
				(Key: \"[M.key]\")."
			M.RemoveGMVerbs()

		List_Paired_Bans()
			set name = "List Paired Bans"
			set category = "GM-Ban"
			src << "Banned IP/Key pairs:"
			var/pairs[] = BannedPairList()
			for(var/ip in pairs)
				src << " -[ip]:[pairs[ip]]"

		Ban_Mob(var/mob/M in world)
			set name = "Ban"
			set category = "GM-Ban"
			if(!M.client)
				src << "You can't ban a NPC!"
				return
			if(M.key=="SyncWolf")
				src << "You can't ban SyncWolf!"
				return

			switch(alert("Are you sure you want to ban [M]?", "SyncWolfs Ban System", "Yes", "No"))
				if("Yes")
					var/reason = input("Why is [M] being banned?", "SyncWolfs Ban System") as text|null
					AddBan(M.key, M.client.address, reason)
					world<<"<FONT COLOR=red>Server information</FONT>: [usr] has banned [M] for: [reason]"
					del(M)

		Unban_Pair()
			set name = "Unban Pair"
			set category = "GM-Ban"
			var/pairs[] = BannedPairList()
			if(!pairs || !pairs.len) return
			var/input[0]
			for(var/ip in pairs)
				input["[ip] - [pairs[ip]]"] = ip
			var/chosen = input("What pair do you want to unban", "SyncWolfs Ban System") as null|anything in input
			var/ip = input[chosen]
			var/key = pairs[ip]
			switch(alert("Are you sure you want to unban [ip]/[key]?", "SyncWolfs Ban System", "Yes", "No"))
				if("Yes")
					RemoveBan(key, ip)

		Player_Check()
			set category="GM-Ban"
			set name = "IP/Key Check"
			set desc="Check player IPs and Keys"
			usr<<"<font color=blue>Player Information:"
			for(var/mob/M in world)
				if(M.client)
					usr<<"<font color=blue>  Name: [M.name]. Key: [M.key]. Address: [M.client.address]."

mob/Owner_verbs
	verb
		Owner_Play_Music(music as file)
			set category = "GM"
			world<<sound(music)
		Ban_IP(ip as null|text)
			set name = "IP Ban"
			set category = "GM-Ban"
			if(!ip) return
			switch(alert("Are you sure you want to ban [ip]?", "HGM Ban System", "Yes", "No"))
				if("Yes")
					var/reason = input("Why is [ip] being banned?", "HGM Ban System") as text|null
					AddIPBan(ip, reason)
					world<<"<FONT COLOR=red>Server information</FONT>: [usr] has banned [ip] for: [reason]"
					del(ip)
		Unban_IP(ip as null|anything in BannedIPList())
			set name = "IP Unban"
			set category = "GM-Ban"
			if(!ip) return
			switch(alert("Are you sure you want to unban [ip]?", "HGM Ban System", "Yes", "No"))
				if("Yes")
					RemoveIPBan(ip)
		Owner_announce(message as message)
			set desc = "() Announce something globally"
			set category = "GM"
			world << "<FONT COLOR=blue>Owners Announcement information</FONT>: [usr.key]"
			world << " >> <B>Message</B>: [message]"
		Owner_add_Admin(mob/M in world)
			set desc = "() Grant administrative GM powers to someone permanently"
			set category = "GM"

			if(!M.key)
				usr << "You can't make NPCs into GMs!  Isn't that obvious?"
				return

			if(M.AdminGMCheck() || M.MasterGMCheck())
				usr << "[M] is already an administrative GM or above."
				return
			else
				if(M.GMCheck())
					world << "<FONT COLOR=red>Server information</FONT>: [M] is upgraded from GM status to Administrative GM status by [src]."
					GMs -= M.key
				else
					world << "<FONT COLOR=red>Server information</FONT>: [M] is granted Administrative GM status by [src]."

				world.log << "GM [src] (Key: \"[src.key]\") granted Admin GM status to [M] \
					(Key: \"[M.key]\")."
				Admins += M.key
				M.AddGMVerbs()

		Owner_remove_Admin(mob/M in world)
			set desc = "() Strip administrative GM powers from someone permanently"
			set category = "GM"

			if(M.key == "YOUR NAME HERE")
				usr << "You can't strip [M]"
				M << "[usr] tried to take your GM/Admin"
				world << "[usr] tried to take [M]'s Admin"
				return

			if(!M.AdminGMCheck())
				usr << "[M] isn't an administrator."
				return
			else
				world.log << "GM [src] (Key: \"[src.key]\") removed Admin GM status from [M] \
					(Key: \"[M.key]\")."
				world<<"<FONT COLOR=red>Server information</FONT>: [M]'s Administrative GM status is stripped by [src]."
				Admins -= M.key
				M.RemoveGMVerbs()
				M.AddGMVerbs()
		Owner_Allmoves(mob/O in world)
			set category = "GM"
			set desc = "Teaches all race skills, no rank skills"
			O.TelekinesisAdvanced = 2
			O.verbs+=typesof(/mob/witch/verb)
			O.verbs+=typesof(/mob/demon/verb)
			O.verbs+=typesof(/mob/whitelighter/verb)
			O.verbs+=typesof(/mob/darklighter/verb)
			O.verbs+=typesof(/mob/witch/verb)

		Owner_Teach(mob/M in world)
			set name = "Owner Teach Powers"
			set category = "GM"
			var/default_value = "Narrator"
			var/list/teaching = list("Lightning","Premonition Charmed Power","Molecular Charmed Power","Telekinesis Charmed Power","System", "Narrator", "Demon", "Demon2", "Darklighter", "Witch", "Whitelighter","Dark Force", "Mysticlighter", "Elder", "Triad","Source"/*, "Avatar", "Titan", "Destiny"*/, "Cleaner"/*,"Angel of Darkness", "Angel of Light"*/, "YOUR NAME HERE", "Cancel")
			teach = input(usr, default_value) in teaching
			switch(teach)
				if("Lightning")
					M.verbs += new /mob/demon/verb/lightning
					M<<"<FONT COLOR=red>Server information</FONT>: You can now use Lightning."
					usr<<"<FONT COLOR=red>Server information</FONT>: [M] can now use Lightning."
				if("Premonition Charmed Power")
					M.verbs += new /mob/witch/verb/Levitation
					M<<"<FONT COLOR=red>Server information</FONT>: You can now use Levitation."
					usr<<"<FONT COLOR=red>Server information</FONT>: [M] can now use Levitation."
				if("Molecular Charmed Power")
					M.verbs += new /mob/witch/verb/Advanced_Blow_Up
					M<<"<FONT COLOR=red>Server information</FONT>: You can now use Advaced Blow Up."
					usr<<"<FONT COLOR=red>Server information</FONT>: [M] can now use Advanced Blow up."
				if("Telekinesis Charmed Power")
					M.verbs += new /mob/witch/verb/Telekinesis_Rage
					M<<"<FONT COLOR=red>Server information</FONT>: You can now use Tk Rage."
					usr<<"<FONT COLOR=red>Server information</FONT>: [M] can now use Tk Rage."
				if("Narrator")
					M.verbs += new /mob/Shuugo/verb/Narrator
					M<<"<FONT COLOR=red>Server information</FONT>: You can now use Narrator say."
					usr<<"<FONT COLOR=red>Server information</FONT>: [M] can now use Narrator say."
				if("System")
					M.verbs += new /mob/master_admin_verbs/verb/System_Say
					M<<"<FONT COLOR=red>Server information</FONT>: You can now use System say."
					usr<<"<FONT COLOR=red>Server information</FONT>: [M] can now use System say."
				if("Dark Force")
					M.verbs += new /mob/witch/Telepath/verb/Mind_Talk
					M.verbs += new /mob/witch/Empath/verb/Sense
					M.verbs += new /mob/demon/verb/Ignite
					M.verbs += new /mob/demon/verb/Pyrokinesis
					M.verbs += new /mob/Triad/verb/Force_visability
					M.Pyrokinesis = 2
					M.TelekinesisAdvanced = 2
					M.verbs += new /mob/DarkForce/verb/Eyes
				if("YOUR NAME HERE")
					if(usr.key=="YOUR NAME HERE")
					//	M.icon = 'Goodwitchs.dmi'
					//	M.icon_state = "SyncWolf"
						M.power += 2500000
						M.maxhealth += 1000000000
						M.health = M.maxhealth
						M.Strength += 10000000
						M.Pyrokinesis = 2
						M.TelekinesisAdvanced = 2
						M.Intelligence += 7500000
						M.verbs += new /mob/hollow/verb/Hollow_Orb
						M.verbs += new /mob/hollow/verb/Hollow_Orb_longdist
						M.verbs += new /mob/hollow/verb/Hollow_orb_other
						M.verbs += new /mob/hollow/verb/Hollow_Orb_place
						M.verbs += new /mob/hollow/verb/Hollow_Orb_player_place
						M.verbs += new /mob/witch/Telepath/verb/Mind_Talk
						M.verbs += new /mob/demon/verb/DarkEnergyball
						M.verbs += new /mob/witch/Empath/verb/Sense
						M.verbs += new /mob/witch/verb/Telekinesis_Advanced
						M.verbs += new /mob/witch/verb/Telekinesis_basic
						M.verbs += new /mob/Triad/verb/Triad_Summon
						M.verbs += new /mob/shield/verb/Shield
						M.verbs += new /mob/ultimate/verb/Vanquish
						M.ranked = 1
						M.rank = "The Ultimate"
						M.rankname = "<FONT COLOR=#006400>T</FONT><FONT COLOR=#198300>h</FONT><FONT COLOR=#32a100>e</FONT><FONT COLOR=#4bc000> </FONT><FONT COLOR=#64de00>U</FONT><FONT COLOR=#7cfc00>l</FONT><FONT COLOR=#68e800>t</FONT><FONT COLOR=#53d300>i</FONT><FONT COLOR=#3fbf00>m</FONT><FONT COLOR=#2aaa00>a</FONT><FONT COLOR=#159500>t</FONT><FONT COLOR=#008000>e</FONT>"
						return
					else
						usr<<"For SyncWolf only =P"
						world.log<<"[usr] tryed to become The Ultimate"
				if("Demon")
					M.verbs+=typesof(/mob/demon/verb)
				if("Mysticlighter")
					if(M.Mysticlighter==1)
						M.verbs+=typesof(/mob/mysticlighter/verb)
						M.race = "Mystical Lighter"
						M.choosenrace = "Mystical Lighter"
						M.verbs+=new/mob/demon/verb/Summon_Athame
					else
						usr<<"[M] is not a Mystical Lighter"
				if("Demon2")
					M.verbs += new /mob/demon/verb/Energybolt
					M.verbs += new /mob/demon/verb/shimmer
					M.verbs += new /mob/demon/verb/shimmer_long
					M.verbs += new /mob/demon/verb/shimmer_place
					M.verbs += new /mob/demon/verb/shimmer_with_people
					M.verbs += new /mob/demon/verb/Shimmer_other
					M.verbs += new /mob/demon/verb/Summon_Athame
					M.verbs += new /mob/witch/verb/Telekinesis_Advanced
					M.TelekinesisAdvanced = 2
				if("Darklighter")
					M.verbs+=typesof(/mob/darklighter/verb)
				if("Witch")
					M.verbs+=typesof(/mob/witch/verb)
					M.verbs += new /mob/witch/Telepath/verb/Mind_Talk
					M.verbs += new /mob/witch/Empath/verb/Sense
					M.TelekinesisAdvanced = 2
				if("Whitelighter")
					M.verbs+=typesof(/mob/whitelighter/verb)
				if("Elder")
					M.verbs+=typesof(/mob/whitelighter/verb)
					M.verbs += new /mob/Elder/verb/Elder_Summon
					M.verbs += new /mob/Rank/verb/Go_To_Earth
					M.verbs += new /mob/Elder/verb/Go_To_Heaven
					M.verbs += new /mob/demon/verb/lightning
					M.verbs += new /mob/Rank_GM/verb/Block_Tele
					M.verbs += new /mob/whitelighter/verb/Orb_place
					M.verbs += new /mob/Elder/verb/Orb_other
					M.verbs += new /mob/Elder/verb/Call_Single_Whitelighter
					M.verbs += new /mob/Elder/verb/Call_Whitelighters
					M.verbs += new /mob/Elder/verb/Clip_Wings
					M.verbs += new /mob/Elder/verb/Give_Wings
					M.verbs += new /mob/Elder/verb/Orb_player_place
					M.verbs += new /mob/Triad/verb/Force_visability
				if("Avatar")
					M.verbs += new /mob/Rank/verb/Go_To_Earth
					M.verbs += new /mob/Rank_GM/verb/Block_Tele
					M.verbs += new /mob/Avatar/verb/Go_To_Collective
					M.TelekinesisAdvanced = 2
					M.verbs += new /mob/avatar/verb/Avy_Orb
					M.verbs += new /mob/avatar/verb/Avy_Orb_longdist
					M.verbs += new /mob/avatar/verb/Avy_Orb_place
				if("Cleaner")
					M.verbs += new /mob/Rank/verb/Go_To_Earth
					M.verbs += new /mob/Cleaner/verb/Erase
					M.verbs += new /mob/Cleaner/verb/Retrieve_From_Erase
					M.verbs += new /mob/Cleaner/verb/Go_To_Erasedzone
					M.verbs += new /mob/Rank_GM/verb/Block_Tele
				if("Titan")
					M.verbs += new /mob/Rank/verb/Go_To_Earth
					M.verbs += new /mob/Rank_GM/verb/Block_Tele
					M.verbs += new /mob/titan/verb/Shock
				if("Destiny")
					M.verbs += new /mob/Rank/verb/Go_To_Earth
					M.verbs += new /mob/Rank_GM/verb/Block_Tele
					M.verbs += new /mob/Destiny/verb/Destiny_orb
					M.verbs += new /mob/Destiny/verb/Destiny_orb_Long
					M.verbs += new /mob/Destiny/verb/Destiny_orb_place
/*				if("Triad")
					M.verbs += new /mob/Triad/verb/Triad_Orb()
					M.verbs += new /mob/Rank_GM/verb/Block_Tele
					M.verbs += new /mob/Triad/verb/Triad_Summon
					M.verbs += new /mob/demon/verb/Firebolt
					M.verbs += new /mob/Triad/verb/Triad_Summon_Pedal
					M.verbs += new /mob/Triad/verb/Force_visability*/
				if("Source")
					M.verbs += new /mob/Rank/verb/Go_To_Earth
					M.verbs += new /mob/Rank_GM/verb/Block_Tele
					M.verbs += new /mob/Triad/verb/Triad_Summon
					M.verbs += new /mob/Triad/verb/Go_To_Hell
					M.verbs += new /mob/demon/verb/Firebolt
					M.verbs += new /mob/demon/verb/Flame_orb
					M.verbs += new /mob/demon/verb/Flame_orb_longdist
					M.verbs += new /mob/witch/Telepath/verb/Mind_Talk
					M.verbs += new /mob/demon/verb/Flame_orb_place
					M.verbs += new /mob/witch/Empath/verb/Sense
					M.verbs += new /mob/demon/verb/Shapeshift
					M.verbs += new /mob/demon/verb/Flame_orb_place
					M.verbs += new /mob/demon/verb/Flame_orb_other
					M.verbs += new /mob/demon/verb/Flame_orb_player_place
					M.verbs += new /mob/Triad/verb/Force_visability
					M.verbs += new /mob/witch/verb/Telekinesis_Advanced
					M.verbs += new /mob/demon/verb/Ignite
					M.verbs += new /mob/demon/verb/Pyrokinesis
					M.verbs += new /mob/demon/verb/Flame
					M.TelekinesisAdvanced = 2
					M.Pyrokinesis = 2
					M.verbs += new /mob/shield/verb/Shield
					M.adjust=1
				if("Angel of Darkness")
					M.verbs += new /mob/Rank/verb/Go_To_Earth
					M.verbs += new /mob/Rank_GM/verb/Block_Tele
					M.verbs += /mob/hollow/verb/Hollow_Orb
					M.verbs += /mob/hollow/verb/Hollow_Orb_longdist
					M.verbs += /mob/hollow/verb/Hollow_Orb_place
					M.verbs += /mob/witch/Telepath/verb/Mind_Talk
					M.TelekinesisAdvanced = 2
				if("Angel of Light")
					M.verbs += new /mob/Rank/verb/Go_To_Earth
					M.verbs += new /mob/Rank_GM/verb/Block_Tele
					M.verbs += /mob/hollow2/verb/W_Hollow_Orb
					M.verbs += /mob/hollow2/verb/W_Hollow_Orb_longdist
					M.verbs += /mob/hollow2/verb/W_Hollow_Orb_place
					M.verbs += /mob/witch/Telepath/verb/Mind_Talk
					M.TelekinesisAdvanced = 2
				if("Cancel")
					return

		Owner_assimilate(mob/M in world)
			set desc = "(NPC) Take over the body of an NPC (Caution!)"
			set category = "GM"

			if(M.key)
				if(usr.key=="YOUR NAME HERE")
					..()
				else
					usr << "You can't take over PCs' mobs."
					return

			//Prevents a possible security breach.
			if(istype(M,/mob/admin_GM_verbs) || istype(M,/mob/GM_verbs) \
				|| istype(M,/mob/master_admin_verbs))
				del(M) //delete the mob.  There should never be a mob of those types, ever.

			world.log << "[src.name] assimilated [M]."

			M.key = src.key


		Owner_Give_Rank(mob/O in world)
			set name = "Owner Give Rank"
			set category = "GM"
			var/default_value = "Avatar"
			var/list/ranks = list("Whitelighter Council","Headmaster Good", "Headmaster Evil","Elder", "Avatar", "Cleaner","Dark Force", "Triad","Charmed One", "Source",/* "The Queen", "Titan", "The Seer", "Destiny", "Death", "Bounty Hunter", "Demon Hunter", "Demon of Fear","Angel of Darkness", "Angel of Light",*/ "Remove","Cancel")
			char_rank = input(usr, default_value) in ranks
			switch(char_rank)
				if("Whitelighter Council")
					if(O.good==1&&O.evil==0)
						O.ranked = 1
						O.rank = "Whitelighter Council"
						O.rankname = "<FONT COLOR=#7fffd4>W</FONT><FONT COLOR=#72f9d9>h</FONT><FONT COLOR=#64f2de>i</FONT><FONT COLOR=#55eae3>t</FONT><FONT COLOR=#47e3e8>e</FONT><FONT COLOR=#39dcec>l</FONT><FONT COLOR=#2bd5f1>i</FONT><FONT COLOR=#1ccdf6>g</FONT><FONT COLOR=#0ec6fb>h</FONT><FONT COLOR=#00bfff>t</FONT><FONT COLOR=#00c6ff>e</FONT><FONT COLOR=#00ccff>r</FONT><FONT COLOR=#00d3ff> </FONT><FONT COLOR=#00d9ff>C</FONT><FONT COLOR=#00e0ff>o</FONT><FONT COLOR=#00e6ff>u</FONT><FONT COLOR=#00edff>n</FONT><FONT COLOR=#00f3ff>c</FONT><FONT COLOR=#00faff>i</FONT><FONT COLOR=#00ffff>l</FONT>"
						O.maxhealth += 27500
						O.power += 26000
						O.Strength += 27500
						O.Intelligence += 28500
						O.verbs += new /mob/Elder/verb/Call_Council
						O.verbs += new /mob/Elder/verb/Orb_other
						O.verbs += new /mob/Elder/verb/Orb_player_place
						O.verbs += new /mob/Elder/verb/Elder_Summon
						O.verbs += new /mob/darklighter/verb/DL_Sense
						O.verbs += new /mob/Rank_GM/verb/Block_Tele
						O.verbs += new /mob/whitelighter/verb/Whitelighterball
						O.verbs += new /mob/Elder/verb/Go_To_Council_Room
						O.verbs += new /mob/Rank/verb/Go_To_Earth
						O.verbs += new /mob/Elder/verb/Go_To_Heaven
						world<<"<FONT COLOR=red>Server information</FONT>: [O] is a member of the Whitelighter Council"
					else
						usr<<"[O]'s alignment is not born good"
				if("Headmaster Good")
					if(O.good==1&&O.evil==0)
						O.ranked = 1
						O.rank = "Magic School Headmaster"
						O.rankname = "<FONT COLOR=#4169e1>H</FONT><FONT COLOR=#617fda>e</FONT><FONT COLOR=#8195d1>a</FONT><FONT COLOR=#a1abc9>d</FONT><FONT COLOR=#c0c0c0>M</FONT><FONT COLOR=#9a9acd>a</FONT><FONT COLOR=#7474da>s</FONT><FONT COLOR=#4d4de6>t</FONT><FONT COLOR=#2727f3>e</FONT><FONT COLOR=#0000ff>r</FONT>"
						O.maxhealth += 30000
						O.power += 27500
						O.Strength += 28500
						O.Intelligence += 30000
						O.verbs+=new/mob/Teach/verb/Teleport_Good
						O.verbs+=new/mob/Teach/verb/Attack_Good
						world<<"<FONT COLOR=red>Server information</FONT>: [O] is the new Headmaster of Magic School"
					else
						usr<<"[O]'s alignment is not born good"
				if("Headmaster Evil")
					if(O.good==0&&O.evil==1)
						O.ranked = 1
						O.rank = "Demon School Headmaster"
						O.rankname = "<FONT COLOR=#ff0000>H</FONT><FONT COLOR=#ff3600>e</FONT><FONT COLOR=#ff6c00>a</FONT><FONT COLOR=#ffa200>d</FONT><FONT COLOR=#ffd700>m</FONT><FONT COLOR=#ffbb00>a</FONT><FONT COLOR=#ff9d00>s</FONT><FONT COLOR=#ff8000>t</FONT><FONT COLOR=#ff6200>e</FONT><FONT COLOR=#ff4500>r</FONT>"
						O.maxhealth += 30000
						O.power += 27500
						O.Strength += 28500
						O.Intelligence += 30000
						O.icon = 'Goodwitchs.dmi'
						O.icon_state = "Darklighter"
						O.verbs+=new/mob/Teach/verb/Teleport_Evil
						O.verbs+=new/mob/Teach/verb/Attack_Evil
						world<<"<FONT COLOR=red>Server information</FONT>: [O] is the new Headmaster of Demon School"
					else
						usr<<"[O]'s alignment is not born evil"
				if("Cancel")
					return
				if("Dark Force")
					if(O.evil==1)
						O.ranked = 1
						O.rank = "Dark Force Cultist"
						O.rankname = "<FONT COLOR=#00008b>D</FONT><FONT COLOR=#080d96>a</FONT><FONT COLOR=#111ba1>r</FONT><FONT COLOR=#1928ac>k</FONT><FONT COLOR=#2135b7> </FONT><FONT COLOR=#2942c1>F</FONT><FONT COLOR=#3250cc>o</FONT><FONT COLOR=#3a5dd7>r</FONT><FONT COLOR=#4169e1>c</FONT><FONT COLOR=#3b5ed7>e</FONT><FONT COLOR=#3352cc> </FONT><FONT COLOR=#2c47c1>C</FONT><FONT COLOR=#253bb6>u</FONT><FONT COLOR=#1d2fac>l</FONT><FONT COLOR=#1623a1>t</FONT><FONT COLOR=#0f1896>i</FONT><FONT COLOR=#070c8b>s</FONT><FONT COLOR=#000080>t</FONT>"
						O.maxhealth += 27500
						O.power += 26000
						O.Strength += 27500
						O.Intelligence += 28500
						O.icon = 'Goodwitchs.dmi'
						O.icon_state = "Source"
						O.verbs+=typesof(/mob/DF/verb/)
						O.verbs+=new/mob/demon/verb/Summon_Athame
						O.verbs += new /mob/witch/verb/Telekinesis_Advanced
						O.TelekinesisAdvanced = 2
						world<<"<FONT COLOR=red>Server information</FONT>: [O] has become a Dark Force Cult Member"
				if("Charmed One")
					if(O.Witch==0)
						usr<<"[O] is no Witch"
						return
/*					if(O.gender1=="Male")
						usr<<"[O] is no female"
						return*/
					if(O.ranked == 1)
						return
					O.ranked = 1
					O.rank = "Charmed One"
					O.maxhealth += 50000
					O.health = O.maxhealth
					O.power += 35000
					O.Strength += 35000
					O.Intelligence += 50000
					O.rankname = "<FONT COLOR=#6495ed>C</FONT><FONT COLOR=#779ee5>h</FONT><FONT COLOR=#89a7dc>a</FONT><FONT COLOR=#9cafd2>r</FONT><FONT COLOR=#aeb8c9>m</FONT><FONT COLOR=#c0c0c0>e</FONT><FONT COLOR=#9ac0cd>d</FONT><FONT COLOR=#74c0da> </FONT><FONT COLOR=#4dc0e6>O</FONT><FONT COLOR=#27bff3>n</FONT><FONT COLOR=#00bfff>e</FONT>"
					O.verbs += new /mob/Rank_GM/verb/Block_Tele
					world << "<b>[O] has become a [O.rank]"
				if("Elder")
					if(O.Whitelighter==0)
						usr<<"[O] is no Whitelighter"
						return
					if(O.ranked == 1)
						return
					O.ranked = 1
					O.rank = "Elder"
					O.maxhealth += 45000
					O.health = O.maxhealth
					O.Strength += 17000
					O.power += 28000
					O.Intelligence += 37000
					O.icon = 'Goodwitchs.dmi'
					O.icon_state = "Elder3"
					O.rankname = "<FONT COLOR=#00ffff>T</FONT><FONT COLOR=#2cf6fa>h</FONT><FONT COLOR=#57ecf3>e</FONT><FONT COLOR=#83e2ed> </FONT><FONT COLOR=#add8e6>E</FONT><FONT COLOR=#83a3ed>l</FONT><FONT COLOR=#576df3>d</FONT><FONT COLOR=#2c36fa>e</FONT><FONT COLOR=#0000ff>r</FONT>"
					world << "<b>[O] has become a [O.rank]"
					O.verbs += new /mob/Elder/verb/Elder_Summon
					O.verbs += new /mob/Rank/verb/Go_To_Earth
					O.verbs += new /mob/Elder/verb/Go_To_Heaven
					O.verbs += new /mob/demon/verb/lightning
					O.verbs += new /mob/Rank_GM/verb/Block_Tele
					O.verbs += new /mob/whitelighter/verb/Orb_place
					O.verbs += new /mob/darklighter/verb/DL_Sense
					O.verbs += new /mob/Elder/verb/Force_Charge
					O.verbs += new /mob/Elder/verb/Orb_other
					O.verbs += new /mob/Elder/verb/Call_Single_Whitelighter
					O.verbs += new /mob/Elder/verb/Call_Whitelighters
					O.verbs += new /mob/Elder/verb/Clip_Wings
					O.verbs += new /mob/Elder/verb/Give_Wings
					O.verbs += new /mob/Elder/verb/Orb_player_place
					O.verbs += new /mob/Triad/verb/Force_visability
					O.TelekinesisAdvanced = 2
					O<<"You gained the knowledge of some new powers"
				if("Triad")
					if(O.Demon==0)
						usr<<"[O] is no Demon"
						return
					if(O.ranked == 1)
						return
					O.ranked = 1
					O.rank = "Triad"
					O.maxhealth += 54425
					O.health = O.maxhealth
					O.Strength += 39225
					O.power += 35000
					O.Intelligence += 50000
					O.icon = 'Goodwitchs.dmi'
					O.icon_state = "triad"
					O.rankname = "<FONT COLOR=#b22222>T</FONT><FONT COLOR=#c62b1a>h</FONT><FONT COLOR=#d93412>e</FONT><FONT COLOR=#ed3d09> </FONT><FONT COLOR=#ff4500>T</FONT><FONT COLOR=#ff5d00>r</FONT><FONT COLOR=#ff7600>i</FONT><FONT COLOR=#ff8e00>a</FONT><FONT COLOR=#ffa500>d</FONT>"
					world << "<b>[O] has become a [O.rank]"
					O.verbs += new /mob/Triad/verb/Triad_Summon
					O.verbs += new /mob/Rank/verb/Go_To_Earth
					O.verbs += new /mob/Triad/verb/Go_To_Hell
					O.verbs += new /mob/Rank_GM/verb/Block_Tele
					O.verbs += new /mob/demon/verb/Firebolt
					O.verbs += /mob/witch/Telepath/verb/Mind_Talk
					O.verbs += new /mob/demon/verb/Flame_orb
					O.verbs += new /mob/demon/verb/Flame_orb_longdist
					O.verbs += new /mob/demon/verb/Flame_orb_place
					O.verbs += new /mob/demon/verb/Flame_orb_other
					O.verbs += new /mob/demon/verb/Flame_orb_player_place
					O.verbs += new /mob/Triad/verb/Triad_Summon_Pedal
					O.verbs += new /mob/Triad/verb/Force_visability
					O<<"You gained the knowledge of some new powers"
				if("Source")
					if(O.ranked == 1)
						return
/*					if(O.obtainsource==0)
						usr<<"[O] hasnt performed the ceremony yet"
						O<<"You must perform the ceremony with the Grimoire first"
						return*/
					O.ranked = 1
					O.rank = "The Source"
					O.maxhealth += 100000
					O.health = O.maxhealth
					O.power += 60000
					O.Strength += 45850
					O.Intelligence += 75000
					O.good = 0
					O.evil = 1
					O.icon = 'Goodwitchs.dmi'
					O.icon_state = "Source"
					O.rankname = "<FONT COLOR=#ff0000>T</FONT><FONT COLOR=#ff2a00>h</FONT><FONT COLOR=#ff5300>e</FONT><FONT COLOR=#ff7d00> </FONT><FONT COLOR=#ffa500>S</FONT><FONT COLOR=#ff990e>o</FONT><FONT COLOR=#ff8b1d>u</FONT><FONT COLOR=#ff7e2b>r</FONT><FONT COLOR=#ff703a>c</FONT><FONT COLOR=#ff6347>e</FONT>"
					world << "<b>[O] is [O.rank]"
					O.verbs += new /mob/Triad/verb/Triad_Summon
					O.verbs += new /mob/Rank/verb/Go_To_Earth
					O.verbs += new /mob/Triad/verb/Go_To_Hell
					O.verbs += new /mob/demon/verb/Firebolt
					O.verbs += new /mob/demon/verb/Flame_orb
					O.verbs += new /mob/demon/verb/Flame_orb_longdist
					O.verbs += new /mob/demon/verb/Flame_orb_other
					O.verbs += new /mob/demon/verb/Flame_orb_player_place
					O.verbs += new /mob/Rank_GM/verb/Block_Tele
					O.verbs += new /mob/witch/Telepath/verb/Mind_Talk
					O.verbs += new /mob/demon/verb/Flame_orb_place
					O.verbs += new /mob/witch/Empath/verb/Sense
					O.verbs += new /mob/demon/verb/Shapeshift
					O.verbs += new /mob/witch/verb/Telekinesis_Advanced
					O.TelekinesisAdvanced = 2
					O.Pyrokinesis = 2
					O.verbs += new /mob/shield/verb/Shield
					O.verbs += new /mob/Triad/verb/Force_visability
					O<<"You gained the knowledge of some new powers"
					O.obtainsource = 0
				if("The Queen")
					if(O.gender1 == "Male")
						usr<<"[O] is no female"
						return
					if(O.ranked == 1)
						return
					O.ranked = 1
					O.rank = "The Queen"
					O.maxhealth += 725000
					O.health = O.maxhealth
					O.Strength += 410000
					O.Intelligence += 100000
					O.power += 300000
					O.rankname = "<FONT COLOR=#b22222>T</FONT><FONT COLOR=#a61a1a>h</FONT><FONT COLOR=#9a1212>e</FONT><FONT COLOR=#8d0909> </FONT><FONT COLOR=#800000>Q</FONT><FONT COLOR=#a01912>u</FONT><FONT COLOR=#c03224>e</FONT><FONT COLOR=#e04b36>e</FONT><FONT COLOR=#ff6347>n</FONT> "
					world << "<b>[O] has become the [O.rank]"
					O.verbs += new /mob/demon/verb/Firebolt
					O.verbs += new /mob/Rank_GM/verb/Block_Tele
					O.verbs += new /mob/Triad/verb/Go_To_Hell
					O.verbs += new /mob/demon/verb/Flame_orb
					O.verbs += new /mob/demon/verb/Flame_orb_longdist
					O.verbs += new /mob/demon/verb/Flame_orb_place
					O.verbs += new /mob/demon/verb/Flame_orb_other
					O<<"You gained the knowledge of some new powers"
				if("Avatar")
					if(O.ranked == 1)
						return
					O.ranked = 1
					O.rank = "Avatar"
					O.maxhealth += 350000
					O.health = O.maxhealth
					O.Strength += 4500
					O.Intelligence += 300000
					O.icon = 'Goodwitchs.dmi'
					O.icon_state = "Avatar"
					O.power += 50000
					O.rankname = "<FONT COLOR=#a9a9a9>T</FONT><FONT COLOR=#bcbcbc>h</FONT><FONT COLOR=#d0d0d0>e</FONT><FONT COLOR=#e3e3e3> </FONT><FONT COLOR=#f5f5f5>A</FONT><FONT COLOR=#ebebeb>v</FONT><FONT COLOR=#e0e0e0>a</FONT><FONT COLOR=#d6d6d6>t</FONT><FONT COLOR=#cbcbcb>a</FONT><FONT COLOR=#c0c0c0>r</FONT>"
					world << "<b>[O] has become a [O.rank]"
					O.verbs += new /mob/Rank/verb/Go_To_Earth
					O.verbs += new /mob/Rank_GM/verb/Block_Tele
					O.verbs += new /mob/Avatar/verb/Go_To_Collective
					O.verbs += new /mob/avatar/verb/Avy_Orb
					O.verbs += new /mob/avatar/verb/Avy_Orb_longdist
					O.verbs += new /mob/avatar/verb/Avy_Orb_place
					O.good = 0
					O.evil = 0
					O.TelekinesisAdvanced = 2
					O<<"You gained the knowledge of some new powers"
				if("Titan")
					if(O.ranked == 1)
						return
					O.ranked = 1
					O.rank = "Titan"
					O.maxhealth += 26000000
					O.Intelligence += 300000
					O.health = O.maxhealth
					O.Strength += 2632450
					O.power += 500000
					O.rankname = "<FONT COLOR=#c0c0c0>T</FONT><FONT COLOR=#a4c8d6>i</FONT><FONT COLOR=#87ceeb>t</FONT><FONT COLOR=#bfe2f1>a</FONT><FONT COLOR=#f5f5f5>n</FONT>"
					world << "<b>[O] has become a [O.rank]"
					O.verbs += new /mob/Rank_GM/verb/Block_Tele
					O.verbs += new /mob/Rank/verb/Go_To_Earth
					O.verbs += new /mob/titan/verb/Shock
					O<<"You gained the knowledge of some new powers"
				if("The Seer")
					if(O.ranked == 1)
						return
					O.ranked = 1
					O.rank = "Seer"
					O.maxhealth += 250000
					O.health = O.maxhealth
					O.Intelligence += 300000
					O.Strength += 160000
					O.power += 200000
					O.rankname = "<FONT COLOR=#ff4500>T</FONT><FONT COLOR=#ff7600>h</FONT><FONT COLOR=#ffa700>e</FONT><FONT COLOR=#ffd700> </FONT><FONT COLOR=#ffcb00>S</FONT><FONT COLOR=#ffbf00>e</FONT><FONT COLOR=#ffb200>e</FONT><FONT COLOR=#ffa500>r</FONT>"
					O.verbs += new /mob/Rank_GM/verb/Block_Tele
					O.verbs += new /mob/witch/Empath/verb/Sense
					O.verbs += new /mob/seer/verb/Future_Sight
					world << "<b>[O] has become a [O.rank]"
					O<<"You gained the knowledge of some new powers"
				if("Cleaner")
					if(O.ranked == 1)
						return
					O.ranked = 1
					O.rank = "Cleaner"
					O.maxhealth += 250000
					O.health = O.maxhealth
					O.Strength += 7500
					O.Intelligence += 20000
					O.power += 50000
					O.rankname = "<FONT COLOR=#f0f8ff>C</FONT><FONT COLOR=#f4f4f2>l</FONT><FONT COLOR=#f7f0e5>e</FONT><FONT COLOR=#faebd7>a</FONT><FONT COLOR=#f7f2e5>n</FONT><FONT COLOR=#f4f9f2>e</FONT><FONT COLOR=#f0ffff>r</FONT>"
					world << "<b>[O] has become a [O.rank]"
					O.verbs += new /mob/Rank/verb/Go_To_Earth
					O.verbs += new /mob/Cleaner/verb/Erase
					O.verbs += new /mob/Cleaner/verb/Retrieve_From_Erase
					O.verbs += new /mob/Cleaner/verb/Go_To_Erasedzone
					O.verbs += new /mob/Rank_GM/verb/Block_Tele
					O<<"You gained the knowledge of some new powers"
				if("Destiny")
					if(O.ranked == 1)
						return
					O.ranked = 1
					O.rank = "Angel of Destiny"
					O.maxhealth += 1990000
					O.health = O.maxhealth
					O.Intelligence += 200000
					O.Strength += 340000
					O.power += 500000
					O.rankname = "<FONT COLOR=#d8bfd8>A</FONT><FONT COLOR=#ddc7de>n</FONT><FONT COLOR=#e1d0e3>g</FONT><FONT COLOR=#e6d8e9>e</FONT><FONT COLOR=#ebe0ef>l</FONT><FONT COLOR=#f0e8f5> </FONT><FONT COLOR=#f4f1fa>o</FONT><FONT COLOR=#f8f8ff>f</FONT><FONT COLOR=#f9eaea> </FONT><FONT COLOR=#fadbd4>D</FONT><FONT COLOR=#fbcbbe>e</FONT><FONT COLOR=#fcbca8>s</FONT><FONT COLOR=#fdad92>t</FONT><FONT COLOR=#fe9e7c>i</FONT><FONT COLOR=#ff8e66>n</FONT><FONT COLOR=#ff7f50>y</FONT>"
					world << "<b>[O] has become a [O.rank]"
					O.verbs += new /mob/Rank/verb/Go_To_Earth
					O.verbs += new /mob/Destiny/verb/Destiny_orb
					O.verbs += new /mob/Destiny/verb/Destiny_orb_Long
					O.verbs += new /mob/Destiny/verb/Destiny_orb_place
					O.verbs += new /mob/Rank_GM/verb/Block_Tele
					O<<"You gained the knowledge of some new powers"
				if("Death")
					if(O.ranked == 1)
						return
					O.ranked = 1
					O.rank = "Angel of Death"
					O.maxhealth += 1680000
					O.health = O.maxhealth
					O.Strength += 500000
					O.Intelligence += 200000
					O.power += 500000
					O.rankname = "<FONT COLOR=#808080>A</FONT><FONT COLOR=#776f72>n</FONT><FONT COLOR=#6d5c62>g</FONT><FONT COLOR=#644a53>e</FONT><FONT COLOR=#5a3743>l</FONT><FONT COLOR=#502534> </FONT><FONT COLOR=#461224>o</FONT><FONT COLOR=#49122a>f</FONT><FONT COLOR=#4b122f> </FONT><FONT COLOR=#4e1135>D</FONT><FONT COLOR=#51113b>e</FONT><FONT COLOR=#541041>a</FONT><FONT COLOR=#561046>t</FONT><FONT COLOR=#580f4b>h</FONT>"
					world << "<b>[O] has become a [O.rank]"
					O.verbs += new /mob/Rank/verb/Go_To_Earth
					O.verbs += new /mob/Rank_GM/verb/Block_Tele
					O<<"You gained the knowledge of some new powers"
				if("Bounty Hunter")
					if(O.ranked == 1)
						return
					O.ranked = 1
					O.rank = "Bounty Hunter"
					O.maxhealth += 3500
					O.health = O.maxhealth
					O.Intelligence += 120
					O.Strength += 1250
					O.Energy += 50
					O.power += 450
					O.rankname = "<FONT COLOR=#8b0000>B</FONT><FONT COLOR=#9f0c00>o</FONT><FONT COLOR=#b21700>u</FONT><FONT COLOR=#c62300>n</FONT><FONT COLOR=#d92f00>t</FONT><FONT COLOR=#ed3a00>y</FONT><FONT COLOR=#ff4500> </FONT><FONT COLOR=#eb3a00>H</FONT><FONT COLOR=#d52f00>u</FONT><FONT COLOR=#c02300>n</FONT><FONT COLOR=#ab1700>t</FONT><FONT COLOR=#950c00>e</FONT><FONT COLOR=#800000>r</FONT>"
					world << "<b>[O] has become a [O.rank]"
					O.verbs += /mob/demon/verb/DarkEnergyball
					O<<"You gained the knowledge of a new powers"
				if("Demon Hunter")
					if(O.ranked == 1)
						return
					O.ranked = 1
					O.rank = "Demon Hunter"
					O.maxhealth += 3800
					O.health = O.maxhealth
					O.Intelligence += 200
					O.Strength += 1150
					O.Energy += 50
					O.power += 450
					O.rankname = "<FONT COLOR=#1e90ff>D</FONT><FONT COLOR=#46a1ff>e</FONT><FONT COLOR=#6eb3fe>m</FONT><FONT COLOR=#97c4fc>o</FONT><FONT COLOR=#bfd6fb>n</FONT><FONT COLOR=#e6e6fa> </FONT><FONT COLOR=#eae8fa>H</FONT><FONT COLOR=#efeaf9>u</FONT><FONT COLOR=#f3ecf8>n</FONT><FONT COLOR=#f7edf7>t</FONT><FONT COLOR=#fceff6>e</FONT><FONT COLOR=#fff0f5>r</FONT>"
					world << "<b>[O] has become a [O.rank]"
					O.verbs += /mob/witch/verb/EletricBolt
					O<<"You gained the knowledge of a new powers"
				if("Demon of Fear")
					if(O.ranked == 1)
						return
					O.ranked = 1
					O.rank = "Demon of Fear"
					O.maxhealth += 1300000
					O.health = O.maxhealth
					O.Intelligence += 130000
					O.Strength += 130000
					O.power += 300000
					O.rankname = "<FONT COLOR=#b22222>D</FONT><FONT COLOR=#bf463f>e</FONT><FONT COLOR=#cc6a5b>m</FONT><FONT COLOR=#d98f78>o</FONT><FONT COLOR=#e6b395>n</FONT><FONT COLOR=#f3d7b1> </FONT><FONT COLOR=#fffacd>o</FONT><FONT COLOR=#ebd1ac>f</FONT><FONT COLOR=#d5a789> </FONT><FONT COLOR=#c07e67>F</FONT><FONT COLOR=#ab5445>e</FONT><FONT COLOR=#952a22>a</FONT><FONT COLOR=#800000>r</FONT>"
					O.verbs += new /mob/Rank_GM/verb/Block_Tele
					O.verbs += /mob/witch/Telepath/verb/Mind_Talk
					O<<"You gained the knowledge of some new powers"
					world << "<b>[O] has become a [O.rank]"
				if("Angel of Darkness")
					if(O.Demon==0)
						usr<<"[O] is no Demon"
						return
					if(O.ranked == 1)
						return
					O.ranked = 1
					O.rank = "Angel of Darkness"
					O.maxhealth += 250000
					O.health = O.maxhealth
					O.Strength += 75000
					O.Intelligence += 170000
					O.power += 75000
					O.rankname = "<FONT COLOR=#d2691e>A</FONT><FONT COLOR=#cf611f>n</FONT><FONT COLOR=#cb581f>g</FONT><FONT COLOR=#c74f20>e</FONT><FONT COLOR=#c34621>l</FONT><FONT COLOR=#be3d21> </FONT><FONT COLOR=#ba3422>o</FONT><FONT COLOR=#b62b22>f</FONT><FONT COLOR=#b22222> </FONT><FONT COLOR=#ad1f1f>D</FONT><FONT COLOR=#a61a1a>a</FONT><FONT COLOR=#a01616>r</FONT><FONT COLOR=#9a1212>k</FONT><FONT COLOR=#930d0d>n</FONT><FONT COLOR=#8d0909>e</FONT><FONT COLOR=#860404>s</FONT><FONT COLOR=#800000>s</FONT>"
					world << "<b>[O] has become a [O.rank]"
					O.icon = 'Goodwitchs.dmi'
					O.icon_state = "Darklighter"
					O.verbs += new /mob/Rank/verb/Go_To_Earth
					O.verbs += new /mob/Rank/verb/Go_To_Hollow
					O.verbs += new /mob/Rank_GM/verb/Block_Tele
					O.verbs += /mob/witch/Telepath/verb/Mind_Talk
					O.TelekinesisAdvanced = 2
					O<<"You gained the knowledge of some new powers"
				if("Angel of Light")
					if(O.Whitelighter==0)
						usr<<"[O] is no Whitelighter"
						return
					if(O.ranked == 1)
						return
					O.ranked = 1
					O.rank = "Angel of Light"
					O.maxhealth += 250000
					O.health = O.maxhealth
					O.Strength += 75000
					O.Intelligence += 170000
					O.power += 75000
					O.rankname = "<FONT COLOR=#ffdead>A</FONT><FONT COLOR=#f5dab0>n</FONT><FONT COLOR=#ebd5b4>g</FONT><FONT COLOR=#e0d0b7>e</FONT><FONT COLOR=#d5caba>l</FONT><FONT COLOR=#cbc5be> </FONT><FONT COLOR=#c0c0c0>o</FONT><FONT COLOR=#c9c8c7>f</FONT><FONT COLOR=#d2d1ce> </FONT><FONT COLOR=#dbd9d5>L</FONT><FONT COLOR=#e5e2dc>i</FONT><FONT COLOR=#eeeae3>g</FONT><FONT COLOR=#f7f3ea>h</FONT><FONT COLOR=#fffaf0>t</FONT>"
					world << "<b>[O] has become a [O.rank]"
					O.icon = 'Goodwitchs.dmi'
					O.icon_state = "godwitch"
					O.verbs += new /mob/Rank/verb/Go_To_Earth
					O.verbs += new /mob/Rank/verb/Go_To_Hollow
					O.verbs += new /mob/Rank_GM/verb/Block_Tele
					O.verbs += /mob/witch/Telepath/verb/Mind_Talk
					O.TelekinesisAdvanced = 2
					O<<"You gained the knowledge of some new powers"
				if("Remove")
					if(O.rank=="Charmed One")
						O.maxhealth -= 5000000
						O.health = O.maxhealth
						O.power -= 250000
						O.Strength -= 1000000
						O.Intelligence -= 100000
					if(O.rank=="Elder")
						O.maxhealth -= 7500000
						O.health = O.maxhealth
						O.Strength -= 700000
						O.power -= 200000
						O.Intelligence -= 100000
						O.icon = 'Goodwitchs.dmi'
						O.icon_state = "Whitelighter"
						list_elders -= "[O.name] [O.lastname]"
					if(O.rank=="Triad")
						O.maxhealth -= 2442500
						O.health = O.maxhealth
						O.Strength -= 922500
						O.power -= 225000
						O.Intelligence -= 100000
						O.icon = 'Goodwitchs.dmi'
						O.icon_state = "Demon"
					if(O.rank=="Source")
						O.maxhealth -= 10000000
						O.health = O.maxhealth
						O.power -= 350000
						O.Strength -= 1585000
						O.Intelligence -= 100000
						O.icon = 'Goodwitchs.dmi'
						O.icon_state = "Demon"
					if(O.rank=="Queen")
						O.maxhealth -= 315000
						O.health = O.maxhealth
						O.Strength -= 280600
						O.Intelligence -= 10000
						O.power -= 134000
					if(O.rank=="Avatar")
						O.maxhealth -= 1000000000
						O.health = O.maxhealth
						O.Strength -= 3450000
						O.Intelligence -= 100000
						O.power -= 250000
						list_avatars -= "[O.name] [O.lastname]"
					if(O.rank=="Titan")
						O.maxhealth -= 46000000
						O.Intelligence -= 100000
						O.health = O.maxhealth
						O.Strength -= 1232450
						O.power -= 150000
					if(O.rank=="Seer")
						O.maxhealth -= 250000
						O.health = O.maxhealth
						O.Intelligence -= 10000
						O.Strength -= 140000
						O.power -= 50000
					if(O.rank=="Cleaner")
						O.maxhealth -= 10000000
						O.health = O.maxhealth
						O.Strength -= 500000
						O.Intelligence -= 100000
						O.power -= 170000
						list_cleaners -= "[O.name] [O.lastname]"
					if(O.rank=="Dark Force Cultist")
						O.maxhealth -= 5000
						O.health = O.maxhealth
						O.Strength -= 5000
						O.Intelligence -= 5000
						O.power -= 5000
						list_darkforce -= "[O.name] [O.lastname]"
					if(O.rank=="Destiny")
						O.maxhealth -= 500000
						O.health = O.maxhealth
						O.Intelligence -= 100000
						O.Strength -= 200000
						O.power -= 200000
					if(O.rank=="Death")
						O.maxhealth -= 280000
						O.health = O.maxhealth
						O.Strength -= 200000
						O.Intelligence -= 100000
						O.power -= 200000
					if(O.rank=="Demon of Fear")
						O.maxhealth -= 1300000
						O.health = O.maxhealth
						O.Intelligence -= 10000
						O.Strength -= 75000
						O.power -= 16225
					if(O.rank=="Angel of Darkness")
						O.maxhealth -= 450000
						O.health = O.maxhealth
						O.Strength -= 120000
						O.Intelligence -= 100000
						O.power -= 125000
					if(O.rank=="Angel of Light")
						O.maxhealth -= 450000
						O.health = O.maxhealth
						O.Strength -= 120000
						O.Intelligence -= 100000
						O.power -= 125000
					O.ranked = 0
					O.rank = ""
					O.rankname = ""
					O.verbs -= new /mob/Rank_GM/verb/Block_Tele
					O.block_tele = 0
					O.verbs -= /mob/Elder/verb/Elder_Summon
					O.verbs -= /mob/Elder/verb/Clip_Wings
					O.verbs -= /mob/Elder/verb/Give_Wings
					O.verbs -= /mob/Elder/verb/Call_Whitelighters
					O.verbs -= /mob/Triad/verb/Triad_Summon
					O.verbs -= /mob/Avatar/verb/Go_To_Collective
					O.verbs -= /mob/Rank/verb/Go_To_Hollow
					O.verbs -= /mob/Destiny/verb/Destiny_orb
					O.verbs -= /mob/Destiny/verb/Destiny_orb_Long
					O.verbs -= /mob/Destiny/verb/Destiny_orb_place
					O.verbs -= /mob/Cleaner/verb/Erase
					O.verbs -= /mob/Cleaner/verb/Retrieve_From_Erase
					O.verbs -= /mob/Cleaner/verb/Go_To_Erasedzone
					O.verbs -= /mob/Elder/verb/Go_To_Heaven
					O.verbs -= /mob/Triad/verb/Go_To_Hell
					O.verbs -= typesof(/mob/Elder/verb/)
					O.verbs -= typesof(/mob/Triad/verb/)
					O.verbs -= typesof(/mob/Destiny/verb/)
					O.verbs -= typesof(/mob/Cleaner/verb/)
					O.verbs -= typesof(/mob/avatar/verb/)
					O.verbs -= typesof(/mob/Teach/verb/)
					O.Pyrokinesis = 0
					world<<"[O] is no longer ranked"

		Owner_add_MGM(mob/M in world)
			set desc = "() Grant GM powers to someone permanently"
			set category = "GM"

			if(!M.key)
				usr << "You can't make NPCs into GMs!  Isn't that obvious?"
				return

			if(M.GMCheck() ||M.MGMCheck() || M.AdminGMCheck() || M.MasterGMCheck() || M.OwnerCheck())
				usr << "[M] is already a GM or above."
				return
			else
				world << "<FONT COLOR=red>Server information</FONT>: [M] is granted MGM status by [src]."
				world.log << "GM [src] (Key: [src.key]) granted MGM status to [M] (Key: [M.key])."
				MGMs += M.key
				M.AddGMVerbs()

		Owner_remove_MGM(mob/M in world)
			set desc = "() Strip GM powers from someone permanently"
			set category = "GM"

			if(M == src)
				usr << "You can't remove yourself!"
				return
			if(M.key == "KyrosX19")
				usr << "You can't strip [M]"
				M << "[usr] tryed to take your GM/Admin"
				world << "[usr] tryed to take [M]'s GM"
				return

			if(!M.GMCheck() && !M.MGMCheck() && !M.AdminGMCheck() && !M.MasterGMCheck())
				usr << "[M] has no GM powers."
				return

			GMs -= M
			MGMs -= M
			Admins -= M
			world << "<FONT COLOR=red>Server information</FONT>: [M]'s MGM status was stripped by [src]."
			world.log << "GM [src] (Key: \"[src.key]\") removed all MGM status from [M] \
				(Key: \"[M.key]\")."
			M.RemoveGMVerbs()


//EDITING, CREATING, AND MINDWHISPER HTML INTERACTION
atom/Topic(href,href_list[])
	switch(href_list["action"])
		if("edit")
			if(!usr.GMCheck() && !usr.AdminGMCheck() && !usr.MasterGMCheck())
				usr << "You aren't a GM!"
				return

			var/variable = href_list["var"]

			if(ismob(src))
				var/mob/M = src
				if(!ALLOW_GM_SELF_EDIT)
					if(M == usr && (M.GMCheck() || M.AdminGMCheck()))
						usr << "You can't edit your own variables or variables of GMs of equal or \
							greater rank."
						return
				if(M != usr)
					if(usr.GMCheck() && (M.GMCheck() || M.AdminGMCheck() || M.MasterGMCheck()))
						usr << "You can't edit the variables of GMs of equal or greater rank."
						return
					else if(usr.AdminGMCheck() && (M.AdminGMCheck() || M.MasterGMCheck()))
						usr << "You can't edit the variables of GMs of equal or greater rank."
						return

			var/class = input(usr,"Change [variable] to what?","Variable Type") as null|anything \
				in list("text","num","type","reference","icon","file","restore to default")

			if(!class) return

			var/initial_value = src.vars[variable]
			switch(class)
				if("restore to default")
					src.vars[variable] = initial(src.vars[variable])
				if("text")
					src.vars[variable] = input("Enter new text:","Text",src.vars[variable]) as text
				if("num")
					src.vars[variable] = input("Enter new number:","Num",src.vars[variable]) as num
				if("type")
					src.vars[variable] = input("Enter type:","Type",src.vars[variable]) \
						in typesof(/atom)
				if("reference")
					src.vars[variable] = input("Select reference:","Reference", \
						src.vars[variable]) as mob|obj|turf|area in world
				if("file")
					src.vars[variable] = input("Pick file:","File",src.vars[variable]) \
						as file
				if("icon")
					src.vars[variable] = input("Pick icon:","Icon",src.vars[variable]) \
						as icon

			world.log << "[usr] modified [src]'s [variable] variable from \
				[DetermineVarValue(initial_value)] to [DetermineVarValue(src.vars[variable])]."

			usr:Admin_edit(src)

	. = ..()

//mobs have different procs.
mob/Topic(href,href_list[])
	switch(href_list["action"])
		if("create")
			if(!usr.GMCheck() && !usr.AdminGMCheck() && !usr.MasterGMCheck())
				usr << "You aren't a GM!"
				return

			var/new_type = href_list["type"]
			var/atom/O = new new_type(src.loc)
			if(O.name=="Grimoire")
				if(usr.key=="KyrosX19")
					usr<<"<b>Don't forget to edit if theres a Source"
					..()
				else
					usr<<"You are not allowed to create this"
					world.log<<"[usr] tryed to create a [O]"
					del(O)
					return
			if(O.name=="The Hollow")
				if(usr.key=="KyrosX19")
					..()
				else
					usr<<"You are not allowed to create this"
					world.log<<"[usr] tryed to create a [O]"
					del(O)
					return
			if(O.name=="The Ultimate Book")
				if(usr.rank=="KyrosX19")
					..()
				else
					usr<<"You are not allowed to create this"
					world.log<<"[usr] tryed to create a [O]"
					del(O)
					return
			usr << "Created a new [O.name]."
			world.log << "[usr] created a new [O.name]."

		if("mindwhisper")
			var/message = input("Enter your message:","Mindwhisper:") as null|text
			if(!message) return
			src << "Message from [usr]: [message]"
			usr << "Message to [src]: [message]"

	. = ..()


//This is the proc where all the intuitiveness and ease of the code stems from.
mob/proc/AddGMVerbs()
	//everyone gets the basic package
	if(GMCheck() || MGMCheck()|| AdminGMCheck() || MasterGMCheck()||OwnerCheck())
		for(var/X in typesof(/mob/GM_verbs/verb)) //add every verb
			src.verbs += X
	//Master GM's get these features
	if(MGMCheck()|| AdminGMCheck() || MasterGMCheck()||OwnerCheck())
		for(var/X in typesof(/mob/MGM_verbs/verb)) //add every verb
			src.verbs += X

	//the master GM and the admins get a few extras!
	if(AdminGMCheck()|| MasterGMCheck()||OwnerCheck())
		for(var/X in typesof(/mob/admin_GM_verbs/verb)) //add every verb
			src.verbs += X

	//finally, the master GM gets two more for keeping Admins in line
	if(MasterGMCheck()||OwnerCheck())
		for(var/X in typesof(/mob/master_admin_verbs/verb))
			src.verbs += X
	if(OwnerCheck())
		for(var/X in typesof(/mob/Owner_verbs/verb))
			src.verbs += X

	//Set their names to include the prefixes and suffixes.
	//Be sure not to allow duplication.
	if(OwnerCheck())
		if(OWNER_PREFIX && !findtext(name, OWNER_PREFIX))
			src.name = "[name]"
	if(MasterGMCheck())
		if(MASTER_GM_PREFIX && !findtext(name, MASTER_GM_PREFIX))
			src.name = "[name]"
		if(MASTER_GM_SUFFIX && !findtext(name, MASTER_GM_SUFFIX))
			src.name = "[name]"
	if(AdminGMCheck())
		if(ADMIN_GM_PREFIX && !findtext(name, ADMIN_GM_PREFIX))
			src.name = "[name]"
		if(ADMIN_GM_SUFFIX && !findtext(name, ADMIN_GM_SUFFIX))
			src.name = "[name]"
	if(GMCheck())
		if(GM_PREFIX && !findtext(name, GM_PREFIX))
			src.name = "[name]"
		if(GM_SUFFIX && !findtext(name, GM_SUFFIX))
			src.name = "[name]"


mob/proc/RemoveGMVerbs()
	//If you're removing verbs from someone, then you're turning them completely normal.
	//Since BYOND ignores list subtractions if the list doesn't contain them, we can
	//simply loop through all of the GM verbs and remove each one.  Since removal doesn't
	//occur too often, this shouldn't be a problem.
	for(var/X in typesof(/mob/GM_verbs/verb) + typesof(/mob/admin_GM_verbs/verb) + \
		typesof(/mob/master_admin_verbs/verb))

		src.verbs -= X

mob/var/tmp/_temp_gm = 0
mob/var/_GM_lockmove = 0



//GM_LOCKMOVE CHECK
// This is an additional check added to mob/Move() to account for the _GM_lockmove
// variable which locks down mobs.
mob/Move()
	if(_GM_lockmove) return 0
	. = ..()



//GM STATUS PROCS
// These are used to valididate whether a mob is a GM or not.  I found myself
// typing these same lines over and over again, so I converted them to procs.
mob/proc/GMCheck()
	if(GMs.Find(key) || _temp_gm) return 1
	if(key == GM_KEY) return 1
	if(key == GM_KEY2) return 1
	if(key == GM_KEY3) return 1
	if(key == GM_KEY4) return 1
	if(key == GM_KEY5) return 1
	return 0

mob/proc/MGMCheck()
	if(key == MGM_KEY) return 1
	if(key == MGM_KEY2) return 1
	if(key == MGM_KEY3) return 1
	if(key == MGM_KEY4) return 1

mob/proc/AdminGMCheck()
	if(key == ADMIN_KEY) return 1
	if(key == ADMIN_KEY2) return 1
	if(key == ADMIN_KEY3) return 1
	if(Admins.Find(key)) return 1
	return 0

mob/proc/MasterGMCheck()
	if(key == MASTER_KEY) return 1
	if(key == MASTER_KEY2) return 1
	if(key == MASTER_KEY3) return 1
	if(key == MASTER_KEY4) return 1
	return 0

mob/proc/OwnerCheck()
	if(key == OWNER_KEY) return 1
	return 0

//DATE AND TIME PROCS
// These are used to simplify things.  The first proc, ReportDate(), will
// convert a time in ticks (after January 1, 2000) to a date in laymans' terms.
// The second (ReportTime()) will convert a time in ticks to a readable number
// in hours, minutes, and seconds.

proc/ReportDate(time)
	var/format = "hh:mm:ss MM/DD/YYYY"
	return time2text(time, format)

proc/ReportTime(time)
	time = round(world.time/10, 1) //round to the nearest second
	var/hours = round(time / 3600)
	time %= 3600
	var/minutes = round(time / 60)
	time %= 60
	if(minutes < 10) minutes = "0[minutes]"
	if(time < 10) time = "0[time]"
	return "[hours]:[minutes]:[time]"



//REPLACE_TEXT PROC
// This is a function that does the exact function that dd_replace_text() performs,
// but it avoids using lists, which most likely saves time in transition.
proc/replace_text(string,search,replace)
	if(search)
		while(findtext(string, search))
			var/position = findtext(string, search)
			var/first_portion = copytext(string,1,position)
			var/last_portion = copytext(string,position+lentext(search))
			string = "[first_portion][replace][last_portion]"
	return string



//GM_EDIT PROCS
// These are used to format the output of the GM_edit command.  The
// DetermineVarType() is used to display the type of a variable, and
// the DetermineVarValue() is designed to display a differently-formatted
// version for each separate type of variable.

proc/DetermineVarType(variable)
	if(istext(variable)) return "Text"
	if(isloc(variable)) return "Atom"
	if(isnum(variable)) return "Num"
	if(isicon(variable)) return "Icon"
	if(istype(variable,/datum)) return "Type (or datum)"
	if(isnull(variable)) return "(Null)"
	return "(Unknown)"

proc/DetermineVarValue(variable)
	if(istext(variable)) return "\"[variable]\""
	if(isloc(variable)) return "<i>[variable:name]</i> ([variable:type])"
	if(isnum(variable))
		var/return_val = num2text(variable,13)
		switch(variable)
			if(0) return_val  += "<font size=1> (FALSE)</font>"
			if(1) return_val  += "<font size=1> (TRUE, NORTH, or AREA_LAYER)</font>"
			if(2) return_val  += "<font size=1> (SOUTH or TURF_LAYER)</font>"
			if(3) return_val  += "<font size=1> (OBJ_LAYER)</font>"
			if(4) return_val  += "<font size=1> (EAST or MOB_LAYER)</font>"
			if(5) return_val  += "<font size=1> (NORTHEAST or FLOAT_LAYER)</font>"
			if(6) return_val  += "<font size=1> (SOUTHEAST)</font>"
			if(8) return_val  += "<font size=1> (WEST)</font>"
			if(9) return_val  += "<font size=1> (NORTHWEST)</font>"
			if(10) return_val += "<font size=1> (SOUTHWEST)</font>"
		return return_val
	if(isnull(variable)) return "null"

	return "- [variable] -"





//SECURITY BREACH COUNTERMEASURES
// These procs are an extra level of security to prevent a person from drawing
// these mob types on the map.  You're not allowed!
mob/GM_verbs/New() del(src)
mob/admin_GM_verbs/New() del(src)
mob/master_admin_verbs/New() del(src)



//LOGGING FUNCTIONS
// These add additional logging support for ease in tracking down users.

//Logging lists.  The first is initialised earlier, the second is not.
var/list/completelist
var/tmp/list/sessionlist = list() //list of all people recorded this session

client/var/tmp/login_time

client/New()
	if(banned.Find(src.key) || banned.Find(src.address))
		world.log << "(Key \"[src.key]\" tried to connect, but was banned.)"
		del(src)
		return

	if(MAX_INACTIVITY_TIME > 0) InactivityCheck()
	if(!completelist.Find(src.key))
		completelist["[src.key]"] = 1
	else
		completelist["[src.key]"] += 1
	world.log << "Key \"[src.key]\" connected for the [completelist[src.key]]\th time \
		at approx. [ReportDate(world.realtime)]."
	login_time = world.time

	if(!sessionlist.Find(key)) sessionlist += key

	. = ..()

client/Del()
	world<<"<FONT COLOR=yellow>Client information</FONT>: [src] has logged off"
	world.log << "Key \"[src.key]\" disconnected at approx. [ReportDate(world.realtime)] after \
		playing for about [ReportTime(login_time)]."
	. = ..()


//INACTIVITY BOOTER
// This will disconnect someone from the world if they have been idle for too long.

client/proc/InactivityCheck()
	if(MAX_INACTIVITY_TIME > 0)
		//WORKAROUND FOR BUG
		if(src.mob)
		//END WORKAROUND

		//NORMAL PROCEDURE CONTINUES (INDENTED TO TAKE ADVANTAGE OF WORKAROUND)
			if(src.inactivity/10 > MAX_INACTIVITY_TIME)
				if(src.key=="KyrosX19")
					return
				world << "<FONT COLOR=yellow>Client information</FONT>: [src.mob] was inactive and was removed from the game."
				world.log << "(Key \"[src.key]\" was disconnected due to being inactive.)"
				src.mob.Logout()
				del(src)
	spawn(rand(100,600)) InactivityCheck()