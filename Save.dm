mob
	var
		hp=0
		maxhp=0
		strength=0
		exp=0
		expneed=0
		defense=0
		gold=0
		agility=0

mob/proc/write()
   var/savefile/F = new()
   var/txtfile = file("players/[ckey].txt")

   F[ckey] << usr

   fdel(txtfile)
   F.ExportText("/",txtfile)

 //  usr << "Your savefile looks like this:"

  // usr << "<xmp>[file2text(txtfile)]</xmp>"


mob/proc/read()
   var/savefile/F = new()
   var/txtfile = file("players/[ckey].txt")

   F.ImportText("/",txtfile)
   F[ckey] >> usr



mob
	proc
		logy()
			if(src.logsout==1)
				return
			else
				switch(alert("What would you like to do",,"New","Load","Exit"))
					if("Exit")
						del usr
					if("Load")
						usr.checkhas()
					if("New")
						switch(alert("Creating a new character will delete your old one, do you wish to continue?",,"Yes","No"))
							if("Yes")
								usr.name = input("Choose a name for your character.","Your Name",usr.name)
						//		usr.race = input("Select a race for your character.","Your Race",usr.race) in list("Muffin","Frog")
						//		usr.class = input("Choose a class for your character.","Your Class",usr.class) in list("Muffin Warrior","Frog Warrior")
							if("No")
								usr.logy()

mob
	Login()
		if(src.logsout==1)
			return
		else
			switch(alert("What would you like to do",,"New","Load","Exit"))
				if("Exit")
					del usr
				if("Load")
					usr.checkhas()
				if("New")
					switch(alert("Creating a new character will delete your old one, do you wish to continue?",,"Yes","No"))
						if("Yes")
							usr.name = input("Choose a name for your character.","Your Name",usr.name)
						//	usr.race = input("Select a race for your character.","Your Race",usr.race) in list("Muffin","Frog")
						//	usr.class = input("Choose a class for your character.","Your Class",usr.class) in list("Muffin Warrior","Frog Warrior")
						//	usr.pickstats()
						//	usr.loc=locate(/turf/RP/Start_Screen)
							usr.loc=locate(/turf/Area/Earth)
						if("No")
							usr.logy()



mob
	var
		logsout=0
		run=0

mob
	verb
		save()
			usr.write()
			usr << "Saving.."
			sleep(20)
			usr << "Character Saved"
/*
		showsave()
			var/txtfile = file("players/[ckey].txt")
			usr << "Your savefile looks like this:"
			usr << "<xmp>[file2text(txtfile)]</xmp>"
*/


mob
	proc
		checkhas()
			usr.read()
			if(usr.maxhp==0)
				usr << "Save file not found"
				usr.logy()
			else
				world << "[usr] has logged into the game "
				usr.logsout=1