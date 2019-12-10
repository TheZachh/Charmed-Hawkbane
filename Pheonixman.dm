
obj/forcefield
	icon = 'magicitems.dmi'
	icon_state = "obj8"
mob/var
	tmp/spellwords=""
	said_forcefield=0
	said_power=0
	use_spells=1
client/command_text="say \""//needed! players will get confused if not!
mob/verb
	Emote(msg as text)
		set category = "Commands"
		msg=copytext(msg,1,500)
		if(usr.talk == 1)
			view(9) << "*<i>[usr] [msg]*"
		else
			usr<<"You have been muted!"
	Whisper(msg as text)
		if(usr.talk==0||usr.talk==2||usr.talk==3)
			usr<<"You have been muted"
			return
		view(1)<<"<b>[src.rankname] [src] whispers</b>: [html_encode(msg)]"
	say(msg as text)
		set hidden=1
		if(usr.Froze==0)
			if(usr.Freeze==1)
				usr<<"You are frozen, how the hell do you plan on speaking?"
				return
		if(usr.Selforb==1)
			usr<<"Can't talk if your orbed"
			return
		if(usr.talk==0||usr.talk==2||usr.talk==3)
			usr<<"You have been muted"
			return
		if(msg=="fuck"||msg=="bitch"||msg=="slut"||msg=="idiot"||msg=="moron"||msg=="asshole"||msg=="cunt")
			usr.talk = 3
			world << "<FONT COLOR=red>Server information</FONT>: [usr] has been muted for swearing {time: 60 seconds}"
			spellwords=null
			sleep(600)
			usr.talk = 1
			world << "<FONT COLOR=red>Server information</FONT>: [usr] has been unmuted"
			return
		if(msg=="can i be a gm"||msg=="gm, can i be"||msg=="i want gm"||msg=="make me gm")
			usr.talk = 3
			world << "<FONT COLOR=red>Server information</FONT>: [usr] has been muted for asking for gm {time: 30 seconds}"
			spellwords=null
			sleep(300)
			usr.talk = 1
			world << "<FONT COLOR=red>Server information</FONT>: [usr] has been unmuted"
			return
		view()<<"<b>[src.rankname] [src] says</b>: [msg]"
		if(!use_spells)return
		spellwords+=msg
		Check_White(msg)
		AlignmentChecker()
		parsespell(msg)
		if(spellwords)parsespell(spellwords)
		for(var/mob/NPC in view(9))
			if(NPC.NPC>=1)
				sleep(5)
				usr.random = rand(1,5)
				if(msg=="Hiya"||msg=="Hi"||msg=="Hey"||msg=="Greetings"||msg=="hiya"||msg=="hi"||msg=="hey"||msg=="greetings"||msg=="Goodday"||msg=="goodday")
					if(usr.random==1)
						view(9)<<"[NPC] says: Hey there"
						sleep(3)
					if(usr.random==2)
						view(9)<<"[NPC] says: Hi"
						sleep(3)
					if(usr.random==3)
						view(9)<<"[NPC] says: Greetings"
						sleep(3)
					if(usr.random==4)
						view(9)<<"[NPC] says: Hiya"
						sleep(3)
					if(usr.random==5)
						view(9)<<"[NPC] says: Hiya, [usr]"
						sleep(3)
				if(msg=="How are you"||msg=="Whats up"||msg=="sup"||msg=="how are you"||msg=="whats up")
					if(usr.random==1)
						view(9)<<"[NPC] says: I'm fine, how are you?"
						sleep(3)
					if(usr.random==2)
						view(9)<<"[NPC] says: I'm okay, how about you?"
						sleep(3)
					if(usr.random==3)
						view(9)<<"[NPC] says: No problems over here."
						sleep(3)
					if(usr.random==4)
						view(9)<<"[NPC] says: I'm okay, you?"
						sleep(3)
					if(usr.random==5)
						view(9)<<"[NPC] says: I'm chill'ing"
						sleep(3)
				if(msg=="Im okay"||msg=="Im fine"||msg=="im okay"||msg=="im fine"||msg=="good"||msg=="Good")
					if(usr.random==1)
						view(9)<<"[NPC] says: Thats good to hear."
						sleep(3)
					if(usr.random==2)
						view(9)<<"[NPC] says: Nice, keep it that way"
						sleep(3)
					if(usr.random==3)
						view(9)<<"[NPC] says: Okay"
						sleep(3)
					if(usr.random==4)
						view(9)<<"[NPC] says: Good to hear"
						sleep(3)
					if(usr.random==5)
						view(9)<<"[NPC] says: Yeah, well, me to..."
						sleep(3)
				if(msg=="have you seen anything strange lately"||msg=="anything strange happened"||msg=="seen anything wierd"||msg=="Have you seen anything strange lately"||msg=="Any strange happened"||msg=="Seen anything wierd")
					if(usr.random==1)
						view(9)<<"[NPC] says: Not really, but there is something with the cemetery."
						sleep(3)
					if(usr.random==2)
						view(9)<<"[NPC] says: Why do you ask?"
						sleep(3)
					if(usr.random==3)
						view(9)<<"[NPC] says: Not over here."
						sleep(3)
					if(usr.random==4)
						view(9)<<"[NPC] says: Not that i know off"
						sleep(3)
					if(usr.random==5)
						view(9)<<"[NPC] says: No, why do you ask?"
						sleep(3)
				if(msg=="LolZ"||msg=="lol"||msg=="LMAO"||msg=="ROFLMAO"||msg=="ROFLMFAO"||msg=="lmao"||msg=="roflmao"||msg=="roflmfao"||msg=="rofl"||msg=="ROFL"||msg=="Lol"||msg=="LOL"||msg=="LMFAO"||msg=="lmfao")
					if(usr.random==1)
						view(9)<<"[NPC] laughs"
						sleep(3)
					if(usr.random==2)
						view(9)<<"[NPC] says: Did i miss something?"
						sleep(3)
					if(usr.random==3)
						view(9)<<"[NPC] looks at [usr], wondering whats to laugh about"
						sleep(3)
					if(usr.random==4)
						view(9)<<"[NPC] says: Hehehehe"
						sleep(3)
					if(usr.random==5)
						view(9)<<"[NPC] smiles"
						sleep(3)
				if(msg=="cya"||msg=="bye"||msg=="goodbye"||msg=="Cya"||msg=="Bye"||msg=="Goodbye"||msg=="g2g"||msg=="G2G")
					if(usr.random==1)
						view(9)<<"[NPC] says: Cya, [usr]!"
						sleep(3)
					if(usr.random==2)
						view(9)<<"[NPC] says: Bye"
						sleep(3)
					if(usr.random==3)
						view(9)<<"[NPC] says: Goodbye"
						sleep(3)
					if(usr.random==4)
						view(9)<<"[NPC] waves [usr] goodbye"
						sleep(3)
					if(usr.random==5)
						view(9)<<"[NPC] says: Take care"
						sleep(3)
				if(msg=="omg"||msg=="OMG"||msg=="omfg"||msg=="OMFG"||msg=="zomg"||msg=="ZOMG")
					if(usr.random==1)
						view(9)<<"[NPC] says: Something wrong?"
						sleep(3)
					if(usr.random==2)
						view(9)<<"[NPC] says: ??"
						sleep(3)
					if(usr.random==3)
						view(9)<<"[NPC] says: Whats wrong?"
						sleep(3)
					if(usr.random==4)
						view(9)<<"[NPC] says: I was just about to say that.."
						sleep(3)
					if(usr.random==5)
						view(9)<<"[NPC] says: Yeah, really..wow"
						sleep(3)
				if(msg=="demon"||msg=="Demon"||msg=="DEMON"||msg=="Witch"||msg=="witch"||msg=="WITCH")
					if(usr.random==1)
						view(9)<<"[NPC] says: A what?"
						sleep(3)
					if(usr.random==2)
						view(9)<<"[NPC] stares at [usr]"
						sleep(3)
					if(usr.random==3)
						view(9)<<"[NPC] says: Uhm, you have been watchig to mutch movies.."
						sleep(3)
					if(usr.random==4)
						view(9)<<"[NPC] says: What about it?"
						sleep(3)
					if(usr.random==5)
						view(9)<<"[NPC] says: ... ?"
						sleep(3)
				if(msg=="=P"||msg=="=p"||msg==":p"||msg==":P")
					if(usr.random==1)
						view(9)<<"[NPC] says: What?"
						sleep(3)
					if(usr.random==2)
						view(9)<<"[NPC] says: Why you doing that?"
						sleep(3)
					if(usr.random==3)
						view(9)<<"[NPC] says: =P"
						sleep(3)
					if(usr.random==4)
						view(9)<<"[NPC] says: XD"
						sleep(3)
					if(usr.random==5)
						view(9)<<"[NPC] says: Don't stick your tongue out against me"
						sleep(3)
				if(msg=="XD"||msg=="xD")
					if(usr.random==1)
						view(9)<<"[NPC] says: LolZ"
						sleep(3)
					if(usr.random==2)
						view(9)<<"[NPC] says: Hehe, having fun hé"
						sleep(3)
					if(usr.random==3)
						view(9)<<"[NPC] says: Awh, i must have mist why you are laughing.."
						sleep(3)
					if(usr.random==4)
						view(9)<<"[NPC] says: XD"
						sleep(3)
					if(usr.random==5)
						view(9)<<"[NPC] says: Uhm, okay"
						sleep(3)
				if(msg=="so"||msg=="So"||msg=="so..."||msg=="So..."||msg=="so.."||msg=="So.."||msg=="...oS")
					if(usr.random==1)
						view(9)<<"[NPC] says: I dont know"
						sleep(3)
					if(usr.random==2)
						view(9)<<"[NPC] says: Uhm, dunno"
						sleep(3)
					if(usr.random==3)
						view(9)<<"[NPC] says: *sigh*"
						sleep(3)
					if(usr.random==4)
						view(9)<<"[NPC] starts looking around.."
						sleep(3)
					if(usr.random==5)
						view(9)<<"[NPC] says: Bored huh.."
						sleep(3)
				if(msg=="Meow")
					if(usr.random==1)
						view(9) << "[NPC] says: Kittie!!!"
						sleep(3)
					if(usr.random==2)
						view(9)<<"[NPC] says: Lol"
						sleep(3)
					if(usr.random==3)
						view(9)<<"[NPC] says: [usr] is at it again!"
						sleep(3)
					if(usr.random==4)
						view(9)<<"[NPC] looks at [usr] in a strange way"
						sleep(3)
					if(usr.random==5)
						view(9)<<"[NPC] says: ..."
						sleep(3)
				if(msg=="Rawr!")
					if(usr.random==1)
						view(9) << "[NPC] says: DOGGIE!!!"
						sleep(3)
					if(usr.random==2)
						view(9)<<"[NPC] says: Lol"
						sleep(3)
					if(usr.random==3)
						view(9)<<"[NPC] says: [usr] is at it again!"
						sleep(3)
					if(usr.random==4)
						view(9)<<"[NPC] looks at [usr] in a strange way"
						sleep(3)
					if(usr.random==5)
						view(9)<<"[NPC] says: ..."
						sleep(3)

	WSay(msg as text) //placeholders. keep em.
		set hidden=1
		return World_Say(msg)
	OOC(msg as text) //placeholders. keep em.
		set hidden=1
		return World_Say(msg)
	Side_Say(msg as text)
		if(usr.talk==0||usr.talk==2||usr.talk==3)
			usr<<"You have been muted"
			return
		for(var/mob/M in world)
			if(usr.evil==1)
				if(M.evil==1)
					M<<"<b><font color=red>{Evil}</font color></b> [usr]: [msg]"
			if(usr.good==1)
				if(M.good==1)
					M<<"<b><font color=blue>{Good}</font color></b> [usr]: [msg]"
	World_Say(msg as text)
		var/text="<b>(WorldSay)</b> "
		if(usr.talk==0||usr.talk==2||usr.talk==3)
			usr<<"You have been muted"
			return
		if(usr.death==1)
			usr<<"You are death"
			return
		if(usr.erased==1)
			usr<<"You can not communicate with the world anymore, you have been erased"
			return
		if(src.guild)text+="<b>~[src.guild]~</b> "
		text+="<b>[src.rankname] [src]</b>: [html_encode(msg)]"
		world<<text
		AlignmentChecker()

mob/proc
	parsespell(msg)
		for(var/mob/M in world)
			if(findtext(msg,"Magic forces black and white to reach out though space and light, be he far or be he near, bring us the demon [M.name] here"))
				if(usr.Witch==1||usr.Warlock==1||usr.HalfWhitelighter==1)
					if(M.RolePlaying==0)
						spellwords=null
						return
					if(M.Demon==1)
						if(usr.Intelligence <= M.Intelligence)
							usr<<"Your spell isnt strong enough"
							spellwords=null
							return
						if(usr.death==1)
							usr<<"You are death"
							spellwords=null
							return
						if(M.death==1)
							usr<<"[M] is death"
							spellwords=null
							return
						if(M.erased==1)
							usr<<"Who the hell you trying to summon?"
							spellwords=null
							return
						M.loc=locate(x,y-1,z)
						M<<"<i>You were summoned out of hell by a spell..."
				else
					usr<<"You cannot use spells"
				spellwords=null
			if(findtext(msg,"In this tween time, this darkest hour I call upon the sacred power. I myself stand alone command [M.name] to be shown."))
				if(usr.Witch==1||usr.Warlock==1||usr.HalfWhitelighter==1)
					if(M.RolePlaying==0)
						spellwords=null
						return
					if(usr.Intelligence <= M.Intelligence)
						usr<<"Your spell isnt strong enough"
						spellwords=null
						return
					if(M.Selforb == 1)
						M.density = 1
						M.Selforb = 0
						M.icon = new /mob/goodwitch()
						view(9)<<"[M] becomes visable"
						spellwords=null
				else
					usr<<"You cannot use spells"
				spellwords=null
			if(findtext(msg,"Ixo Mende Layto Sempar [M.name]"))
				if(usr.Witch==1||usr.Warlock==1||usr.HalfWhitelighter==1)
					if(M.RolePlaying==0)
						spellwords=null
						return
					if(usr.Intelligence <= M.Intelligence)
						usr<<"Your spell isnt strong enough"
						spellwords=null
						return
					if(M.Darklighter==1)
						if(usr.death==1)
							usr<<"You are death"
							spellwords=null
							return
						if(M.death==1)
							usr<<"[M] is death"
							spellwords=null
							return
						if(M.erased==1)
							usr<<"Who the hell you trying to summon?"
							spellwords=null
							return
						M.loc=locate(x,y-1,z)
						M<<"<i>You were summoned by a spell..."
						spellwords=null
				else
					usr<<"You cannot use spells"
				spellwords=null
			if(findtext(msg,"With my power that it be I summon the one that brings destiny to my feet now he fall come to me Angel of Destiny now thee I call"))
				if(usr.Witch==1||usr.Warlock==1||usr.HalfWhitelighter==1)
					if(M.RolePlaying==0)
						spellwords=null
						return
					if(usr.Intelligence <= M.Intelligence)
						usr<<"Your spell isnt strong enough"
						spellwords=null
						return
					if(M.rank=="Angel of Destiny")
						if(usr.death==1)
							usr<<"You are death"
							spellwords=null
							return
						if(M.death==1)
							usr<<"[M] is death"
							spellwords=null
							return
						if(M.erased==1)
							usr<<"Who the hell you trying to summon?"
							spellwords=null
							return
						M.loc=locate(x,y-1,z)
						M<<"<i>You were summoned by a spell..."
						spellwords=null
				else
					usr<<"You cannot use spells"
				spellwords=null
			if(findtext(msg,"Spirits of air, forest and sea, set us of this demon free, beasts of hoof and beasts of shell, drive this [M.name] back to hell"))
				if(usr.Witch==1||usr.Warlock==1||usr.HalfWhitelighter==1)
					if(M.RolePlaying==0)
						spellwords=null
						return
					if(usr.Intelligence <= M.Intelligence)
						usr<<"Your spell isnt strong enough"
						spellwords=null
						return
					if(M.Demon==1)
						M.loc=locate(/turf/Area/Hell)
						M<<"You were sent to hell by an evil spell..."
						spellwords=null
					if(M.Demon==1&&M.power>=usr.power)
						usr<<"[M] seems to be to strong to return with a spell"
						spellwords=null
				else
					usr<<"You cannot use spells"
				spellwords=null

			if(findtext(msg,"Hellspawn demon, Creature of death, Fire shall take [M.name] very last breath"))
				if(usr.Witch==1||usr.Warlock==1||usr.HalfWhitelighter==1)
					if(M.RolePlaying==0)
						spellwords=null
						return
					if(usr.Intelligence <= M.Intelligence)
						usr<<"Your spell isnt strong enough"
						spellwords=null
						return
					if(M.Demon==1)
						if(M in view(20))
							M.health = 0
							usr.deathcheck(M)
							spellwords=null
						else
							usr<<"[M] isnt near you"
							spellwords=null
				else
					usr<<"You cannot use spells"
				spellwords=null


		if(findtext(msg,"Knowledge and reverence"))
			if(usr.RolePlaying==0)
				return
			src.said_forcefield=1
			var/said=0
			for(var/mob/M in view(3))
				if(M.said_forcefield==1)said+=1
			if(said>=2)
				for(var/mob/M in view(10))
					if(M.said_forcefield==1)
						var/westn=0
						var/eastn=0
						var/northn=0
						var/southn=0
						for(var/mob/Q in get_step(M,WEST))if(Q.said_forcefield==1)westn=1
						for(var/mob/Q in get_step(M,EAST))if(Q.said_forcefield==1)eastn=1
						for(var/mob/Q in get_step(M,NORTH))if(Q.said_forcefield==1)northn=1
						for(var/mob/Q in get_step(M,SOUTH))if(Q.said_forcefield==1)southn=1
						if(!westn)
							var/obj/forcefield/W=new(M.loc)
							step(W,WEST)
							W.owner=key
							W.density=1
							var/obj/forcefield/NW=new(M.loc)
							step(NW,NORTHWEST)
							NW.owner=key
							NW.density=1
							var/obj/forcefield/SW=new(M.loc)
							step(SW,SOUTHWEST)
							SW.owner=key
							SW.density=1
						if(!eastn)
							var/obj/forcefield/E=new(M.loc)
							step(E,EAST)
							E.owner=key
							E.density=1
							var/obj/forcefield/NE=new(M.loc)
							step(NE,NORTHWEST)
							NE.owner=key
							NE.density=1
							var/obj/forcefield/SE=new(M.loc)
							step(SE,SOUTHWEST)
							SE.owner=key
							SE.density=1
						if(!northn)
							var/obj/forcefield/N=new(M.loc)
							step(N,NORTH)
							N.owner=key
							N.density=1
							var/obj/forcefield/NWW=new(M.loc)
							step(NWW,NORTHWEST)
							NWW.owner=key
							NWW.density=1
							var/obj/forcefield/NEE=new(M.loc)
							step(NEE,NORTHEAST)
							NEE.owner=key
							NEE.density=1
						if(!southn)
							var/obj/forcefield/S=new(M.loc)
							step(S,SOUTH)
							S.owner=key
							S.density=1
							var/obj/forcefield/SWW=new(M.loc)
							step(SWW,SOUTHWEST)
							SWW.owner=key
							SWW.density=1
							var/obj/forcefield/SEE=new(M.loc)
							step(SEE,SOUTHEAST)
							SEE.owner=key
							SEE.density=1
				spawn(rand(100,300))
					for(var/obj/forcefield/O in view(3))if(O.owner==key)del(O)
			spawn(100)said_forcefield=0
			spellwords=null
		if(findtext(msg,"Let the piercing cry that feeds on pain, and leaves more sorrow then it gains. Shall now be heard by one who seeks, to stop the havoc that it wreaks"))
			for(var/mob/Q in view(100))
				if(usr.Witch==1||usr.Warlock==1||usr.HalfWhitelighter==1)
					if(Q.RolePlaying==0)
						spellwords=null
						return
					if(usr.Intelligence <= Q.Intelligence)
						usr<<"Your spell isnt strong enough"
						spellwords=null
						return
					if(Q.Demon==1)
						if(Q in view(10))src<<"<i>You sense [Q.name]. [Q.name] seems to be very close to you."
						else if(Q in view(20))src<<"<i>You sense [Q.name]. [Q.name] seems to be close to you."
						else if(Q in view(30))src<<"<i>You sense [Q.name]. [Q.name] seems to be far from you."
						else src<<"<i>You sense an evil presence, but it is too far for you to sense who it is..."
						spellwords=null
				else
					usr<<"You cannot use spells"
			spellwords=null
		if(findtext(msg,"As the flame lights shadows, and truth ends fear, open lost thoughts, to my willing ear"))
			for(var/mob/M in view(100))if(M.client)
				var/txt="<i>"
				if(usr.Witch==1||usr.Warlock==1||usr.HalfWhitelighter==1)
					if(M.RolePlaying==0)
						spellwords=null
						return
					if(M in view(15))
						txt+="You sense [M.name]. \He feels close to your location. "
						txt+="You sense the blood of a [lowertext(M.race)] burning inside of \him."
						if(M.good)txt+="You sense that [M.name] is good in nature. "
						else txt+="You sense that [M.name] is evil in nature. "
						if(M.maxhealth>=M.maxhealth)
							txt+="You also sense that [M.name] is in a good condition. "
						else if(M.health<M.maxhealth&&M.health>=M.maxhealth/3)txt+="You also sense that [M.name] is in a average condition. "
						else if(M.health<M.maxhealth/3&&M.health>=M.maxhealth/2)txt+="You also sense that [M.name] is in a weakened condition. "
						else if(M.health<M.maxhealth/2&&M.health>=10)txt+="You also sense that [M.name] is in a sub-critical condition. "
						else txt+="You also sense that [M.name] is in a critical condition. "
						if(M.power>=src.power)txt+="You sense that [M.name] is stronger than you."
						else if(M.power==src.power)txt+="You sense that [M.name] is equal than you."
						else txt+="You sense that [M.name] is weaker than you."
						spellwords=null
					else if(M in view(30))
						txt+="You sense [M.name]. \He feels further away from your location. "
						txt+="You sense the blood of a [lowertext(M.race)] burning inside of \him."
						if(M.good)txt+="You sense that [M.name] is good in nature. "
						else txt+="You sense that [M.name] is evil in nature. "
						if(rand(1,2))
							if(M.maxhealth>=M.maxhealth)
								txt+="You also sense that [M.name] is in a good condition. "
							else if(M.health<M.maxhealth&&M.health>=M.maxhealth/3)txt+="You also sense that [M.name] is in a average condition. "
							else if(M.health<M.maxhealth/3&&M.health>=M.maxhealth/2)txt+="You also sense that [M.name] is in a weakened condition. "
							else if(M.health<M.maxhealth/2&&M.health>=10)txt+="You also sense that [M.name] is in a sub-critical condition. "
							else txt+="You also sense that [M.name] is in a critical condition. "
						else if(rand(1,2))
							if(M.power>=src.power)txt+="You sense that [M.name] is stronger than you."
							else if(M.power==src.power)txt+="You sense that [M.name] is equal than you."
							else txt+="You sense that [M.name] is weaker than you."
							spellwords=null
					else if(M in view(50))
						txt+="You sense [M.name]. \He feels far away from your location. "
						if(M.good)txt+="You sense that [M.name] is good in nature. "
						else txt+="You sense that [M.name] is evil in nature. "
						if(M.power>=src.power)txt+="You sense that [M.name] is stronger than you."
						else if(M.power==src.power)if(rand(1,2))txt+="You sense that [M.name] is equal than you."
						spellwords=null
					else
						txt+="You sense someone. He or she feels extremely far away from your location. "
						if(M.good)txt+="You sense that [M.name] is good in nature. "
						else txt+="You sense that [M.name] is evil in nature. "
						if(M.power>=src.power)txt+="You sense that [M.name] is stronger than you."
						spellwords=null
					src<<txt
				else
					usr<<"You cannot use spells"
			spellwords=null

		if(findtext(msg,"Yam is ado, Heek is ado, Malo cot bonus, Moss in con sesis, Super deeco nos"))
			for(var/mob/M in range(9))
				if(usr.Witch==1||usr.Warlock==1||usr.HalfWhitelighter==1)
					if(M.RolePlaying==0)
						usr<<"[M] isnt in the Role Play"
						spellwords=null
						return
					if(usr.Intelligence <= M.Intelligence)
						usr<<"Your spell isnt strong enough"
						spellwords=null
						return
					if(M.containhollow == 1)
						M.containhollow = 0
						M.race = M.choosenrace
						spellwords=null
						view(9) << "The hollow has been sent back to the box by a spell"
				else
					usr<<"You cannot use spells"
					spellwords=null

mob/proc/Check_White(msg as text)
	if(msg == "[usr:whitelightername]!")
		for(var/mob/m in world)
			if(m.name == usr:whitelightername)
				m << "<font color=white><i>You hear [usr]'s voice echo in your head.</i>"
				var/ans = alert(m,"Orb to Charge?","Charge system","Yes","No")
				if(ans=="Yes")
					m.overlays += /obj/effects/worb
					sleep(8)
					m.overlays -= /obj/effects/worb
					m:x = usr:x
					m:y = usr:y+1
					m:z = usr:z
					m.overlays += /obj/effects/worb
					sleep(10)
					m.overlays -= /obj/effects/worb
