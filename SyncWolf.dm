//////////////////////////////////////////////////////
//													//
//			Updates, made by YOUR NAME HERE!			//
//													//
//////////////////////////////////////////////////////
//////////////////////////////////////////////////////
//													//
//						Objects						//
//													//
//////////////////////////////////////////////////////
obj/HGM/
	Radio
		icon = 'General.dmi'
		icon_state = "Radio"
		density = 1

	Book
		icon = 'General.dmi'
		icon_state = "book1"
		density = 1
		var/booktext
		verb
			write(msg as message)
				set name = "Write"
				set src in view(1)
				if(src.bookowner=="")
					src.bookowner = "[usr.name] [usr.lastname]"
				booktext = {"<HTML><TITLE>Ancient Book</TITLE><BODY BGCOLOR=black TEXT=white><H3><CENTER><FONT FACE="Charming Font" SIZE="7" COLOR=darkblue><U>Ancient book of [src.bookowner]</U></FONT></CENTER></H3><P>[msg]</BODY></HTML>"}
			read()
				set src in view(1)
				set name = "Read"
				usr << browse(booktext,"Window=Book,size=350x325")
			Get()
				set src in oview(1)
				src.loc = usr
				usr << "You get a [src]."
			Drop()
				set src in usr
				src.loc = usr.loc
				usr << "You drop a [src]."

//////////////////////////////////////////////////////
//													//
//						Vars						//
//													//
//////////////////////////////////////////////////////
obj/var
	bookowner = ""
//////////////////////////////////////////////////////
//													//
//						Example						//
//													//
//////////////////////////////////////////////////////

/*mob/guard/Greet()
   ..()
   usr << "[src] whispers, 'drow cigam!'"*/

/*usr.speed += 1*/
//////////////////////////////////////////////////////
//													//
//						Procs						//
//													//
//////////////////////////////////////////////////////
mob/proc
	Multi_Key_Check() //needs to be fixed
		set category = "~Staff~"
		set name = "Check Multikey"
		set desc = "Check All Player for Multi Keying"
		var/Found[0]
		for(var/mob/M in world)
			if(Found.Find(M))continue
			if(M.client)
				for(var/mob/M2 in world)
					if(!M2.client)continue
					if(!M2)continue
					if(M == M2)continue
					if(M.client.address == M2.client.address)
						Found += M
						Found += M2
						usr << "-----------------"
						usr << "<B><font color = red>Match Found!"
						usr << "<B><font color = red>Name:</font> [M.name] <B><font color = #999999>- Key:</font> [M.key] <B><font color = #999999>- Address:</font> [M.client.address]."
						usr << "<B><font color = red>Name:</font> [M2.name] <B><font color = #999999>- Key:</font> [M2.key] <B><font color = #999999>- Address:</font> [M2.client.address]."
						usr << "-----------------"

//////////////////////////////////////////////////////
//													//
//						Boosts						//
//													//
//////////////////////////////////////////////////////
/*
BloodRayne666 *******
Mendon
Janosalderan69
Devils_Dragon ********
BlueKing45
Beerend
Buffy Summers
Shadow Seraph *******
Cobain997
Destroior
Slash13ac
Kimpo876
Fenixo *******
Shuugo
Ej100
*/

client/proc
	AutoReboot()
		for(var/mob/M in world)
			if(M.key=="Coolbuddy22"||M.key=="KyrosX19")
				switch(alert(M,"Do you want to start the Auto-reboot?","Auto reboot","Yes","No"))
					if("Yes")
						sleep(126000)
						world << "<FONT COLOR=red>Server information</FONT>: Server Reboot!"
						world.Reboot()
					if("No")
						..()

