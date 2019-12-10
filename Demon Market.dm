mob/DemonMarket
	Trader1
		name = "Power Broker"
		icon = 'Goodwitchs.dmi'
		icon_state = "Demonic"
		race = "Demon"
		maxhealth = 180000000000000
		health = 18000000000000000
		gender1 = "Male"
		density = 1
		age = "?"
		Demon = 1
		NPC = 1
		RolePlaying = 1
		verb
			Trade()
				set src in oview(1)
				switch(alert(usr,"Are you intrested in a Energybolt? Only 5.000$.","Power trading","Yes","No"))
					if("Yes")
						if(usr.Money>=5000)
							if(usr.Whitelighter==1)
								usr<<"Power Broker: Im not selling you anything!"
								return
							usr.verbs+= new /mob/demon/verb/Energybolt
							usr.Money-=5000
							usr<<"You have bought the power of Energybolt"
							return
						if(usr.Money<=4999)
							usr<<"Power Broker: Who you trying to fool idiot, you dont have that mutch money!"
					if("No")
						..()
	Trader2
		name = "Power Broker"
		icon = 'Goodwitchs.dmi'
		icon_state = "witch1"
		density = 1
		maxhealth = 180000000000000
		health = 1800000000000000
		race = "Demon"
		gender1 = "Female"
		Demon = 1
		age = "?"
		NPC = 1
		RolePlaying = 1
		verb
			Trade()
				set src in oview(1)
				switch(alert(usr,"Are you intrested in Shapeshift? Only 18.000$.","Power trading","Yes","No"))
					if("Yes")
						if(usr.Money>=18000)
							if(usr.Whitelighter==1)
								usr<<"Power Broker: Im not selling you anything!"
								return
							usr.verbs+= new /mob/demon/verb/Shapeshift
							usr.Money-=18000
							usr<<"You have bought the power of Shapeshifting"
							return
						if(usr.Money<=17999)
							usr<<"Power Broker: Who you trying to fool idiot, you dont have that mutch money!"
					if("No")
						..()
	Trader3
		name = "Power Broker"
		icon = 'Goodwitchs.dmi'
		icon_state = "godwitch"
		density = 1
		maxhealth = 180000000000000
		health = 1800000000000000
		race = "Demon"
		gender1 = "Female"
		Demon = 1
		age = "?"
		NPC = 1
		RolePlaying = 1
		dir = EAST
		verb
			Trade()
				set src in oview(1)
				switch(alert(usr,"Are you intrested in Telepath? Only 7.000$.","Power trading","Yes","No"))
					if("Yes")
						if(usr.Money>=7000)
							if(usr.Whitelighter==1)
								usr<<"Power Broker: Im not selling you anything!"
								return
							usr.verbs+= new /mob/witch/Telepath/verb/Mind_Talk
							usr.Money-=7000
							usr<<"You have bought the power of Telepath"
							return
						if(usr.Money<=6999)
							usr<<"Power Broker: Who you trying to fool idiot, you dont have that mutch money!"
					if("No")
						..()

turf/teleport/
	Hell7ToDemonMarket//the name of our turf
		Entered(mob/M)
			if(istype(M,/mob))//is it a mob that entered?
				M.loc=locate(/turf/teleport/DemonMarketToHell7)
	DemonMarketToHell7//the name of our turf
		Entered(mob/M)
			if(istype(M,/mob))//is it a mob that entered?
				M.loc=locate(/turf/teleport/Hell7ToDemonMarket)
