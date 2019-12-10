
obj/RPNPC/
	NPC_01
		name = "Role Play"
		density = 1
		icon = 'Goodwitchs.dmi'
		icon_state = "rpnpc"
		verb
			Talk_1()
				set name = "Join RP"
				set src in oview(1)
				usr.RPCheck()
	NPC_02
		name = "Role Play"
		density = 1
		icon = 'Goodwitchs.dmi'
		icon_state = "rpnpc"
		verb
			Talk_2()
				set name = "Join Safe"
				set src in oview(1)
				usr.RPCheck2()

mob/proc
	RPCheck()
		switch(alert(usr,"What do you want to do? Join RP or Stay?","Role Play","Join RP","Stay"))
			if("Join RP")
				usr.RolePlaying = 1
				usr.statuschecker()
				if(usr.good==1)
					usr.loc=locate(/turf/RP/RolePlayGood)
				if(usr.evil==1)
					usr.loc=locate(/turf/RP/RolePlayEvil)
				else
					usr.loc=locate(/turf/Area/Earth)
				world << "<font color=blue>[usr] has joined the Role Play</font>"
				world.log << "[usr] has joined the Role Play"
			if("Stay")
				usr<<"You stay in the safe zone"
				usr.statuschecker()
	RPCheck2()
		switch(alert(usr,"What do you want to do? Go to Safe Zone or Stay?","Role Play","Safe Zone","Stay"))
			if("Safe Zone")
				usr.RolePlaying = 0
				usr.loc=locate(/turf/RP/SafeZone)
				world << "<font color=blue>[usr] has entered the Safe Zone</font>"
				world.log << "[usr] has entered the Safe Zone"
				usr.statuschecker()
			if("Stay")
				usr<<"You stay in the Role Play"
				usr.statuschecker()
	RolePlay()
		switch(alert(usr,"What do you want to do? Join RP or Safe Zone?","Role Play","Join RP","Safe Zone"))
			if("Join RP")
				usr.RolePlaying = 1
				if(usr.good==1)
					usr.loc=locate(/turf/RP/RolePlayGood)
				if(usr.evil==1)
					usr.loc=locate(/turf/RP/RolePlayEvil)
				else
					usr.loc=locate(/turf/Area/Earth)
				world << "<font color=blue>[usr] has joined the Role Play</font>"
				world.log << "[usr] has joined the Role Play"
				usr.statuschecker()
			if("Safe Zone")
				usr.loc=locate(/turf/RP/SafeZone)
				world << "<font color=blue>[usr] has entered the Safe Zone</font>"
				world.log<<"[usr] has entered the safe zone"
				usr.statuschecker()

turf/RP
	RolePlayEvil
		name = ""
	RolePlayGood
		name = ""
	SafeZone
		name = ""
	NewZone
		name = ""
	Start_Screen
		name = ""
		density = 0
	Title_Screen
		icon = 'charmed_title2.bmp'


/*mob/verb
	Set_Status()
		switch(alert(usr,"Set status to?","Setting Status","AFK","Back"))
			if("AFK")
				usr.status = "AFK"
			if("Back")
				usr.statuschecker()*/

mob/verb
	Give_Money(mob/M in range(1)-usr)
		usr.giveamount = input("How mutch you wanna give?","Give money") as num
		if(usr.giveamount>=usr.Money)
			usr<<"You dont have this mutch money"
			return
		else
			usr.Money -= usr.giveamount
			M.Money += usr.giveamount
			usr<<"You have given [M] [usr.giveamount]$"
			M<<"[usr] has given you [usr.giveamount]$"

	Set_Relationship(mob/M in view(9))
		set category = "Commands"
		var/default_value = "Father"
		var/list/family = list("Father", "Mother", "Brother", "Sister", "Son", "Daughter", "Cancel")
		choose_family = input(usr, default_value) in family
		switch(choose_family)
			if("Father")
				if(usr.hasfather==1)
					usr<<"You already have a father"
					return
				if(M.gender1=="Female")
					usr<<"[M] is a girl, LolZ"
				switch(alert(M,"Are you [usr]'s Father?","Family system","Yes","No"))
					if("No")
						usr<<"[M] has denied to be your father"
						M<<"You denied fatherhood"
						return
					if("Yes")
						..()
				if(usr.gender1=="Male")
					if(M.sons==3)
						usr<<"[M] already has 3 sons"
						return
					else if(M.sons==2)
						usr.father = M.name
						usr.hasfather = 1
						M<<"[usr] has claimed to be your son"
						M.son3 = usr.name
						M.sons += 1
						return
					else if(M.sons==1)
						usr.father = M.name
						usr.hasfather = 1
						M<<"[usr] has claimed to be your son"
						M.son2 = usr.name
						M.sons += 1
						return
					else if(M.sons==0)
						usr.father = M.name
						usr.hasfather = 1
						M<<"[usr] has claimed to be your son"
						M.son1 = usr.name
						M.sons += 1
						return
				else if(usr.gender1=="Female")
					if(M.daughters==3)
						usr<<"[M] already has 3 daughters"
						return
					else if(M.daughters==2)
						usr.father = M.name
						usr.hasfather = 1
						M<<"[usr] has claimed to be your daughter"
						M.daughter3 = usr.name
						M.daughters += 1
						return
					else if(M.daughters==1)
						usr.father = M.name
						usr.hasfather = 1
						M<<"[usr] has claimed to be your daughter"
						M.daughter2 = usr.name
						M.daughters += 1
						return
					else if(M.daughters==0)
						usr.father = M.name
						usr.hasfather = 1
						M<<"[usr] has claimed to be your daughter"
						M.daughter1 = usr.name
						M.daughters += 1
						return

			if("Mother")
				if(usr.hasmother==1)
					usr<<"You already have a mother"
					return
				if(M.gender1=="Male")
					usr<<"LMAO, he's a guy, how can a guy be a mother XD"
					return
				switch(alert(M,"Are you [M]'s mother?","Family system","Yes","No"))
					if("No")
						usr<<"[M] has denied to be your mother"
						M<<"You denied motherhood"
						return
					if("Yes")
						..()
				if(usr.gender1=="Male")
					if(M.sons==3)
						usr<<"[M] already has 3 sons"
						return
					else if(M.sons==2)
						usr.mother = M.name
						usr.hasmother = 1
						M<<"[usr] has claimed to be your son"
						M.son3 = usr.name
						M.sons += 1
						return
					else if(M.sons==1)
						usr.mother = M.name
						usr.hasmother = 1
						M<<"[usr] has claimed to be your son"
						M.son2 = usr.name
						M.sons += 1
						return
					else if(M.sons==0)
						usr.mother = M.name
						usr.hasmother = 1
						M<<"[usr] has claimed to be your son"
						M.son1 = usr.name
						M.sons += 1
						return
				else if(usr.gender1=="Female")
					if(M.daughters==3)
						usr<<"[M] already has 3 daughters"
						return
					else if(M.daughters==2)
						usr.mother = M.name
						usr.hasmother = 1
						M<<"[usr] has claimed to be your daughter"
						M.daughter3 = usr.name
						M.daughters += 1
						return
					else if(M.daughters==1)
						usr.mother = M.name
						usr.hasmother = 1
						M<<"[usr] has claimed to be your daughter"
						M.daughter2 = usr.name
						M.daughters += 1
						return
					else if(M.daughters==0)
						usr.mother = M.name
						usr.hasmother = 1
						M<<"[usr] has claimed to be your daughter"
						M.daughter1 = usr.name
						M.daughters += 1
						return
			if("Brother")
				if(M.gender1=="Female")
					usr<<"There is a bigger chance of this being your sister"
					return
				if(usr.brothers==3)
					usr<<"You already have 3 brothers"
					return
				switch(alert(M,"Are you [usr]'s brother?","Family system","Yes","No"))
					if("No")
						usr<<"[M] has denied to be your brother"
						M<<"You denied brotherhood"
						return
					if("Yes")
						..()
				if(usr.gender1=="Male")
					if(M.brothers==3)
						usr<<"[M] already has 3 brothers"
						return
					if(M.brothers==2)
						M.brother3 = usr.name
						if(usr.brothers==2)
							usr.brother3 = M.name
						if(usr.brothers==1)
							usr.brother2 = M.name
						if(usr.brothers==0)
							usr.brother1 = M.name
						M<<"[usr] has claimed to be your brother"
					if(M.brothers==1)
						M.brother2 = usr.name
						if(usr.brothers==2)
							usr.brother3 = M.name
						if(usr.brothers==1)
							usr.brother2 = M.name
						if(usr.brothers==0)
							usr.brother1 = M.name
						M<<"[usr] has claimed to be your brother"
					if(M.brothers==0)
						M.brother1 = usr.name
						if(usr.brothers==2)
							usr.brother3 = M.name
						if(usr.brothers==1)
							usr.brother2 = M.name
						if(usr.brothers==0)
							usr.brother1 = M.name
						M<<"[usr] has claimed to be your brother"
				if(usr.gender1=="Female")
					if(M.sisters==3)
						usr<<"[M] already has 3 sisters"
						return
					if(M.sisters==2)
						M.sister3 = usr.name
						if(usr.brothers==2)
							usr.brother3 = M.name
						if(usr.brothers==1)
							usr.brother2 = M.name
						if(usr.brothers==0)
							usr.brother1 = M.name
						M<<"[usr] has claimed to be your sister"
					if(M.sisters==1)
						M.sister2 = usr.name
						if(usr.brothers==2)
							usr.brother3 = M.name
						if(usr.brothers==1)
							usr.brother2 = M.name
						if(usr.brothers==0)
							usr.brother1 = M.name
						M<<"[usr] has claimed to be your sister"
					if(M.sisters==0)
						M.sister1 = usr.name
						if(usr.brothers==2)
							usr.brother3 = M.name
						if(usr.brothers==1)
							usr.brother2 = M.name
						if(usr.brothers==0)
							usr.brother1 = M.name
						M<<"[usr] has claimed to be your sister"
			if("Sister")
				if(M.gender1=="Male")
					usr<<"There is a bigger chance of this being your brother"
					return
				if(usr.sisters==3)
					usr<<"You already have 3 sisters"
					return
				switch(alert(M,"Are you [usr]'s sister?","Family system","Yes","No"))
					if("No")
						usr<<"[M] has denied to be your sister"
						M<<"You denied sisterhood"
						return
					if("Yes")
						..()
				if(usr.gender1=="Male")
					if(M.brothers==3)
						usr<<"[M] already has 3 brothers"
						return
					if(M.brothers==2)
						M.brother3 = usr.name
						if(usr.sisters==2)
							usr.sister3 = M.name
						if(usr.sisters==1)
							usr.sister2 = M.name
						if(usr.sisters==0)
							usr.sister1 = M.name
						M<<"[usr] has claimed to be your sister"
					if(M.brothers==1)
						M.brother2 = usr.name
						if(usr.sisters==2)
							usr.sister3 = M.name
						if(usr.sisters==1)
							usr.sister2 = M.name
						if(usr.sisters==0)
							usr.sister1 = M.name
						M<<"[usr] has claimed to be your sister"
					if(M.brothers==0)
						M.brother1 = usr.name
						if(usr.sisters==2)
							usr.sister3 = M.name
						if(usr.sisters==1)
							usr.sister2 = M.name
						if(usr.sisters==0)
							usr.sister1 = M.name
						M<<"[usr] has claimed to be your sister"
				if(usr.gender1=="Female")
					if(M.sisters==3)
						usr<<"[M] already has 3 sisters"
						return
					if(M.sisters==2)
						M.sister3 = usr.name
						if(usr.sisters==2)
							usr.sister3 = M.name
						if(usr.sisters==1)
							usr.sister2 = M.name
						if(usr.sisters==0)
							usr.sister1 = M.name
						M<<"[usr] has claimed to be your sister"
					if(M.sisters==1)
						M.sister2 = usr.name
						if(usr.sisters==2)
							usr.sister3 = M.name
						if(usr.sisters==1)
							usr.sister2 = M.name
						if(usr.sisters==0)
							usr.sister1 = M.name
						M<<"[usr] has claimed to be your sister"
					if(M.sisters==0)
						M.sister1 = usr.name
						if(usr.sisters==2)
							usr.sister3 = M.name
						if(usr.sisters==1)
							usr.sister2 = M.name
						if(usr.sisters==0)
							usr.sister1 = M.name
						M<<"[usr] has claimed to be your sister"
			if("Son")
				if(M.gender1=="Female")
					usr<<"There is a bigger chance of this being your daughter"
					return
				if(usr.sons==3)
					usr<<"You already have 3 sons"
					return
				switch(alert(M,"Are you [usr]'s son?","Family system","Yes","No"))
					if("No")
						usr<<"[M] has denied to be your son"
						M<<"You denied to be [usr]'s son"
						return
					if("Yes")
						..()
				if(usr.gender1=="Male")
					if(M.hasfather==1)
						usr<<"[M] already has a father"
						return
					else
						M.father = usr.name
						M.hasfather = 1
						if(usr.sons==2)
							usr.son3 = M.name
						if(usr.sons==1)
							usr.son2 = M.name
						if(usr.sons==0)
							usr.son1 = M.name
						M<<"[usr] has claimed to be your father"
				if(usr.gender1=="Female")
					if(M.hasmother==1)
						usr<<"[M] already has a mother"
						return
					else
						M.mother = usr.name
						M.hasmother = 1
						if(usr.sons==2)
							usr.son3 = M.name
						if(usr.sons==1)
							usr.son2 = M.name
						if(usr.sons==0)
							usr.son1 = M.name
						M<<"[usr] has claimed to be your mother"
			if("Daughter")
				if(M.gender1=="Male")
					usr<<"There is a bigger chance of this being your son"
					return
				if(usr.daughters==3)
					usr<<"You already have 3 daughters"
					return
				switch(alert(M,"Are you [usr]'s daughter?","Family system","Yes","No"))
					if("No")
						usr<<"[M] has denied to be your daughter"
						M<<"You denied to be [usr]'s daughter"
						return
					if("Yes")
						..()
				if(usr.gender1=="Male")
					if(M.hasfather==1)
						usr<<"[M] already has a father"
						return
					else
						M.father = usr.name
						M.hasfather = 1
						if(usr.daughters==2)
							usr.daughter3 = M.name
						if(usr.daughters==1)
							usr.daughter2 = M.name
						if(usr.daughters==0)
							usr.daughter1 = M.name
						M<<"[usr] has claimed to be your father"
				if(usr.gender1=="Female")
					if(M.hasmother==1)
						usr<<"[M] already has a mother"
						return
					else
						M.mother = usr.name
						M.hasmother = 1
						if(usr.daughters==2)
							usr.daughter3 = M.name
						if(usr.daughters==1)
							usr.daughter2 = M.name
						if(usr.daughters==0)
							usr.daughter1 = M.name
						M<<"[usr] has claimed to be your mother"

	Clear_Family()
		set desc = "Clears your intire family"
		set category = "Commands"
		switch(input(usr,"You sure you want to clear all your family?","Family","Yes","No"))
			if("Yes")
				usr.father = ""
				usr.hasfather = 0
				usr.mother = ""
				usr.hasmother = 0
				usr.brother1 = ""
				usr.brother2 = ""
				usr.brother3 = ""
				usr.brothers = 0
				usr.sister1 = ""
				usr.sister2 = ""
				usr.sister3 = ""
				usr.sisters = 0
				usr.son1 = ""
				usr.son2 = ""
				usr.son3 = ""
				usr.sons = 0
				usr.daughter1 = ""
				usr.daughter2 = ""
				usr.daughter3 = ""
				usr.daughters = 0
				usr<<"You cleared your family tree"
			if("No")
				..()

mob
	verb
		Screen_size()
			set name = "Set View"
			alert("Your current view is [client.view]. The default view for charmed is 9.")//**NOTE**:'5' is the closest to the default view as you can get, IF you don't want to get into fractions.
			switch(input("What Screen size do you want?","Choose your screen size!",) in list("4","5","6","7","8","9","10","Cancel"))
				if("4")
					if(client.view == 4)
						usr << "You are on this size ([client.view]) already..."
					else
						client.view = 4
				if("5")
					if(client.view == 5)
						usr << "You are on this size ([client.view]) already..."
					else
						client.view = 5
				if("6")
					if(client.view == 6)
						usr << "You are on this size ([client.view]) already..."
					else
						client.view = 6
				if("7")
					if(client.view == 7)
						usr << "You are on this size ([client.view]) already..."
					else
						client.view = 7
				if("8")
					if(client.view == 8)
						usr << "You are on this size ([client.view]) already..."
					else
						client.view = 8
				if("9")
					if(client.view == 9)
						usr << "You are on this size ([client.view]) already..."
					else
						client.view = 9
				if("10")
					if(client.view == 10)
						usr << "You are on this size ([client.view]) already..."
					else
						client.view = 10
				if("Cancel")
					return()
		Punch(mob/M in range(1)-usr)
			set category = "Skills"
			if(usr.RolePlaying==0)
				usr<<"Your not roleplaying"
				return
			if(usr.Selforb==1)
				usr<<"Not while in orb"
				return
			if(M.Selforb==1)
				usr<<"[M] is orbed"
				return
			if(usr.attacking==0)
				usr.attacking = 1
				usr<<"You punch [M]"
				M<<"[usr] punches you"
				M.health -= usr.Strength/200
				if(M.evil==1)
					usr.alignpoint+=1
				if(M.good==1)
					usr.alignpoint-=1
				usr.attacking = 0
				usr.AlignmentChecker()
				usr.deathcheck(M)
			else
				usr<<"Your already attacking"
		Give_item(mob/M in range(1)-usr)
			usr.giveitem = input("What item do you want to give?","Give item") in contents
			usr.contents -= usr.giveitem
			M.contents += usr.giveitem
			usr<<"<FONT COLOR=yellow>Client information</FONT>: You have given [usr.giveitem] to [M]."
			M<<"<FONT COLOR=yellow>Client information</FONT>: [usr.name] has given [usr.giveitem] to you."
mob/DarkForce/verb
	Eyes()
		set category = "Skills"
		view(9) << "<i>*You see [usr]'s eyes turn into flames and then black*"
turf/numbers
	nr1
		name = "Level 1"
		icon = 'General.dmi'
		icon_state = "1"
		density = 1
	nr2
		name = "Level 2"
		icon = 'General.dmi'
		icon_state = "2"
		density = 1
	nr3
		name = "Level 3"
		icon = 'General.dmi'
		icon_state = "3"
		density = 1

/*	Grand Rank name colors:
Grand Elder: <FONT COLOR="#4169e1">G</FONT><FONT COLOR="#577fe2">r</FONT><FONT COLOR="#6d96e3">a</FONT><FONT COLOR="#82ace5">n</FONT><FONT COLOR="#98c3e6">d</FONT><FONT COLOR="#add8e6"> </FONT><FONT COLOR="#a6d7e7">E</FONT><FONT COLOR="#9ed5e8">l</FONT><FONT COLOR="#97d2ea">d</FONT><FONT COLOR="#8fd0eb">e</FONT><FONT COLOR="#87ceeb">r</FONT>
Grand Avatar: */