
var/list/Guildlevel = list()
var/list/Guilds = list()//This defines the list that we store the created guild in
mob/var/list/Guildmembers = list()//This defines the list we store guildmembers in
mob/var/list/teleportmob = list()
mob/var/guild//Defines the variable guild
mob/var/guildlevel
mob
	verb
		Make_Guild(var/Guildmaking as text)//The var/Guildmaking as text means whatever the player enters is what the variable Guildmaking is
			set name = "Create Faction/Coven"
			if(usr.good==0&&usr.evil==0)
				usr<<"Neutral party's cannot create a Coven/Faction"
				return
			if(usr.power<= 49999)
				if(usr.good==1)
					usr<<"With sutch low power...your to weak to have your own Coven"
				if(usr.evil==1)
					usr<<"With sutch low power...your to weak to have your own Faction"
				return
			if(!usr.guild)
				if(Guilds.Find(ckey(Guildmaking)))//Next we check if the guild name is taken
					alert("There is already a guild named this. Pick another name.")//If it is we tell them that is is and to pick another name
				else if(usr.good==1)
					Guilds += ckey(Guildmaking)//If its not we add the new guild's name to the list of created guilds
					src.guild = "[Guildmaking]"//Now we make the players guild variable equal the new quilds name (This will be used when inviting a player to the guild)
					src.verbs += /mob/Guild/verb/Coven_Chat//We give the player the new guild verbs
					src.verbs += /mob/Guild/verb/Coven_Members//We give the player the new guild verbs
					src.verbs += /mob/Guild/verb/Coven_Invite//We give the player the new guild verbs
					src.verbs += /mob/Guild/verb/Coven_Disband//We give the player the new guild verbs
					src.verbs -= /mob/verb/Make_Guild//Now we delete this verb so the player cannot create multiple guilds
					src.verbs += /mob/Guild/verb/Coven_recruiter
					src.verbs += /mob/Guild/verb/Covenmember_level
				else if(usr.evil==1)
					Guilds += ckey(Guildmaking)//If its not we add the new guild's name to the list of created guilds
					src.guild = "[Guildmaking]"//Now we make the players guild variable equal the new quilds name (This will be used when inviting a player to the guild)
					src.verbs += /mob/Guild/verb/Faction_Chat//We give the player the new guild verbs
					src.verbs += /mob/Guild/verb/Faction_Members//We give the player the new guild verbs
					src.verbs += /mob/Guild/verb/Faction_Invite//We give the player the new guild verbs
					src.verbs += /mob/Guild/verb/Faction_Disband//We give the player the new guild verbs
					src.verbs -= /mob/verb/Make_Guild//Now we delete this verb so the player cannot create multiple guilds
					src.verbs += /mob/Guild/verb/Faction_recruiter
					src.verbs += /mob/Guild/verb/Factionmember_level


			else
				usr << "You already have a guild."
	Guild
		verb
			Faction_Members()
				set category = "Faction"
				src << "The following are in your faction:"
				for(var/mob/M in world)//Checks all the players in the world
					if(M.guild == src.guild)//If the player is in the players guild
						src << "[M]"//then is tells the player

			Faction_Chat(var/T as text)//Makes it so the player can enter the message he wants to tell the guildmembers
				set category = "Faction"
				for(var/mob/M in world)
					if(M.guild == src.guild)//Makes sure the other players in his guild can head
						M << "<font color=red>{Faction}</font color> [src] : [T]"//Gives all the guild members the message

			Leave_Faction()
				set category = "Faction"
				switch(alert("Are you sure you want to leave [copytext("[guild]",1)]","","Yes","No"))//We make sure the character wants to leave the guild
					if("Yes")
						for(var/mob/M in world)
							if(M.guild == src.guild)
								M << "<FONT COLOR=purple>Guild information</FONT>: [src] has left the faction."//If he wants to leave the guild it tells all the members he left
						src.verbs -= new/mob/Guild/verb/Faction_Invite//Deletes the owner of the guilds verbs
						src.verbs -= new/mob/Guild/verb/Faction_Disband//Deletes the owner of the guilds verbs
						src.verbs -= new/mob/Guild/verb/Faction_Chat//Deletes the owner of the guilds verbs
						src.verbs -= new/mob/Guild/verb/Factionmember_level
						src.verbs -= new/mob/Guild/verb/Faction_recruiter
						src.verbs -= new/mob/Guild/verb/Faction_Members//Deletes the owner of the guilds verbs
						src.verbs -= new/mob/Guild/verb/Leave_Faction
						src.verbs += new/mob/verb/Make_Guild//Gives him the make guild verb so he cant create another one later
						src.guild = null//Then it makes his guild null so he can join other ones

			Faction_Invite(mob/M as mob in view())//We make it so only players around the player can be invited to the guild
				set category = "Faction"
				if(!M.guild)//Now we have sure they are not in a guild
					switch(alert(M,"[usr] would like you to join their Faction {[usr.guild]}. Would you like to join?","","Yes","No"))//If they arent in a guild we ask them to join
						if("Yes")
							if(M.guild == src.guild)
								M << "<FONT COLOR=purple>Guild information</FONT>: [M.name] has joined the faction"
							M.guild = usr.guild//Now we make the players guild the same as the other players
							M.verbs += /mob/Guild/verb/Leave_Faction//We give the player the new guild verbs
							M.verbs += /mob/Guild/verb/Faction_Chat//We give the player the new guild verbs
							M.verbs += /mob/Guild/verb/Faction_Members//We give the player the new guild verbs
				else
					usr << "[M] is already in a guild."//If they are in a guild we dont invite them and it tells the player that person is already in a guild

			Faction_Disband()
				set category = "Faction"
				switch(alert("Are you sure you want to delete [html_decode(usr.guild)]?","","Yes","No"))
					if("Yes")
						for(var/mob/M in Guildmembers)//If he wants to it makes all the players in the guild leave
							M.guild = null//Makes their guild = nothing
						src.verbs -= new/mob/Guild/verb/Faction_Invite//Deletes the owner of the guilds verbs
						src.verbs -= new/mob/Guild/verb/Faction_Disband//Deletes the owner of the guilds verbs
						src.verbs -= new/mob/Guild/verb/Faction_Chat//Deletes the owner of the guilds verbs
						src.verbs -= new/mob/Guild/verb/Factionmember_level
						src.verbs -= new/mob/Guild/verb/Faction_recruiter
						src.verbs -= new/mob/Guild/verb/Faction_Members//Deletes the owner of the guilds verbs
						src.verbs += new/mob/verb/Make_Guild//Gives him the make guild verb so he cant create another one later
						src.guild = null//Makes the owners guild = nothing
						src.Guildmembers = null//Make the guildmembers list = nothing so no more info is stored in it
			Faction_recruiter(mob/M as mob in view())
				set category = "Faction"
				switch(alert("Are you sure you want make [M] a Faction_recruiter","","Yes","No"))//Makes sure the player really wants to disband his guild
					if("Yes")
						M.verbs += /mob/Guild/verb/Faction_Invite
						M.verbs += /mob/Guild/verb/Factionmember_level
			Factionmember_level(mob/M as mob in view(),var/level as text)//The var/Guildmaking as text means whatever the player enters is what the variable Guildmaking is
				set category = "Faction"
				if(M.guild == src.guild)
					if(Guildlevel.Find(ckey(level)))//Next we check if the guild name is taken
						alert("There is already a Faction/Coven named this. Pick another name.")//If it is we tell them that is is and to pick another name
					else
						Guildlevel += ckey(level)//If its not we add the new guild's name to the list of created guilds
						M.guildlevel = "[level]"//Now we make the players guild variable equal the new quilds name (This will be used when inviting a player to the guild)



			Coven_Members()
				set category = "Coven"
				src << "The following are in your Coven:"
				for(var/mob/M in world)//Checks all the players in the world
					if(M.guild == src.guild)//If the player is in the players guild
						src << "[M]"//then is tells the player

			Coven_Chat(var/T as text)//Makes it so the player can enter the message he wants to tell the guildmembers
				set category = "Coven"
				for(var/mob/M in world)
					if(M.guild == src.guild)//Makes sure the other players in his guild can head
						M << "<font color=blue>{Coven}</font color> [src] : [T]"//Gives all the guild members the message

			Leave_Coven()
				set category = "Coven"
				switch(alert("Are you sure you want to leave [copytext("[guild]",1)]","","Yes","No"))//We make sure the character wants to leave the guild
					if("Yes")
						for(var/mob/M in world)
							if(M.guild == src.guild)
								M << "<FONT COLOR=purple>Guild information</FONT>: [src] has left the coven."//If he wants to leave the guild it tells all the members he left
						src.verbs -= new/mob/Guild/verb/Coven_Invite//Deletes the owner of the guilds verbs
						src.verbs -= new/mob/Guild/verb/Coven_Disband//Deletes the owner of the guilds verbs
						src.verbs -= new/mob/Guild/verb/Coven_Chat//Deletes the owner of the guilds verbs
						src.verbs -= new/mob/Guild/verb/Covenmember_level
						src.verbs -= new/mob/Guild/verb/Coven_recruiter
						src.verbs -= new/mob/Guild/verb/Coven_Members//Deletes the owner of the guilds verbs
						src.verbs -= new/mob/Guild/verb/Leave_Coven
						src.verbs += new/mob/verb/Make_Guild//Gives him the make guild verb so he cant create another one later
						src.guild = null//Then it makes his guild null so he can join other ones

			Coven_Invite(mob/M as mob in view())//We make it so only players around the player can be invited to the guild
				set category = "Coven"
				if(!M.guild)//Now we have sure they are not in a guild
					switch(alert(M,"[usr] would like you to join their Coven {[usr.guild]}. Would you like to join?","","Yes","No"))//If they arent in a guild we ask them to join
						if("Yes")
							if(M.guild == src.guild)
								M << "<FONT COLOR=purple>Guild information</FONT>: [M.name] has joined the coven"
							M.guild = usr.guild//Now we make the players guild the same as the other players
							M.verbs += /mob/Guild/verb/Leave_Coven//We give the player the new guild verbs
							M.verbs += /mob/Guild/verb/Coven_Chat//We give the player the new guild verbs
							M.verbs += /mob/Guild/verb/Coven_Members//We give the player the new guild verbs
				else
					usr << "[M] is already in a guild."//If they are in a guild we dont invite them and it tells the player that person is already in a guild

			Coven_Disband()
				set category = "Coven"
				switch(alert("Are you sure you want to delete [html_decode(usr.guild)]?","","Yes","No"))
					if("Yes")
						for(var/mob/M in Guildmembers)//If he wants to it makes all the players in the guild leave
							M.guild = null//Makes their guild = nothing
						src.verbs -= new/mob/Guild/verb/Coven_Invite//Deletes the owner of the guilds verbs
						src.verbs -= new/mob/Guild/verb/Coven_Disband//Deletes the owner of the guilds verbs
						src.verbs -= new/mob/Guild/verb/Coven_Chat//Deletes the owner of the guilds verbs
						src.verbs -= new/mob/Guild/verb/Covenmember_level
						src.verbs -= new/mob/Guild/verb/Coven_recruiter
						src.verbs -= new/mob/Guild/verb/Coven_Members//Deletes the owner of the guilds verbs
						src.verbs += new/mob/verb/Make_Guild//Gives him the make guild verb so he cant create another one later
						src.guild = null//Makes the owners guild = nothing
						src.Guildmembers = null//Make the guildmembers list = nothing so no more info is stored in it
			Coven_recruiter(mob/M as mob in view())
				set category = "Coven"
				switch(alert("Are you sure you want make [M] a Coven_recruiter","","Yes","No"))//Makes sure the player really wants to disband his guild
					if("Yes")
						M.verbs += /mob/Guild/verb/Coven_Invite
						M.verbs += /mob/Guild/verb/Covenmember_level
			Covenmember_level(mob/M as mob in view(),var/level as text)//The var/Guildmaking as text means whatever the player enters is what the variable Guildmaking is
				set category = "Coven"
				if(M.guild == src.guild)
					if(Guildlevel.Find(ckey(level)))//Next we check if the guild name is taken
						alert("There is already a Coven/Faction named this. Pick another name.")//If it is we tell them that is is and to pick another name
					else
						Guildlevel += ckey(level)//If its not we add the new guild's name to the list of created guilds
						M.guildlevel = "[level]"//Now we make the players guild variable equal the new quilds name (This will be used when inviting a player to the guild)




