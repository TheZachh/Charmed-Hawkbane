mob/demon
	verb
		Flame_orb_longdist(var/mob/M in world)		//attack a mob within 1 tile of you
			set category = "Skills"
			if(usr.Freeze==1)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: Your frozen, you can't use magic"
				return
			if(usr.Energy<=0)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: Your out of energy!"
				return
			if(usr.RolePlaying == 0)
				usr<<"Your not roleplaying"
				return
			if(usr.death==1)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: You are death"
				return
			if(M.death==1)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: [M] is death"
				return
			if(M.erased==1)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: [M] has been erased from time and space"
				return
			if(usr.good==1 && M.indemonschool==1)
				return
			if(usr.evil==1 && M.inmagicschool==1)
				return
			if(usr.evil==1 && M.indemonschool==1)
				usr.indemonschool=1
			if(usr.good==1 && M.inmagicschool==1)
				usr.inmagicschool=1
			if(usr.neutral==1)
				if(M.indemonschool==1||M.inmagicschool==1)
					return
			if(M.block_tele==1)
				switch(alert(M,"[src] is trying to teleport to you! Allow [src] to come to you?","","Yes","No"))
					if("Yes")
						..()
					if("No")
						src<<"You cant sense [M]"
						return
			if(M.RolePlaying==0)
				usr<<"[M] isnt in the Roleplay"
				return
			if(usr.erased==1)
				return
			if(M.inheaven==1)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: You cannot go to this personne"
				return
			if(M.inhell==1)
				usr.inhell = 1
			if(M.inhell==0)
				usr.inhell = 0
			usr.power += 1
			view(9)<< "[usr] orbs away"
			usr.Energy -= 10
			usr.Exposing_Magic()
			usr.overlays = new /obj/orb/demonorb1
			spawn(1)
				usr.overlays = null
				usr.overlays += new /obj/orb/demonorb2
				spawn(1)
					usr.overlays = null
					usr.overlays += new /obj/orb/demonorb3
					spawn(1)
						usr.overlays = null
						usr.overlays += new /obj/orb/demonorb4
						spawn(1)
							usr.overlays = null
							usr.icon = null
							usr.overlays += new /obj/orb/demonorb5
							spawn(1)
								usr.overlays = null
								usr.overlays += new /obj/orb/demonorb6
								spawn(1)
									usr.overlays = null
									spawn(1)
										usr.overlays = null
										src.x = M:x
										src.y = M:y+1
										src.z = M:z
										src.dir = SOUTH
										M << "[src.name] orbed behind you!!!"
										usr.overlays += new /obj/orb/demonorb6
										spawn(1)
											usr.overlays = null
											usr.overlays += new /obj/orb/demonorb5
											spawn(1)
												usr.overlays = null
												usr.icon = new /mob/goodwitch()
												usr.overlays += new /obj/orb/demonorb4
												spawn(1)
													usr.overlays = null
													usr.overlays += new /obj/orb/demonorb3
													spawn(1)
														usr.overlays = null
														usr.overlays += new /obj/orb/demonorb2
														spawn(1)
															usr.overlays = null
															usr.overlays += new /obj/orb/demonorb1
															spawn(1)
																usr.overlays = null
																usr.Selforb = 0
																usr.density = 1

mob/demon
	verb
		Flame_orb_place()
			set category = "Skills"
			var/default_value = "Earth"
			var/list/places = list("Earth", "Hell Entrance", "Underworld", "Demon School", "Charmed manor", "Park", "Julian's House", "Kyros House", "DragoWings House", "Graveyard", "The Ultimate")
			choose_place = input(usr, default_value) in places
			switch(choose_place)
				if("Earth")
					usr.place = "Earth"
				if("Hell Entrance")
					usr.place = "Hell"
				if("Underworld")
					usr.place = "Hell2"
				if("Demon School")
					usr.place = "Demon School"
				if("Charmed manor")
					usr.place = "Charmed"
				if("Park")
					usr.place = "Park"
				if("Julian's House")
					usr.place = "SyncWolf"
				if("Kyros House")
					usr.place = "Zeniox"
				if("DragoWings House")
					usr.place = "Drago"
				if("Graveyard")
					usr.place = "Graveyard"
				if("The Ultimate")
					usr.place = "Ultimate"
			if(usr.Freeze==1)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: Your frozen, you can't use magic"
				return
			if(usr.Energy<=0)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: Your out of energy!"
				return
			if(usr.RolePlaying == 0)
				usr<<"Your not roleplaying"
				return
			if(usr.death==1)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: You are death"
				return
			if(usr.erased==1)
				return
			else
				usr.power += 1
				view(9)<< "[usr] orbs away"
				usr.Energy -= 10
				usr.Exposing_Magic()
				usr.overlays = new /obj/orb/demonorb1
				spawn(1)
					usr.overlays = null
					usr.overlays += new /obj/orb/demonorb2
					spawn(1)
						usr.overlays = null
						usr.overlays += new /obj/orb/demonorb3
						spawn(1)
							usr.overlays = null
							usr.overlays += new /obj/orb/demonorb4
							spawn(1)
								usr.overlays = null
								usr.icon = null
								usr.overlays += new /obj/orb/demonorb5
								spawn(1)
									usr.overlays = null
									usr.overlays += new /obj/orb/demonorb6
									spawn(1)
										usr.overlays = null
										if(usr.place=="Earth")
											usr.loc = locate(/turf/Area/Earth)
											usr.inhell = 0
										if(usr.place=="Hell")
											usr.loc = locate(/turf/Area/Hell)
											usr.inhell = 0
										if(usr.place=="Hell2")
											usr.loc = locate(/turf/Area/Hell2)
											usr.inhell = 0
										if(usr.place=="Demon school")
											usr.loc = locate(/turf/Area/DemonSchool)
										if(usr.place=="Charmed")
											usr.loc = locate(/turf/Area/Charmed)
											usr.inhell = 0
										if(usr.place=="Park")
											usr.loc = locate(/turf/Area/Park)
											usr.inhell = 0
										if(usr.place=="SyncWolf")
											usr.loc = locate(/turf/Area/SyncWolfsHouse)
											usr.inhell = 0
										if(usr.place=="Zeniox")
											usr.loc = locate(/turf/Area/ZenioxHouse)
											usr.inhell = 0
										if(usr.place=="Drago")
											usr.loc = locate(/turf/Area/DragowingHouse)
											usr.inhell = 0
										if(usr.place=="Graveyard")
											usr.loc = locate(/turf/Area/Graveyard)
											usr.inhell = 0
										if(usr.place=="Ultimate")
											usr.loc = locate(/turf/Area/Ultimate)
											usr.inhell = 0
										spawn(1)
											usr.overlays = null
											usr.overlays += new /obj/orb/demonorb6
											spawn(1)
												usr.overlays = null
												usr.overlays += new /obj/orb/demonorb5
												spawn(1)
													usr.overlays = null
													usr.icon = new /mob/goodwitch()
													usr.overlays += new /obj/orb/demonorb4
													spawn(1)
														usr.overlays = null
														usr.overlays += new /obj/orb/demonorb3
														spawn(1)
															usr.overlays = null
															usr.overlays += new /obj/orb/demonorb2
															spawn(1)
																usr.overlays = null
																usr.overlays += new /obj/orb/demonorb1
																spawn(1)
																	usr.overlays = null
																	usr.Selforb = 0
																	usr.density = 1

mob/demon
	verb
		Flame_orb_player_place(mob/M in view(9))
			set category = "Skills"
			var/default_value = "Earth"
			var/list/places = list("Earth", "Hell Entrance", "Underworld","Demon school", "Charmed manor", "Park", "Julian's House", "Kyros House", "DragoWings House", "Graveyard", "The Ultimate")
			choose_place = input(usr, default_value) in places
			switch(choose_place)
				if("Earth")
					M.place = "Earth"
				if("Hell Entrance")
					M.place = "Hell"
				if("Underworld")
					M.place = "Hell2"
				if("Demon school")
					M.place = "Demon school"
				if("Charmed manor")
					M.place = "Charmed"
				if("Park")
					M.place = "Park"
				if("Julian's House")
					M.place = "SyncWolf"
				if("Kyros House")
					M.place = "Zeniox"
				if("DragoWings House")
					M.place = "Drago"
				if("Graveyard")
					M.place = "Graveyard"
				if("The Ultimate")
					M.place = "Ultimate"
			if(usr.Freeze==1)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: Your frozen, you can't use magic"
				return
			if(usr.Energy<=0)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: Your out of energy!"
				return
			if(usr.RolePlaying == 0)
				usr<<"Your not roleplaying"
				return
			if(M.death==1)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: [M] is death"
				return
			if(M.erased==1)
				return
			else
				usr.power += 1
				view(9)<< "[M] gets orbed away"
				usr.Energy -= 10
				usr.Exposing_Magic()
				M.overlays = new /obj/orb/demonorb1
				spawn(1)
					M.overlays = null
					M.overlays += new /obj/orb/demonorb2
					spawn(1)
						M.overlays = null
						M.overlays += new /obj/orb/demonorb3
						spawn(1)
							M.overlays = null
							M.overlays += new /obj/orb/demonorb4
							spawn(1)
								M.overlays = null
								M.icon = null
								M.overlays += new /obj/orb/demonorb5
								spawn(1)
									M.overlays = null
									M.overlays += new /obj/orb/demonorb6
									spawn(1)
										M.overlays = null
										if(M.place=="Earth")
											M.loc = locate(/turf/Area/Earth)
											M.inhell = 0
										if(M.place=="Hell")
											M.loc = locate(/turf/Area/Hell)
											M.inhell = 0
										if(M.place=="Hell2")
											M.loc = locate(/turf/Area/Hell2)
											M.inhell = 0
										if(M.place == "Demon school")
											M.loc = locate(/turf/Area/DemonSchool)
										if(M.place=="Charmed")
											M.loc = locate(/turf/Area/Charmed)
											M.inhell = 0
										if(M.place=="Park")
											M.loc = locate(/turf/Area/Park)
											M.inhell = 0
										if(M.place=="SyncWolf")
											M.loc = locate(/turf/Area/SyncWolfsHouse)
											M.inhell = 0
										if(M.place=="Zeniox")
											M.loc = locate(/turf/Area/ZenioxHouse)
											M.inhell = 0
										if(M.place=="Drago")
											M.loc = locate(/turf/Area/DragowingHouse)
											M.inhell = 0
										if(M.place=="Graveyard")
											M.loc = locate(/turf/Area/Graveyard)
											M.inhell = 0
										if(M.place=="Ultimate")
											M.loc = locate(/turf/Area/Ultimate)
											M.inhell = 0
										spawn(1)
											M.overlays = null
											M.overlays += new /obj/orb/demonorb6
											spawn(1)
												M.overlays = null
												M.overlays += new /obj/orb/demonorb5
												spawn(1)
													M.overlays = null
													M.icon = new /mob/goodwitch()
													M.overlays += new /obj/orb/demonorb4
													spawn(1)
														M.overlays = null
														M.overlays += new /obj/orb/demonorb3
														spawn(1)
															M.overlays = null
															M.overlays += new /obj/orb/demonorb2
															spawn(1)
																M.overlays = null
																M.overlays += new /obj/orb/demonorb1
																spawn(1)
																	M.overlays = null
																	M.Selforb = 0
																	M.density = 1



mob/demon
	verb
		flame_with_people(var/mob/M in world)		//attack a mob within 1 tile of you
			set category = "Skills"
			set name = "Flame Orb Surrounding"
			if(usr.Freeze==1)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: Your frozen, you can't use magic"
				return
			if(usr.RolePlaying == 0)
				usr<<"Your not roleplaying"
				return
			if(usr.Energy<=0)
				usr<<"You don't have the energy to do this"
				return
			if(usr.death==1)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: You are death"
				return
			if(M.death==1)
				usr<<"[M] is death"
				return
			if(M.erased==1)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: [M] has been erased from time and space!"
				return
			if(usr.erased==1)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: You have been erased, there is no leaving here"
				return
			if(M.RolePlaying == 0)
				usr<<"[M] isnt roleplaying"
				return
			if(usr.good==1 && M.indemonschool==1)
				return
			if(usr.evil==1 && M.inmagicschool==1)
				return
			if(usr.neutral==1)
				if(M.indemonschool==1||M.inmagicschool==1)
					return
			if(usr.evil==1 && M.indemonschool==1)
				usr.indemonschool=1
			if(usr.good==1 && M.inmagicschool==1)
				usr.inmagicschool=1
			if(M.block_tele==1)
				switch(alert(M,"[src] is trying to teleport to you! Allow [src] to come to you?","","Yes","No"))
					if("Yes")
						..()
					if("No")
						src<<"You cant sense [M]"
						return
			if(M.inheaven==1)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: You cannot go to this personne"
				return
			if(M.inhell==1)
				usr.inhell = 1
			if(M.inhell==0)
				usr.inhell = 0
			if(usr.world == M)
				for(var/mob/P as mob in range(2,usr))
					if(P.shimerexept == 1)
						usr.power += 1
						usr.Exposing_Magic()
						usr.Energy -= 15
						usr.overlays = new /obj/orb/demonorb1
						P.overlays = new /obj/orb/demonorb1
						spawn(1)
							usr.overlays = null
							P.overlays = null
							usr.overlays += new /obj/orb/demonorb2
							P.overlays += new /obj/orb/demonorb2
							spawn(1)
								P.overlays = null
								P.overlays += new /obj/orb/demonorb3
								usr.overlays = null
								usr.overlays += new /obj/orb/demonorb3
								spawn(1)
									P.overlays = null
									P.overlays += new /obj/orb/demonorb4
									usr.overlays = null
									usr.overlays += new /obj/orb/demonorb4
									spawn(1)
										P.overlays = null
										P.icon = null
										P.overlays += new /obj/orb/demonorb5
										usr.overlays = null
										usr.icon = null
										usr.overlays += new /obj/orb/demonorb5
										spawn(1)
											P.overlays = null
											P.overlays += new /obj/orb/demonorb6
											usr.overlays = null
											usr.overlays += new /obj/orb/demonorb6
											spawn(1)
												usr.overlays = null
												src.x = M:x
												src.y = M:y+1
												src.z = M:z
												src.dir = SOUTH
												P.loc = locate(usr.x,usr.y,usr.z)
												if(M.inhell==1)
													P.inhell = 1
													..()
												M << "[usr.name] orbed behind you!!!"
												P.overlays = new /obj/orb/demonorb6
												usr.overlays = new /obj/orb/demonorb6
												spawn(1)
													P.overlays = null
													usr.overlays = null
													P.overlays += new /obj/orb/demonorb5
													usr.overlays += new /obj/orb/demonorb5
													spawn(1)
														P.overlays = null
														usr.overlays = null
														P.overlays += new /obj/orb/demonorb4
														usr.overlays += new /obj/orb/demonorb4
														spawn(1)
															P.overlays = null
															usr.overlays = null
															P.overlays += new /obj/orb/demonorb3
															usr.overlays += new /obj/orb/demonorb3
															spawn(1)
																P.overlays = null
																usr.overlays = null
																P.icon = null
																P.overlays += new /obj/orb/demonorb2
																usr.icon = null
																usr.overlays += new /obj/orb/demonorb2
																spawn(1)
																	P.overlays = null
																	usr.overlays = null
																	P.overlays += new /obj/orb/demonorb1
																	usr.overlays += new /obj/orb/demonorb1
																	spawn(1)
																		P.overlays = null
																		usr.overlays = null
																		usr.Selforb = 0
																		usr.density = 1



			else
				for(var/mob/P as mob in range(2,usr))
					if(P.shimerexept == 1)
						usr.power += 1
						usr.Exposing_Magic()
						usr.Energy -= 15
						usr.overlays = new /obj/orb/demonorb1
						P.overlays = new /obj/orb/demonorb1
						spawn(1)
							usr.overlays = null
							P.overlays = null
							usr.overlays += new /obj/orb/demonorb2
							P.overlays += new /obj/orb/demonorb2
							spawn(1)
								P.overlays = null
								P.overlays += new /obj/orb/demonorb3
								usr.overlays = null
								usr.overlays += new /obj/orb/demonorb3
								spawn(1)
									P.overlays = null
									P.overlays += new /obj/orb/demonorb4
									usr.overlays = null
									usr.overlays += new /obj/orb/demonorb4
									spawn(1)
										P.overlays = null
										P.icon = null
										P.overlays += new /obj/orb/demonorb5
										usr.overlays = null
										usr.icon = null
										usr.overlays += new /obj/orb/demonorb5
										spawn(1)
											P.overlays = null
											P.overlays += new /obj/orb/demonorb6
											usr.overlays = null
											usr.overlays += new /obj/orb/demonorb6
											spawn(1)
												usr.overlays = null
												src.x = M:x
												src.y = M:y+1
												src.z = M:z
												src.dir = SOUTH
												if(M.inhell==1)
													P.inhell = 1
													..()
												P.loc = locate(usr.x,usr.y,usr.z)
												M << "[P.name] orbed behind you!!!"
												P.overlays = new /obj/orb/demonorb6
												usr.overlays = new /obj/orb/demonorb6
												spawn(1)
													P.overlays = null
													usr.overlays = null
													P.overlays += new /obj/orb/demonorb5
													usr.overlays += new /obj/orb/demonorb5
													spawn(1)
														P.overlays = null
														usr.overlays = null
														P.overlays += new /obj/orb/demonorb4
														usr.overlays += new /obj/orb/demonorb4
														spawn(1)
															P.overlays = null
															usr.overlays = null
															P.overlays += new /obj/orb/demonorb3
															usr.overlays += new /obj/orb/demonorb3
															spawn(1)
																P.overlays = null
																usr.overlays = null
																P.icon = null
																P.overlays += new /obj/orb/demonorb2
																usr.icon = null
																usr.overlays += new /obj/orb/demonorb2
																spawn(1)
																	P.overlays = null
																	usr.overlays = null
																	P.overlays += new /obj/orb/demonorb1
																	usr.overlays += new /obj/orb/demonorb1
																	spawn(1)
																		P.overlays = null
																		usr.overlays = null
																		usr.Selforb = 0
																		usr.density = 1


mob/demon
	verb
		Flame_orb_other(mob/M in view(9))		//attack a mob within 1 tile of you
			set name = "Flame Orb Player"
			set category = "Skills"
			if(usr.Freeze==1)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: Your frozen, you can't use magic"
				return
			if(usr.Energy<=0)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: Your out of energy"
				return
			var/mob/X = input("Choose a target:","Target") as mob in world
			if(M.RolePlaying==0)
				usr<<"[M] isnt roleplaying"
				return
			if(X.RolePlaying==0)
				usr<<"[X] isnt roleplaying"
				return
			if(usr.Selforb == 1||M.Selforb==1)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: Not while orbing"
				return
			if(X.inheaven==1)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: You cannot send someone there"
				return
			if(M.inhell==1)
				M.inhell = 0
				..()
			if(M.good==1 && X.indemonschool==1)
				return
			if(M.evil==1 && X.inmagicschool==1)
				return
			if(M.neutral==1)
				if(X.indemonschool==1||X.inmagicschool==1)
					return
			if(X.block_tele==1)
				switch(alert(X,"[M] is being teleported to you! Allow [M] to come to you?","","Yes","No"))
					if("Yes")
						..()
					if("No")
						usr<<"<FONT COLOR=yellow>Client information</FONT>: You cant sense [X]"
						return
			if(X.inhell==1)
				M.inhell = 1
				..()
			usr.power += 1
			view(9)<< "[M] gets flame orbed away"
			usr.Energy -= 10
			usr.Exposing_Magic()
			M.overlays = new /obj/orb/demonorb1
			spawn(1)
				M.overlays = null
				M.overlays += new /obj/orb/demonorb2
				spawn(1)
					M.overlays = null
					M.overlays += new /obj/orb/demonorb3
					spawn(1)
						M.overlays = null
						M.overlays += new /obj/orb/demonorb4
						spawn(1)
							M.overlays = null
							M.icon = null
							M.overlays += new /obj/orb/demonorb5
							spawn(1)
								M.overlays = null
								M.overlays += new /obj/orb/demonorb6
								spawn(1)
									usr.overlays = null
									spawn(1)
										M.overlays = null
										M.x = X:x
										M.y = X:y+1
										M.z = X:z
										M.dir = SOUTH
										X << "[M.name] flame orbed behind you!!!"
										M.overlays += new /obj/orb/demonorb6
										spawn(1)
											M.overlays = null
											M.overlays += new /obj/orb/demonorb5
											spawn(1)
												M.overlays = null
												M.icon = new /mob/goodwitch()
												M.overlays += new /obj/orb/demonorb4
												spawn(1)
													M.overlays = null
													M.overlays += new /obj/orb/demonorb3
													spawn(1)
														M.overlays = null
														M.overlays += new /obj/orb/demonorb2
														spawn(1)
															M.overlays = null
															M.overlays += new /obj/orb/demonorb1
															spawn(1)
																M.overlays = null
																M.Selforb = 0
																M.density = 1


mob/demon
	verb
		Flame_orb()		//attack a mob within 1 tile of you
			set category = "Skills"
			if(usr.Freeze==1)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: Your frozen, you can't use magic"
				return
			if(usr.Energy<=0)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: Your out of energy"
				return
			if(usr.Selforb == 0)
				usr.Selforb = 1
				usr.density = 0
				usr.power += 1
				usr.Exposing_Magic()
				usr.overlays = new /obj/orb/demonorb1
				view(9)<< "[usr] flames out"
				usr.Energy -= 5
				spawn(1)
					usr.overlays = null
					usr.overlays += new /obj/orb/demonorb2
					spawn(1)
						usr.overlays = null
						usr.overlays += new /obj/orb/demonorb3
						spawn(1)
							usr.overlays = null
							usr.overlays += new /obj/orb/demonorb4
							spawn(1)
								usr.overlays = null
								usr.icon = null
								usr.overlays += new /obj/orb/demonorb5
								spawn(1)
									usr.overlays = null
									usr.overlays += new /obj/orb/demonorb6
									spawn(1)
										usr.overlays = null

			else
				usr.Selforb = 0
				usr.density = 1
				usr.overlays += new /obj/orb/demonorb6
				view(9)<< "[usr] flames in"
				usr.Exposing_Magic()
				usr.Energy -= 5
				spawn(1)
					usr.overlays = null
					usr.overlays += new /obj/orb/demonorb5
					spawn(1)
						usr.overlays = null
						usr.icon = new /mob/goodwitch()
						usr.overlays += new /obj/orb/demonorb4
						spawn(1)
							usr.overlays = null
							usr.overlays += new /obj/orb/demonorb3
							spawn(1)
								usr.overlays = null
								usr.overlays += new /obj/orb/demonorb2
								spawn(1)
									usr.overlays = null
									usr.overlays += new /obj/orb/demonorb1
									spawn(1)
										usr.overlays = null






obj/orb
	demonorb1
		icon = 'Flame Orb.dmi'
		icon_state = "f1"
		layer = MOB_LAYER
obj/orb
	demonorb2
		icon = 'Flame Orb.dmi'
		icon_state = "f2"
		layer = MOB_LAYER
obj/orb
	demonorb3
		icon = 'Flame Orb.dmi'
		icon_state = "f3"
		layer = MOB_LAYER
obj/orb
	demonorb4
		icon = 'Flame Orb.dmi'
		icon_state = "f4"
		layer = MOB_LAYER
obj/orb
	demonorb5
		icon = 'Flame Orb.dmi'
		icon_state = "f4"
		layer = MOB_LAYER
obj/orb
	demonorb6
		icon = 'Flame Orb.dmi'
		icon_state = "f5"
		layer = MOB_LAYER
obj/orb
	demonorb7
		icon = 'Flame Orb.dmi'
		icon_state = "f6"
		layer = MOB_LAYER
obj/orb
	demonorb8
		icon = 'Flame Orb.dmi'
		icon_state = "f7"
		layer = MOB_LAYER
obj/orb
	demonorb9
		icon = 'Flame Orb.dmi'
		icon_state = "f8"
		layer = MOB_LAYER
obj/orb
	demonorb10
		icon = 'magicgood.dmi'
		icon_state = "demonorb10"
		layer = MOB_LAYER


///////////////////////////////////////////
//////////
//////////////////////////////////////////
mob/whitelighter
	verb
		Orb()		//attack a mob within 1 tile of you
			set category = "Skills"
			set name = "Whitelighter Orb"
			if(usr.Freeze==1)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: Your frozen, you can't use magic"
				return
			if(usr.Energy<=0)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: Your out of energy!"
				return
			if(usr.Selforb == 0)
				usr.Selforb = 1
				usr.density = 0
				usr.Exposing_Magic()
				usr.power += 1
				usr.overlays = new /obj/orb/orbing1
				view(9)<< "[usr] orbs away"
				usr.Energy -= 5
				spawn(1)
					view(6)<<sound("Whitelighter Orb.wav")
					usr.overlays = null
					usr.overlays += new /obj/orb/orbing2
					spawn(1)
						usr.overlays = null
						usr.overlays += new /obj/orb/orbing3
						spawn(1)
							usr.overlays = null
							usr.overlays += new /obj/orb/orbing4
							spawn(1)
								usr.overlays = null
								usr.icon = null
								usr.overlays += new /obj/orb/orbing5
								spawn(1)
									usr.overlays = null
									usr.overlays += new /obj/orb/orbing6
									spawn(1)
										usr.overlays = null
										usr.overlays += new /obj/orb/orbing7
										spawn(1)
											usr.overlays = null
											usr.overlays += new /obj/orb/orbing8
											spawn(1)
												usr.overlays = null
												usr.overlays += new /obj/orb/orbing9
												spawn(1)
													usr.overlays = null
													usr.overlays += new /obj/orb/orbing10
													spawn(1)
														usr.overlays = null

			else
				usr.Selforb = 0
				usr.density = 1
				usr.overlays = new /obj/orb/orbing10
				spawn(1)
					view(6)<<sound("Whitelighter Orb.wav")
					view(9)<< "[usr] orbs in"
					usr.Exposing_Magic()
					usr.Energy -= 5
					usr.overlays = null
					usr.overlays += new /obj/orb/orbing9
					spawn(1)
						usr.overlays = null
						usr.overlays += new /obj/orb/orbing8
						spawn(1)
							usr.overlays = null
							usr.overlays += new /obj/orb/orbing7
							spawn(1)
								usr.overlays = null
								usr.icon = null
								usr.overlays += new /obj/orb/orbing6
								spawn(1)
									usr.overlays = null
									usr.overlays += new /obj/orb/orbing5
									spawn(1)
										usr.overlays = null
										usr.icon = new /mob/goodwitch()
										usr.overlays += new /obj/orb/orbing4
										spawn(1)
											usr.overlays = null
											usr.overlays += new /obj/orb/orbing3
											spawn(1)
												usr.overlays = null
												usr.overlays += new /obj/orb/orbing2
												spawn(1)
													usr.overlays = null
													usr.overlays += new /obj/orb/orbing1
													spawn(1)
														usr.overlays = null






obj/orb
	orbing1
		icon = 'magicgood.dmi'
		icon_state = "1"
		layer = MOB_LAYER
obj/orb
	orbing2
		icon = 'magicgood.dmi'
		icon_state = "2"
		layer = MOB_LAYER
obj/orb
	orbing3
		icon = 'magicgood.dmi'
		icon_state = "3"
		layer = MOB_LAYER
obj/orb
	orbing4
		icon = 'magicgood.dmi'
		icon_state = "4"
		layer = MOB_LAYER
obj/orb
	orbing5
		icon = 'magicgood.dmi'
		icon_state = "5"
		layer = MOB_LAYER
obj/orb
	orbing6
		icon = 'magicgood.dmi'
		icon_state = "6"
		layer = MOB_LAYER
obj/orb
	orbing7
		icon = 'magicgood.dmi'
		icon_state = "7"
		layer = MOB_LAYER
obj/orb
	orbing8
		icon = 'magicgood.dmi'
		icon_state = "8"
		layer = MOB_LAYER
obj/orb
	orbing9
		icon = 'magicgood.dmi'
		icon_state = "9"
		layer = MOB_LAYER
obj/orb
	orbing10
		icon = 'magicgood.dmi'
		icon_state = "10"
		layer = MOB_LAYER
obj/orb
	orbing11
		icon = 'magicgood.dmi'
		icon_state = "11"
		layer = MOB_LAYER

mob/whitelighter
	verb
		Meditate()
			set category = "Skills"
			if(usr.Freeze==1)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: Your frozen, you can't use magic"
			if(Selforb == 0)
				if(usr.meditate==0)
					if(usr.icon_state=="Elder3")
						usr.density = 0
						usr.Froze = 1
						usr.Freeze = 1
						usr.icon_state = "Meditate2"
						usr.meditate=1
						meditate()
					if(usr.icon_state=="Lighter")
						usr.density = 0
						usr.Froze = 1
						usr.Freeze = 1
						usr.icon_state = "Meditate"
						usr.meditate=1
						meditate()

				else
					if(usr.icon_state=="Meditate")
						usr.density=1
						usr.Froze = 0
						usr.Freeze = 0
						usr.meditate = 0
						usr.icon_state = "Lighter"
					if(usr.icon_state=="Meditate2")
						usr.density=1
						usr.Froze = 0
						usr.Freeze = 0
						usr.meditate = 0
						usr.icon_state = "Elder3"

proc
	meditate()
		if(usr.meditate==1)
			usr.power+=rand(3,8)
			usr.Energy-=rand(60,100)
			sleep(5)
			usr.Intelligence+=rand(5,10)
			usr.Energy-=rand(60,100)
			sleep(5)
			usr.maxhealth+=rand(10,20)
			usr.Energy-=rand(60,100)
			sleep(10)
			meditate()


mob/darklighter
	verb
		DL_Sense()
			set category = "Skills"
			set name = "Sense Whitelighter"
			if(usr.Freeze==1)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: Your frozen, you can't use magic"
				return
			if(usr.Energy<=0)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: Your out of energy"
				return
			for(var/mob/Q in view(100))
				usr.Energy -= 5
				if(Q.Whitelighter == 1)
					if(Q in view(20))src<<"<i>You sense [Q.name]. [Q.name] seems to be very close to you."
					else src<<"<i>You sense a whitelighter presence, but it is too far for you to sense who it is..."
				if(Q.HalfWhitelighter==1)
					if(Q in view(20))src<<"<i>You sense [Q.name]. [Q.name] seems to be very close to you."
					else src<<"<i>You sense a halfblood whitelighter presence, but it is too far for you to sense who it is..."
mob/darklighter
	verb
		DL_Touch_of_Death(mob/M as mob in range(2,usr)-usr)		//attack a mob within 1 tile of you
			set category = "Skills"
			set name = "Touch of Death"
			if(usr.Freeze==1)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: Your frozen, you can't use magic"
				return
			if(usr.touching==1)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: Your already attacking"
				return
			if(usr.RolePlaying == 0)
				usr<<"You cant use magic here"
				return
			if(M.containhollow==1)
				usr.verbs -= new /mob/darklighter/verb/DL_Touch_of_Death
				M.verbs += new /mob/darklighter/verb/DL_Touch_of_Death
				view(9)<<"[M] has taken [usr]'s power using the hollow"
				return
			if(usr.Energy <= 0)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: Your out of energy"
				return
			if(usr.Selforb == 0)
/*				for(var/mob/P as mob in range(2,usr))*/
				if(M.Selforb==1)
					usr<<"<FONT COLOR=yellow>Client information</FONT>: You cant find [M]"
					return
				usr.touching=1
				usr.Exposing_Magic()
				sleep(6)
				M.overlays += new /obj/ToD/ToD1
				if(M.Whitelighter==1)
					M.health -= M.health/2
					M<<"You are extremely weak against this attack"
				M.health -= usr.Strength
				usr.Energy -= 250
				sleep(7)
				usr.Energy -= 500
				usr.touching = 0
				usr.deathcheck(M)
			else
				usr<<"<FONT COLOR=yellow>Client information</FONT>: You cant do this while orbing"
obj/ToD
	ToD1
		icon = 'magicgood.dmi'
		icon_state = "touch of death"
		layer = MOB_LAYER
mob/darklighter
	verb
		DL_Orb()		//attack a mob within 1 tile of you
			set category = "Skills"
			set name = "Black Orb"
			if(usr.Freeze==1)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: Your frozen, you can't use magic"
				return
			if(usr.Energy<=0)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: Your out of energy!"
				return
			if(usr.Selforb == 0)
				usr.Selforb = 1
				usr.density = 0
				usr.power += 1
				usr.overlays = new /obj/orb/dlorbing1
				view(9)<< "[usr] orbs away"
				usr.Exposing_Magic()
				usr.Energy -= 5
				view(9)<<sound("Whitelighter Orb.wav")
				spawn(1)
					usr.overlays = null
					usr.overlays += new /obj/orb/dlorbing2
					spawn(1)
						usr.overlays = null
						usr.overlays += new /obj/orb/dlorbing3
						spawn(1)
							usr.overlays = null
							usr.overlays += new /obj/orb/dlorbing4
							spawn(1)
								usr.overlays = null
								usr.icon = null
								usr.overlays += new /obj/orb/dlorbing5
								spawn(1)
									usr.overlays = null
									usr.overlays += new /obj/orb/dlorbing6
									spawn(1)
										usr.overlays = null
										usr.overlays += new /obj/orb/dlorbing7
										spawn(1)
											usr.overlays = null
											usr.overlays += new /obj/orb/dlorbing8
											spawn(1)
												usr.overlays = null
												usr.overlays += new /obj/orb/dlorbing9
												spawn(1)
													usr.overlays = null
													usr.overlays += new /obj/orb/dlorbing10
													spawn(1)
														usr.overlays = null

			else
				usr.Selforb = 0
				usr.density = 1
				usr.overlays = new /obj/orb/dlorbing10
				view(9)<<sound("Whitelighter Orb.wav")
				view(9)<< "[usr] orbs in"
				usr.Exposing_Magic()
				usr.Energy -= 5
				spawn(1)
					usr.overlays = null
					usr.overlays += new /obj/orb/dlorbing9
					spawn(1)
						usr.overlays = null
						usr.overlays += new /obj/orb/dlorbing8
						spawn(1)
							usr.overlays = null
							usr.overlays += new /obj/orb/dlorbing7
							spawn(1)
								usr.overlays = null
								usr.icon = null
								usr.overlays += new /obj/orb/dlorbing6
								spawn(1)
									usr.overlays = null
									usr.overlays += new /obj/orb/dlorbing5
									spawn(1)
										usr.overlays = null
										usr.icon = new /mob/Darklighter()
										usr.overlays += new /obj/orb/dlorbing4
										spawn(1)
											usr.overlays = null
											usr.overlays += new /obj/orb/dlorbing3
											spawn(1)
												usr.overlays = null
												usr.overlays += new /obj/orb/dlorbing2
												spawn(1)
													usr.overlays = null
													usr.overlays += new /obj/orb/dlorbing1
													spawn(1)
														usr.overlays = null



mob/darklighter
	verb
		DL_Orb_longdist(var/mob/M in world)		//attack a mob within 1 tile of you
			set category = "Skills"
			set name = "Black Orb Long"
			if(usr.Freeze==1)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: Your frozen, you can't use magic"
				return
			if(usr.RolePlaying == 0)
				usr<<"Your not roleplaying"
				return
			if(usr.Energy<=0)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: Your out of energy!"
				return
			if(usr.death==1)
				usr<<"You are death"
				return
			if(M.death==1)
				usr<<"[M] is death"
				return
			if(M.erased==1)
				return
			if(usr.good==1 && M.indemonschool==1)
				return
			if(usr.evil==1 && M.inmagicschool==1)
				return
			if(usr.neutral==1)
				if(M.indemonschool==1||M.inmagicschool==1)
					return
			if(usr.evil==1 && M.indemonschool==1)
				usr.indemonschool=1
			if(usr.good==1 && M.inmagicschool==1)
				usr.inmagicschool=1
			if(M.block_tele==1)
				switch(alert(M,"[src] is trying to teleport to you! Allow [src] to come to you?","","Yes","No"))
					if("Yes")
						..()
					if("No")
						src<<"You cant sense [M]"
						return
			if(M.RolePlaying==0)
				usr<<"[M] isnt in the Roleplay"
				return
			if(M.name == "Elder")
				usr<<"You dont know the location of the Elders"
				return
			if(M.name == "GrandElder")
				usr<<"You dont know the location of the Elders"
				return
			if(M.name == "FirstTimePlayer")
				usr<<"You cannot teleport to this"
				return
			if(M.name == "The Hollow")
				usr<<"You dont know the location of the hollow"
				return
			if(usr.erased==1)
				return
			if(M.inheaven==1)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: You cannot go to this personne"
				return
			if(M.inhell==1)
				usr.inhell = 1
			if(M.inhell==0)
				usr.inhell = 0
			usr.power += 1
			usr.Exposing_Magic()
			usr.overlays = new /obj/orb/dlorbing1
			view(9)<< "[usr] orbs away"
			usr.Energy -= 10
			view(9)<<sound("Whitelighter Orb.wav")
			spawn(1)
				usr.overlays = null
				usr.overlays += new /obj/orb/dlorbing2
				spawn(1)
					usr.overlays = null
					usr.overlays += new /obj/orb/dlorbing3
					spawn(1)
						usr.overlays = null
						usr.overlays += new /obj/orb/dlorbing4
						spawn(1)
							usr.overlays = null
							usr.icon = null
							usr.overlays += new /obj/orb/dlorbing5
							spawn(1)
								usr.overlays = null
								usr.overlays += new /obj/orb/dlorbing6
								spawn(1)
									usr.overlays = null
									usr.overlays += new /obj/orb/dlorbing7
									spawn(1)
										usr.overlays = null
										usr.overlays += new /obj/orb/dlorbing8
										spawn(1)
											usr.overlays = null
											usr.overlays += new /obj/orb/dlorbing9
											spawn(1)
												usr.overlays = null
												usr.overlays += new /obj/orb/dlorbing10
												spawn(1)
													usr.overlays = null
													src.x = M:x
													src.y = M:y+1
													src.z = M:z
													src.dir = SOUTH
													M << "[src.name] orbed behind you!!!"
													usr.overlays = new /obj/orb/orbing10
													spawn(1)
														usr.overlays = null
														usr.overlays += new /obj/orb/dlorbing9
														spawn(1)
															usr.overlays = null
															usr.overlays += new /obj/orb/dlorbing8
															spawn(1)
																usr.overlays = null
																usr.overlays += new /obj/orb/dlorbing7
																spawn(1)
																	usr.overlays = null
																	usr.icon = null
																	usr.overlays += new /obj/orb/dlorbing6
																	spawn(1)
																		usr.overlays = null
																		usr.overlays += new /obj/orb/dlorbing5
																		spawn(1)
																			usr.overlays = null
																			usr.icon = new /mob/Darklighter()
																			usr.overlays += new /obj/orb/dlorbing4
																			spawn(1)
																				usr.overlays = null
																				usr.overlays += new /obj/orb/dlorbing3
																				spawn(1)
																					usr.overlays = null
																					usr.overlays += new /obj/orb/dlorbing2
																					spawn(1)
																						usr.overlays = null
																						usr.overlays += new /obj/orb/dlorbing1
																						spawn(1)
																							usr.overlays = null
																							usr.Selforb = 0
																							usr.density = 1



mob/darklighter
	verb
		DL_orb_other(mob/M in view(9))		//attack a mob within 1 tile of you
			set name = "Black Orb Player"
			set category = "Skills"
			var/mob/X = input("Choose a target:","Target:") as mob in world
			if(usr.Freeze==1)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: Your frozen, you can't use magic"
				return
			if(M.RolePlaying==0)
				usr<<"[M] isnt roleplaying"
				return
			if(X.RolePlaying==0)
				usr<<"[X] isnt roleplaying"
				return
			if(usr.Energy<=0)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: Your out of energy!"
				return
			if(usr.Selforb == 1||M.Selforb==1)
				usr<<"Not while orbing"
				return
			if(X.inheaven == 1)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: You cannot send [M] here"
				return
			if(M.inhell == 1)
				M.inhell = 0
				..()
			if(M.good==1 && X.indemonschool==1)
				return
			if(M.evil==1 && X.inmagicschool==1)
				return
			if(M.neutral==1)
				if(X.indemonschool==1||X.inmagicschool==1)
					return
			if(X.block_tele==1)
				switch(alert(X,"[M] is being teleported to you! Allow [M] to come to you?","","Yes","No"))
					if("Yes")
						..()
					if("No")
						usr<<"You cant sense [X]"
						return
			if(X.inhell == 1)
				M.inhell = 1
				..()
			usr.power += 1
			M.overlays = new /obj/orb/dlorbing1
			view(9)<< "[M] gets orbed away"
			usr.Energy -= 10
			usr.Exposing_Magic()
			view(9)<<sound("Whitelighter Orb.wav")
			spawn(1)
				M.overlays = null
				M.overlays += new /obj/orb/dlorbing2
				spawn(1)
					M.overlays = null
					M.overlays += new /obj/orb/dlorbing3
					spawn(1)
						M.overlays = null
						M.overlays += new /obj/orb/dlorbing4
						spawn(1)
							M.overlays = null
							M.icon = null
							M.overlays += new /obj/orb/dlorbing5
							spawn(1)
								M.overlays = null
								M.overlays += new /obj/orb/dlorbing6
								spawn(1)
									M.overlays = null
									M.overlays += new /obj/orb/dlorbing7
									spawn(1)
										M.overlays = null
										M.overlays += new /obj/orb/dlorbing8
										spawn(1)
											M.overlays = null
											M.overlays += new /obj/orb/dlorbing9
											spawn(1)
												M.overlays = null
												M.overlays += new /obj/orb/dlorbing10
												spawn(1)
													M.overlays = null
													M.x = X:x
													M.y = X:y+1
													M.z = X:z
													M.dir = SOUTH
													X << "[M.name] orbed behind you!!!"
													M.overlays = new /obj/orb/orbing10
													spawn(1)
														M.overlays = null
														M.overlays += new /obj/orb/dlorbing9
														spawn(1)
															M.overlays = null
															M.overlays += new /obj/orb/dlorbing8
															spawn(1)
																M.overlays = null
																M.overlays += new /obj/orb/dlorbing7
																spawn(1)
																	M.overlays = null
																	M.icon = null
																	M.overlays += new /obj/orb/dlorbing6
																	spawn(1)
																		M.overlays = null
																		M.overlays += new /obj/orb/dlorbing5
																		spawn(1)
																			M.overlays = null
																			M.icon = new /mob/Darklighter()
																			M.overlays += new /obj/orb/dlorbing4
																			spawn(1)
																				M.overlays = null
																				M.overlays += new /obj/orb/dlorbing3
																				spawn(1)
																					M.overlays = null
																					M.overlays += new /obj/orb/dlorbing2
																					spawn(1)
																						M.overlays = null
																						M.overlays += new /obj/orb/dlorbing1
																						spawn(1)
																							M.overlays = null
																							M.Selforb = 0
																							M.density = 1

mob/darklighter
	verb
		DL_Orb_with_people(var/mob/M in world)		//attack a mob within 1 tile of you
			set category = "Skills"
			set name = "Black Orb surrounding"
			if(usr.Freeze==1)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: Your frozen, you can't use magic"
				return
			if(usr.RolePlaying == 0)
				usr<<"Your not roleplaying"
				return
			if(usr.Energy<=0)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: Your out of energy!"
				return
			if(M.erased==1)
				return
			if(usr.erased==1)
				return
			if(M.RolePlaying == 0)
				usr<<"[M] isnt roleplaying"
				return
			if(usr.good==1 && M.indemonschool==1)
				return
			if(usr.evil==1 && M.inmagicschool==1)
				return
			if(usr.neutral==1)
				if(M.indemonschool==1||M.inmagicschool==1)
					return
			if(usr.evil==1 && M.indemonschool==1)
				usr.indemonschool=1
			if(usr.good==1 && M.inmagicschool==1)
				usr.inmagicschool=1
			if(M.block_tele==1)
				switch(alert(M,"[src] is trying to teleport to you! Allow [src] to come to you?","","Yes","No"))
					if("Yes")
						..()
					if("No")
						src<<"You cant sense [M]"
						return
			if(M.inheaven==1)
				usr.inheaven = 1
			if(M.inheaven==0)
				usr.inheaven = 0
			if(M.inhell == 1)
				usr<<"You canno go there"
				return
			if(usr.world == M)
				if(usr.Darklighter == 1)
					for(var/mob/P as mob in range(2,usr))
						if(P.dlorbexept == 1)
							if(usr.inheaven==1)
								P.inheaven = 1
							if(usr.inheaven==0)
								P.inheaven = 0
							usr.power += 1
							usr.Exposing_Magic()
							usr.Energy -= 15
							view(9)<<sound("Whitelighter Orb")
							usr.overlays = new /obj/orb/dlorbing1
							P.overlays = new /obj/orb/dlorbing1
							spawn(1)
								usr.overlays = null
								P.overlays = null
								usr.overlays += new /obj/orb/dlorbing2
								P.overlays += new /obj/orb/dlorbing2
								spawn(1)
									P.overlays = null
									P.overlays += new /obj/orb/dlorbing3
									usr.overlays = null
									usr.overlays += new /obj/orb/dlorbing3
									spawn(1)
										P.overlays = null
										P.overlays += new /obj/orb/dlorbing4
										usr.overlays = null
										usr.overlays += new /obj/orb/dlorbing4
										spawn(1)
											P.overlays = null
											P.icon = null
											P.overlays += new /obj/orb/dlorbing5
											usr.overlays = null
											usr.icon = null
											usr.overlays += new /obj/orb/dlorbing5
											spawn(1)
												P.overlays = null
												P.overlays += new /obj/orb/dlorbing6
												usr.overlays = null
												usr.overlays += new /obj/orb/dlorbing6
												spawn(1)
													P.overlays = null
													P.overlays += new /obj/orb/dlorbing7
													usr.overlays = null
													usr.overlays += new /obj/orb/dlorbing7
													spawn(1)
														P.overlays = null
														P.overlays += new /obj/orb/dlorbing8
														usr.overlays = null
														usr.overlays += new /obj/orb/dlorbing8
														spawn(1)
															P.overlays = null
															P.overlays += new /obj/orb/dlorbing9
															usr.overlays = null
															usr.overlays += new /obj/orb/dlorbing9
															spawn(1)
																P.overlays = null
																P.overlays += new /obj/orb/dlorbing10
																usr.overlays = null
																usr.overlays += new /obj/orb/dlorbing10
																spawn(1)
																	usr.overlays = null
																	src.x = M:x
																	src.y = M:y+1
																	src.z = M:z
																	src.dir = SOUTH
																	P.loc = locate(usr.x,usr.y,usr.z)
																	M << "[src.name] orbed behind you!!!"
																	P.overlays = new /obj/orb/dlorbing10
																	usr.overlays = new /obj/orb/dlorbing10
																	spawn(1)
																		P.overlays = null
																		usr.overlays = null
																		P.overlays += new /obj/orb/dlorbing9
																		usr.overlays += new /obj/orb/dlorbing9
																		spawn(1)
																			P.overlays = null
																			usr.overlays = null
																			P.overlays += new /obj/orb/dlorbing8
																			usr.overlays += new /obj/orb/dlorbing8
																			spawn(1)
																				P.overlays = null
																				usr.overlays = null
																				P.overlays += new /obj/orb/dlorbing7
																				usr.overlays += new /obj/orb/dlorbing7
																				spawn(1)
																					P.overlays = null
																					usr.overlays = null
																					P.icon = null
																					P.overlays += new /obj/orb/dlorbing6
																					usr.icon = null
																					usr.overlays += new /obj/orb/dlorbing6
																					spawn(1)
																						P.overlays = null
																						usr.overlays = null
																						P.overlays += new /obj/orb/dlorbing5
																						usr.overlays += new /obj/orb/dlorbing5
																						spawn(1)
																							P.overlays = null
																							usr.overlays = null
																							P.icon = new /mob/goodwitch()
																							P.overlays += new /obj/orb/dlorbing4
																							usr.icon = new /mob/goodwitch()
																							usr.overlays += new /obj/orb/dlorbing4
																							spawn(1)
																								P.overlays = null
																								usr.overlays = null
																								P.overlays += new /obj/orb/dlorbing3
																								usr.overlays += new /obj/orb/dlorbing3
																								spawn(1)
																									P.overlays = null
																									usr.overlays = null
																									P.overlays += new /obj/orb/dlorbing2
																									usr.overlays += new /obj/orb/dlorbing2
																									spawn(1)
																										P.overlays = null
																										usr.overlays = null
																										P.overlays += new /obj/orb/dlorbing1
																										usr.overlays += new /obj/orb/dlorbing1
																										spawn(1)
																											P.overlays = null
																											usr.overlays = null
																											usr.Selforb = 0
																											usr.density = 1
				else
					return
			else
				for(var/mob/P as mob in range(2,usr))
					if(P.dlorbexept == 1)
						usr.power += 1
						usr.Energy -= 15
						usr.Exposing_Magic()
						usr.overlays = new /obj/orb/dlorbing1
						P.overlays = new /obj/orb/dlorbing1
						spawn(1)
							usr.overlays = null
							P.overlays = null
							usr.overlays += new /obj/orb/dlorbing2
							P.overlays += new /obj/orb/dlorbing2
							spawn(1)
								P.overlays = null
								P.overlays += new /obj/orb/dlorbing3
								usr.overlays = null
								usr.overlays += new /obj/orb/dlorbing3
								spawn(1)
									P.overlays = null
									P.overlays += new /obj/orb/dlorbing4
									usr.overlays = null
									usr.overlays += new /obj/orb/dlorbing4
									spawn(1)
										P.overlays = null
										P.icon = null
										P.overlays += new /obj/orb/dlorbing5
										usr.overlays = null
										usr.icon = null
										usr.overlays += new /obj/orb/dlorbing5
										spawn(1)
											P.overlays = null
											P.overlays += new /obj/orb/dlorbing6
											usr.overlays = null
											usr.overlays += new /obj/orb/dlorbing6
											spawn(1)
												P.overlays = null
												P.overlays += new /obj/orb/dlorbing7
												usr.overlays = null
												usr.overlays += new /obj/orb/dlorbing7
												spawn(1)
													P.overlays = null
													P.overlays += new /obj/orb/dlorbing8
													usr.overlays = null
													usr.overlays += new /obj/orb/dlorbing8
													spawn(1)
														P.overlays = null
														P.overlays += new /obj/orb/dlorbing9
														usr.overlays = null
														usr.overlays += new /obj/orb/dlorbing9
														spawn(1)
															P.overlays = null
															P.overlays += new /obj/orb/dlorbing10
															usr.overlays = null
															usr.overlays += new /obj/orb/dlorbing10
															spawn(1)
																usr.overlays = null
																src.x = M:x
																src.y = M:y+1
																src.z = M:z
																src.dir = SOUTH
																P.loc = locate(usr.x,usr.y,usr.z)
																M << "[src.name] orbed behind you!!!"
																P.overlays = new /obj/orb/dlorbing10
																usr.overlays = new /obj/orb/dlorbing10
																spawn(1)
																	P.overlays = null
																	usr.overlays = null
																	P.overlays += new /obj/orb/dlorbing9
																	usr.overlays += new /obj/orb/dlorbing9
																	spawn(1)
																		P.overlays = null
																		usr.overlays = null
																		P.overlays += new /obj/orb/dlorbing8
																		usr.overlays += new /obj/orb/dlorbing8
																		spawn(1)
																			P.overlays = null
																			usr.overlays = null
																			P.overlays += new /obj/orb/dlorbing7
																			usr.overlays += new /obj/orb/dlorbing7
																			spawn(1)
																				P.overlays = null
																				usr.overlays = null
																				P.icon = null
																				P.overlays += new /obj/orb/dlorbing6
																				usr.icon = null
																				usr.overlays += new /obj/orb/dlorbing6
																				spawn(1)
																					P.overlays = null
																					usr.overlays = null
																					P.overlays += new /obj/orb/dlorbing5
																					usr.overlays += new /obj/orb/dlorbing5
																					spawn(1)
																						P.overlays = null
																						usr.overlays = null
																						P.icon = new /mob/goodwitch()
																						P.overlays += new /obj/orb/dlorbing4
																						usr.icon = new /mob/goodwitch()
																						usr.overlays += new /obj/orb/dlorbing4
																						spawn(1)
																							P.overlays = null
																							usr.overlays = null
																							P.overlays += new /obj/orb/dlorbing3
																							usr.overlays += new /obj/orb/dlorbing3
																							spawn(1)
																								P.overlays = null
																								usr.overlays = null
																								P.overlays += new /obj/orb/dlorbing2
																								usr.overlays += new /obj/orb/dlorbing2
																								spawn(1)
																									P.overlays = null
																									usr.overlays = null
																									P.overlays += new /obj/orb/dlorbing1
																									usr.overlays += new /obj/orb/dlorbing1
																									spawn(1)
																										P.overlays = null
																										usr.overlays = null
																										usr.Selforb = 0
																										usr.density = 1



mob/darklighter
	verb
		DL_Orb_place()
			set category = "Skills"
			set name = "Black Orb place"
			var/default_value = "Earth"
			var/list/places = list("Earth", "Hell Entrance", "Charmed manor", "Park", "Julian's House", "Kyros House", "DragoWings House", "Graveyard", "The Ultimate")
			choose_place = input(usr, default_value) in places
			switch(choose_place)
				if("Earth")
					usr.place = "Earth"
				if("Hell Entrance")
					usr.place = "Hell"
				if("Charmed manor")
					usr.place = "Charmed"
				if("Park")
					usr.place = "Park"
				if("Julian's House")
					usr.place = "SyncWolf"
				if("Kyros House")
					usr.place = "Zeniox"
				if("DragoWings House")
					usr.place = "Drago"
				if("Graveyard")
					usr.place = "Graveyard"
				if("The Ultimate")
					usr.place = "Ultimate"
			if(usr.Freeze==1)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: Your frozen, you can't use magic"
				return
			if(usr.RolePlaying == 0)
				usr<<"Your not roleplaying"
				return
			if(usr.Energy<=0)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: Your out of energy!"
				return
			if(usr.death==1)
				usr<<"You are death"
				return
			if(usr.erased==1)
				return
			if(usr.Darklighter == 1)
				usr.power += 1
				usr.overlays = new /obj/orb/dlorbing1
				view(9)<< "[usr] orbs away"
				usr.Energy -= 10
				usr.Exposing_Magic()
				view(9)<<sound("Whitelighter Orb.wav")
				spawn(1)
					usr.overlays = null
					usr.overlays += new /obj/orb/dlorbing2
					spawn(1)
						usr.overlays = null
						usr.overlays += new /obj/orb/dlorbing3
						spawn(1)
							usr.overlays = null
							usr.overlays += new /obj/orb/dlorbing4
							spawn(1)
								usr.overlays = null
								usr.icon = null
								usr.overlays += new /obj/orb/dlorbing5
								spawn(1)
									usr.overlays = null
									usr.overlays += new /obj/orb/dlorbing6
									spawn(1)
										usr.overlays = null
										usr.overlays += new /obj/orb/dlorbing7
										spawn(1)
											usr.overlays = null
											usr.overlays += new /obj/orb/dlorbing8
											spawn(1)
												usr.overlays = null
												usr.overlays += new /obj/orb/dlorbing9
												spawn(1)
													usr.overlays = null
													usr.overlays += new /obj/orb/dlorbing10
													spawn(1)
														usr.overlays = null
														if(usr.place=="Earth")
															usr.loc = locate(/turf/Area/Earth)
															usr.inhell = 0
														if(usr.place=="Hell")
															usr.loc = locate(/turf/Area/Hell)
															usr.inhell = 0
														if(usr.place=="Charmed")
															usr.loc = locate(/turf/Area/Charmed)
															usr.inhell = 0
														if(usr.place=="Park")
															usr.loc = locate(/turf/Area/Park)
															usr.inhell = 0
														if(usr.place=="SyncWolf")
															usr.loc = locate(/turf/Area/SyncWolfsHouse)
															usr.inhell = 0
														if(usr.place=="Zeniox")
															usr.loc = locate(/turf/Area/ZenioxHouse)
															usr.inhell = 0
														if(usr.place == "Drago")
															usr.loc = locate(/turf/Area/DragowingHouse)
															usr.inhell = 0
														if(usr.place=="Graveyard")
															usr.loc = locate(/turf/Area/Graveyard)
															usr.inhell = 0
														if(usr.place=="Ultimate")
															usr.loc = locate(/turf/Area/Ultimate)
															usr.inhell = 0
														usr.overlays = new /obj/orb/dlorbing10
														spawn(1)
															usr.overlays = null
															usr.overlays += new /obj/orb/dlorbing9
															spawn(1)
																usr.overlays = null
																usr.overlays += new /obj/orb/dlorbing8
																spawn(1)
																	usr.overlays = null
																	usr.overlays += new /obj/orb/dlorbing7
																	spawn(1)
																		usr.overlays = null
																		usr.overlays += new /obj/orb/dlorbing6
																		spawn(1)
																			usr.overlays = null
																			usr.overlays += new /obj/orb/dlorbing5
																			spawn(1)
																				usr.overlays = null
																				usr.icon = new /mob/Darklighter()
																				usr.overlays += new /obj/orb/dlorbing4
																				spawn(1)
																					usr.overlays = null
																					usr.overlays += new /obj/orb/dlorbing3
																					spawn(1)
																						usr.overlays = null
																						usr.overlays += new /obj/orb/dlorbing2
																						spawn(1)
																							usr.overlays = null
																							usr.overlays += new /obj/orb/dlorbing1
																							spawn(1)
																								usr.overlays = null
																								usr.Selforb = 0
																								usr.density = 1

obj/orb
	dlorbing1
		icon = 'magicgood.dmi'
		icon_state = "dl1"
		layer = MOB_LAYER
obj/orb
	dlorbing2
		icon = 'magicgood.dmi'
		icon_state = "dl2"
		layer = MOB_LAYER
obj/orb
	dlorbing3
		icon = 'magicgood.dmi'
		icon_state = "dl3"
		layer = MOB_LAYER
obj/orb
	dlorbing4
		icon = 'magicgood.dmi'
		icon_state = "dl4"
		layer = MOB_LAYER
obj/orb
	dlorbing5
		icon = 'magicgood.dmi'
		icon_state = "dl5"
		layer = MOB_LAYER
obj/orb
	dlorbing6
		icon = 'magicgood.dmi'
		icon_state = "dl6"
		layer = MOB_LAYER
obj/orb
	dlorbing7
		icon = 'magicgood.dmi'
		icon_state = "dl7"
		layer = MOB_LAYER
obj/orb
	dlorbing8
		icon = 'magicgood.dmi'
		icon_state = "dl8"
		layer = MOB_LAYER
obj/orb
	dlorbing9
		icon = 'magicgood.dmi'
		icon_state = "dl9"
		layer = MOB_LAYER
obj/orb
	dlorbing10
		icon = 'magicgood.dmi'
		icon_state = "dl10"
		layer = MOB_LAYER
obj/orb
	dlorbing11
		icon = 'magicgood.dmi'
		icon_state = "dl11"
		layer = MOB_LAYER

obj
	orbball
		icon='magicgood.dmi'
		icon_state = "orbball"
		density = 1
		Bump(atom/M)
			if(istype(M,/mob/))
/*				for(var/mob/N in world)*/
				if(M:shielded==1)
					del(src)
					return
				if(M:Whitelighter==1)
					M:Whitelighter_Death()
					del(src)
					return
				if(M:containhollow==1)
					M.verbs += new /mob/whitelighter/verb/Whitelighterball
					usr.verbs -= new /mob/whitelighter/verb/Whitelighterball
					view(9)<<"[M] has taken [usr]'s power using the hollow"
					del(src)
					return
				for(var/mob/N in world)
					if(src.owner == "[N.key]")
						N<<"You hit [M]!"
						M<<"You were hit by [N]!"
						M:health -= N.power/M:power
						M:health -= N.Strength/2
						N.power += 1
						N.deathcheck(M)
						del(src)
						for(var/obj/orbball/T in world)
							if(T:owner == "[N.key]")
								del(T)
				del(src)
			else
				..()
			if(istype(M,/obj/))
				spawn(1)
					M.overlays = null
					spawn(1)
						M.overlays = null
						spawn(1)
							M.overlays = null
							del(M)


				del(src)
			else
				..()


mob
	whitelighter
		verb
			Whitelighterball()
				set category = "Skills"
				set name = "Whitelighter Ball"
				if(usr.Freeze==1)
					usr<<"<FONT COLOR=yellow>Client information</FONT>: Your frozen, you can't use magic"
					return
				if(usr.RolePlaying == 0)
					usr<<"You cannot use magic here"
					return
				if(usr.Energy<=0)
					usr<<"<FONT COLOR=yellow>Client information</FONT>: Your out of energy!"
					return
				if(usr.attacking==1)
					return
				if(usr.Selforb == 0)
					usr.Energy -= 10
					usr.Exposing_Magic()
					usr.attacking = 1
					var/obj/orbball/F = new /obj/orbball(src.loc)
					F:owner = "[usr.key]"
					walk(F,usr.dir)
					sleep(8)
					usr.attacking = 0
					spawn(10)
						del(F)

				else
					usr<<"You cant do this while orbing"
mob
	whitelighter
		verb
			Teach_Whitelighter_Ball(mob/M in oview())
				set category = "Skills"
				M<<"You have been taught how to control your orbs into an attack."
				usr<<"You taught [M] to use orbs as an attack."
				M.verbs += /mob/whitelighter/verb/Whitelighterball



mob
	darklighter
		verb
			Summondarkbow()
				set category = "Skills"
				set name = "Summon Darklighter Bow"
				var/counter=0
				for(var/obj/Darklighter_Bow/O in usr.contents)
					counter+=1
				if(counter<=0)
					var/obj/Darklighter_Bow/W = new/obj/Darklighter_Bow
					W.loc = usr
					W.name= "Darklighter Bow"
					usr<<"A crossbow appears from smoke into your hands"
					return
				else
					usr<<"You already have one..."
					return

mob/darklighter
	verb
		Energybolt()		//attack a mob within 1 tile of you
			set category = "Skills"
			if(usr.Freeze==1)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: Your frozen, you can't use magic"
				return
			if(usr.RolePlaying == 0)
				usr<<"You cannot use magic here"
				return
			if(usr.Energy<=0)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: Your out of energy!"
				return
			if(usr.attacking==1)
				return
			if(usr.Selforb == 0)
				usr.Energy -= 10
				usr.Exposing_Magic()
				usr.attacking = 1
				var/obj/Fastenergy/F = new /obj/Fastenergy(src.loc)
				F:owner = "[usr.key]"
				walk(F,usr.dir)
				sleep(8)
				usr.attacking = 0
				spawn(10)
					del(F)

			else
				usr<<"You cant do this while orbing"

///////////////////////////////////////////
//////////
//////////////////////////////////////////
obj
	Fastenergy
		icon='General.dmi'
		icon_state = "lightningball"
		density = 1
		Bump(atom/M)
			if(istype(M,/mob/))
/*				for(var/mob/N in world)*/
				if(M:shielded==1)
					del(src)
					return
				if(M:Whitelighter==1)
					M:Whitelighter_Death()
					del(src)
					return
				if(M:containhollow==1)
					M.verbs += new /mob/darklighter/verb/Energybolt
					usr.verbs -= new /mob/darklighter/verb/Energybolt
					view(9)<<"[M] has taken [usr]'s power using the hollow"
					del(src)
					return
				for(var/mob/N in world)
					if(src.owner == "[N.key]")
						N<<"You hit [M]!"
						M<<"You were hit by [N]!"
						M:health -= N.power/M:power
						M:health -= N.Strength
						N.power += 1
						del(src)
						N.deathcheck(M)
						for(var/obj/Fastenergy/T in world)
							if(T:owner == "[N.key]")
								del(T)
				del(src)
			else
				..()
			if(istype(M,/obj/))
				spawn(1)
					M.overlays = null
					spawn(1)
						M.overlays = null
						spawn(1)
							M.overlays = null
							del(M)


				del(src)
			else
				..()


mob/demon
	verb
		Energybolt()		//attack a mob within 1 tile of you
			set category = "Skills"
			if(usr.Freeze==1)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: Your frozen, you can't use magic"
				return
			if(usr.RolePlaying == 0)
				usr<<"You cannot use magic here"
				return
			if(usr.Energy<=0)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: Your out of energy!"
				return
			if(usr.attacking == 1)
				return
			if(usr.Selforb == 0)
				var/obj/Fastenergy/F = new /obj/Fastenergy2(src.loc)
				usr.Exposing_Magic()
				usr.Energy -= 5
				usr.attacking = 1
				F:owner = "[usr.key]"
				walk(F,usr.dir)
				sleep(8)
				usr.attacking = 0
				spawn(10)
					del(F)

			else
				usr<<"You cant do this while orbing"
obj
	Fastenergy2
		icon='General.dmi'
		icon_state = "energybolt"
		density = 1
		Bump(atom/M)
			if(istype(M,/mob/))
/*				for(var/mob/N in world)*/
				if(M:shielded==1)
					del(src)
					return
				if(M:Whitelighter==1)
					M:Whitelighter_Death()
					del(src)
					return
				if(M:containhollow==1)
					M.verbs += new /mob/demon/verb/Energybolt
					usr.verbs -= new /mob/demon/verb/Energybolt
					view(9)<<"[M] has taken [usr]'s power using the hollow"
					del(src)
					return
				for(var/mob/N in world)
					if(src.owner == "[N.key]")
						N<<"You hit [M]!"
						M<<"You were hit by [N]!"
						M:health -= N.power/M:power
						M:health -= N.Strength
						N.power += 1
						N.deathcheck(M)
						del(src)
						for(var/obj/Fastenergy/T in world)
							if(T:owner == "[N.key]")
								del(T)
				del(src)
			else
				..()
			if(istype(M,/obj/))
				spawn(1)
					M.overlays = null
					spawn(1)
						M.overlays = null
						spawn(1)
							M.overlays = null
							del(M)


				del(src)
			else
				..()


obj
	Firebolt
		var
			power = 50
		icon='General.dmi'
		icon_state = "fireball4"
		density = 1
		Bump(atom/M)
			if(istype(M,/mob/))
/*				for(var/mob/N in world)*/
				if(M:shielded==1)
					del(src)
					return
				if(M:Whitelighter==1)
					M:Whitelighter_Death()
					del(src)
					return
				if(M:containhollow==1)
					M.verbs += new /mob/demon/verb/Firebolt
					usr.verbs -= new /mob/demon/verb/Firebolt
					view(9)<<"[M] has taken [usr]'s power using the hollow"
					del(src)
					return
				for(var/mob/N in world)
					if(src.owner == "[N.key]")
						N<<"You hit [M]!"
						M<<"You were hit by [N]!"
						M:health -= N.power/M:power
						M:health -= N.Strength
						N.power += 1
						N.deathcheck(M)
						for(var/obj/Fastenergy/T in world)
							if(T:owner == "[N.key]")
								del(T)
				del(src)
			else
				..()
			if(istype(M,/obj/))
				spawn(1)
					M.overlays = null
					spawn(1)
						M.overlays = null
						spawn(1)
							M.overlays = null
							del(M)


				del(src)
			else
				..()
obj
	Firebolt2
		var
			power = 10
		icon='General.dmi'
		icon_state = "fireball4"
		density = 1
		Bump(atom/M)
			if(istype(M,/mob/))
/*				for(var/mob/N in world)*/
				if(M:shielded==1)
					del(src)
					return
				if(M:Whitelighter==1)
					M:Whitelighter_Death()
					del(src)
					return
				if(M:containhollow==1)
					M.verbs += new /mob/demon/verb/Firebolt
					usr.verbs -= new /mob/demon/verb/Firebolt
					view(9)<<"[M] has taken [usr]'s power using the hollow"
					del(src)
					return
				for(var/mob/N in world)
					if(src.owner == "[N]")
						N<<"You hit [M]!"
						M<<"You were hit by [N]!"
						M:health -= N.power/M:power
						M:health -= N.Strength
						N.power += 1
						N.deathcheck(M)
						for(var/obj/Fastenergy/T in world)
							if(T:owner == "[N.key]")
								del(T)
				del(src)
			else
				..()
			if(istype(M,/obj/))
				spawn(1)
					M.overlays = null
					spawn(1)
						M.overlays = null
						spawn(1)
							M.overlays = null
							del(M)


				del(src)
			else
				..()
mob/demon
	verb
		Firebolt()		//attack a mob within 1 tile of you
			set category = "Skills"
			if(usr.Freeze==1)
				usr<<"Your frozen, you can't use magic"
				return
			if(usr.RolePlaying == 0)
				usr<<"You cannot use magic here"
				return
			if(usr.Energy<=0)
				usr<<"You don't have the energy to do this"
				return
			if(usr.attacking==1)
				return
			if(usr.Selforb == 0)
				var/obj/Fastenergy/F = new /obj/Firebolt(src.loc)
				usr.Energy -= 5
				usr.Exposing_Magic()
				usr.attacking = 1
				F:owner = "[usr.key]"
				walk(F,usr.dir)
				sleep(8)
				usr.attacking = 0
				spawn(10)
					del(F)
			else
				usr<<"You cant do this while orbing"
/*obj
	Energyball
		var
			power = 10
			owner = ""
		icon='General.dmi'
		icon_state = "orbball"
		density = 1
		Bump(atom/M)
			if(istype(M,/mob/))
				for(var/mob/N in world)
					if(M:containhollow==1)
						M.verbs += new /mob/whitelighter/verb/Energyball
						N.verbs -= new /mob/whitelighter/verb/Energyball
						view(9)<<"[M] has taken [N]'s power using the hollow"
						del(src)
						return
					if(src.owner == "[N.key]")
						N<<"You hit [M]!"
						M<<"You were hit by [N]!"
						M:health -= N.power/M:power
						M:health -= N.Strength
						N.power += 1
						N.deathcheck(M)
						for(var/obj/Firebolt/T in world)
							if(T:owner == "[N.key]")
								del(T)
				del(src)
			else
				..()
			if(istype(M,/obj/))
				spawn(1)
					M.overlays = null
					spawn(1)
						M.overlays = null
						spawn(1)
							M.overlays = null
							del(M)


				del(src)
			else
				..()
mob/whitelighter
	verb
		Energyball()		//attack a mob within 1 tile of you
			set category = "Skills"
			if(usr.RolePlaying == 0)
				usr<<"You cannot use magic here"
				return
			if(usr.Selforb == 0)
				var/obj/Energyball/F = new /obj/Energyball(src.loc)
				F:owner = "[usr.key]"
				walk(F,usr.dir)
				spawn(20)
					del(F)
			else
				usr<<"You cant do this while orbing"*/
mob/witch
	verb
		Waterball()		//attack a mob within 1 tile of you
			set category = "Skills"
			if(usr.Freeze==1)
				usr<<"Your frozen, you can't use magic"
				return
			if(usr.RolePlaying == 0)
				usr<<"You cannot use magic here"
				return
			if(usr.Energy<=0)
				usr<<"You don't have the energy to do this"
				return
			if(usr.attacking == 1)
				return
			if(usr.Selforb == 0)
				var/obj/waterball/F = new /obj/waterball(src.loc)
				usr.Energy -= 5
				usr.attacking = 1
				usr.Exposing_Magic()
				F:owner = "[usr.key]"
				walk(F,usr.dir)
				sleep(8)
				usr.attacking = 0
				spawn(10)
					del(F)
			else
				usr<<"You cant do this while orbing"
obj
	waterball
		var
			power = 10

		icon='General.dmi'
		icon_state = "waterball"
		density = 1
		Bump(atom/M)
			if(istype(M,/mob/))
/*				for(var/mob/N in world)*/
				if(M:shielded==1)
					del(src)
					return
				if(M:Whitelighter==1)
					M:Whitelighter_Death()
					del(src)
					return
				for(var/mob/N in world)
					if(M:containhollow==1)
						M.verbs += new /mob/witch/verb/Waterball
						N.verbs -= new /mob/witch/verb/Waterball
						view(9)<<"[M] has taken [N]'s power using the hollow"
						del(src)
						return
					if(src.owner == "[N.key]")
						N<<"You hit [M]!"
						M<<"You were hit by [N]!"
						M:health -= N.power/M:power
						M:health -= N.Strength
						N.power += 1
						N.deathcheck(M)
						for(var/obj/Fastenergy/T in world)
							if(T:owner == "[N.key]")
								del(T)
				del(src)
			else
				..()
			if(istype(M,/obj/))
				spawn(1)
					M.overlays = null
					spawn(1)
						M.overlays = null
						spawn(1)
							M.overlays = null
							del(M)


				del(src)
			else
				..()
mob/witch
	verb
		EletricBolt()		//attack a mob within 1 tile of you
			set category = "Skills"
			set name = "Electric bolt"
			if(usr.Freeze==1)
				usr<<"Your frozen, you can't use magic"
				return
			if(usr.RolePlaying == 0)
				usr<<"You cannot use magic here"
				return
			if(usr.Energy<=0)
				usr<<"You don't have the energy to do this"
				return
			if(usr.attacking == 1)
				return
			if(usr.Selforb == 0)
				var/obj/witchball/F = new /obj/witchball(src.loc)
				usr.Energy -= 5
				usr.attacking = 1
				usr.Exposing_Magic()
				F:owner = "[usr.key]"
				walk(F,usr.dir)
				sleep(8)
				usr.attacking = 0
				spawn(10)
					del(F)
			else
				usr<<"You cant do this while orbing"
obj
	witchball
		var
			power = 10

		icon='General.dmi'
		icon_state = "witchball"
		density = 1
		Bump(atom/M)
			if(istype(M,/mob/))
/*				for(var/mob/N in world)*/
				if(M:shielded==1)
					del(src)
					return
				if(M:Whitelighter==1)
					M:Whitelighter_Death()
					del(src)
					return
				for(var/mob/N in world)
					if(M:containhollow==1)
						M.verbs += new /mob/witch/verb/EletricBolt
						N.verbs -= new /mob/witch/verb/EletricBolt
						view(9)<<"[M] has taken [N]'s power using the hollow"
						del(src)
						return
					if(src.owner == "[N.key]")
						N<<"You hit [M]!"
						M<<"You were hit by [N]!"
						M:health -= N.power/M:power
						M:health -= N.Strength
						N.power += 1
						N.deathcheck(M)
						for(var/obj/Fastenergy/T in world)
							if(T:owner == "[N.key]")
								del(T)
				del(src)
			else
				..()
			if(istype(M,/obj/))
				spawn(1)
					M.overlays = null
					spawn(1)
						M.overlays = null
						spawn(1)
							M.overlays = null
							del(M)


				del(src)
			else
				..()
mob/demon
	verb
		DarkEnergyball()		//attack a mob within 1 tile of you
			set category = "Skills"
			set name = "Dark Energyball"
			if(usr.Freeze==1)
				usr<<"Your frozen, you can't use magic"
				return
			if(usr.RolePlaying == 0)
				usr<<"You cannot use magic here"
				return
			if(usr.Energy<=0)
				usr<<"You don't have the energy to do this"
				return
			if(usr.attacking == 1)
				return
			if(usr.Selforb == 0)
				var/obj/darkenergyball/F = new /obj/darkenergyball(src.loc)
				usr.Energy -= 5
				usr.attacking = 1
				usr.Exposing_Magic()
				F:owner = "[usr.key]"
				walk(F,usr.dir)
				sleep(8)
				usr.attacking = 0
				spawn(10)
					del(F)
			else
				usr<<"You cant do this while orbing"
obj
	darkenergyball
		var
			power = 10

		icon='General.dmi'
		icon_state = "purpleball"
		density = 1
		Bump(atom/M)
			if(istype(M,/mob/))
/*				for(var/mob/N in world)*/
				if(M:shielded==1)
					del(src)
					return
				if(M:Whitelighter==1)
					M:Whitelighter_Death()
					del(src)
					return
				for(var/mob/N in world)
					if(N.containhollow==1)
						M.verbs += new /mob/demon/verb/DarkEnergyball
						N.verbs -= new /mob/demon/verb/DarkEnergyball
						view(9)<<"[M] has taken [N]'s power using the hollow"
						del(src)
						return
					if(src.owner == "[N.key]")
						N<<"You hit [M]!"
						M<<"You were hit by [N]!"
						M:health -= N.power/M:power
						M:health -= N.Strength
						N.power += 1
						N.deathcheck(M)
						for(var/obj/Fastenergy/T in world)
							if(T:owner == "[N.key]")
								del(T)
				del(src)
			else
				..()
			if(istype(M,/obj/))
				spawn(1)
					M.overlays = null
					spawn(1)
						M.overlays = null
						spawn(1)
							M.overlays = null
							del(M)


				del(src)
			else
				..()

////////////////////////////
///////////////////////////
mob/Move()
	if(Freeze) return 0
	. = ..()
mob/var/Freeze = 0
obj/var/Freeze = 0
mob/witch
	verb
		Freeze()
			set desc = "(victim) Remove movement abilities from a player's mob for a short time"
			set category = "Skills"
			set name = "Temporal Statis"
			if(usr.Freeze==1)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: Your frozen, you can't use magic"
				return
			if(usr.RolePlaying==0)
				usr<<"You cannot use magic here"
				return
			if(usr.Energy<=0)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: Your out of energy!"
				return
			for(var/obj/B as obj in view(9))
				walk(B,0)
				usr.power += 1
			for(var/mob/C as mob in view(9)-usr)
				if(C.containhollow==1)
					usr.verbs -= new /mob/witch/verb/Freeze
					C.verbs += new /mob/witch/verb/Freeze
					view(9)<<"[C] has taken [usr]'s power using the hollow"
					return
				C:Freeze = 1
				view(9)<<sound("temporalstasis.wav")
				view(9)<<"[C] freezes up"
				usr.power += 1
				usr.Energy -= 10
				if(C.adjust == 1)
					sleep(25)
					C:Freeze = 0
					view(9)<<"[C] unfreezes"
					return
				if(C.Intelligence >= usr.Intelligence)
					sleep(70)
					C:Freeze = 0
					view(9)<<"[C] unfreezes"
					return
				if(C.Intelligence <= usr.Intelligence)
					sleep(150)
					C:Freeze = 0
					view(9)<<"[C] unfreezes"
					return

mob/witch
	verb
		Unfreeze()
			set category = "Skills"
			if(usr.Freeze==1)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: Your frozen, you can't use magic"
				return
			if(usr.RolePlaying==0)
				usr<<"You cannot use magic here"
				return
			if(usr.Energy<=0)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: Your out of energy!"
				return
			for(var/obj/B as obj in view(4))
				walk(B,0)
				usr.power += 1
			for(var/mob/C as mob in view(4)-usr)
				if(C.containhollow==1)
					usr.verbs -= new /mob/witch/verb/Unfreeze
					C.verbs += new /mob/witch/verb/Unfreeze
					view(9)<<"[C] has taken [usr]'s power using the hollow"
					return
				C:Freeze = 0
				view(9)<<"[C] unfreezes"
				view(9)<<sound("temporalstasis.wav")
				usr.Energy -= 5
				usr.power += 1

mob/witch
	verb
		Freeze_Player(mob/M in oview(9))
			set category = "Skills"
			set name = "Temporal Statis Player"
			if(usr.Freeze==1)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: Your frozen, you can't use magic"
				return
			if(usr.RolePlaying==0)
				usr<<"You cannot use magic here"
				return
			if(usr.Energy<=0)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: Your out of energy!"
				return
			if(M.containhollow==1)
				usr.verbs -= new /mob/witch/verb/Freeze_Player
				M.verbs += new /mob/witch/verb/Freeze_Player
				view(9)<<"[M] has taken [usr]'s power using the hollow"
				return
			if(M:shielded==1)
				return
			M.Freeze = 1
			usr.Energy -= 5
			view(9)<<sound("temporalstasis.wav")
			view(9)<<"[M] freezes up"
			if(M.adjust == 1)
				sleep(25)
				M:Freeze = 0
				view(9)<<"[M] unfreezes"
				return
			if(M.Intelligence >= usr.Intelligence)
				sleep(70)
				M:Freeze = 0
				view(9)<<"[M] unfreezes"
				return
			if(M.Intelligence <= usr.Intelligence)
				sleep(150)
				M:Freeze = 0
				view(9)<<"[M] unfreezes"
				return
mob/witch
	verb
		Freeze_Body(mob/M in oview(9))
			set category = "Skills"
			if(usr.Freeze==1)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: Your frozen, you can't use magic"
				return
			if(usr.RolePlaying==0)
				usr<<"You cannot use magic here"
				return
			if(usr.Energy<=0)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: Your out of energy!"
				return
			if(M.containhollow==1)
				usr.verbs -= new /mob/witch/verb/Freeze_Body
				M.verbs += new /mob/witch/verb/Freeze_Body
				view(9)<<"[M] has taken [usr]'s power using the hollow"
				return
			if(M:shielded==1)
				return
			M.Freeze = 1
			usr.Energy -= 5
			view(9)<<sound("temporalstasis.wav")
			view(9)<<"[M] freezes up"
			sleep(10)
			M.Froze = 1
			view(9)<<"[M]'s head unfreezes"
			if(M.adjust == 1)
				sleep(35)
				M:Freeze = 0
				view(9)<<"[M] unfreezes"
				return
			if(M.Intelligence >= usr.Intelligence)
				sleep(100)
				M:Freeze = 0
				view(9)<<"[M] unfreezes"
				return
			if(M.Intelligence <= usr.Intelligence)
				sleep(180)
				M:Freeze = 0
				view(9)<<"[M] unfreezes"
				return
mob/witch
	verb
		Unfreeze_Player(mob/M in oview(9))
			set category = "Skills"
			if(usr.Freeze==1)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: Your frozen, you can't use magic"
				return
			if(usr.RolePlaying==0)
				usr<<"You cannot use magic here"
				return
			if(usr.Energy<=0)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: Your out of energy!"
				return
			if(M.containhollow==1)
				usr.verbs -= new /mob/witch/verb/Unfreeze_Player
				M.verbs += new /mob/witch/verb/Unfreeze_Player
				view(9)<<"[M] has taken [usr]'s power using the hollow"
				return
			M.Freeze = 0
			view(9)<<"[M] unfreezes"
			usr.Energy -= 5
			view(9)<<sound("temporalstasis.wav")
mob/witch
	verb
		Freeze_Object()
			set category = "Skills"
			for(var/obj/O in range(9))
				if(usr.Freeze==1)
					usr<<"<FONT COLOR=yellow>Client information</FONT>: Your frozen, you can't use magic"
					return
				if(usr.RolePlaying==0)
					usr<<"You cannot use magic here"
					return
				if(usr.Energy<=0)
					usr<<"<FONT COLOR=yellow>Client information</FONT>: Your out of energy!"
					return
				walk(O,0)
				usr.Energy -= 5
				view(9)<<sound("temporalstasis.wav")

///////////////////
mob/demon
	verb
		shimmer()		//attack a mob within 1 tile of you
			set category = "Skills"
			set name = "Shimmer"
			if(usr.Freeze==1)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: Your frozen, you can't use magic"
				return
			if(usr.Energy<=0)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: Your out of energy!"
				return
			if(usr.Selforb == 0)
				usr.Selforb = 1
				usr.density = 0
				usr.power += 1
				usr.Exposing_Magic()
				usr.overlays = new /obj/shimer/shimer1
				view(9)<< "[usr] shimmers away"
				usr.Energy -= 5
				spawn(1)
					usr.overlays = null
					usr.overlays += new /obj/shimer/shimer2
					spawn(1)
						usr.overlays = null
						usr.overlays += new /obj/shimer/shimer3
						spawn(1)
							usr.overlays = null
							usr.overlays += new /obj/shimer/shimer4
							spawn(1)
								usr.overlays = null
								usr.icon = null
								usr.overlays += new /obj/shimer/shimer5
								spawn(1)
									usr.overlays = null
									usr.overlays += new /obj/shimer/shimer6


			else
				usr.Selforb = 0
				usr.density = 1
				usr.icon = new /mob/goodwitch()
				usr.overlays = new /obj/shimer/shimer6
				view(9)<< "[usr] shimmers in"
				usr.Exposing_Magic()
				usr.Energy -= 5
				spawn(1)
					usr.overlays = null
					usr.overlays += new /obj/shimer/shimer5
					spawn(1)
						usr.overlays = null
						usr.overlays += new /obj/shimer/shimer4
						spawn(1)
							usr.overlays = null
							usr.overlays += new /obj/shimer/shimer3
							spawn(1)
								usr.overlays = null
								usr.overlays += new /obj/shimer/shimer2
								spawn(1)
									usr.overlays = null
									usr.overlays = new /obj/shimer/shimer1
									spawn(1)
										usr.overlays = null

mob/demon
	verb
		shimmer_long(var/mob/M in world)		//attack a mob within 1 tile of you
			set category = "Skills"
			set name = "Shimmer long"
			if(usr.Freeze==1)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: Your frozen, you can't use magic"
				return
			if(usr.RolePlaying == 0)
				usr<<"Your not roleplaying"
				return
			if(usr.Energy<=0)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: Your out of energy!"
				return
			if(usr.death==1)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: You are death"
				return
			if(M.death==1)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: [M] is death"
				return
			if(M.erased==1)
				return
			if(M.RolePlaying == 0)
				usr<<"[M] isnt roleplaying"
				return
			if(usr.good==1 && M.indemonschool==1)
				return
			if(usr.evil==1 && M.inmagicschool==1)
				return
			if(usr.neutral==1)
				if(M.indemonschool==1||M.inmagicschool==1)
					return
			if(usr.evil==1 && M.indemonschool==1)
				usr.indemonschool=1
			if(usr.good==1 && M.inmagicschool==1)
				usr.inmagicschool=1
			if(M.block_tele==1)
				switch(alert(M,"[src] is trying to teleport to you! Allow [src] to come to you?","","Yes","No"))
					if("Yes")
						..()
					if("No")
						src<<"You cant sense [M]"
						return
			if(M.name == "Elder")
				usr<<"You dont know the location of the Elders"
				return
			if(M.name == "GrandElder")
				usr<<"You dont know the location of the Elders"
				return
			if(M.name == "FirstTimePlayer")
				usr<<"You cannot teleport to this"
				return
				usr<<"You cant sense [M]"
				return
			if(M.name == "The Hollow")
				usr<<"You dont know the location of the hollow"
				return
			if(usr.erased==1)
				return
			if(M.inheaven==1)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: You cannot go to this personne"
				return
			if(M.inhell==1)
				usr.inhell = 1
			if(M.inhell==0)
				usr.inhell = 0
			usr.power += 1
			usr.overlays = new /obj/shimer/shimer1
			view(9)<< "[usr] shimmers away"
			usr.Exposing_Magic()
			usr.Energy -= 10
			spawn(1)
				usr.overlays = null
				usr.overlays += new /obj/shimer/shimer2
				spawn(1)
					usr.overlays = null
					usr.overlays += new /obj/shimer/shimer3
					spawn(1)
						usr.overlays = null
						usr.overlays += new /obj/shimer/shimer4
						spawn(1)
							usr.overlays = null
							usr.icon = null
							usr.overlays += new /obj/shimer/shimer5
							spawn(1)
								usr.overlays = null
								usr.overlays += new /obj/shimer/shimer6
								usr.icon = new /mob/goodwitch()
								src.x = M:x
								src.y = M:y+1
								src.z = M:z
								src.dir = SOUTH
								M << "[src.name] orbed behind you!!!"
								spawn(1)
									usr.overlays = null
									usr.overlays += new /obj/shimer/shimer5
									spawn(1)
										usr.overlays = null
										usr.overlays += new /obj/shimer/shimer4
										spawn(1)
											usr.overlays = null
											usr.overlays += new /obj/shimer/shimer3
											spawn(1)
												usr.overlays = null
												usr.overlays += new /obj/shimer/shimer2
												spawn(1)
													usr.overlays = null
													usr.overlays = new /obj/shimer/shimer1
													spawn(1)
														usr.overlays = null
														usr.Selforb = 0
														usr.density = 1

mob/demon
	verb
		Shimmer_other(mob/M in view(9))		//attack a mob within 1 tile of you
			set name = "Shimmer Player"
			set category = "Skills"
			if(usr.Freeze==1)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: Your frozen, you can't use magic"
				return
			if(usr.Energy<=0)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: Your out of energy!"
				return
			var/mob/X = input("Choose a target:","Target") as mob in world
			if(M.RolePlaying==0)
				usr<<"[M] isnt roleplaying"
				return
			if(X.RolePlaying==0)
				usr<<"[X] isnt roleplaying"
				return
			if(usr.Selforb == 1||M.Selforb==1)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: Not while orbing"
				return
			if(X.inheaven==1)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: You cannot send someone there"
				return
			if(M.inhell==1)
				M.inhell = 0
				..()
			if(M.good==1 && X.indemonschool==1)
				return
			if(M.evil==1 && X.inmagicschool==1)
				return
			if(M.neutral==1)
				if(X.indemonschool==1||X.inmagicschool==1)
					return
			if(X.block_tele==1)
				switch(alert(X,"[M] is being teleported to you! Allow [M] to come to you?","","Yes","No"))
					if("Yes")
						..()
					if("No")
						usr<<"You cant sense [X]"
						return
			if(X.inhell==1)
				M.inhell = 1
				..()
			usr.power += 1
			view(9)<< "[M] gets shimmered away"
			usr.Exposing_Magic()
			usr.Energy -= 10
			M.overlays = new /obj/shimer/shimer1
			spawn(1)
				M.overlays = null
				M.overlays += new /obj/shimer/shimer2
				spawn(1)
					M.overlays = null
					M.overlays += new /obj/shimer/shimer3
					spawn(1)
						M.overlays = null
						M.overlays += new /obj/shimer/shimer4
						spawn(1)
							M.overlays = null
							M.icon = null
							M.overlays += new /obj/shimer/shimer5
							spawn(1)
								M.overlays = null
								M.overlays += new /obj/shimer/shimer6
								spawn(1)
									usr.overlays = null
									spawn(1)
										M.overlays = null
										M.x = X:x
										M.y = X:y+1
										M.z = X:z
										M.dir = SOUTH
										X << "[M.name] shimmers behind you!!!"
										M.overlays += new /obj/shimer/shimer6
										spawn(1)
											M.overlays = null
											M.overlays += new /obj/shimer/shimer5
											spawn(1)
												M.overlays = null
												M.icon = new /mob/goodwitch()
												M.overlays += new /obj/shimer/shimer4
												spawn(1)
													M.overlays = null
													M.overlays += new /obj/shimer/shimer3
													spawn(1)
														M.overlays = null
														M.overlays += new /obj/shimer/shimer2
														spawn(1)
															M.overlays = null
															M.overlays += new /obj/shimer/shimer1
															spawn(1)
																M.overlays = null
																M.Selforb = 0
																M.density = 1


mob/demon
	verb
		shimmer_place()		//attack a mob within 1 tile of you
			set category = "Skills"
			set name = "Shimmer place"
			var/default_value = "Earth"
			var/list/places = list("Earth", "Hell Entrance", "Underworld","Demon school", "Charmed manor", "Park", "Julian's House", "Kyros House", "DragoWings House", "Graveyard", "The Ultimate")
			choose_place = input(usr, default_value) in places
			switch(choose_place)
				if("Earth")
					usr.place = "Earth"
				if("Hell Entrance")
					usr.place = "Hell"
				if("Underworld")
					usr.place = "Hell2"
				if("Demon school")
					usr.place = "Demon school"
				if("Charmed manor")
					usr.place = "Charmed"
				if("Park")
					usr.place = "Park"
				if("Julian's House")
					usr.place = "SyncWolf"
				if("Kyros House")
					usr.place = "Zeniox"
				if("DragoWings House")
					usr.place = "Drago"
				if("Graveyard")
					usr.place = "Graveyard"
				if("The Ultimate")
					usr.place = "Ultimate"
			if(usr.Freeze==1)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: Your frozen, you can't use magic"
				return
			if(usr.RolePlaying == 0)
				usr<<"Your not roleplaying"
				return
			if(usr.Energy<=0)
				usr<<"<FONT COLOR=yellow>Client information</FONT>: Your out of energy!"
				return
			if(usr.death==1)
				usr<<"You are death"
				return
			if(usr.erased==1)
				return
			else
				usr.power += 1
				usr.overlays = new /obj/shimer/shimer1
				view(9)<< "[usr] shimmers away"
				usr.Exposing_Magic()
				usr.Energy -= 10
				spawn(1)
					usr.overlays = null
					usr.overlays += new /obj/shimer/shimer2
					spawn(1)
						usr.overlays = null
						usr.overlays += new /obj/shimer/shimer3
						spawn(1)
							usr.overlays = null
							usr.overlays += new /obj/shimer/shimer4
							spawn(1)
								usr.overlays = null
								usr.icon = null
								usr.overlays += new /obj/shimer/shimer5
								spawn(1)
									usr.overlays = null
									usr.overlays += new /obj/shimer/shimer6
									usr.icon = new /mob/goodwitch()
									if(usr.place=="Earth")
										usr.loc = locate(/turf/Area/Earth)
										usr.inhell = 0
									if(usr.place=="Hell")
										usr.loc = locate(/turf/Area/Hell)
										usr.inhell = 0
									if(usr.place=="Hell2")
										usr.loc = locate(/turf/Area/Hell2)
										usr.inhell = 0
									if(usr.place=="Demon school")
										usr.loc = locate(/turf/Area/DemonSchool)
									if(usr.place=="Charmed")
										usr.loc = locate(/turf/Area/Charmed)
										usr.inhell = 0
									if(usr.place=="Park")
										usr.loc = locate(/turf/Area/Park)
										usr.inhell = 0
									if(usr.place=="SyncWolf")
										usr.loc = locate(/turf/Area/SyncWolfsHouse)
										usr.inhell = 0
									if(usr.place=="Zeniox")
										usr.loc = locate(/turf/Area/ZenioxHouse)
										usr.inhell = 0
									if(usr.place=="Drago")
										usr.loc = locate(/turf/Area/DragowingHouse)
										usr.inhell = 0
									if(usr.place=="Graveyard")
										usr.loc = locate(/turf/Area/Graveyard)
										usr.inhell = 0
									if(usr.place=="Ultimate")
										usr.loc = locate(/turf/Area/Ultimate)
										usr.inhell = 0
									spawn(1)
										usr.overlays = null
										usr.overlays += new /obj/shimer/shimer5
										spawn(1)
											usr.overlays = null
											usr.overlays += new /obj/shimer/shimer4
											spawn(1)
												usr.overlays = null
												usr.overlays += new /obj/shimer/shimer3
												spawn(1)
													usr.overlays = null
													usr.overlays += new /obj/shimer/shimer2
													spawn(1)
														usr.overlays = null
														usr.overlays = new /obj/shimer/shimer1
														spawn(1)
															usr.overlays = null
															usr.Selforb = 0
															usr.density = 1

atom
	var
		shimerexept

mob/darklighter
	verb
		Join_black_orb()
			if(usr.dlorbexept == 0)
				usr.dlorbexept = 1
				usr<<"You will join with orb"
			else
				usr.dlorbexept = 0
				usr<<"You will no longer join with orb"
atom
	var
		dlorbexept = 0

mob/demon
	verb
		Join_shimmer()
			if(usr.shimerexept == 0)
				usr.shimerexept = 1
				usr<<"You will join with shimer"
			else
				usr.shimerexept = 0
				usr<<"You will no longer join with shimer"
mob/demon
	verb
		shimmer_with_people(var/mob/M in world)		//attack a mob within 1 tile of you
			set category = "Skills"
			set name = "Shimmer surrounding"
			if(usr.Freeze==1)
				usr<<"Your frozen, you can't use magic"
				return
			if(usr.RolePlaying == 0)
				usr<<"Your not roleplaying"
				return
			if(usr.Energy<=0)
				usr<<"You don't have the energy to do this"
				return
			if(usr.death==1)
				usr<<"You are death"
				return
			if(M.death==1)
				usr<<"[M] is death"
				return
			if(M.erased==1)
				usr<<"You cannot sense the erased personne"
				return
			if(usr.erased==1)
				usr<<"You have been erased, there is no leaving here"
				return
			if(M.RolePlaying == 0)
				usr<<"[M] isnt roleplaying"
				return
			if(usr.good==1 && M.indemonschool==1)
				return
			if(usr.evil==1 && M.inmagicschool==1)
				return
			if(usr.neutral==1)
				if(M.indemonschool==1||M.inmagicschool==1)
					return
			if(usr.evil==1 && M.indemonschool==1)
				usr.indemonschool=1
			if(usr.good==1 && M.inmagicschool==1)
				usr.inmagicschool=1
			if(M.block_tele==1)
				switch(alert(M,"[src] is trying to teleport to you! Allow [src] to come to you?","","Yes","No"))
					if("Yes")
						..()
					if("No")
						src<<"You cant sense [M]"
						return
			if(M.inheaven==1)
				usr<<"You cannot go to this personne"
				return
			if(M.inhell==1)
				usr.inhell = 1
			if(M.inhell==0)
				usr.inhell = 0
			if(usr.world == M)
				for(var/mob/P as mob in range(2,usr))
					if(P.shimerexept == 1)
						usr.Exposing_Magic()
						usr.power += 1
						usr.Energy -= 15
						usr.overlays = new /obj/shimer/shimer1
						P.overlays = new /obj/shimer/shimer1
						spawn(1)
							usr.overlays = null
							P.overlays = null
							usr.overlays += new /obj/shimer/shimer2
							P.overlays += new /obj/shimer/shimer2
							spawn(1)
								P.overlays = null
								P.overlays += new /obj/shimer/shimer3
								usr.overlays = null
								usr.overlays += new /obj/shimer/shimer3
								spawn(1)
									P.overlays = null
									P.overlays += new /obj/shimer/shimer4
									usr.overlays = null
									usr.overlays += new /obj/shimer/shimer4
									spawn(1)
										P.overlays = null
										P.icon = null
										P.overlays += new /obj/shimer/shimer5
										usr.overlays = null
										usr.icon = null
										usr.overlays += new /obj/shimer/shimer5
										spawn(1)
											P.overlays = null
											P.overlays += new /obj/shimer/shimer6
											usr.overlays = null
											usr.overlays += new /obj/shimer/shimer6
											spawn(1)
												usr.overlays = null
												src.x = M:x
												src.y = M:y+1
												src.z = M:z
												src.dir = SOUTH
												P.loc = locate(usr.x,usr.y,usr.z)
												if(M.inhell==1)
													P.inhell = 1
													..()
												M << "[src.name] orbed behind you!!!"
												P.overlays = new /obj/shimer/shimer6
												usr.overlays = new /obj/shimer/shimer6
												spawn(1)
													P.overlays = null
													usr.overlays = null
													P.overlays += new /obj/shimer/shimer5
													usr.overlays += new /obj/shimer/shimer5
													spawn(1)
														P.overlays = null
														usr.overlays = null
														P.overlays += new /obj/shimer/shimer4
														usr.overlays += new /obj/shimer/shimer4
														spawn(1)
															P.overlays = null
															usr.overlays = null
															P.overlays += new /obj/shimer/shimer3
															usr.overlays += new /obj/shimer/shimer3
															spawn(1)
																P.overlays = null
																usr.overlays = null
																P.icon = new /mob/goodwitch()
																P.overlays += new /obj/shimer/shimer2
																usr.icon = new /mob/goodwitch()
																usr.overlays += new /obj/shimer/shimer2
																spawn(1)
																	P.overlays = null
																	usr.overlays = null
																	P.overlays += new /obj/shimer/shimer1
																	usr.overlays += new /obj/shimer/shimer1
																	spawn(1)
																		P.overlays = null
																		usr.overlays = null
																		usr.Selforb = 0
																		usr.density = 1



			else
				for(var/mob/P as mob in range(2,usr))
					if(P.shimerexept == 1)
						usr.power += 1
						usr.Energy -= 15
						usr.Exposing_Magic()
						usr.overlays = new /obj/shimer/shimer1
						P.overlays = new /obj/shimer/shimer1
						spawn(1)
							usr.overlays = null
							P.overlays = null
							usr.overlays += new /obj/shimer/shimer2
							P.overlays += new /obj/shimer/shimer2
							spawn(1)
								P.overlays = null
								P.overlays += new /obj/shimer/shimer3
								usr.overlays = null
								usr.overlays += new /obj/shimer/shimer3
								spawn(1)
									P.overlays = null
									P.overlays += new /obj/shimer/shimer4
									usr.overlays = null
									usr.overlays += new /obj/shimer/shimer4
									spawn(1)
										P.overlays = null
										P.icon = null
										P.overlays += new /obj/shimer/shimer5
										usr.overlays = null
										usr.icon = null
										usr.overlays += new /obj/shimer/shimer5
										spawn(1)
											P.overlays = null
											P.overlays += new /obj/shimer/shimer6
											usr.overlays = null
											usr.overlays += new /obj/shimer/shimer6
											spawn(1)
												usr.overlays = null
												src.x = M:x
												src.y = M:y+1
												src.z = M:z
												src.dir = SOUTH
												if(M.inhell==1)
													P.inhell = 1
													..()
												P.loc = locate(usr.x,usr.y,usr.z)
												M << "[src.name] orbed behind you!!!"
												P.overlays = new /obj/shimer/shimer6
												usr.overlays = new /obj/shimer/shimer6
												spawn(1)
													P.overlays = null
													usr.overlays = null
													P.overlays += new /obj/shimer/shimer5
													usr.overlays += new /obj/shimer/shimer5
													spawn(1)
														P.overlays = null
														usr.overlays = null
														P.overlays += new /obj/shimer/shimer4
														usr.overlays += new /obj/shimer/shimer4
														spawn(1)
															P.overlays = null
															usr.overlays = null
															P.overlays += new /obj/shimer/shimer3
															usr.overlays += new /obj/shimer/shimer3
															spawn(1)
																P.overlays = null
																usr.overlays = null
																P.icon = null
																P.overlays += new /obj/shimer/shimer2
																usr.icon = null
																usr.overlays += new /obj/shimer/shimer2
																spawn(1)
																	P.overlays = null
																	usr.overlays = null
																	P.overlays += new /obj/shimer/shimer1
																	usr.overlays += new /obj/shimer/shimer1
																	spawn(1)
																		P.overlays = null
																		usr.overlays = null
																		usr.Selforb = 0
																		usr.density = 1
obj/shimer
	shimer1
		icon = 'magic.dmi'
		icon_state = "1"
		layer = MOB_LAYER
obj/shimer
	shimer2
		icon = 'magic.dmi'
		icon_state = "2"
		layer = MOB_LAYER
obj/shimer
	shimer3
		icon = 'magic.dmi'
		icon_state = "3"
		layer = MOB_LAYER
obj/shimer
	shimer4
		icon = 'magic.dmi'
		icon_state = "4"
		layer = MOB_LAYER
obj/shimer
	shimer5
		icon = 'magic.dmi'
		icon_state = "5"
		layer = MOB_LAYER
obj/shimer
	shimer6
		icon = 'magic.dmi'
		icon_state = "6"
		layer = MOB_LAYER

////////////////////////////////////
////////////////////////////////////
mob/whitelighter
	verb
		Orb_object(atom/M as obj in oview(5,usr))		//attack a mob within 1 tile of you
			set category = "Skills"
			if(usr.Freeze==1)
				usr<<"Your frozen, you can't use magic"
				return
			if(usr.Energy<=0)
				usr<<"You don't have the energy to do this"
				return
			if(usr.Selforb == 0)
				if(M == null)
					return
				else
					usr.power += 1
					usr.Exposing_Magic()
					usr.Energy -= 5
					M.density = 0
					M.overlays += new /obj/orbo/orbingobj1
					view(9)<< "[usr] moves [M]"
					view(6)<<sound("OrbingTelek.wav")
					spawn(1)
						if(M == null)
							return
						else
							M.overlays = null
							M.overlays += new /obj/orbo/orbingobj2
						spawn(1)
							if(M == null)
								return
							else
								M.overlays = null
								M.overlays += new /obj/orbo/orbingobj3
								spawn(1)
									if(M == null)
										return
									else
										M.overlays = null
										M.overlays += new /obj/orbo/orbingobj4
										spawn(1)
											if(M == null)
												return
											else
												M.overlays = null
												M.icon = null
												M.overlays += new /obj/orbo/orbingobj5
												spawn(1)
													if(M == null)
														return
													else
														M.overlays = null
														M.overlays += new /obj/orbo/orbingobj6
														spawn(1)
															if(M == null)
																return
															else
																M.overlays = null
																M.overlays += new /obj/orbo/orbingobj7
																spawn(1)
																	if(M == null)
																		return
																	else
																		M.overlays = null
																		M.overlays += new /obj/orbo/orbingobj8
																		step(M,usr.dir)
																		spawn(1)
																			if(M == null)
																				return
																			else
																				step(M,usr.dir)
																				spawn(2)
																					if(M == null)
																						return
																					else
																						M.overlays = null
																						M.icon = new /obj/tile44()
																						M.density = 1
			else
				usr<<"You cant do this while orbing"

obj/orbo
	orbingobj1
		icon = 'magicgood.dmi'
		icon_state = "obj1"
		layer = MOB_LAYER
obj/orbo
	orbingobj2
		icon = 'magicgood.dmi'
		icon_state = "obj2"
		layer = MOB_LAYER
obj/orbo
	orbingobj3
		icon = 'magicgood.dmi'
		icon_state = "obj3"
		layer = MOB_LAYER
obj/orbo
	orbingobj4
		icon = 'magicgood.dmi'
		icon_state = "obj4"
		layer = MOB_LAYER
obj/orbo
	orbingobj5
		icon = 'magicgood.dmi'
		icon_state = "obj5"
		layer = MOB_LAYER
obj/orbo
	orbingobj6
		icon = 'magicgood.dmi'
		icon_state = "obj6"
		layer = MOB_LAYER
obj/orbo
	orbingobj7
		icon = 'magicgood.dmi'
		icon_state = "obj7"
		layer = MOB_LAYER
obj/orbo
	orbingobj8
		icon = 'magicgood.dmi'
		icon_state = "obj8"
		layer = MOB_LAYER
/////////////////////////////////////
/////////////////////////////////////
/////////////////////////////////////
obj/MouseDrag()if(istype(usr,/mob/witch))mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)
obj/New()
	..()
	mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)


obj/MouseDrop(o_o,s_l,o_l) //make it so if an object has been dragged to someplace...
	if(usr.TelekinesisAdvanced==2) //make sure it's a witch doing it.
		if(usr.Freeze==1)
			usr<<"Your frozen, you can't use magic"
			return
		if(isturf(o_l)) //making sure it was dropped on the map, and not in a statpanel or off the map
			if(usr.Energy<=0)
				usr<<"You don't have the energy to do this"
				return
			if(usr.Selforb)usr<<"You can't do this while orbing."
			else
				walk_towards(src,o_l)
				usr.Exposing_Magic()
				view(9)<<sound("Telekinesis.wav")
				usr:Energy -= 5
				usr:power+=1
		else usr<<"You can't just drop this into your inventory!"

	else usr<<"You do not possess the ability to do this!"
mob/MouseDrop(o_o,s_l,o_l) //make it so if an object has been dragged to someplace...
	if(usr.TelekinesisAdvanced==2) //make sure it's a witch doing it.
		if(usr.Freeze==1)
			usr<<"Your frozen, you can't use magic"
			return
		if(isturf(o_l)) //making sure it was dropped on the map, and not in a statpanel or off the map
			if(usr.Energy<=0)
				usr<<"You don't have the energy to do this"
				return
			if(usr.Selforb)usr<<"You can't do this while orbing."
			else
				walk_towards(src,o_l)
				usr.Exposing_Magic()
				view(9)<<sound("Telekinesis.wav")
				usr:Energy -= 5
				usr:power+=1
		else usr<<"You can't just drop this into your inventory!"

	else usr<<"You do not possess the ability to do this!"

mob/witch
	verb
		Telekinesis_basic(atom/M as obj in range(9,usr))		//attack a mob within 1 tile of you
			set category = "Skills"
			if(usr.Freeze==1)
				usr<<"Your frozen, you can't use magic"
				return
			if(usr.Energy<=0)
				usr<<"You don't have the energy to do this"
				return
			if(usr.Selforb == 0)
				usr.power += 1
				usr.Energy -= 5
				usr.Exposing_Magic()
				view(9)<<sound("Telekinesis.wav")
				step(M,usr.dir)
				spawn(2)
					step(M,usr.dir)
			else
				usr<<"You cant do this while orbing"
mob/witch
	verb
		Telekinesis_Advanced(mob/M as mob in range(9,usr))		//attack a mob within 1 tile of you
			set category = "Skills"
			set name = "Telekinesis Player"
			if(usr.Freeze==1)
				usr<<"Your frozen, you can't use magic"
				return
			if(usr.Energy<=0)
				usr<<"You don't have the energy to do this"
				return
			if(M.containhollow==1)
				usr.verbs -= new /mob/witch/verb/Telekinesis_Advanced
				M.verbs += new /mob/witch/verb/Telekinesis_Advanced
				view(9)<<"[M] has taken [usr]'s power using the hollow"
				return
			if(usr.Selforb == 0)
				usr.power += 1
				usr.Energy -= 5
				view(6)<<sound("Telekinesis.wav")
				usr.Exposing_Magic()
				step(M,usr.dir)
				spawn(2)
					step(M,usr.dir)
					spawn(2)
						step(M,usr.dir)
						spawn(2)
							step(M,usr.dir)
							spawn(2)
								step(M,usr.dir)
			else
				usr<<"You cant do this while orbing"

		Telekinesis_Repel()
			set category = "Skills"
			set name = "Telekinesis Personne"
			for(var/mob/M as mob in range(5,usr)-usr)
				if(usr.Freeze==1)
					usr<<"Your frozen, you can't use magic"
					return
				if(usr.Energy<=0)
					usr<<"You don't have the energy to do this"
					return
				if(M.containhollow==1)
					usr.verbs -= new /mob/witch/verb/Telekinesis_Repel
					M.verbs += new /mob/witch/verb/Telekinesis_Repel
					view(9)<<"[M] has taken [usr]'s power using the hollow"
					return
				if(M.Selforb==1)
					return
				if(usr.Selforb == 0)
					usr.power += 1
					usr.Energy -= 5
					view(6)<<sound("Telekinesis.wav")
					usr.Exposing_Magic()
					step_away(M,usr)
					spawn(2)
						step_away(M,usr)
						spawn(2)
							step_away(M,usr)
							spawn(2)
								step_away(M,usr)
								spawn(2)
									step_away(M,usr)
									spawn(2)
										step_away(M,usr)
										spawn(2)
											step_away(M,usr)
				else
					usr<<"You cant do this while orbing"

		Telekinesis_Blast(mob/M as mob in range(5,usr)-usr)		//attack a mob within 1 tile of you
			set category = "Skills"
			set name = "Telekinesis Personne"
			if(usr.Freeze==1)
				usr<<"Your frozen, you can't use magic"
				return
			if(usr.Energy<=0)
				usr<<"You don't have the energy to do this"
				return
			if(M.containhollow==1)
				usr.verbs -= new /mob/witch/verb/Telekinesis_Blast
				M.verbs += new /mob/witch/verb/Telekinesis_Blast
				view(9)<<"[M] has taken [usr]'s power using the hollow"
				return
			if(M.Selforb==1)
				return
			if(usr.Selforb == 0)
				usr.power += 1
				usr.Energy -= 5
				view(6)<<sound("Telekinesis.wav")
				usr.Exposing_Magic()
				step(M,usr.dir)
				spawn(2)
					step(M,usr.dir)
					spawn(2)
						step(M,usr.dir)
						spawn(2)
							step(M,usr.dir)
							spawn(2)
								step(M,usr.dir)
								spawn(2)
									step(M,usr.dir)
									spawn(2)
										step(M,usr.dir)
										M.health -= usr.Strength
										if(M.Whitelighter==1)
											M.Whitelighter_Death()
											return
										usr.deathcheck(M)
			else
				usr<<"You cant do this while orbing"

/*		Telekinesis_Reversal(obj/O in range(9,usr))		//attack a mob within 1 tile of you
			set category = "Skills"
			if(usr.Freeze==1)
				usr<<"Your frozen, you can't use magic"
				return
			if(usr.Energy<=0)
				usr<<"You don't have the energy to do this"
				return
			if(usr.Selforb == 0)
				usr.power += 1
				usr.Energy -= 5
				view(9)<<sound("Telekinesis.wav")
				usr.Exposing_Magic()
				walk_away(O,usr.dir)
				spawn(5)
					step_away(O,usr.dir)
					spawn(5)
						step_away(O,usr.dir)
						spawn(5)
							step_away(O,usr.dir)
							spawn(5)
								step_away(O,usr.dir)
								spawn(5)
									step_away(O,usr.dir)
			else
				usr<<"You cant do this while orbing"*/

		Telekinesis_Reversal()		//attack a mob within 1 tile of you
			set category = "Skills"
			for(var/obj/O in oview())
				if(usr.Freeze==1)
					usr<<"Your frozen, you can't use magic"
					return
				if(usr.Energy<=0)
					usr<<"You don't have the energy to do this"
					return
				if(usr.Selforb == 0)
					usr.power += 1
					usr.Energy -= 5
					view(9)<<sound("Telekinesis.wav")
					usr.Exposing_Magic()
					step(O,usr.dir)
					spawn(5)
						step(O,usr.dir)
						spawn(5)
							step(O,usr.dir)
				else
					usr<<"You cant do this while orbing"

		Telekinesis_Rage()
			set category ="Skills"
			if(usr.Freeze==1)
				usr<<"Your frozen, you can't use magic"
				return
			if(usr.Energy<=0)
				usr<<"You don't have the energy to do this"
				return
			if(usr.Selforb == 0)
				usr.power += 1
				usr.Energy -= 10
				view(9)<<sound("Telekinesis.wav")
				usr.Exposing_Magic()
				for(var/mob/M in oview(7)-usr)
					if(M.Selforb==1)
						return
					step_away(M,usr)
					spawn(5)
						step_away(M,usr)
						spawn(5)
							step_away(M,usr)
							spawn(5)
								step_away(M,usr)
								spawn(5)
									step_away(M,usr)
									spawn(5)
										M.health -= usr.power/2
										if(M.Whitelighter==1)
											M.Whitelighter_Death()
											return
										usr.deathcheck(M)

mob/whitelighter
	verb
		Heal(mob/M as mob in range(7,usr))		//attack a mob within 1 tile of you
			set category = "Skills"
			if(usr.Freeze==1)
				usr<<"Your frozen, you can't use magic"
				return
			if(usr.Energy<=0)
				usr<<"You don't have the energy to do this"
				return
			if(M.containhollow==1)
				usr.verbs -= new /mob/whitelighter/verb/Heal
				M.verbs += new /mob/whitelighter/verb/Heal
				view(9)<<"[M] has taken [usr]'s power using the hollow"
				return
			if(usr.Selforb == 0)
				for(var/mob/P as mob in range(2,usr))
					P.overlays = new /obj/orb/orbing1
					usr.Exposing_Magic()
					spawn(1)
						P.overlays = null
						P.overlays += new /obj/orb/orbing2
						spawn(1)
							P.overlays = null
							P.overlays = new /obj/orb/orbing1
							spawn(1)
								P.overlays = null
								P.overlays += new /obj/orb/orbing2
								spawn(1)
									P.overlays = null
									P.overlays += new /obj/orb/orbing1
									spawn(1)
										P.overlays = null
										P.health = P.maxhealth
										P.Energy = P.maxEnergy
			else
				usr<<"You cant do this while orbing"
/////////////////////////////////////
/////////////////////////////////////
/////////////////////////////////////
Glamouring
mob/witch
	verb
		/*Astroprojection()
			set name = "Astral Projection"
			set category = "Skills"
			if(usr.Freeze==1)
				usr<<"Your frozen, you can't use magic"
				return
			if(usr.Energy<=0)
				usr<<"You don't have the energy to do this"
				return
			if(usr.Selforb == 0)
				if(usr.astroproj == 0)
					usr.power += 1
					usr.Energy -= 5
					usr.astroproj = 1
					var/atom/O = new usr.type(usr.loc)
					O.dir = usr.dir
					usr.icon = null
					usr.density = 0
					step(usr,O.dir)
					step(usr,O.dir)
					step(usr,O.dir)
					view(9)<<sound("astralprojection.wav")
					usr.Exposing_Magic()
					view(9)<< "[usr] astral projects"
					usr.overlays = new /obj/astro/astro1
					spawn(1)
						usr.overlays = null
						usr.overlays += new /obj/astro/astro2
						spawn(1)
							usr.overlays = null
							usr.overlays += new /obj/astro/astro3
							spawn(1)
								usr.overlays = null
								usr.overlays += new /obj/astro/astro4
								spawn(1)
									usr.overlays = null
									usr.icon = null
									usr.overlays += new /obj/astro/astro5
									spawn(1)
										usr.overlays = null
										usr.icon = new /mob/goodwitch()
										spawn(1)
											usr.overlays = null
											usr.overlays += new /obj/astro/astro5
											spawn(1)
												usr.overlays = null
												usr.overlays += new /obj/astro/astro4
												spawn(1)
													usr.overlays = null
													usr.overlays += new /obj/astro/astro3
													spawn(1)
														usr.overlays = null
														usr.overlays += new /obj/astro/astro2
														spawn(1)
															usr.overlays = null
															usr.overlays = new /obj/astro/astro1
															spawn(1)
																usr.overlays = null
				else
					var/atom/O = new usr.type(usr.loc)
					usr.overlays = new /obj/astro/astro1
					view(9)<< "[usr] astral projects"
					usr.Exposing_Magic()
					spawn(1)
						usr.overlays = null
						usr.overlays += new /obj/astro/astro2
						spawn(1)
							usr.overlays = null
							usr.overlays += new /obj/astro/astro3
							spawn(1)
								usr.overlays = null
								usr.overlays += new /obj/astro/astro4
								spawn(1)
									usr.overlays = null
									usr.icon = null
									usr.overlays += new /obj/astro/astro5
									spawn(1)
										usr.overlays = null
										usr.overlays += new /obj/astro/astro5
										spawn(1)
											usr.overlays = null
											usr.overlays = new /obj/astro/astro4
											spawn(1)
												usr.overlays = null
												usr.overlays = new /obj/astro/astro3
												spawn(1)
													usr.overlays = null
													usr.overlays = new /obj/astro/astro2
													spawn(1)
														usr.overlays = null
														usr.overlays = new /obj/astro/astro1
														usr.overlays = null
														usr.icon = new /mob/goodwitch()
														usr.loc = O.loc
														del(O)
														usr.density = 1
														usr.astroproj = 0

			else
				usr<<"You cant do this while orbing"*/

/*		Astroprojection()
			set category = "Skills"
			set name = "Astral Projection"
			set category = "Skills"
			if(usr.Freeze==1)
				usr<<"Your frozen, you can't use magic"
				return
			if(usr.Energy<=0)
				usr<<"You don't have the energy to do this"
				return
			if(usr.Selforb == 0)
				usr.power += 1
				usr.Energy -= 5
				usr.astroproj = 1
				var/place = usr.x
				var/place2 = usr.y
				var/place3 = usr.z
				var/mob/F = new /mob/Whitelighter()
			//	var/obj/npcs/F = new /obj/npcs/Astral()
				F:name = "[usr]"
				F:icon = usr.original_icon
				F.owner = usr
				usr.Oicon = usr.icon
				usr.icon_state = "whitelighter"
				sleep(5)
			//	usr.icon_state=""
				F:overlays += usr.overlays
				F.owner = usr
				usr.astrallocx = place
				usr.astrallocy = place2
				usr.astrallocz = place3
				if(usr.dir==NORTH)
					place2=place2 + 1
				if(usr.dir==SOUTH)
					place2=place2 - 1
				if(usr.dir==WEST)
					place=place - 1
				if(usr.dir==EAST)
					place=place + 1
				F:loc = locate(usr.x,usr.y,usr.z)
				usr.loc=locate(place,place2,place3)
			//	F:icon_state=""
				usr.power += 1
				usr<<"You Astral Project"
				usr.Exposing_Magic()
				view(usr)<<"[usr], used Astral Projection"
				F.density=1
				usr.astroproj = 1
				return
			else
				usr.icon_state=usr.original_icon
				sleep(5)
			//	usr.icon_state=""
				usr.loc= astral            //locate(usr.astrallocx,usr.astrallocy,usr.astrallocz)
			//	usr.icon_state=""
				usr.astroproj = 0
				usr.astrallocx=null
				usr.astrallocy=null
				usr.astrallocz=null
				usr<<"You Astral Projected back into your body"
				for(var/mob/A in world)
					if(A.owner==usr)
						del(A)
				return*/

obj/astro
	astro1
		icon = 'magicgood.dmi'
		icon_state = "astro1"
		layer = MOB_LAYER
obj/astro
	astro2
		icon = 'magicgood.dmi'
		icon_state = "astro2"
		layer = MOB_LAYER
obj/astro
	astro3
		icon = 'magicgood.dmi'
		icon_state = "astro3"
		layer = MOB_LAYER
obj/astro
	astro4
		icon = 'magicgood.dmi'
		icon_state = "astro4"
		layer = MOB_LAYER
obj/astro
	astro5
		icon = 'magicgood.dmi'
		icon_state = "astro5"
		layer = MOB_LAYER
/////////////////////////////////////////
////////////////////////////////////////
////////////////////////////////////////
mob/whitelighter
	verb
		Join_orb()
			if(usr.orbexept == 0)
				usr.orbexept = 1
				usr<<"You will join with orb"
			else
				usr.orbexept = 0
				usr<<"You will no longer join with orb"
atom
	var
		orbexept = 0
mob/whitelighter
	verb
		Orb_with_people(var/mob/M in world)		//attack a mob within 1 tile of you
			set category = "Skills"
			set name = "Whitelighter Orb surrounding"
			if(usr.Freeze==1)
				usr<<"Your frozen, you can't use magic"
				return
			if(usr.RolePlaying == 0)
				usr<<"Your not roleplaying"
				return
			if(usr.Energy<=0)
				usr<<"You don't have the energy to do this"
				return
			if(M.erased==1)
				return
			if(usr.erased==1)
				return
			if(M.RolePlaying == 0)
				usr<<"[M] isnt roleplaying"
				return
			if(usr.good==1 && M.indemonschool==1)
				return
			if(usr.evil==1 && M.inmagicschool==1)
				return
			if(usr.neutral==1)
				if(M.indemonschool==1||M.inmagicschool==1)
					return
			if(usr.evil==1 && M.indemonschool==1)
				usr.indemonschool=1
			if(usr.good==1 && M.inmagicschool==1)
				usr.inmagicschool=1
			if(M.block_tele==1)
				switch(alert(M,"[src] is trying to teleport to you! Allow [src] to come to you?","","Yes","No"))
					if("Yes")
						..()
					if("No")
						src<<"You cant sense [M]"
						return
			if(M.inheaven==1)
				usr.inheaven = 1
			if(M.inheaven==0)
				usr.inheaven = 0
			if(M.inhell == 1)
				usr<<"You canno go there"
				return
			if(usr.world == M)
				if(usr.Whitelighter == 1||usr.HalfWhitelighter==1)
					for(var/mob/P as mob in range(2,usr))
						if(P.orbexept == 1)
							if(usr.inheaven==1)
								P.inheaven = 1
							if(usr.inheaven==0)
								P.inheaven = 0
							usr.power += 1
							usr.Energy -= 15
							view(9)<<sound("Whitelighter Orb")
							usr.Exposing_Magic()
							usr.overlays = new /obj/orb/orbing1
							P.overlays = new /obj/orb/orbing1
							spawn(1)
								usr.overlays = null
								P.overlays = null
								usr.overlays += new /obj/orb/orbing2
								P.overlays += new /obj/orb/orbing2
								spawn(1)
									P.overlays = null
									P.overlays += new /obj/orb/orbing3
									usr.overlays = null
									usr.overlays += new /obj/orb/orbing3
									spawn(1)
										P.overlays = null
										P.overlays += new /obj/orb/orbing4
										usr.overlays = null
										usr.overlays += new /obj/orb/orbing4
										spawn(1)
											P.overlays = null
											P.icon = null
											P.overlays += new /obj/orb/orbing5
											usr.overlays = null
											usr.icon = null
											usr.overlays += new /obj/orb/orbing5
											spawn(1)
												P.overlays = null
												P.overlays += new /obj/orb/orbing6
												usr.overlays = null
												usr.overlays += new /obj/orb/orbing6
												spawn(1)
													P.overlays = null
													P.overlays += new /obj/orb/orbing7
													usr.overlays = null
													usr.overlays += new /obj/orb/orbing7
													spawn(1)
														P.overlays = null
														P.overlays += new /obj/orb/orbing8
														usr.overlays = null
														usr.overlays += new /obj/orb/orbing8
														spawn(1)
															P.overlays = null
															P.overlays += new /obj/orb/orbing9
															usr.overlays = null
															usr.overlays += new /obj/orb/orbing9
															spawn(1)
																P.overlays = null
																P.overlays += new /obj/orb/orbing10
																usr.overlays = null
																usr.overlays += new /obj/orb/orbing10
																spawn(1)
																	usr.overlays = null
																	src.x = M:x
																	src.y = M:y+1
																	src.z = M:z
																	src.dir = SOUTH
																	P.loc = locate(usr.x,usr.y,usr.z)
																	M << "[src.name] orbed behind you!!!"
																	P.overlays = new /obj/orb/orbing10
																	usr.overlays = new /obj/orb/orbing10
																	spawn(1)
																		P.overlays = null
																		usr.overlays = null
																		P.overlays += new /obj/orb/orbing9
																		usr.overlays += new /obj/orb/orbing9
																		spawn(1)
																			P.overlays = null
																			usr.overlays = null
																			P.overlays += new /obj/orb/orbing8
																			usr.overlays += new /obj/orb/orbing8
																			spawn(1)
																				P.overlays = null
																				usr.overlays = null
																				P.overlays += new /obj/orb/orbing7
																				usr.overlays += new /obj/orb/orbing7
																				spawn(1)
																					P.overlays = null
																					usr.overlays = null
																					P.icon = null
																					P.overlays += new /obj/orb/orbing6
																					usr.icon = null
																					usr.overlays += new /obj/orb/orbing6
																					spawn(1)
																						P.overlays = null
																						usr.overlays = null
																						P.overlays += new /obj/orb/orbing5
																						usr.overlays += new /obj/orb/orbing5
																						spawn(1)
																							P.overlays = null
																							usr.overlays = null
																							P.icon = new /mob/goodwitch()
																							P.overlays += new /obj/orb/orbing4
																							usr.icon = new /mob/goodwitch()
																							usr.overlays += new /obj/orb/orbing4
																							spawn(1)
																								P.overlays = null
																								usr.overlays = null
																								P.overlays += new /obj/orb/orbing3
																								usr.overlays += new /obj/orb/orbing3
																								spawn(1)
																									P.overlays = null
																									usr.overlays = null
																									P.overlays += new /obj/orb/orbing2
																									usr.overlays += new /obj/orb/orbing2
																									spawn(1)
																										P.overlays = null
																										usr.overlays = null
																										P.overlays += new /obj/orb/orbing1
																										usr.overlays += new /obj/orb/orbing1
																										spawn(1)
																											P.overlays = null
																											usr.overlays = null
																											usr.Selforb = 0
																											usr.density = 1
				else
					return
			else
				for(var/mob/P as mob in range(2,usr))
					if(P.orbexept == 1)
						usr.power += 1
						usr.Energy -= 15
						usr.Exposing_Magic()
						usr.overlays = new /obj/orb/orbing1
						P.overlays = new /obj/orb/orbing1
						spawn(1)
							usr.overlays = null
							P.overlays = null
							usr.overlays += new /obj/orb/orbing2
							P.overlays += new /obj/orb/orbing2
							spawn(1)
								P.overlays = null
								P.overlays += new /obj/orb/orbing3
								usr.overlays = null
								usr.overlays += new /obj/orb/orbing3
								spawn(1)
									P.overlays = null
									P.overlays += new /obj/orb/orbing4
									usr.overlays = null
									usr.overlays += new /obj/orb/orbing4
									spawn(1)
										P.overlays = null
										P.icon = null
										P.overlays += new /obj/orb/orbing5
										usr.overlays = null
										usr.icon = null
										usr.overlays += new /obj/orb/orbing5
										spawn(1)
											P.overlays = null
											P.overlays += new /obj/orb/orbing6
											usr.overlays = null
											usr.overlays += new /obj/orb/orbing6
											spawn(1)
												P.overlays = null
												P.overlays += new /obj/orb/orbing7
												usr.overlays = null
												usr.overlays += new /obj/orb/orbing7
												spawn(1)
													P.overlays = null
													P.overlays += new /obj/orb/orbing8
													usr.overlays = null
													usr.overlays += new /obj/orb/orbing8
													spawn(1)
														P.overlays = null
														P.overlays += new /obj/orb/orbing9
														usr.overlays = null
														usr.overlays += new /obj/orb/orbing9
														spawn(1)
															P.overlays = null
															P.overlays += new /obj/orb/orbing10
															usr.overlays = null
															usr.overlays += new /obj/orb/orbing10
															spawn(1)
																usr.overlays = null
																src.x = M:x
																src.y = M:y+1
																src.z = M:z
																src.dir = SOUTH
																P.loc = locate(usr.x,usr.y,usr.z)
																M << "[src.name] orbed behind you!!!"
																P.overlays = new /obj/orb/orbing10
																usr.overlays = new /obj/orb/orbing10
																spawn(1)
																	P.overlays = null
																	usr.overlays = null
																	P.overlays += new /obj/orb/orbing9
																	usr.overlays += new /obj/orb/orbing9
																	spawn(1)
																		P.overlays = null
																		usr.overlays = null
																		P.overlays += new /obj/orb/orbing8
																		usr.overlays += new /obj/orb/orbing8
																		spawn(1)
																			P.overlays = null
																			usr.overlays = null
																			P.overlays += new /obj/orb/orbing7
																			usr.overlays += new /obj/orb/orbing7
																			spawn(1)
																				P.overlays = null
																				usr.overlays = null
																				P.icon = null
																				P.overlays += new /obj/orb/orbing6
																				usr.icon = null
																				usr.overlays += new /obj/orb/orbing6
																				spawn(1)
																					P.overlays = null
																					usr.overlays = null
																					P.overlays += new /obj/orb/orbing5
																					usr.overlays += new /obj/orb/orbing5
																					spawn(1)
																						P.overlays = null
																						usr.overlays = null
																						P.icon = new /mob/goodwitch()
																						P.overlays += new /obj/orb/orbing4
																						usr.icon = new /mob/goodwitch()
																						usr.overlays += new /obj/orb/orbing4
																						spawn(1)
																							P.overlays = null
																							usr.overlays = null
																							P.overlays += new /obj/orb/orbing3
																							usr.overlays += new /obj/orb/orbing3
																							spawn(1)
																								P.overlays = null
																								usr.overlays = null
																								P.overlays += new /obj/orb/orbing2
																								usr.overlays += new /obj/orb/orbing2
																								spawn(1)
																									P.overlays = null
																									usr.overlays = null
																									P.overlays += new /obj/orb/orbing1
																									usr.overlays += new /obj/orb/orbing1
																									spawn(1)
																										P.overlays = null
																										usr.overlays = null
																										usr.Selforb = 0
																										usr.density = 1

mob/whitelighter
	verb
		Orb_longdist(var/mob/M in world)		//attack a mob within 1 tile of you
			set category = "Skills"
			set name = "Whitelighter Orb long"
			if(usr.Freeze==1)
				usr<<"Your frozen, you can't use magic"
				return
			if(usr.RolePlaying == 0)
				usr<<"Your not roleplaying"
				return
			if(usr.Energy<=0)
				usr<<"You don't have the energy to do this"
				return
			if(usr.death==1)
				usr<<"You are death"
				return
			if(M.death==1)
				usr<<"[M] is death"
				return
			if(M.erased==1)
				usr<<"[M] is erased"
				return
			if(usr.good==1 && M.indemonschool==1)
				return
			if(usr.evil==1 && M.inmagicschool==1)
				return
			if(usr.neutral==1)
				if(M.indemonschool==1||M.inmagicschool==1)
					return
			if(usr.evil==1 && M.indemonschool==1)
				usr.indemonschool=1
			if(usr.good==1 && M.inmagicschool==1)
				usr.inmagicschool=1
			if(M.block_tele==1)
				switch(alert(M,"[src] is trying to teleport to you! Allow [src] to come to you?","","Yes","No"))
					if("Yes")
						..()
					if("No")
						src<<"You cant sense [M]"
						return
			if(M.RolePlaying == 0)
				usr<<"[M] isnt roleplaying"
				return
			if(M.name == "Triad")
				usr<<"You dont know the location of the Triad"
				return
			if(M.name == "FirstTimePlayer")
				usr<<"You cannot teleport to this"
				return
				src<<"You cant sense [M]"
				return
			if(M.name == "The Hollow")
				usr<<"You dont know the location of the hollow"
				return
			if(usr.erased==1)
				usr<<"You have been erased"
				return
			if(M.inheaven==1)
				usr.inheaven = 1
			if(M.inheaven==0)
				usr.inheaven = 0
			if(M.inhell==1)
				usr<<"You cannot go there"
				return
			if(usr.Whitelighter == 1||usr.HalfWhitelighter==1)
				usr.power += 1
				usr.Energy -= 5
				usr.overlays = new /obj/orb/orbing1
				view(9)<< "[usr] orbs away"
				view(9)<<sound("Whitelighter Orb.wav")
				usr.Exposing_Magic()
				spawn(1)
					usr.overlays = null
					usr.overlays += new /obj/orb/orbing2
					spawn(1)
						usr.overlays = null
						usr.overlays += new /obj/orb/orbing3
						spawn(1)
							usr.overlays = null
							usr.overlays += new /obj/orb/orbing4
							spawn(1)
								usr.overlays = null
								usr.icon = null
								usr.overlays += new /obj/orb/orbing5
								spawn(1)
									usr.overlays = null
									usr.overlays += new /obj/orb/orbing6
									spawn(1)
										usr.overlays = null
										usr.overlays += new /obj/orb/orbing7
										spawn(1)
											usr.overlays = null
											usr.overlays += new /obj/orb/orbing8
											spawn(1)
												usr.overlays = null
												usr.overlays += new /obj/orb/orbing9
												spawn(1)
													usr.overlays = null
													usr.overlays += new /obj/orb/orbing10
													spawn(1)
														usr.overlays = null
														src.x = M:x
														src.y = M:y+1
														src.z = M:z
														src.dir = SOUTH
														M << "[src.name] orbed behind you!!!"
														usr.overlays = new /obj/orb/orbing10
														spawn(1)
															usr.overlays = null
															usr.overlays += new /obj/orb/orbing9
															spawn(1)
																usr.overlays = null
																usr.overlays += new /obj/orb/orbing8
																spawn(1)
																	usr.overlays = null
																	usr.overlays += new /obj/orb/orbing7
																	spawn(1)
																		usr.overlays = null
																		usr.icon = null
																		usr.overlays += new /obj/orb/orbing6
																		spawn(1)
																			usr.overlays = null
																			usr.overlays += new /obj/orb/orbing5
																			spawn(1)
																				usr.overlays = null
																				usr.icon = new /mob/goodwitch()
																				usr.overlays += new /obj/orb/orbing4
																				spawn(1)
																					usr.overlays = null
																					usr.overlays += new /obj/orb/orbing3
																					spawn(1)
																						usr.overlays = null
																						usr.overlays += new /obj/orb/orbing2
																						spawn(1)
																							usr.overlays = null
																							usr.overlays += new /obj/orb/orbing1
																							spawn(1)
																								usr.overlays = null
																								usr.Selforb = 0
																								usr.density = 1

mob/Elder
	verb
		Orb_other(mob/M in view(9))		//attack a mob within 1 tile of you
			set name = "Whitelighter Orb Player"
			set category = "Skills"
			var/mob/X = input("Choose a target:","Target:") as mob in world
			if(usr.Freeze==1)
				usr<<"Your frozen, you can't use magic"
				return
			if(M.RolePlaying==0)
				usr<<"[M] isnt roleplaying"
				return
			if(X.RolePlaying==0)
				usr<<"[X] isnt roleplaying"
				return
			if(usr.Energy<=0)
				usr<<"You don't have the energy to do this"
				return
			if(usr.Selforb == 1||M.Selforb==1)
				usr<<"Not while orbing"
				return
			if(M.inhell==1)
				usr<<"You cannot send [M] there"
				return
			if(M.good==1 && X.indemonschool==1)
				return
			if(M.evil==1 && X.inmagicschool==1)
				return
			if(M.neutral==1)
				if(X.indemonschool==1||X.inmagicschool==1)
					return
			if(X.block_tele==1)
				switch(alert(X,"[M] is being teleported to you! Allow [M] to come to you?","","Yes","No"))
					if("Yes")
						..()
					if("No")
						usr<<"You cant sense [X]"
						return
			if(X.inheaven==1)
				M.inheaven = 1
				..()
			usr.power += 1
			usr.Energy -= 10
			M.overlays = new /obj/orb/orbing1
			view(9)<< "[M] gets orbed away"
			view(9)<<sound("Whitelighter Orb.wav")
			usr.Exposing_Magic()
			spawn(1)
				M.overlays = null
				M.overlays += new /obj/orb/orbing2
				spawn(1)
					M.overlays = null
					M.overlays += new /obj/orb/orbing3
					spawn(1)
						M.overlays = null
						M.overlays += new /obj/orb/orbing4
						spawn(1)
							M.overlays = null
							M.icon = null
							M.overlays += new /obj/orb/orbing5
							spawn(1)
								M.overlays = null
								M.overlays += new /obj/orb/orbing6
								spawn(1)
									M.overlays = null
									M.overlays += new /obj/orb/orbing7
									spawn(1)
										M.overlays = null
										M.overlays += new /obj/orb/orbing8
										spawn(1)
											M.overlays = null
											M.overlays += new /obj/orb/orbing9
											spawn(1)
												M.overlays = null
												M.overlays += new /obj/orb/orbing10
												spawn(1)
													M.overlays = null
													M.x = X:x
													M.y = X:y+1
													M.z = X:z
													M.dir = SOUTH
													X << "[M.name] orbed behind you!!!"
													M.overlays = new /obj/orb/orbing10
													spawn(1)
														M.overlays = null
														M.overlays += new /obj/orb/orbing9
														spawn(1)
															M.overlays = null
															M.overlays += new /obj/orb/orbing8
															spawn(1)
																M.overlays = null
																M.overlays += new /obj/orb/orbing7
																spawn(1)
																	M.overlays = null
																	M.icon = null
																	M.overlays += new /obj/orb/orbing6
																	spawn(1)
																		M.overlays = null
																		M.overlays += new /obj/orb/orbing5
																		spawn(1)
																			M.overlays = null
																			M.icon = new /mob/goodwitch()
																			M.overlays += new /obj/orb/orbing4
																			spawn(1)
																				M.overlays = null
																				M.overlays += new /obj/orb/orbing3
																				spawn(1)
																					M.overlays = null
																					M.overlays += new /obj/orb/orbing2
																					spawn(1)
																						M.overlays = null
																						M.overlays += new /obj/orb/orbing1
																						spawn(1)
																							M.overlays = null
																							M.Selforb = 0
																							M.density = 1



mob/whitelighter
	verb
		Orb_place()		//attack a mob within 1 tile of you
			set category = "Skills"
			set name = "Whitelighter Orb place"
			var/default_value = "Earth"
			var/list/places = list("Earth", "Hell", "Heaven", "Charmed manor", "Magic School", "Park", "Julian's House", "Kyros House", "DragoWings House", "Graveyard", "The Ultimate")
			choose_place = input(usr, default_value) in places
			switch(choose_place)
				if("Earth")
					usr.place = "Earth"
				if("Hell")
					usr.place = "Hell"
				if("Heaven")
					if(usr.Whitelighter == 1||usr.race=="Half Whitelighter Half Witch")
						usr.place = "Heaven"
					else
						usr<<"You cannot go here"
				if("Charmed manor")
					usr.place = "Charmed"
				if("Magic School")
					usr.place = "Magic School"
				if("Park")
					usr.place = "Park"
				if("Julian's House")
					usr.place = "SyncWolf"
				if("Kyros House")
					usr.place = "Zeniox"
				if("DragoWings House")
					usr.place = "Drago"
				if("Graveyard")
					usr.place = "Graveyard"
				if("The Ultimate")
					usr.place = "Ultimate"
			if(usr.Freeze==1)
				usr<<"Your frozen, you can't use magic"
				return
			if(usr.RolePlaying == 0)
				usr<<"Your not roleplaying"
				return
			if(usr.Energy<=0)
				usr<<"You don't have the energy to do this"
				return
			if(usr.death==1)
				usr<<"You are death"
				return
			if(usr.erased==1)
				return
			else
				if(usr.Whitelighter == 1||usr.HalfWhitelighter==1)
					usr.power += 1
					usr.Energy -= 10
					usr.overlays = new /obj/orb/orbing1
					view(9)<< "[usr] orbs away"
					usr.Exposing_Magic()
					view(9)<<sound("Whitelighter Orb.wav")
					spawn(1)
						usr.overlays = null
						usr.overlays += new /obj/orb/orbing2
						spawn(1)
							usr.overlays = null
							usr.overlays += new /obj/orb/orbing3
							spawn(1)
								usr.overlays = null
								usr.overlays += new /obj/orb/orbing4
								spawn(1)
									usr.overlays = null
									usr.icon = null
									usr.overlays += new /obj/orb/orbing5
									spawn(1)
										usr.overlays = null
										usr.overlays += new /obj/orb/orbing6
										spawn(1)
											usr.overlays = null
											usr.overlays += new /obj/orb/orbing7
											spawn(1)
												usr.overlays = null
												usr.overlays += new /obj/orb/orbing8
												spawn(1)
													usr.overlays = null
													usr.overlays += new /obj/orb/orbing9
													spawn(1)
														usr.overlays = null
														usr.overlays += new /obj/orb/orbing10
														spawn(1)
															usr.overlays = null
															if(usr.place=="Earth")
																usr.loc = locate(/turf/Area/Earth)
																usr.inheaven = 0
															if(usr.place=="Hell")
																usr.loc = locate(/turf/Area/Hell)
																usr.inheaven = 0
															if(usr.place=="Heaven")
																usr.loc = locate(/turf/Area/Heaven)
																usr.inheaven = 1
															if(usr.place=="Charmed")
																usr.loc = locate(/turf/Area/Charmed)
																usr.inheaven = 0
															if(usr.place == "Magic School")
																usr.loc = locate(/turf/Area/MagicSchool)
															if(usr.place=="Park")
																usr.loc = locate(/turf/Area/Park)
																usr.inheaven = 0
															if(usr.place=="SyncWolf")
																usr.loc = locate(/turf/Area/SyncWolfsHouse)
																usr.inheaven = 0
															if(usr.place=="Zeniox")
																usr.loc = locate(/turf/Area/ZenioxHouse)
																usr.inheaven = 0
															if(usr.place=="Drago")
																usr.loc = locate(/turf/Area/DragowingHouse)
																usr.inheaven = 0
															if(usr.place=="Graveyard")
																usr.loc = locate(/turf/Area/Graveyard)
																usr.inheaven = 0
															if(usr.place=="Ultimate")
																usr.loc = locate(/turf/Area/Ultimate)
																usr.inheaven = 0
															usr.overlays = new /obj/orb/orbing10
															spawn(1)
																usr.overlays = null
																usr.overlays += new /obj/orb/orbing9
																spawn(1)
																	usr.overlays = null
																	usr.overlays += new /obj/orb/orbing8
																	spawn(1)
																		usr.overlays = null
																		usr.overlays += new /obj/orb/orbing7
																		spawn(1)
																			usr.overlays = null
																			usr.icon = null
																			usr.overlays += new /obj/orb/orbing6
																			spawn(1)
																				usr.overlays = null
																				usr.overlays += new /obj/orb/orbing5
																				spawn(1)
																					usr.overlays = null
																					usr.icon = new /mob/goodwitch()
																					usr.overlays += new /obj/orb/orbing4
																					spawn(1)
																						usr.overlays = null
																						usr.overlays += new /obj/orb/orbing3
																						spawn(1)
																							usr.overlays = null
																							usr.overlays += new /obj/orb/orbing2
																							spawn(1)
																								usr.overlays = null
																								usr.overlays += new /obj/orb/orbing1
																								spawn(1)
																									usr.overlays = null
																									usr.Selforb = 0
																									usr.density = 1


mob/Elder
	verb
		Orb_player_place(mob/M in view(9))		//attack a mob within 1 tile of you
			set category = "Skills"
			set name = "Whitelighter Orb player place"
			var/default_value = "Earth"
			var/list/places = list("Earth", "Hell", "Heaven", "Charmed manor", "Park", "Julian's House", "Kyros House", "DragoWings House", "Graveyard", "The Ultimate")
			choose_place = input(usr, default_value) in places
			switch(choose_place)
				if("Earth")
					M.place = "Earth"
				if("Hell")
					M.place = "Hell"
				if("Heaven")
					if(usr.Whitelighter == 1||usr.race=="Half Whitelighter Half Witch")
						M.place = "Heaven"
					else
						usr<<"You cannot send [M] there"
				if("Charmed manor")
					M.place = "Charmed"
				if("Park")
					M.place = "Park"
				if("Julian's House")
					M.place = "SyncWolf"
				if("Kyros House")
					M.place = "Zeniox"
				if("DragoWings House")
					M.place = "Drago"
				if("Graveyard")
					M.place = "Graveyard"
				if("The Ultimate")
					M.place = "Ultimate"
			if(usr.Freeze==1)
				usr<<"Your frozen, you can't use magic"
				return
			if(M.RolePlaying == 0)
				usr<<"[M] isnt roleplaying"
				return
			if(usr.RolePlaying == 0)
				usr<<"Your not roleplaying"
				return
			if(usr.Energy<=0)
				usr<<"You don't have the energy to do this"
				return
			if(usr.death==1)
				usr<<"You are death"
				return
			if(usr.erased==1)
				return
			if(M.erased==1)
				return
			else
				if(usr.Whitelighter == 1||usr.HalfWhitelighter==1)
					usr.power += 1
					usr.Energy -= 10
					usr.Exposing_Magic()
					M.overlays = new /obj/orb/orbing1
					view(9)<< "[M] gets orbed away"
					view(9)<<sound("Whitelighter Orb.wav")
					spawn(1)
						M.overlays = null
						M.overlays += new /obj/orb/orbing2
						spawn(1)
							M.overlays = null
							M.overlays += new /obj/orb/orbing3
							spawn(1)
								M.overlays = null
								M.overlays += new /obj/orb/orbing4
								spawn(1)
									M.overlays = null
									M.icon = null
									M.overlays += new /obj/orb/orbing5
									spawn(1)
										M.overlays = null
										M.overlays += new /obj/orb/orbing6
										spawn(1)
											M.overlays = null
											M.overlays += new /obj/orb/orbing7
											spawn(1)
												M.overlays = null
												M.overlays += new /obj/orb/orbing8
												spawn(1)
													M.overlays = null
													M.overlays += new /obj/orb/orbing9
													spawn(1)
														M.overlays = null
														M.overlays += new /obj/orb/orbing10
														spawn(1)
															M.overlays = null
															if(M.place=="Earth")
																M.loc = locate(/turf/Area/Earth)
																M.inheaven = 0
															if(M.place=="Hell")
																M.loc = locate(/turf/Area/Hell)
																M.inheaven = 0
															if(M.place=="Heaven")
																if(usr.Whitelighter == 1||usr.race=="Half Whitelighter")
																	M.loc = locate(/turf/Area/Heaven)
																	M.inheaven = 1
																else
																	M << "You cannot send [M] there"
															if(M.place=="Charmed")
																M.loc = locate(/turf/Area/Charmed)
																M.inheaven = 0
															if(M.place=="Park")
																M.loc = locate(/turf/Area/Park)
																M.inheaven = 0
															if(M.place=="SyncWolf")
																M.loc = locate(/turf/Area/SyncWolfsHouse)
																M.inheaven = 0
															if(M.place=="Zeniox")
																M.loc = locate(/turf/Area/ZenioxHouse)
																M.inheaven = 0
															if(M.place=="Drago")
																M.loc = locate(/turf/Area/DragowingHouse)
																M.inheaven = 0
															if(M.place=="Graveyard")
																M.loc = locate(/turf/Area/Graveyard)
																M.inheaven = 0
															if(M.place=="Ultimate")
																M.loc = locate(/turf/Area/Ultimate)
																M.inheaven = 0
															M.overlays = new /obj/orb/orbing10
															spawn(1)
																M.overlays = null
																M.overlays += new /obj/orb/orbing9
																spawn(1)
																	M.overlays = null
																	M.overlays += new /obj/orb/orbing8
																	spawn(1)
																		M.overlays = null
																		M.overlays += new /obj/orb/orbing7
																		spawn(1)
																			M.overlays = null
																			M.icon = null
																			M.overlays += new /obj/orb/orbing6
																			spawn(1)
																				M.overlays = null
																				M.overlays += new /obj/orb/orbing5
																				spawn(1)
																					M.overlays = null
																					M.icon = new /mob/goodwitch()
																					M.overlays += new /obj/orb/orbing4
																					spawn(1)
																						M.overlays = null
																						M.overlays += new /obj/orb/orbing3
																						spawn(1)
																							M.overlays = null
																							M.overlays += new /obj/orb/orbing2
																							spawn(1)
																								M.overlays = null
																								M.overlays += new /obj/orb/orbing1
																								spawn(1)
																									M.overlays = null
																									M.Selforb = 0
																									M.density = 1


//////////////////////////////////////////////////
//////////////////////////////////////////////////
/////////////////////////////////////////////////////
obj
    beams5
        var
            power = 10

            hit = 0
            blast = 0
            energyhit = 0
        Ki_Blast2
            icon = 'magicgood.dmi'
            icon_state="Front-r"
            density = 1
            power = 10
            Bump(atom/M)
                hit = 1
                if(istype(M,/mob/))
                    for(var/mob/N in world)
                        if(M:shielded==1)
                            N.blast = 0
                            del(src)
                            return
                        if(M:containhollow==1)
                            M:verbs += new /mob/titan/verb/Shock
                            N.verbs -= new /mob/titan/verb/Shock
                            view(9)<<"[M] has taken [N]'s power using the hollow"
                            N.blast = 0
                            del(src)
                            return
                        if(owner == "[N.key]")
                            N << "you shot [M]"
                            M << "[N] shot you"
                            M:health -= N.power/M:power
                            M:health -= N.Strength
                            N.deathcheck(M)
                            usr.power += 1
                            for(var/obj/beams5/Trail2/T in world)
                                if(T:owner == "[N.key]")
                                    usr.blast = 0
                                    del(T)

                    del(src)
                else
                    ..()

        Trail2
            icon = 'magicgood.dmi'
            icon_state="Back-r"
            density = 1

    proc
        Moving5(obj/O,mob/N,obj/F)
            if(O:hit == 0)
                sleep(1)
                var/m = new /obj/beams5/Trail2(O:loc)
                m:dir = usr.dir
                m:owner = F:owner
                usr.energyhit += 1
                step(O,usr.dir)
                usr.blast = 1
                if(usr.energyhit <= 10)
                    O:Moving5(O,N,m)
                else
                    usr.energyhit = 0
                    for(var/obj/beams5/Trail2/T in world)
                        if(T:owner == O:owner)
                            usr.blast = 0
                            del T
                    del O
            else
                for(var/obj/beams5/Trail2/T in world)
                    if(T:owner == O:owner)
                        usr.blast = 0

                        del T
                del O


obj
    beams4
        var
            power = 10

            hit = 0
            blast = 0
            energyhit = 0
        Ki_Blast
            icon = 'magicgood.dmi'
            icon_state="Front"
            density = 1
            power = 10
            Bump(atom/M)
                hit = 1
                if(istype(M,/mob/))
                    for(var/mob/N in world)
                        if(M:shielded==1)
                            N.blast = 0
                            del(src)
                            return
                        if(M:Whitelighter==1)
                            if(M:Strength<=N.Strength/3)
                                M:health -= N.Strength
                                N.deathcheck(M)
                                return
                            del(src)
                            N.blast = 0
                            return
                        if(M:containhollow==1)
                            M.verbs += new /mob/demon/verb/lightning
                            N.verbs -= new /mob/demon/verb/lightning
                            view(9)<<"[M] has taken [N]'s power using the hollow"
                            N.blast = 0
                            del(src)
                            return
                        if(owner == "[N.key]")
                            N << "you shot [M]"
                            M << "[N] shot you"
                            M:health -= N.power/M:power
                            M:health -= N.Strength
                            N.deathcheck(M)
                            N.power += 1
                            for(var/obj/beams4/Trail/T in world)
                                if(T:owner == "[N.key]")
                                    usr.blast = 0
                                    del(T)

                    del(src)
                else
                    ..()

        Trail
            icon = 'magicgood.dmi'
            icon_state="Back"
            density = 1

    proc
        Moving4(obj/O,mob/N,obj/F)
            if(O:hit == 0)
                sleep(1)
                var/m = new /obj/beams4/Trail(O:loc)
                m:dir = usr.dir
                m:owner = F:owner
                usr.energyhit += 1
                step(O,usr.dir)
                usr.blast = 1
                if(usr.energyhit <= 10)
                    O:Moving4(O,N,m)
                else
                    usr.energyhit = 0
                    for(var/obj/beams4/Trail/T in world)
                        if(T:owner == O:owner)
                            usr.blast = 0
                            del T
                    del O
            else
                for(var/obj/beams4/Trail/T in world)
                    if(T:owner == O:owner)
                        usr.blast = 0

                        del T
                del O

mob/demon
    verb
        lightning()
            set category = "Skills"
            set name = "Lightning"
            if(usr.Freeze==1)
                usr<<"Your frozen, you can't use magic"
                return
            if(usr.Energy<=0)
                usr<<"You don't have the energy to do this"
                return
            if(usr.RolePlaying == 0)
                usr<<"Your not roleplaying"
                return
            if(usr.Selforb == 0)
                if(usr.blast == 0)
                    view(9)<<sound('spark.wav')
                    usr.Exposing_Magic()
                    usr.Energy -= 5
                    usr.energyhit = 0
                    var/t = new /obj/beams4/Ki_Blast(usr.loc)
                    step(t,usr.dir)
                    t:owner = "[usr.key]"
                    t:dir = "[usr.dir]"
                    step(t,usr.dir)
                    var/w
                    var/n = new /obj/beams4/Trail(usr.loc)
                    w = usr.dir
                    step(n,w)
                    n:owner = "[usr.key]"
                    n:dir = w
                    t:Moving4(t,usr,n)
            else
                usr<<"You cant do this while orbing"
mob/titan
    verb
        Shock()
            set category = "Skills"
            if(usr.Freeze==1)
                usr<<"Your frozen, you can't use magic"
                return
            if(usr.Energy<=0)
                usr<<"You don't have the energy to do this"
                return
            if(usr.RolePlaying == 0)
                usr<<"Your not roleplaying"
                return
            if(usr.Selforb == 0)
                if(usr.blast == 0)
                    view(9)<<sound('spark.wav')
                    usr.Exposing_Magic()
                    usr.Energy -= 5
                    usr.energyhit = 0
                    var/t = new /obj/beams5/Ki_Blast2(usr.loc)
                    step(t,usr.dir)
                    t:owner = "[usr.key]"
                    t:dir = "[usr.dir]"
                    step(t,usr.dir)
                    var/w
                    var/n = new /obj/beams5/Trail2(usr.loc)
                    w = usr.dir
                    step(n,w)
                    n:owner = "[usr.key]"
                    n:dir = w
                    t:Moving5(t,usr,n)
            else
                usr<<"You cant do this while orbing"
mob
    var
        energyhit = 0
        blast =0
        D
obj/field
    Forcefield1
        icon = 'magicitems.dmi'
        icon_state = "Force1"
        pixel_x = -32
        density = 1
obj/field
    Forcefield2
        icon = 'magicitems.dmi'
        icon_state = "Force2"
        density = 1
obj/field
    Forcefield3
        icon = 'magicitems.dmi'
        icon_state = "Force3"
        pixel_x = 32
        density = 1
obj/field
    Forcefield4
        icon = 'magicitems.dmi'
        icon_state = "Force4"
        pixel_x = -32
        pixel_y = 32
        density = 1
obj/field
    Forcefield5
        icon = 'magicitems.dmi'
        icon_state = "Force5"
        pixel_y = 32
        density = 1
obj/field
    Forcefield6
        icon = 'magicitems.dmi'
        icon_state = "Force6"
        pixel_x = 32
        pixel_y = 32
        density = 1

///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////
mob
    var
        saveverbs = /mob/verb/World_Say
        strippower
        charmedgotextra = 0
obj
    var
        Bookname


/////////////////////
/*mob
	var
		Whitelightername
		Chargename
		gotaWhitelightername = 0
		gotacharge = 0
mob/whitelighter
	verb
		Choose_witch(var/mob/M as mob in world)
			if(M.race == "Demon")
				usr<<"You cant have a demon as a charge"
				return
			if(M.race == "Darklighter")
				usr<<"You cant have a darklighter as a charge"
				return
			if(usr.gotaWhitelightername == 1)
				return
			if(M.gotacharge == 1)
				usr<<"[M] already has a charge"
			else
				usr<<"You can now teleport to [M]"
				usr.Whitelightername = M.name
				usr.gotaWhitelightername = 1
				M.Chargename = usr.name
				M.gotacharge = 1
*/
//////////////////////////////////////////
////////////////
//////////
///////////////
////////////////////////////////////////
mob
	var
		rest = 0
mob
	verb
		Rest()
			if(usr.Freeze==1)
				usr<<"Your frozen, you can't rest"
				return
			if(usr.rest == 0)
				usr.rest = 1
				usr.Freeze = !usr.Freeze
				usr<<"<FONT COLOR=yellow>Client information</FONT>: You begin to rest"
				spawn(35)
					usr.Energy = usr.maxEnergy
					usr.health = usr.maxhealth
					usr.Freeze = 0
					usr.attacking = 0
					usr.rest = 0
					usr.shielded = 0
					usr.overlays = null
					usr<<"<FONT COLOR=yellow>Client information</FONT>: You Finnish resting"

mob/Elder/verb/Elder_Summon(mob/M in world)
	set name = "Summon Good"
	set category = "Skills"
	set desc = "(Mob) summon a good personne"
	if(usr.Freeze==1)
		usr<<"<FONT COLOR=yellow>Client information</FONT>: Your frozen, you can't use magic"
		return
	if(usr.RolePlaying == 0)
		usr<<"Your not roleplaying"
		return
	if(M.RolePlaying == 0)
		usr<<"[M] isnt roleplaying"
		return
	if(usr.Energy<=0)
		usr<<"<FONT COLOR=yellow>Client information</FONT>: Your out of energy!"
		return
	if(usr.death==1)
		usr<<"<FONT COLOR=yellow>Client information</FONT>: You are death"
		return
	if(M.death==1)
		usr<<"<FONT COLOR=yellow>Client information</FONT>: [M] is death"
		return
	if(M.containhollow==1)
		usr.verbs -= new /mob/Elder/verb/Elder_Summon
		M.verbs += new /mob/Elder/verb/Elder_Summon
		view(9)<<"[M] has taken [usr]'s power using the hollow"
		return
	if(M.Intelligence>=usr.Intelligence)
		switch(alert(M,"Allow [usr.rank] [usr] to summon you?","Summoning","Yes","No"))
			if("Yes")
				M.x = usr:x
				M.y = usr:y-1
				M.z = usr:z
				M<<"<FONT COLOR=yellow>Client information</FONT>: You have been summoned by a [usr.rank]"
				usr<< "<FONT COLOR=yellow>Client information</FONT>: You summoned [M]"
				usr.Energy -= 25
				if(usr.inheaven == 1)
					M.inheaven = 1
				if(usr.inheaven == 0)
					M.inheaven = 0
				return
			if("No")
				..()

	if(M.erased==1)
		usr<<"[M] has been erased from time and space"
		return
	if(usr.erased==1)
		usr<<"You has been erased from time and space"
		return
	if(M.alignpoint >= 101)
		M.x = usr:x
		M.y = usr:y-1
		M.z = usr:z
		M<<"You have been summoned by [usr.name]"
		usr<< "You summoned [M]"
		usr.Energy -= 25
		if(usr.inheaven == 1)
			M.inheaven = 1
		if(usr.inheaven == 0)
			M.inheaven = 0

mob/Elder/verb/Go_To_Heaven()
	set category = "Skills"
	if(usr.Freeze==1)
		usr<<"Your frozen, you can't use magic"
		return
	if(usr.RolePlaying == 0)
		usr<<"Your not roleplaying"
		return
	if(usr.death==1)
		usr<<"You are death"
		return
	if(usr.erased==1)
		return
	view(9)<< "[usr] go's to Heaven"
	usr.loc = locate(/turf/Area/Heaven)
	usr.inheaven = 1

mob/Triad/verb/Triad_Summon(mob/M in world)
	set name = "Summon Evil"
	set category = "Skills"
	set desc = "(Mob) summon a evil personne"
	if(usr.Freeze==1)
		usr<<"Your frozen, you can't use magic"
		return
	if(usr.RolePlaying == 0)
		usr<<"Your not roleplaying"
		return
	if(M.RolePlaying == 0)
		usr<<"[M] isnt roleplaying"
		return
	if(usr.death==1)
		usr<<"You are death"
		return
	if(M.death==1)
		usr<<"[M] is death"
		return
	if(M.Intelligence>=usr.Intelligence)
		usr<<"Nothing happened"
		M<<"[usr] tryed to summon you"
		return
	if(M.containhollow==1)
		usr.verbs -= new /mob/Triad/verb/Triad_Summon
		M.verbs += new /mob/Triad/verb/Triad_Summon
		view(9)<<"[M] has taken [usr]'s power using the hollow"
		return
	if(M.Intelligence>=usr.Intelligence)
		switch(alert(M,"Allow [usr.rank] [usr] to summon you?","Summoning","Yes","No"))
			if("Yes")
				M.x = usr:x
				M.y = usr:y-1
				M.z = usr:z
				M<<"You have been summoned by [usr.name]"
				usr<< "You summoned [M]"
				usr.Energy -= 25
				if(usr.inheaven == 1)
					M.inheaven = 1
				if(usr.inheaven == 0)
					M.inheaven = 0
				return
			if("No")
				..()
	if(M.erased==1)
		usr<<"[M] has been erased from time and space"
		return
	if(usr.erased==1)
		usr<<"You has been erased from time and space"
		return
	if(M.alignpoint <= 99)
		M.x = usr:x
		M.y = usr:y-1
		M.z = usr:z
		M<<"You have been summoned by a [usr.rank]"
		usr<< "You summoned [M]"
		usr.Energy -= 25
		if(usr.inhell==1)
			M.inhell = 1
		if(usr.inhell==0)
			M.inhell = 0
mob/Triad/verb/Go_To_Hell()
	set name = "Go to Hell"
	set category = "Skills"
	if(usr.Freeze==1)
		usr<<"Your frozen, you can't use magic"
		return
	if(usr.RolePlaying == 0)
		usr<<"Your not roleplaying"
		return
	if(usr.death==1)
		usr<<"You are death"
		return
	if(usr.erased==1)
		return
	view(9)<< "[usr] go's to Hell"
	usr.loc=locate(/turf/Area/Hell2)
	usr.inhell = 1

mob/Avatar/verb/Go_To_Collective()
	set category = "Skills"
	if(usr.Freeze==1)
		usr<<"Your frozen, you can't use magic"
		return
	if(usr.RolePlaying == 0)
		usr<<"Your not roleplaying"
		return
	if(usr.death==1)
		usr<<"You are death"
		return
	if(usr.erased==1)
		return
	view(9)<< "[usr] go's to the collective"
	usr.loc = locate(/turf/Area/Avatars)

mob/Rank/verb/Go_To_Earth()
	set category = "Skills"
	if(usr.Freeze==1)
		usr<<"Your frozen, you can't use magic"
		return
	if(usr.RolePlaying == 0)
		usr<<"Your not roleplaying"
		return
	if(usr.death==1)
		usr<<"You are death"
		return
	if(usr.erased==1)
		return
	view(9)<< "[usr] go's to earth"
	usr.loc=locate(/turf/Area/Earth)
	usr.inhell = 0
	usr.inheaven = 0
mob/Cleaner/verb/Go_To_Erasedzone()
	set category = "Skills"
	set name = "Go To Erasezone"
	if(usr.Freeze==1)
		usr<<"Your frozen, you can't use magic"
		return
	if(usr.RolePlaying == 0)
		usr<<"Your not roleplaying"
		return
	view(9)<< "[usr] go's to ..."
	usr.loc = locate(/turf/Area/Cleaned)
	usr.inhell = 0
	usr.inheaven = 0

mob/Cleaner/verb/Erase(mob/M in view(6))
	set category = "Skills"
	set desc = "Use your cleaning power to erase someone from the world"
	if(usr.Freeze==1)
		usr<<"Your frozen, you can't use magic"
		return
	if(usr.RolePlaying == 0)
		usr<<"Your not roleplaying"
		return
	if(M.RolePlaying == 0)
		usr<<"[M] isnt roleplaying"
		return
	if(M.containhollow==1)
		usr.verbs -= new /mob/Cleaner/verb/Erase
		M.verbs += new /mob/Cleaner/verb/Erase
		view(9)<<"[M] has taken [usr]'s power using the hollow"
		return
	M.loc = locate(/turf/Area/Cleaned)
	M.erased = 1
	M.exposed = 0
	M.seenmagic = 0
	M<<"You have been erased from the world"
	view(9) << "Suddenly you forgot all about [M] as [usr] erased [M]"
	world.log<<"[usr] erased [M] from world"
mob/Cleaner/verb/Retrieve_From_Erase(mob/M in world)
	set category = "Skills"
	set name = "Return from Erase"
	if(usr.Freeze==1)
		usr<<"Your frozen, you can't use magic"
		return
	if(M.containhollow==1)
		usr.verbs -= new /mob/Cleaner/verb/Retrieve_From_Erase
		M.verbs += new /mob/Cleaner/verb/Retrieve_From_Erase
		view(9)<<"[M] has taken [usr]'s power using the hollow"
		return
	if(M.erased == 1)
		M.loc=locate(/turf/Area/Earth)
		M.erased = 0
		world<<"[M] has been brought back into peoples memory"
		world.log<<"[usr] returned [M] from erase"
mob/Shuugo/verb/Narrator(msg as text)
	set category = "Commands"
	set name = "Narrator say"
	set desc = "Talk as narrator"
	world<<"<b><FONT COLOR=#ffff00>N</FONT><FONT COLOR=#fff200>a</FONT><FONT COLOR=#ffe500>r</FONT><FONT COLOR=#ffd700>r</FONT><FONT COLOR=#ffe100>a</FONT><FONT COLOR=#ffec00>t</FONT><FONT COLOR=#fff600>o</FONT><FONT COLOR=#ffff00>r</FONT></b>: [msg]"
obj/orb
	aodesorb1
		icon = 'magicgood.dmi'
		icon_state = "aode1"
		layer = MOB_LAYER
	aodesorb2
		icon = 'magicgood.dmi'
		icon_state = "aode2"
		layer = MOB_LAYER
	aodesorb3
		icon = 'magicgood.dmi'
		icon_state = "aode3"
		layer = MOB_LAYER
	aodesorb4
		icon = 'magicgood.dmi'
		icon_state = "aode4"
		layer = MOB_LAYER
	aodesorb5
		icon = 'magicgood.dmi'
		icon_state = "aode5"
		layer = MOB_LAYER
	aodesorb6
		icon = 'magicgood.dmi'
		icon_state = "aode6"
		layer = MOB_LAYER
	aodesorb7
		icon = 'magicgood.dmi'
		icon_state = "aode7"
		layer = MOB_LAYER
	aodesorb8
		icon = 'magicgood.dmi'
		icon_state = "aode8"
		layer = MOB_LAYER
	aodesorb9
		icon = 'magicgood.dmi'
		icon_state = "aode9"
		layer = MOB_LAYER
	aodesorb10
		icon = 'magicgood.dmi'
		icon_state = "aode10"
		layer = MOB_LAYER
	aodesorb11
		icon = 'magicgood.dmi'
		icon_state = "aode11"
		layer = MOB_LAYER
	aodesorb12
		icon = 'magicgood.dmi'
		icon_state = "aode12"
		layer = MOB_LAYER
	aodesorb13
		icon = 'magicgood.dmi'
		icon_state = "aode13"
		layer = MOB_LAYER
	aodesorb14
		icon = 'magicgood.dmi'
		icon_state = "aode14"
		layer = MOB_LAYER
mob/Destiny
	verb
		Destiny_orb()		//attack a mob within 1 tile of you
			set category = "Skills"
			if(usr.Freeze==1)
				usr<<"Your frozen, you can't use magic"
				return
			if(usr.Energy <= 0)
				usr<<"You don't have the energy for this"
				return
			if(usr.Selforb == 0)
				usr.Selforb = 1
				usr.density = 0
				usr.power += 1
				usr.Exposing_Magic()
				usr.Energy -= 5
				usr.overlays = new /obj/orb/aodesorb14
				view(9)<< "[usr] orbs back"
				spawn(1)
					usr.overlays = null
					usr.overlays += new /obj/orb/aodesorb13
					spawn(1)
						usr.overlays = null
						usr.overlays += new /obj/orb/aodesorb12
						spawn(1)
							usr.overlays = null
							usr.icon = null
							usr.overlays += new /obj/orb/aodesorb11
							spawn(1)
								usr.overlays = null
								usr.overlays += new /obj/orb/aodesorb10
								spawn(1)
									usr.overlays = null
									usr.overlays += new /obj/orb/aodesorb9
									spawn(1)
										usr.overlays = null
										usr.overlays += new /obj/orb/aodesorb8
										spawn(1)
											usr.overlays = null
											usr.overlays += new /obj/orb/aodesorb7
											spawn(1)
												usr.overlays = null
												usr.overlays += new /obj/orb/aodesorb6
												spawn(1)
													usr.overlays = null
													usr.overlays += new /obj/orb/aodesorb5
													spawn(1)
														usr.overlays = null
														usr.overlays += new /obj/orb/aodesorb4
														spawn(1)
															usr.overlays = null
															usr.overlays += new /obj/orb/aodesorb3
															spawn(1)
																usr.overlays = null
																usr.overlays += new /obj/orb/aodesorb2
																spawn(1)
																	usr.overlays = null
																	usr.overlays += new /obj/orb/aodesorb1
																	spawn(1)
																		usr.overlays = null

			else
				usr.Selforb = 0
				usr.density = 1
				usr.overlays = new /obj/orb/aodesorb1
				view(9)<< "[usr] orbs away"
				usr.Exposing_Magic()
				usr.Energy -= 5
				spawn(1)
					usr.overlays = null
					usr.overlays += new /obj/orb/aodesorb2
					spawn(1)
						usr.overlays = null
						usr.overlays += new /obj/orb/aodesorb3
						spawn(1)
							usr.overlays = null
							usr.overlays += new /obj/orb/aodesorb4
							spawn(1)
								usr.overlays = null
								usr.icon = null
								usr.overlays += new /obj/orb/aodesorb5
								spawn(1)
									usr.overlays = null
									usr.overlays += new /obj/orb/aodesorb6
									spawn(1)
										usr.overlays = null
										usr.overlays += new /obj/orb/aodesorb7
										spawn(1)
											usr.overlays = null
											usr.overlays += new /obj/orb/aodesorb8
											spawn(1)
												usr.overlays = null
												usr.overlays += new /obj/orb/aodesorb9
												spawn(1)
													usr.overlays = null
													usr.overlays += new /obj/orb/aodesorb10
													spawn(1)
														usr.overlays = null
														usr.icon = new /mob/goodwitch()
														usr.overlays += new /obj/orb/aodesorb11
														spawn(1)
															usr.overlays = null
															usr.overlays += new /obj/orb/aodesorb12
															spawn(1)
																usr.overlays = null
																usr.overlays += new /obj/orb/aodesorb13
																spawn(1)
																	usr.overlays = null
																	usr.overlays += new /obj/orb/aodesorb14
																	spawn(1)
																		usr.overlays = null

mob/Destiny
	verb
		Destiny_orb_Long(var/mob/M in world)		//attack a mob within 1 tile of you
			set category = "Skills"
			if(usr.Freeze==1)
				usr<<"Your frozen, you can't use magic"
				return
			if(usr.death==1)
				usr<<"You are death"
				return
			if(usr.RolePlaying == 0)
				usr<<"Your not roleplaying"
				return
			if(M.RolePlaying == 0)
				usr<<"[M] isnt roleplaying"
				return
			if(usr.Energy <= 0)
				usr<<"You don't have the energy for this"
				return
			if(M.death==1)
				usr<<"[M] is death"
				return
			if(usr.good==1 && M.indemonschool==1)
				return
			if(usr.evil==1 && M.inmagicschool==1)
				return
			if(usr.neutral==1)
				if(M.indemonschool==1||M.inmagicschool==1)
					return
			if(usr.evil==1 && M.indemonschool==1)
				usr.indemonschool=1
			if(usr.good==1 && M.inmagicschool==1)
				usr.inmagicschool=1
			if(M.block_tele==1)
				switch(alert(M,"[src] is trying to teleport to you! Allow [src] to come to you?","","Yes","No"))
					if("Yes")
						..()
					if("No")
						src<<"You cant sense [M]"
						return
			if(M.name == "FirstTimePlayer")
				usr<<"You cannot teleport to this"
				return
			if(M.name == "The Hollow")
				usr<<"You dont know the location of the hollow"
				return
			if(M.inheaven==1)
				usr<<"You cannot go to this personne"
				return
			if(M.inhell==1)
				usr<<"You cannot go to this personne"
				return
			if(usr.world == M)
				usr.power += 1
				usr.overlays = new /obj/orb/aodesorb1
				view(9)<< "[usr] orbs away"
				usr.Exposing_Magic()
				usr.Energy -= 10
				spawn(1)
					usr.overlays = null
					usr.overlays += new /obj/orb/aodesorb2
					spawn(1)
						usr.overlays = null
						usr.overlays += new /obj/orb/aodesorb3
						spawn(1)
							usr.overlays = null
							usr.overlays += new /obj/orb/aodesorb4
							spawn(1)
								usr.overlays = null
								usr.overlays += new /obj/orb/aodesorb5
								spawn(1)
									usr.overlays = null
									usr.overlays += new /obj/orb/aodesorb6
									spawn(1)
										usr.overlays = null
										usr.overlays += new /obj/orb/aodesorb7
										spawn(1)
											usr.overlays = null
											usr.overlays += new /obj/orb/aodesorb8
											spawn(1)
												usr.overlays = null
												usr.overlays += new /obj/orb/aodesorb9
												spawn(1)
													usr.overlays = null
													usr.overlays += new /obj/orb/aodesorb10
													spawn(1)
														usr.overlays = null
														usr.icon = null
														src.x = M:x
														src.y = M:y+1
														src.z = M:z
														src.dir = SOUTH
														M << "[src.name] orbed behind you!!!"
														usr.overlays += new /obj/orb/aodesorb9
														spawn(1)
															usr.overlays = null
															usr.overlays += new /obj/orb/aodesorb8
															spawn(1)
																usr.overlays = null
																usr.overlays += new /obj/orb/aodesorb7
																spawn(1)
																	usr.overlays = null
																	usr.overlays += new /obj/orb/aodesorb6
																	spawn(1)
																		usr.overlays = null
																		usr.overlays += new /obj/orb/aodesorb5
																		spawn(1)
																			usr.overlays = null
																			usr.overlays += new /obj/orb/aodesorb4
																			spawn(1)
																				usr.overlays = null
																				usr.overlays += new /obj/orb/aodesorb3
																				spawn(1)
																					usr.overlays = null
																					usr.overlays += new /obj/orb/aodesorb2
																					spawn(1)
																						usr.overlays = null
																						usr.overlays += new /obj/orb/aodesorb1
																						spawn(1)
																							usr.overlays = null
																							usr.Selforb = 0
																							usr.density = 1
			else
				usr.power += 1
				usr.overlays = new /obj/orb/aodesorb1
				view(9)<< "[usr] orbs away"
				usr.Exposing_Magic()
				usr.Energy -= 10
				spawn(1)
					usr.overlays = null
					usr.overlays += new /obj/orb/aodesorb2
					spawn(1)
						usr.overlays = null
						usr.overlays += new /obj/orb/aodesorb3
						spawn(1)
							usr.overlays = null
							usr.overlays += new /obj/orb/aodesorb4
							spawn(1)
								usr.overlays = null
								usr.overlays += new /obj/orb/aodesorb5
								spawn(1)
									usr.overlays = null
									usr.overlays += new /obj/orb/aodesorb6
									spawn(1)
										usr.overlays = null
										usr.overlays += new /obj/orb/aodesorb7
										spawn(1)
											usr.overlays = null
											usr.overlays += new /obj/orb/aodesorb8
											spawn(1)
												usr.overlays = null
												usr.overlays += new /obj/orb/aodesorb9
												spawn(1)
													usr.overlays = null
													usr.overlays += new /obj/orb/aodesorb10
													spawn(1)
														usr.overlays = null
														usr.icon = null
														src.x = M:x
														src.y = M:y+1
														src.z = M:z
														src.dir = SOUTH
														M << "[src.name] orbed behind you!!!"
														usr.overlays += new /obj/orb/aodesorb9
														spawn(1)
															usr.overlays = null
															usr.overlays += new /obj/orb/aodesorb8
															spawn(1)
																usr.overlays = null
																usr.overlays += new /obj/orb/aodesorb7
																spawn(1)
																	usr.overlays = null
																	usr.overlays += new /obj/orb/aodesorb6
																	spawn(1)
																		usr.overlays = null
																		usr.overlays += new /obj/orb/aodesorb5
																		spawn(1)
																			usr.overlays = null
																			usr.overlays += new /obj/orb/aodesorb4
																			spawn(1)
																				usr.overlays = null
																				usr.overlays += new /obj/orb/aodesorb3
																				spawn(1)
																					usr.overlays = null
																					usr.overlays += new /obj/orb/aodesorb2
																					spawn(1)
																						usr.overlays = null
																						usr.overlays += new /obj/orb/aodesorb1
																						spawn(1)
																							usr.overlays = null
																							usr.Selforb = 0
																							usr.density = 1


mob/Destiny
	verb
		Destiny_orb_place()		//attack a mob within 1 tile of you
			set category = "Skills"
			var/default_value = "Earth"
			var/list/places = list("Earth", "Hell", "Heaven", "Charmed manor", "Park", "Julian's House", "Kyros House", "DragoWings House", "Graveyard", "The Ultimate")
			choose_place = input(usr, default_value) in places
			switch(choose_place)
				if("Earth")
					usr.place = "Earth"
				if("Hell")
					usr.place = "Hell"
				if("Heaven")
					if(usr.race == "Whitelighter"||usr.race=="Half Whitelighter Half Witch")
						usr.place = "Heaven"
					else
						usr<<"You cannot go here"
				if("Charmed manor")
					usr.place = "Charmed"
				if("Park")
					usr.place = "Park"
				if("Julian's House")
					usr.place = "SyncWolf"
				if("Kyros House")
					usr.place = "Zeniox"
				if("DragoWings House")
					usr.place = "Drago"
				if("Graveyard")
					usr.place = "Graveyard"
				if("The Ultimate")
					usr.place = "Ultimate"
			if(usr.Freeze==1)
				usr<<"Your frozen, you can't use magic"
				return
			if(usr.RolePlaying == 0)
				usr<<"Your not roleplaying"
				return
			if(usr.Energy <= 0)
				usr<<"You don't have the energy for this"
				return
			if(usr.death==1)
				usr<<"You are death"
				return
			usr.power += 1
			usr.overlays = new /obj/orb/aodesorb1
			view(9)<< "[usr] orbs away"
			usr.Energy -= 10
			usr.Exposing_Magic()
			spawn(1)
				usr.overlays = null
				usr.overlays += new /obj/orb/aodesorb2
				spawn(1)
					usr.overlays = null
					usr.overlays += new /obj/orb/aodesorb3
					spawn(1)
						usr.overlays = null
						usr.overlays += new /obj/orb/aodesorb4
						spawn(1)
							usr.overlays = null
							usr.overlays += new /obj/orb/aodesorb5
							spawn(1)
								usr.overlays = null
								usr.overlays += new /obj/orb/aodesorb6
								spawn(1)
									usr.overlays = null
									usr.overlays += new /obj/orb/aodesorb7
									spawn(1)
										usr.overlays = null
										usr.overlays += new /obj/orb/aodesorb8
										spawn(1)
											usr.overlays = null
											usr.overlays += new /obj/orb/aodesorb9
											spawn(1)
												usr.overlays = null
												usr.overlays += new /obj/orb/aodesorb10
												spawn(1)
													usr.overlays = null
													usr.icon = null
													if(usr.place=="Earth")
														usr.loc = locate(/turf/Area/Earth)
													if(usr.place=="Hell")
														usr.loc = locate(/turf/Area/Hell)
													if(usr.place=="Heaven")
														if(usr.race == "Whitelighter"||usr.race=="Half Whitelighter Half Witch")
															usr.loc = locate(/turf/Area/Heaven)
														else
															usr << "You cannot go there"
													if(usr.place=="Charmed")
														usr.loc = locate(/turf/Area/Charmed)
													if(usr.place=="Park")
														usr.loc = locate(/turf/Area/Park)
													if(usr.place=="SyncWolf")
														usr.loc = locate(/turf/Area/SyncWolfsHouse)
													if(usr.place=="Zeniox")
														usr.loc = locate(/turf/Area/ZenioxHouse)
													if(usr.place=="Drago")
														usr.loc = locate(/turf/Area/DragowingHouse)
													if(usr.place=="Graveyard")
														usr.loc = locate(/turf/Area/Graveyard)
													if(usr.place=="Ultimate")
														usr.loc = locate(/turf/Area/Ultimate)
													usr.overlays += new /obj/orb/aodesorb9
													spawn(1)
														usr.overlays = null
														usr.overlays += new /obj/orb/aodesorb8
														spawn(1)
															usr.overlays = null
															usr.overlays += new /obj/orb/aodesorb7
															spawn(1)
																usr.overlays = null
																usr.overlays += new /obj/orb/aodesorb6
																spawn(1)
																	usr.overlays = null
																	usr.overlays += new /obj/orb/aodesorb5
																	spawn(1)
																		usr.overlays = null
																		usr.overlays += new /obj/orb/aodesorb4
																		spawn(1)
																			usr.overlays = null
																			usr.overlays += new /obj/orb/aodesorb3
																			spawn(1)
																				usr.overlays = null
																				usr.overlays += new /obj/orb/aodesorb2
																				spawn(1)
																					usr.overlays = null
																					usr.overlays += new /obj/orb/aodesorb1
																					spawn(1)
																						usr.overlays = null
																						usr.Selforb = 0
																						usr.density = 1


mob/Rank_GM/verb
	Block_Tele()
		set category = "Skills"
		set name = "Block tele"
		set desc = "Blocks teleport so people cant reach you"
		if(usr.Freeze==1)
			usr<<"Your frozen, you can't use magic"
			return
		if(usr.block_tele==1)
			view(9)<<"[usr] lowers the force field, unblocking teleport"
			usr.block_tele = 0
		else
			view(9)<<"[usr] raises a force field to block teleport"
			usr.block_tele = 1



mob/witch/Empath/verb/Sense(mob/M in view(9)-usr)
	set name = "Emphathic Sense"
	set category = "Skills"
	set desc = "Sense a personne"
	if(usr.Freeze==1)
		usr<<"Your frozen, you can't use magic"
		return
	if(usr.Energy <= 0)
		usr<<"You don't have the energy for this"
		return
	usr<<"<i>You are sensing [M]"
	usr.Energy -= 5
	if(M.containhollow==1)
		usr.verbs -= new /mob/witch/Empath/verb/Sense
		M.verbs += new /mob/witch/Empath/verb/Sense
		view(9)<<"[M] has taken [usr]'s power using the hollow"
		return
	if(M.good==1)
		if(M.Strength>=usr.Strength)
			usr<<"<i>[M] seems to be a [M.class]"
			usr<<"<i>[M] also seems to be stronger then you"
			usr<<"<i>[M] seems to be Good hearted"
		if(M.Strength<=usr.Strength)
			usr<<"<i>[M] seems to be a [M.class]"
			usr<<"<i>[M] also seems to be weaker then you"
			usr<<"<i>[M] seems to be Good hearted"
	if(M.evil==1)
		if(M.Strength>=usr.Strength)
			usr<<"<i>[M] seems to be a [M.class]"
			usr<<"<i>[M] also seems to be stronger then you"
			usr<<"<i>[M] seems to be Evil by nature"
		if(M.Strength<=usr.Strength)
			usr<<"<i>[M] seems to be a [M.class]"
			usr<<"<i>[M] also seems to be weaker then you"
			usr<<"<i>[M] seems to be Evil by nature"
	else if(M.good==0&&M.evil==0)
		if(M.Strength>=usr.Strength)
			usr<<"<i>[M] seems to be a [M.class]"
			usr<<"<i>[M] also seems to be stronger then you"
			usr<<"<i>[M] seems to be a neutral being"
		if(M.Strength<=usr.Strength)
			usr<<"<i>[M] seems to be a [M.class]"
			usr<<"<i>[M] also seems to be weaker then you"
			usr<<"<i>[M] seems to be a neutral being"

mob/witch/Telepath/verb/Mind_Talk(mob/M in world, msg as text)
	set name = "Telepathic talk"
	set category = "Skills"
	set desc = "Speak to a personnes telephatically"
	if(usr.Freeze==1)
		usr<<"Your frozen, you can't use magic"
		return
	if(usr.RolePlaying == 0)
		usr<<"Your not roleplaying"
		return
	if(usr.Energy <= 0)
		usr<<"You don't have the energy for this"
		return
	usr<<"<i>You Telepathically say: [html_encode(msg)]"
	M<<"<i>You hear a voice in your head say: [html_encode(msg)]"
	usr.Energy -= 5

mob/witch/verb
	Blink()
		set category = "Skills"
		set name = "Blink"
		set desc = "instant teleporting though dimensions"
		if(usr.Freeze==1)
			usr<<"Your frozen, you can't use magic"
			return
		if(usr.Energy <= 0)
			usr<<"You don't have the energy for this"
			return
		if(usr.Selforb == 0)
			view(9)<< "[usr] blinks away"
			usr.Energy -= 5
			usr.Selforb = 1
			usr.Exposing_Magic()
			usr.density = 0
			usr.icon = null
		else
			usr.Selforb = 0
			usr.density = 1
			usr.icon = new/mob/goodwitch
			usr.Energy -= 5
			usr.Exposing_Magic()
			view(9)<< "[usr] blinks back"
	Blink_Long(var/mob/M in world)
		set category = "Skills"
		set name = "Blink Long"
		set desc = "instant teleporting though dimensions"
		if(usr.Freeze==1)
			usr<<"Your frozen, you can't use magic"
			return
		if(usr.RolePlaying == 0)
			usr<<"Your not roleplaying"
			return
		if(M.RolePlaying == 0)
			usr<<"[M] isnt roleplaying"
			return
		if(usr.Energy <= 0)
			usr<<"You don't have the energy for this"
			return
		if(usr.death==1)
			usr<<"You are death"
			return
		if(M.death==1)
			usr<<"[M] is death"
			return
		if(M.erased==1)
			return
		if(usr.good==1 && M.indemonschool==1)
			return
		if(usr.evil==1 && M.inmagicschool==1)
			return
		if(usr.neutral==1)
			if(M.indemonschool==1||M.inmagicschool==1)
				return
		if(usr.evil==1 && M.indemonschool==1)
			usr.indemonschool=1
		if(usr.good==1 && M.inmagicschool==1)
			usr.inmagicschool=1
		if(M.block_tele==1)
			switch(alert(M,"[src] is trying to teleport to you! Allow [src] to come to you?","","Yes","No"))
				if("Yes")
					..()
				if("No")
					src<<"You cant sense [M]"
					return
		if(M.name == "Elder")
			usr<<"You dont know the location of the Elders"
			return
		if(M.name == "GrandElder")
			usr<<"You dont know the location of the Elders"
			return
		if(M.name == "FirstTimePlayer")
			usr<<"You cannot teleport to this"
			return
		if(M.name == "The Hollow")
			usr<<"You dont know the location of the hollow"
			return
		if(M.inheaven==1)
			usr<<"You cannot go to this personne"
			return
		usr.density = 0
		usr.Energy -= 10
		usr.icon = null
		sleep(3)
		src.x = M:x
		src.y = M:y+1
		src.z = M:z
		usr.Exposing_Magic()
		src.dir = SOUTH
		M << "[src.name] blinked behind you!!!"
		usr.icon = new/mob/goodwitch
		usr.density = 1
		usr.Selforb = 0

	Blink_place()
		set category = "Skills"
		set name = "Blink place"
		set desc = "instant teleporting though dimensions"
		var/default_value = "Earth"
		var/list/places = list("Earth", "Hell", "Charmed manor", "Park", "Julian's House", "Kyros House", "DragoWings House", "Graveyard", "The Ultimate")
		choose_place = input(usr, default_value) in places
		switch(choose_place)
			if("Earth")
				usr.place = "Earth"
			if("Hell")
				usr.place = "Hell"
			if("Charmed manor")
				usr.place = "Charmed"
			if("Park")
				usr.place = "Park"
			if("Julian's House")
				usr.place = "SyncWolf"
			if("Kyros House")
				usr.place = "Zeniox"
			if("DragoWings House")
				usr.place = "Drago"
			if("Graveyard")
				usr.place = "Graveyard"
			if("The Ultimate")
				usr.place = "Ultimate"
		if(usr.Freeze==1)
			usr<<"Your frozen, you can't use magic"
			return
		if(usr.RolePlaying == 0)
			usr<<"Your not roleplaying"
			return
		if(usr.Energy <= 0)
			usr<<"You don't have the energy for this"
			return
		if(usr.death==1)
			usr<<"You are death"
			return
		usr.density = 0
		usr.icon = null
		usr.Exposing_Magic()
		usr.Energy -= 5
		sleep(3)
		if(usr.place=="Earth")
			usr.loc = locate(/turf/Area/Earth)
		if(usr.place=="Hell")
			usr.loc = locate(/turf/Area/Hell)
		if(usr.place=="Charmed")
			usr.loc = locate(/turf/Area/Charmed)
		if(usr.place=="Park")
			usr.loc = locate(/turf/Area/Park)
		if(usr.place=="SyncWolf")
			usr.loc = locate(/turf/Area/SyncWolfsHouse)
		if(usr.place=="Zeniox")
			usr.loc = locate(/turf/Area/ZenioxHouse)
		if(usr.place=="Drago")
			usr.loc = locate(/turf/Area/DragowingHouse)
		if(usr.place=="Graveyard")
			usr.loc = locate(/turf/Area/Graveyard)
		if(usr.place=="Ultimate")
			usr.loc = locate(/turf/Area/Ultimate)
		usr.icon = new/mob/goodwitch
		usr.Selforb = 0
		usr.density = 1




mob/demon/verb
	Summon_Athame()
		set category = "Skills"
		set desc = "Throws a athame"
		if(usr.Freeze==1)
			usr<<"Your frozen, you can't use magic"
			return
		if(usr.RolePlaying == 0)
			usr<<"Your not roleplaying"
			return
		if(usr.Energy <= 0)
			usr<<"You don't have the energy for this"
			return
		if(usr.Selforb == 0)
			var/obj/O = /obj/NewWorld/Athame
			usr.contents += O
			O.owner = usr.key
			usr<<"You summoned a Athame"
			usr.Energy -= 1
		else
			usr<<"You cant do this while orbing"

mob/witch
	verb
		Levitation()
			set category = "Skills"
			set name = "Levitation"
			for(var/mob/M)
				if(usr.Freeze==1)
					usr<<"Your frozen, you can't use magic"
					return
				if(usr.RolePlaying == 0)
					usr<<"Your not roleplaying"
					return
				if(usr.Selforb==1)
					usr << "Not while orbed"
					return
				if(usr.Energy <= 0)
					usr<<"You don't have the energy for this"
					return
				if(usr.density==1)
					usr<<"You fly up into the air and levitate."
					oview()<<"[M] Fly's up into the air and levitates."
					M.Froze=1
					M.Freeze=1
					usr.density = 0
					return
				else
					usr<<"You land on the ground gently."
					oview()<<"[M] lands on the ground gentaly."
					M.Froze=0
					M.Freeze=0
					usr.density = 1
					return

mob/witch
	verb
		Advanced_Blow_Up()		//attack a mob within 1 tile of you
			set category = "Skills"
			set name = "Advanced Molecular Combustion"
			for(var/mob/M in oview()-usr)
				if(usr.Freeze==1)
					usr<<"Your frozen, you can't use magic"
					return
				if(usr.RolePlaying == 0)
					usr<<"Your not roleplaying"
					return
				if(usr.Energy <= 0)
					usr<<"You don't have the energy for this"
					return
				if(M:shielded==1)
					view(9)<<"[M]'s shield blocks the attack"
					return
				if(M.Whitelighter == 1)
					M.Whitelighter_Death()
					return
				if(M.containhollow==1)
					usr.verbs -= new /mob/witch/verb/Advanced_Blow_Up
					M.verbs += new /mob/witch/verb/Advanced_Blow_Up
					view(9)<<"[M] has taken [usr]'s power using the hollow"
					return
				if(usr.Energy <= 0)
					usr<<"You dont have the energy for this"
					return
				if(usr.Selforb == 0)
	/*				for(var/mob/P as mob in range(6,usr))*/
					if(M.Selforb==1)
						usr<<"You cant find [M]"
						return
					if(usr.blowing==1)
						usr<<"Your already attacking"
						return
					usr.blowing = 1
					usr.Exposing_Magic()
					sleep(4)
					M.overlays += new /obj/blowup
					M.health -= usr.Strength
					usr.Energy -= 2000
					sleep(8)
					M.overlays = null
					usr.blowing = 0
					usr.deathcheck(M)
				else
					usr<<"You cant do this while orbing"
obj/blowup
	icon = 'magicgood.dmi'
	icon_state = "blowup"
	layer = MOB_LAYER

mob/witch
	verb
		Blow_Up(mob/M as mob in range(6,usr)-usr)		//attack a mob within 1 tile of you
			set category = "Skills"
			set name = "Molecular Combustion"
			if(usr.Freeze==1)
				usr<<"Your frozen, you can't use magic"
				return
			if(usr.RolePlaying == 0)
				usr<<"Your not roleplaying"
				return
			if(usr.Energy <= 0)
				usr<<"You don't have the energy for this"
				return
			if(M:shielded==1)
				view(9)<<"[M]'s shield blocks the attack"
				return
			if(M.Whitelighter == 1)
				M.Whitelighter_Death()
				return
			if(M.containhollow==1)
				usr.verbs -= new /mob/witch/verb/Blow_Up
				M.verbs += new /mob/witch/verb/Blow_Up
				view(9)<<"[M] has taken [usr]'s power using the hollow"
				return
			if(usr.Energy <= 0)
				usr<<"You dont have the energy for this"
				return
			if(usr.Selforb == 0)
/*				for(var/mob/P as mob in range(6,usr))*/
				if(M.Selforb==1)
					usr<<"You cant find [M]"
					return
				if(usr.blowing==1)
					usr<<"Your already attacking"
					return
				usr.blowing = 1
				usr.Exposing_Magic()
				sleep(4)
				M.overlays += new /obj/blowup
				M.health -= usr.Strength
				usr.Energy -= 25
				sleep(8)
				M.overlays = null
				usr.blowing = 0
				usr.deathcheck(M)
			else
				usr<<"You cant do this while orbing"
obj/blowup
	icon = 'magicgood.dmi'
	icon_state = "blowup"
	layer = MOB_LAYER

mob/demon/verb/Shapeshift(mob/X as mob|obj in oview(9))
	set category = "Skills"
	if(usr.Freeze==1)
		usr<<"Your frozen, you can't use magic"
		return
	switch(alert(usr,"Shapesift into?","Shapeshift","Shapeshift","Revert"))
		if("Shapeshift")
			if(usr.Energy <= 0)
				usr<<"You don't have the energy for this"
				return
			var/obj/ranked
			if(X.ranked==1)
				usr<<"You may not shapeshift into [X] [ranked]"
				return
			usr.icon = X.icon
			usr.Exposing_Magic()
			usr.icon_state = X.icon_state
			usr<<"You shapeshifted into [X]"
			usr.Energy -= 10
			usr.name = X.name
		if("Revert")
			if(usr.Energy <= 0)
				usr<<"You don't have the energy for this"
				return
			if(usr.rank=="The Source")
				usr.icon = 'Goodwitchs.dmi'
				usr.icon_state = "Source"
			if(usr.rank=="Dark Force Cultist")
				usr.icon = 'Goodwitchs.dmi'
				usr.icon_state = "Source"
			if(usr.rank=="Triad")
				usr.icon = 'Goodwitchs.dmi'
				usr.icon_state = "triad"
			if(usr.rank=="Avatar")
				usr.icon = 'Goodwitchs.dmi'
				usr.icon_state = "Avatar"
			else
				if(usr.key=="YOUR NAME HERE")
					usr.icon = 'Goodwitchs.dmi'
					usr.icon_state = "lighter"
					usr.Energy -= 5
					usr.Exposing_Magic()
					usr.name = usr.originalname
					return
				usr.icon = 'Goodwitchs.dmi'
				usr.icon_state = "[usr.original_icon]"
			usr.Energy -= 5
			usr.Exposing_Magic()
			usr.name = usr.originalname

mob/whitelighter/verb/Glamor(mob/M in view(9))
	set category = "Skills"
	if(usr.Freeze==1)
		usr<<"Your frozen, you can't use magic"
		return
	switch(alert(usr,"Glamor into?","Glamor","Glamor","Revert"))
		if("Glamor")
			if(usr.Energy <= 0)
				usr<<"You don't have the energy for this"
				return
			if(M.containhollow==1)
				usr.verbs -= new /mob/whitelighter/verb/Glamor
				M.verbs += new /mob/whitelighter/verb/Glamor
				view(9)<<"[M] has taken [usr]'s power using the hollow"
				return
			if(M.ranked==1)
				usr<<"You may not glamor into [M]"
				return
			usr.icon = M.icon
			usr.icon_state = M.icon_state
			usr<<"You glamored into [M]"
			usr.Energy -= 10
			usr.Exposing_Magic()
		if("Revert")
			if(usr.Energy <= 0)
				usr<<"You don't have the energy for this"
				return
			if(usr.rank=="Elder")
				usr.icon = 'Goodwitchs.dmi'
				usr.icon_state = "Elder3"
			else
				usr.icon = 'Goodwitchs.dmi'
				usr.icon_state = "[usr.original_icon]"
			usr.Energy -= 5
			usr.Exposing_Magic()


mob/hollow
	verb
		Hollow_Orb()		//attack a mob within 1 tile of you
			set category = "Skills"
			set name = "Hollow Orb"
			if(usr.Freeze==1)
				usr<<"Your frozen, you can't use magic"
				return
			if(usr.Energy <= 0)
				usr<<"You don't have the energy for this"
				return
			if(usr.Selforb == 0)
				usr.Selforb = 1
				usr.density = 0
				usr.power += 1
				usr.Exposing_Magic()
				usr.Energy -= 5
				usr.overlays = new /obj/orb/hollow1
				view(9)<< "[usr] orbs away"
				spawn(1)
					usr.overlays = null
					usr.overlays += new /obj/orb/hollow2
					spawn(1)
						usr.overlays = null
						usr.overlays += new /obj/orb/hollow3
						spawn(1)
							usr.overlays = null
							usr.icon = null
							usr.overlays += new /obj/orb/hollow4
							spawn(1)
								usr.overlays = null
								usr.overlays += new /obj/orb/hollow5
								spawn(1)
									usr.overlays = null
									usr.overlays += new /obj/orb/hollow6
									spawn(1)
										usr.overlays = null

			else
				usr.Selforb = 0
				usr.density = 1
				usr.Energy -= 5
				usr.overlays = new /obj/orb/hollow6
				spawn(1)
					view(9)<< "[usr] orbs in"
					usr.Exposing_Magic()
					usr.overlays = null
					usr.overlays += new /obj/orb/hollow5
					spawn(1)
						usr.overlays = null
						usr.overlays += new /obj/orb/hollow4
						spawn(1)
							usr.overlays = null
							usr.icon = new /mob/Darklighter()
							usr.overlays += new /obj/orb/hollow3
							spawn(1)
								usr.overlays = null
								usr.overlays += new /obj/orb/hollow2
								spawn(1)
									usr.overlays = null
									usr.overlays += new /obj/orb/hollow1
									spawn(1)
										usr.overlays = null

obj/orb
	hollow1
		icon = 'magicgood.dmi'
		icon_state = "hllw1"
		layer = MOB_LAYER
obj/orb
	hollow2
		icon = 'magicgood.dmi'
		icon_state = "hllw2"
		layer = MOB_LAYER
obj/orb
	hollow3
		icon = 'magicgood.dmi'
		icon_state = "hllw3"
		layer = MOB_LAYER
obj/orb
	hollow4
		icon = 'magicgood.dmi'
		icon_state = "hllw4"
		layer = MOB_LAYER
obj/orb
	hollow5
		icon = 'magicgood.dmi'
		icon_state = "hllw5"
		layer = MOB_LAYER
obj/orb
	hollow6
		icon = 'magicgood.dmi'
		icon_state = "hllw6"
		layer = MOB_LAYER

mob/hollow
	verb
		Hollow_Orb_longdist(var/mob/M in world)		//attack a mob within 1 tile of you
			set category = "Skills"
			set name = "Hollow Orb Long"
			if(usr.Freeze==1)
				usr<<"Your frozen, you can't use magic"
				return
			if(usr.RolePlaying == 0)
				usr<<"Your not roleplaying"
				return
			if(usr.Energy <= 0)
				usr<<"You don't have the energy for this"
				return
			if(M.RolePlaying == 0)
				usr<<"[M] isnt roleplaying"
				return
			if(usr.death==1)
				usr<<"You are death"
				return
			if(M.death==1)
				usr<<"[M] is death"
				return
			if(M.erased==1)
				return
			if(usr.good==1 && M.indemonschool==1)
				return
			if(usr.evil==1 && M.inmagicschool==1)
				return
			if(usr.neutral==1)
				if(M.indemonschool==1||M.inmagicschool==1)
					return
			if(usr.evil==1 && M.indemonschool==1)
				usr.indemonschool=1
			if(usr.good==1 && M.inmagicschool==1)
				usr.inmagicschool=1
			if(M.block_tele==1)
				switch(alert(M,"[src] is trying to teleport to you! Allow [src] to come to you?","","Yes","No"))
					if("Yes")
						..()
					if("No")
						src<<"You cant sense [M]"
						return
			if(M.name == "Elder")
				usr<<"You dont know the location of the Elders"
				return
			if(M.name == "GrandElder")
				usr<<"You dont know the location of the Elders"
				return
			if(M.name == "FirstTimePlayer")
				usr<<"You cannot teleport to this"
				return
			if(M.inheaven==1)
				usr<<"You cannot go to this personne"
				return
			if(M.inhell==1)
				usr<<"You cannot go to this personne"
				return
			usr.power += 1
			usr.overlays = new /obj/orb/hollow1
			view(9)<< "[usr] orbs away"
			usr.Exposing_Magic()
			usr.Energy -= 10
			spawn(1)
				usr.overlays = null
				usr.overlays += new /obj/orb/hollow2
				spawn(1)
					usr.overlays = null
					usr.icon = null
					usr.overlays += new /obj/orb/hollow3
					spawn(1)
						usr.x = M:x
						usr.y = M:y+1
						usr.z = M:z
						usr.dir = SOUTH
						M << "[usr.name] orbed behind you!!!"
						usr.overlays = null
						usr.icon = new /mob/goodwitch()
						usr.overlays += new /obj/orb/hollow4
						spawn(1)
							usr.overlays = null
							usr.overlays += new /obj/orb/hollow5
							spawn(1)
								usr.overlays = null
								usr.overlays += new /obj/orb/hollow6
								spawn(1)
									usr.overlays = null
									usr.Selforb = 0
									usr.density = 1

mob/hollow
	verb
		Hollow_orb_other(mob/M in view(9))		//attack a mob within 1 tile of you
			set name = "Hollow Orb Player"
			set category = "Skills"
			var/mob/X = input("Choose a target:","Target") as mob in world
			if(usr.Freeze==1)
				usr<<"Your frozen, you can't use magic"
				return
			if(M.RolePlaying==0)
				usr<<"[M] isnt roleplaying"
				return
			if(usr.Energy <= 0)
				usr<<"You don't have the energy for this"
				return
			if(X.RolePlaying==0)
				usr<<"[X] isnt roleplaying"
				return
			if(usr.Selforb == 1||M.Selforb==1)
				usr<<"Not while orbing"
				return
			if(M.good==1 && X.indemonschool==1)
				return
			if(M.evil==1 && X.inmagicschool==1)
				return
			if(M.neutral==1)
				if(X.indemonschool==1||X.inmagicschool==1)
					return
			if(X.block_tele==1)
				switch(alert(X,"[M] is being teleported to you! Allow [M] to come to you?","","Yes","No"))
					if("Yes")
						..()
					if("No")
						usr<<"You cant sense [X]"
						return
			usr.power += 1
			M.overlays = new /obj/orb/hollow1
			view(9)<< "[M] gets orbed away"
			usr.Exposing_Magic()
			usr.Energy -= 15
			spawn(1)
				M.overlays = null
				M.overlays += new /obj/orb/hollow2
				spawn(1)
					M.overlays = null
					M.icon = null
					M.overlays += new /obj/orb/hollow3
					spawn(1)
						M.x = X:x
						M.y = X:y+1
						M.z = X:z
						M.dir = SOUTH
						X << "[M.name] orbed behind you!!!"
						M.overlays = null
						M.icon = new /mob/goodwitch()
						M.overlays += new /obj/orb/hollow4
						spawn(1)
							M.overlays = null
							M.overlays += new /obj/orb/hollow5
							spawn(1)
								M.overlays = null
								M.overlays += new /obj/orb/hollow6
								spawn(1)
									M.overlays = null
									M.Selforb = 0
									M.density = 1


mob/hollow
	verb
		Hollow_Orb_place()		//attack a mob within 1 tile of you
			set category = "Skills"
			set name = "Hollow Orb place"
			var/default_value = "Earth"
			var/list/places = list("Earth", "Hell", "Charmed manor", "Park", "Julian's House", "Kyros House", "DragoWings House", "Graveyard", "The Ultimate")
			choose_place = input(usr, default_value) in places
			switch(choose_place)
				if("Earth")
					usr.place = "Earth"
				if("Hell")
					usr.place = "Hell"
				if("Charmed manor")
					usr.place = "Charmed"
				if("Park")
					usr.place = "Park"
				if("Julian's House")
					usr.place = "SyncWolf"
				if("Kyros House")
					usr.place = "Zeniox"
				if("DragoWings House")
					usr.place = "Drago"
				if("Graveyard")
					usr.place = "Graveyard"
				if("The Ultimate")
					usr.place = "Ultimate"
			if(usr.Freeze==1)
				usr<<"Your frozen, you can't use magic"
				return
			if(usr.RolePlaying == 0)
				usr<<"Your not roleplaying"
				return
			if(usr.Energy <= 0)
				usr<<"You don't have the energy for this"
				return
			if(usr.death==1)
				usr<<"You are death"
				return
			usr.power += 1
			usr.overlays = new /obj/orb/hollow1
			view(9)<< "[usr] orbs away"
			usr.Exposing_Magic()
			usr.Energy -= 10
			spawn(1)
				usr.overlays = null
				usr.overlays += new /obj/orb/hollow2
				spawn(1)
					usr.overlays = null
					usr.icon = null
					usr.overlays += new /obj/orb/hollow3
					spawn(1)
						if(usr.place=="Earth")
							usr.loc = locate(/turf/Area/Earth)
						if(usr.place=="Hell")
							usr.loc = locate(/turf/Area/Hell)
						if(usr.place=="Charmed")
							usr.loc = locate(/turf/Area/Charmed)
						if(usr.place=="Park")
							usr.loc = locate(/turf/Area/Park)
						if(usr.place=="SyncWolf")
							usr.loc = locate(/turf/Area/SyncWolfsHouse)
						if(usr.place=="Zeniox")
							usr.loc = locate(/turf/Area/ZenioxHouse)
						if(usr.place=="Drago")
							usr.loc = locate(/turf/Area/DragowingHouse)
						if(usr.place=="Graveyard")
							usr.loc = locate(/turf/Area/Graveyard)
						if(usr.place=="Ultimate")
							usr.loc = locate(/turf/Area/Ultimate)
						usr.overlays = null
						usr.icon = new /mob/goodwitch()
						usr.overlays += new /obj/orb/hollow4
						spawn(1)
							usr.overlays = null
							usr.overlays += new /obj/orb/hollow5
							spawn(1)
								usr.overlays = null
								usr.overlays += new /obj/orb/hollow6
								spawn(1)
									usr.overlays = null
									usr.Selforb = 0
									usr.density = 1


mob/hollow
	verb
		Hollow_Orb_player_place(mob/M in view(9))		//attack a mob within 1 tile of you
			set category = "Skills"
			set name = "Hollow Orb player place"
			var/default_value = "Earth"
			var/list/places = list("Earth", "Hell", "Charmed manor", "Park", "Julian's House", "Kyros House", "DragoWings House", "Graveyard", "The Ultimate")
			choose_place = input(usr, default_value) in places
			switch(choose_place)
				if("Earth")
					M.place = "Earth"
				if("Hell")
					M.place = "Hell"
				if("Charmed manor")
					M.place = "Charmed"
				if("Park")
					M.place = "Park"
				if("Julian's House")
					M.place = "SyncWolf"
				if("Kyros House")
					M.place = "Zeniox"
				if("DragoWings House")
					M.place = "Drago"
				if("Graveyard")
					M.place = "Graveyard"
				if("The Ultimate")
					M.place = "Ultimate"
			if(usr.Freeze==1)
				usr<<"Your frozen, you can't use magic"
				return
			if(usr.RolePlaying == 0)
				usr<<"Your not roleplaying"
				return
			if(M.RolePlaying == 0)
				usr<<"[M] isnt roleplaying"
				return
			if(usr.Energy <= 0)
				usr<<"You don't have the energy for this"
				return
			if(usr.death==1)
				usr<<"You are death"
				return
			usr.power += 1
			M.overlays = new /obj/orb/hollow1
			view(9)<< "[usr] orbs away"
			usr.Energy -= 10
			usr.Exposing_Magic()
			spawn(1)
				M.overlays = null
				M.overlays += new /obj/orb/hollow2
				spawn(1)
					M.overlays = null
					M.icon = null
					M.overlays += new /obj/orb/hollow3
					spawn(1)
						if(M.place=="Earth")
							M.loc = locate(/turf/Area/Earth)
						if(M.place=="Hell")
							M.loc = locate(/turf/Area/Hell)
						if(M.place=="Charmed")
							M.loc = locate(/turf/Area/Charmed)
						if(M.place=="Park")
							M.loc = locate(/turf/Area/Park)
						if(M.place=="SyncWolf")
							usr.loc = locate(/turf/Area/SyncWolfsHouse)
						if(M.place=="Zeniox")
							M.loc = locate(/turf/Area/ZenioxHouse)
						if(M.place=="Drago")
							M.loc = locate(/turf/Area/DragowingHouse)
						if(M.place=="Graveyard")
							M.loc = locate(/turf/Area/Graveyard)
						if(M.place=="Ultimate")
							M.loc = locate(/turf/Area/Ultimate)
						M.overlays = null
						M.icon = new /mob/goodwitch()
						M.overlays += new /obj/orb/hollow4
						spawn(1)
							M.overlays = null
							M.overlays += new /obj/orb/hollow5
							spawn(1)
								M.overlays = null
								M.overlays += new /obj/orb/hollow6
								spawn(1)
									M.overlays = null
									M.Selforb = 0
									M.density = 1


mob/hollow2
	verb
		W_Hollow_Orb()		//attack a mob within 1 tile of you
			set category = "Skills"
			set name = "Light Orb"
			if(usr.Freeze==1)
				usr<<"Your frozen, you can't use magic"
				return
			if(usr.Energy <= 0)
				usr<<"You don't have the energy for this"
				return
			if(usr.Selforb == 0)
				usr.Selforb = 1
				usr.density = 0
				usr.power += 1
				usr.Exposing_Magic()
				usr.overlays = new /obj/orb2/hollow1
				view(9)<< "[usr] orbs away"
				usr.Energy -= 5
				spawn(1)
					usr.overlays = null
					usr.overlays += new /obj/orb2/hollow2
					spawn(1)
						usr.overlays = null
						usr.overlays += new /obj/orb2/hollow3
						spawn(1)
							usr.overlays = null
							usr.icon = null
							usr.overlays += new /obj/orb2/hollow4
							spawn(1)
								usr.overlays = null
								usr.overlays += new /obj/orb2/hollow5
								spawn(1)
									usr.overlays = null
									usr.overlays += new /obj/orb2/hollow6
									spawn(1)
										usr.overlays = null

			else
				usr.Selforb = 0
				usr.density = 1
				usr.overlays = new /obj/orb2/hollow6
				spawn(1)
					view(9)<< "[usr] orbs in"
					usr.Energy -= 5
					usr.Exposing_Magic()
					usr.overlays = null
					usr.overlays += new /obj/orb2/hollow5
					spawn(1)
						usr.overlays = null
						usr.overlays += new /obj/orb2/hollow4
						spawn(1)
							usr.overlays = null
							usr.icon = new /mob/goodwitch()
							usr.overlays += new /obj/orb2/hollow3
							spawn(1)
								usr.overlays = null
								usr.overlays += new /obj/orb2/hollow2
								spawn(1)
									usr.overlays = null
									usr.overlays += new /obj/orb2/hollow1
									spawn(1)
										usr.overlays = null

obj/orb2
	hollow1
		icon = 'magicgood.dmi'
		icon_state = "hollow1"
		layer = MOB_LAYER
obj/orb2
	hollow2
		icon = 'magicgood.dmi'
		icon_state = "hollow2"
		layer = MOB_LAYER
obj/orb2
	hollow3
		icon = 'magicgood.dmi'
		icon_state = "hollow3"
		layer = MOB_LAYER
obj/orb2
	hollow4
		icon = 'magicgood.dmi'
		icon_state = "hollow4"
		layer = MOB_LAYER
obj/orb2
	hollow5
		icon = 'magicgood.dmi'
		icon_state = "hollow5"
		layer = MOB_LAYER
obj/orb2
	hollow6
		icon = 'magicgood.dmi'
		icon_state = "hollow6"
		layer = MOB_LAYER

mob/hollow2
	verb
		W_Hollow_Orb_longdist(var/mob/M in world)		//attack a mob within 1 tile of you
			set category = "Skills"
			set name = "Light Orb Long"
			if(usr.Freeze==1)
				usr<<"Your frozen, you can't use magic"
				return
			if(usr.RolePlaying == 0)
				usr<<"Your not roleplaying"
				return
			if(usr.Energy <= 0)
				usr<<"You don't have the energy for this"
				return
			if(M.RolePlaying == 0)
				usr<<"[M] isnt roleplaying"
				return
			if(usr.death==1)
				usr<<"You are death"
				return
			if(M.death==1)
				usr<<"[M] is death"
				return
			if(M.erased==1)
				return
			if(usr.good==1 && M.indemonschool==1)
				return
			if(usr.evil==1 && M.inmagicschool==1)
				return
			if(usr.neutral==1)
				if(M.indemonschool==1||M.inmagicschool==1)
					return
			if(M.block_tele==1)
				switch(alert(M,"[src] is trying to teleport to you! Allow [src] to come to you?","","Yes","No"))
					if("Yes")
						..()
					if("No")
						src<<"You cant sense [M]"
						return
			if(M.name == "Triad")
				usr<<"You dont know the location of the Triad"
				return
			if(M.name == "FirstTimePlayer")
				usr<<"You cannot teleport to this"
				return
			if(M.inheaven==1)
				usr<<"You cannot go to this personne"
				return
			if(M.inhell==1)
				usr<<"You cannot go to this personne"
				return
			usr.power += 1
			usr.overlays = new /obj/orb2/hollow1
			view(9)<< "[usr] orbs away"
			usr.Exposing_Magic()
			usr.Energy -= 10
			spawn(1)
				usr.overlays = null
				usr.overlays += new /obj/orb2/hollow2
				spawn(1)
					usr.overlays = null
					usr.overlays += new /obj/orb2/hollow3
					usr.icon = null
					spawn(1)
						usr.x = M:x
						usr.y = M:y+1
						usr.z = M:z
						usr.dir = SOUTH
						M << "[usr.name] orbed behind you!!!"
						usr.overlays = null
						usr.icon = new /mob/goodwitch()
						usr.overlays += new /obj/orb2/hollow4
						spawn(1)
							usr.overlays = null
							usr.overlays += new /obj/orb2/hollow5
							spawn(1)
								usr.overlays = null
								usr.overlays += new /obj/orb2/hollow6
								spawn(1)
									usr.overlays = null
									usr.Selforb = 0
									usr.density = 1

mob/hollow2
	verb
		W_Hollow_Orb_place()		//attack a mob within 1 tile of you
			set category = "Skills"
			set name = "Light Orb place"
			var/default_value = "Earth"
			var/list/places = list("Earth", "Hell", "Charmed manor", "Park", "Julian's House", "Kyros House", "DragoWings House", "Graveyard", "The Ultimate")
			choose_place = input(usr, default_value) in places
			switch(choose_place)
				if("Earth")
					usr.place = "Earth"
				if("Hell")
					usr.place = "Hell"
				if("Charmed manor")
					usr.place = "Charmed"
				if("Park")
					usr.place = "Park"
				if("Julian's House")
					usr.place = "SyncWolf"
				if("Kyros House")
					usr.place = "Zeniox"
				if("DragoWings House")
					usr.place = "Drago"
				if("Graveyard")
					usr.place = "Graveyard"
				if("The Ultimate")
					usr.place = "Ultimate"
			if(usr.Freeze==1)
				usr<<"Your frozen, you can't use magic"
				return
			if(usr.RolePlaying == 0)
				usr<<"Your not roleplaying"
				return
			if(usr.Energy <= 0)
				usr<<"You don't have the energy for this"
				return
			if(usr.death==1)
				usr<<"You are death"
				return
			usr.power += 1
			usr.overlays = new /obj/orb2/hollow1
			view(9)<< "[usr] orbs away"
			usr.Exposing_Magic()
			usr.Energy -= 10
			spawn(1)
				usr.overlays = null
				usr.overlays += new /obj/orb2/hollow2
				spawn(1)
					usr.overlays = null
					usr.overlays += new /obj/orb2/hollow3
					usr.icon = null
					spawn(1)
						if(usr.place=="Earth")
							usr.loc = locate(/turf/Area/Earth)
						if(usr.place=="Hell")
							usr.loc = locate(/turf/Area/Hell)
						if(usr.place=="Charmed")
							usr.loc = locate(/turf/Area/Charmed)
						if(usr.place=="Park")
							usr.loc = locate(/turf/Area/Park)
						if(usr.place=="SyncWolf")
							usr.loc = locate(/turf/Area/SyncWolfsHouse)
						if(usr.place=="Zeniox")
							usr.loc = locate(/turf/Area/ZenioxHouse)
						if(usr.place=="Drago")
							usr.loc = locate(/turf/Area/DragowingHouse)
						if(usr.place=="Graveyard")
							usr.loc = locate(/turf/Area/Graveyard)
						if(usr.place=="Ultimate")
							usr.loc = locate(/turf/Area/Ultimate)
						usr.overlays = null
						usr.icon = new /mob/goodwitch()
						usr.overlays += new /obj/orb2/hollow4
						spawn(1)
							usr.overlays = null
							usr.overlays += new /obj/orb2/hollow5
							spawn(1)
								usr.overlays = null
								usr.overlays += new /obj/orb2/hollow6
								spawn(1)
									usr.overlays = null
									usr.Selforb = 0
									usr.density = 1

mob/Rank
	verb
		Change_to_robe()
			set category = "Commands"
			if(usr:robed==0)
				usr.icon_state = "Elder3"
				usr<<"You put on your robe."
				usr.robed=1
			else
				usr.icon_state = original_icon
				usr<<"You put back on your normal clothes."
				usr.robed=0

mob/Rank/verb/Go_To_Hollow()
	set category = "Skills"
	if(usr.Freeze==1)
		usr<<"Your frozen, you can't use magic"
		return
	if(usr.RolePlaying == 0)
		usr<<"Your not roleplaying"
		return
	if(usr.death==1)
		usr<<"You are death"
		return
	if(usr.erased==1)
		return
	view(9)<< "[usr] go's to The Hollow"
	usr.loc=locate(/turf/Area/Hollow)
	usr.inhell = 0
	usr.inheaven = 0

mob/darklighter/verb
	Shoot_Bow()
		set category = "Skills"
		set desc = "Shoot DL bow"
		if(usr.Freeze==1)
			usr<<"Your frozen, you can't use magic"
			return
		if(usr.RolePlaying == 0)
			usr<<"Your not roleplaying"
			return
		if(usr.Energy <= 0)
			usr<<"You don't have the energy for this"
			return
		if(usr.attacking == 1)
			return
		if(usr.Selforb == 0)
			var/obj/darkenergyball/F = new /obj/darklighter/Arrow(src.loc)
			usr.Energy -= 5
			usr.attacking = 1
			F:owner = "[usr.key]"
			walk(F,usr.dir)
			sleep(8)
			usr.attacking = 0
			spawn(10)
				del(F)

		else
			usr<<"You cant do this while orbing"

obj/darklighter/Arrow
	name = "Arrow"
	icon = 'Items.dmi'
	icon_state = "Arrow"
	density = 1
	Bump(atom/M)
		if(istype(M,/mob/))
			for(var/mob/N in oview(9))
				if(src.owner == "[N.key]")
					M<<"You were hit by [N]!"
					N<<"You hit [M]"
					if(M:race=="Whitelighter")
						M<<"You have been fatally wounded by a poisoned arrow"
						M:health -= M:health/1.5
					M:health -= N.Strength
					M:deathcheck(M)
					for(var/obj/Firebolt/T in world)
						if(T:owner == "[N.key]")
							del(T)
					del(src)
				else
					..()
		if(istype(M,/obj/))
			spawn(1)
				M.overlays = null
				spawn(1)
					M.overlays = null
					spawn(1)
						M.overlays = null
						del(M)
			del(src)
		else
			..()
obj/darklighter/Arrow2
	name = "Arrow"
	icon = 'Items.dmi'
	icon_state = "Arrow"
	density = 1
	Bump(atom/M)
		if(istype(M,/mob/))
			for(var/mob/N in oview(9))
				if(src.owner == "[N.key]")
					M<<"You were hit by [N]!"
					N<<"You hit [M]"
					if(M:race=="Whitelighter")
						M<<"You have been fatally wounded by a poisoned arrow"
						M:health -= M:health/1.5
					M:health -= N.Strength
					M:deathcheck(M)
					for(var/obj/Firebolt/T in world)
						if(T:owner == "[N]")
							del(T)
					del(src)
				else
					..()
		if(istype(M,/obj/))
			spawn(1)
				M.overlays = null
				spawn(1)
					M.overlays = null
					spawn(1)
						M.overlays = null
						del(M)
			del(src)
		else
			..()


mob/avatar
	verb
		Avy_Orb()		//attack a mob within 1 tile of you
			set category = "Skills"
			set name = "Avatar Orb"
			if(usr.Freeze==1)
				usr<<"Your frozen, you can't use magic"
				return
			if(usr.Energy <= 0)
				usr<<"You don't have the energy for this"
				return
			if(usr.Selforb == 0)
				usr.Selforb = 1
				usr.density = 0
				usr.Exposing_Magic()
				usr.Energy -= 5
				usr.power += 1
				usr.overlays = new /obj/orb4/avy1
				view(9)<< "[usr] orbs away"
				spawn(1)
					usr.overlays = null
					usr.overlays += new /obj/orb4/avy2
					spawn(1)
						usr.overlays = null
						usr.icon = null
						usr.overlays += new /obj/orb4/avy3
						spawn(1)
							usr.overlays = null
							usr.overlays += new /obj/orb4/avy4
							spawn(1)
								usr.overlays = null

			else
				usr.Selforb = 0
				usr.density = 1
				usr.overlays = new /obj/orb4/avy4
				usr.Energy -= 5
				spawn(1)
					view(9)<< "[usr] orbs in"
					usr.Exposing_Magic()
					usr.overlays = null
					usr.overlays += new /obj/orb4/avy3
					spawn(1)
						usr.overlays = null
						usr.icon = new /mob/goodwitch()
						usr.overlays += new /obj/orb4/avy2
						spawn(1)
							usr.overlays = null
							usr.overlays += new /obj/orb4/avy1
							spawn(1)
								usr.overlays = null

obj/orb4
	avy1
		icon = 'magicgood.dmi'
		icon_state = "avy1"
		layer = MOB_LAYER
obj/orb4
	avy2
		icon = 'magicgood.dmi'
		icon_state = "avy2"
		layer = MOB_LAYER
obj/orb4
	avy3
		icon = 'magicgood.dmi'
		icon_state = "avy3"
		layer = MOB_LAYER
obj/orb4
	avy4
		icon = 'magicgood.dmi'
		icon_state = "avy4"
		layer = MOB_LAYER

mob/avatar
	verb
		Avy_Orb_longdist(var/mob/M in world)		//attack a mob within 1 tile of you
			set category = "Skills"
			set name = "Avatar Orb Long"
			if(usr.Freeze==1)
				usr<<"Your frozen, you can't use magic"
				return
			if(usr.RolePlaying == 0)
				usr<<"Your not roleplaying"
				return
			if(usr.Energy <= 0)
				usr<<"You don't have the energy for this"
				return
			if(usr.death==1)
				usr<<"You are death"
				return
			if(M.death==1)
				usr<<"[M] is death"
				return
			if(M.erased==1)
				return
			if(usr.good==1 && M.indemonschool==1)
				return
			if(usr.evil==1 && M.inmagicschool==1)
				return
			if(usr.neutral==1)
				if(M.indemonschool==1||M.inmagicschool==1)
					return
			if(usr.evil==1 && M.indemonschool==1)
				usr.indemonschool=1
			if(usr.good==1 && M.inmagicschool==1)
				usr.inmagicschool=1
			if(M.block_tele==1)
				switch(alert(M,"[src] is trying to teleport to you! Allow [src] to come to you?","","Yes","No"))
					if("Yes")
						..()
					if("No")
						src<<"You cant sense [M]"
						return
			if(M.inheaven==1)
				usr<<"You cannot go to this personne"
				return
			if(M.inhell==1)
				usr<<"You cannot go to this personne"
				return
			usr.power += 1
			usr.overlays = new /obj/orb4/avy1
			view(9)<< "[usr] orbs away"
			usr.Exposing_Magic()
			usr.Energy -= 10
			spawn(1)
				usr.overlays = null
				usr.overlays += new /obj/orb4/avy2
				spawn(1)
					usr.overlays = null
					usr.overlays += new /obj/orb4/avy3
					usr.icon = null
					spawn(1)
						usr.x = M:x
						usr.y = M:y+1
						usr.z = M:z
						usr.dir = SOUTH
						M << "[usr.name] orbed behind you!!!"
						usr.overlays = null
						usr.icon = new /mob/goodwitch()
						usr.overlays += new /obj/orb4/avy3
						spawn(1)
							usr.overlays = null
							usr.overlays += new /obj/orb4/avy2
							spawn(1)
								usr.overlays = null
								usr.overlays += new /obj/orb4/avy1
								spawn(1)
									usr.overlays = null
									usr.Selforb = 0
									usr.density = 1

mob/avatar
	verb
		Avy_Orb_place()		//attack a mob within 1 tile of you
			set category = "Skills"
			set name = "Avatar Orb place"
			var/default_value = "Earth"
			var/list/places = list("Earth", "Hell", "Charmed manor", "Park", "Julian's House", "Kyros House", "DragoWings House", "Graveyard", "The Ultimate")
			choose_place = input(usr, default_value) in places
			switch(choose_place)
				if("Earth")
					usr.place = "Earth"
				if("Hell")
					usr.place = "Hell"
				if("Charmed manor")
					usr.place = "Charmed"
				if("Park")
					usr.place = "Park"
				if("Julian's House")
					usr.place = "SyncWolf"
				if("Kyros House")
					usr.place = "Zeniox"
				if("DragoWings House")
					usr.place = "Drago"
				if("Graveyard")
					usr.place = "Graveyard"
				if("The Ultimate")
					usr.place = "Ultimate"
			if(usr.Freeze==1)
				usr<<"Your frozen, you can't use magic"
				return
			if(usr.RolePlaying == 0)
				usr<<"Your not roleplaying"
				return
			if(usr.Energy <= 0)
				usr<<"You don't have the energy for this"
				return
			if(usr.death==1)
				usr<<"You are death"
				return
			usr.power += 1
			usr.overlays = new /obj/orb4/avy1
			view(9)<< "[usr] orbs away"
			usr.Exposing_Magic()
			usr.Energy -= 10
			spawn(1)
				usr.overlays = null
				usr.overlays += new /obj/orb4/avy2
				spawn(1)
					usr.overlays = null
					usr.overlays += new /obj/orb4/avy3
					usr.icon = null
					spawn(1)
						if(usr.place=="Earth")
							usr.loc = locate(/turf/Area/Earth)
						if(usr.place=="Hell")
							usr.loc = locate(/turf/Area/Hell)
						if(usr.place=="Charmed")
							usr.loc = locate(/turf/Area/Charmed)
						if(usr.place=="Park")
							usr.loc = locate(/turf/Area/Park)
						if(usr.place=="SyncWolf")
							usr.loc = locate(/turf/Area/SyncWolfsHouse)
						if(usr.place=="Zeniox")
							usr.loc = locate(/turf/Area/ZenioxHouse)
						if(usr.place=="Drago")
							usr.loc = locate(/turf/Area/DragowingHouse)
						if(usr.place=="Graveyard")
							usr.loc = locate(/turf/Area/Graveyard)
						if(usr.place=="Ultimate")
							usr.loc = locate(/turf/Area/Ultimate)
						usr.overlays = null
						usr.icon = new /mob/goodwitch()
						usr.overlays += new /obj/orb4/avy3
						spawn(1)
							usr.overlays = null
							usr.overlays += new /obj/orb4/avy2
							spawn(1)
								usr.overlays = null
								usr.overlays += new /obj/orb4/avy1
								spawn(1)
									usr.overlays = null
									usr.Selforb = 0
									usr.density = 1


mob/Potion/verb
	AvatarPotion()
		set category = "Commands"
		set name = "Throw potion"
		if(usr.Selforb == 0)
			var/obj/Fastenergy/F = new /obj/Avatar_Potion(src.loc)
			usr.verbs -= /mob/Potion/verb/AvatarPotion
			src.contents -= /obj/Avatar_Potion
			view(9)<< "[usr] throws a Potion"
			F:owner = "[usr.key]"
			walk(F,usr.dir)
			spawn(20)
				del(F)
		else
			usr<<"You cant do this while orbing"

mob/demon
	verb
		Pyrokinesis(mob/M as mob in range(5,usr)-usr)		//attack a mob within 1 tile of you
			set category = "Skills"
			set name = "Pyrokinesis"
			if(usr.Freeze==1)
				usr<<"Your frozen, you can't use magic"
				return
			if(usr.RolePlaying==0)
				usr<<"You cannot use magic here"
				return
			if(usr.Energy <= 0)
				usr<<"You don't have the energy for this"
				return
			if(M:shielded==1)
				view(9)<<"[M]'s shield blocks the attack"
				return
			if(M.Whitelighter==1)
				M.Whitelighter_Death()
				return
			if(M.containhollow==1)
				usr.verbs -= new /mob/demon/verb/Pyrokinesis
				M.verbs += new /mob/demon/verb/Pyrokinesis
				view(9)<<"[M] has taken [usr]'s power using the hollow"
				return
			if(usr.Energy <= 0)
				usr<<"You dont have the energy for this"
				return
			if(usr.Selforb == 0)
/*				for(var/mob/M as mob in range(5,usr))*/
				if(usr.Pyrokinesis == 2)
					if(M.Selforb==1)
						usr<<"You cant find [M]"
						return
					if(usr.burning==1)
						usr<<"Your already attacking"
						return
					usr.burning = 1
					usr.Exposing_Magic()
					sleep(4)
					M.overlays += new /obj/Pyrokinesis
					M.Freeze = 1
					M.health -= usr.Strength
					usr.Energy -= 25
					sleep(15)
					M.overlays = null
					M.Freeze = 0
					usr.burning = 0
					usr.deathcheck(M)
				else
					usr<<"You do not or no longer posses this power"
			else
				usr<<"You cant do this while orbing"
obj/Pyrokinesis
	icon = 'magicgood.dmi'
	icon_state = "Pyrokinesis"
	layer = MOB_LAYER

mob/halfdemon/verb/Change()
	set category = "Skills"
	set desc = "Change form demon/human"
	if(usr.Freeze==1)
		usr<<"Your frozen, you can't use magic"
		return
	if(usr.Energy <= 0)
		usr<<"You don't have the energy for this"
		return
	if(usr.Selforb==1)
		usr << "not while orbed"
		return
	if(usr.changed == 0)
		if(usr.key=="SyncWolf")
			usr.icon = 'Goodwitchs.dmi'
			usr.icon_state = "Darklighter-2"
			usr << "you change into demon form"
			usr.health += usr.maxhealth/2
			usr.Strength += 5000*usr.level
			usr.changed = 1
			usr.Energy -= 15
		else
			usr.icon = 'Goodwitchs.dmi'
			usr.icon_state = "Demon-2"
			usr << "you change into demon form"
			usr.health += usr.maxhealth/2
			usr.Strength += 1000*usr.level
			usr.changed = 1
			usr.Energy -= 15
	else
		if(usr.rank == "The Source")
			usr.icon = 'Goodwitchs.dmi'
			usr.icon_state = "Source"
		if(usr.rank == "Dark Force Cultist")
			usr.icon = 'Goodwitchs.dmi'
			usr.icon_state = "Source"
		if(usr.rank=="Avatar")
			usr.icon = 'Goodwitchs.dmi'
			usr.icon_state = "Avatar"
		if(usr.rank=="Triad")
			usr.icon = 'Goodwitchs.dmi'
			usr.icon_state = "triad"
		else if(usr.ranked==0)
			usr.icon = 'Goodwitchs.dmi'
			usr.icon_state = "Demon"
		usr << "you change into human form"
		usr.changed = 0
		usr.health = usr.maxhealth
		usr.Strength -= 1000*usr.level
		usr.Energy -= 15
	usr.DemonicNameChecker()
	usr.Exposing_Magic()


obj/whitelighter
	whitelighterdie
		icon = 'magicgood.dmi'
		icon_state = "whitedie"
		layer = MOB_LAYER
	whitelighterlive
		icon = 'magicgood.dmi'
		icon_state = "whitelive"
		layer = MOB_LAYER

mob/witch/Prem/verb
	Premonition()
		set category = "Skills"
		set name = "Premonition"
		if(usr.Freeze==1)
			usr<<"Your frozen, you can't use magic"
			return
		if(usr.RolePlaying == 0)
			usr<<"Your not roleplaying"
			return
		if(usr.Energy <= 0)
			usr<<"You don't have the energy for this"
			return
		var/list/being = new()
		for(var/mob/m in world)
			being += m
		being += "Cancel"
		var/who = input("Select target?","Preminition",null) in being
		if(being!="Cancel")
			client.perspective = EYE_PERSPECTIVE
			client.eye = who
			sleep(20)
			client.perspective = MOB_PERSPECTIVE
			client.eye = usr

mob/seer/verb
	Future_Sight()
		set category = "Skills"
		set name = "Future Sight"
		if(usr.Freeze==1)
			usr<<"Your frozen, you can't use magic"
			return
		if(usr.RolePlaying == 0)
			usr<<"Your not roleplaying"
			return
		if(usr.Energy <= 0)
			usr<<"You don't have the energy for this"
			return
		var/list/being = new()
		for(var/mob/m in world)
			being += m
		being += "Cancel"
		var/who = input("Select target?","Future Sight",null) in being
		if(being!="Cancel")
			client.perspective = EYE_PERSPECTIVE
			client.eye = who
			sleep(35)
			client.perspective = MOB_PERSPECTIVE
			client.eye = usr

mob/shield/verb
	Shield()
		set category = "Skills"
		if(usr.Freeze==1)
			usr<<"Your frozen, you can't use magic"
			return
		if(usr.Energy <= 0)
			usr<<"You don't have the energy for this"
			return
		if(usr.shielded==1)
			usr.overlays = null
			view(9)<<"[usr] lowers a shield"
			shielded = 0
			return
		if(usr.evil==1)
			usr.overlays += new /obj/shield/evil
			view(9)<<"[usr] raises a shield"
			shielded = 1
			usr.Energy -= 5
		if(usr.good==1)
			usr.overlays += new /obj/shield/good
			shielded = 1
			view(9)<<"[usr] raises a shield"
			usr.Energy -= 5
		if(usr.align==100)
			usr<<"You cannot create a shield yet"
			usr.Energy = 0
		usr.Exposing_Magic()

obj/shield
	evil
		icon = 'magic.dmi'
		icon_state = "red"
		layer = MOB_LAYER
		density = 1
	good
		icon = 'magic.dmi'
		icon_state = "blue"
		layer = MOB_LAYER
		density = 1

mob/ultimate/verb/Vanquish(mob/M in view(9))
	set category = "Skills"
	if(usr.Freeze==1)
		usr<<"Your frozen, you can't use magic"
		return
	if(usr.RolePlaying == 0)
		usr<<"You cannot use magic here"
		return
	if(usr.Energy <= 0)
		usr<<"You don't have the energy for this"
		return
	if(usr.Selforb == 1)
		usr<<"Not while in orb"
		return
	view(9)<<"<i>*[usr] squeezes his hand causing [M] to explode*"
	sleep(2)
	if(M.Selforb==1)
		return
	else
		M.health = 0
		view(9)<<"You hear [M] scream as he explodes"
		usr.deathcheck(M)
		usr.Exposing_Magic()


obj/DF
	fade1
		icon = 'magicgood.dmi'
		icon_state = "tri1"
		layer = MOB_LAYER
		density = 0
	fade2
		icon = 'magicgood.dmi'
		icon_state = "tri2"
		layer = MOB_LAYER
		density = 0
	fade3
		icon = 'magicgood.dmi'
		icon_state = "tri3"
		layer = MOB_LAYER
		density = 0
	fade4
		icon = 'magicgood.dmi'
		icon_state = "tri4"
		layer = MOB_LAYER
		density = 0
	fade5
		icon = 'magicgood.dmi'
		icon_state = "tri5"
		layer = MOB_LAYER
		density = 0

mob/DF/verb
	Dark_Fade()
		set category = "Skills"
		set name = "Dark Fade"
		set desc = "Teleporting by going into the floor"
		if(usr.Freeze==1)
			usr<<"Your frozen, you can't use magic"
			return
		if(usr.Energy<=0)
			usr<<"You don't have the energy to do this"
			return
		if(usr.Selforb == 0)
			usr.Selforb = 1
			usr.density = 0
			usr.Exposing_Magic()
			usr.power += 1
			usr.overlays = new /obj/DF/fade1
			view(9)<< "[usr] fades away"
			usr.Energy -= 5
			spawn(1)
				usr.icon = null
				usr.overlays = null
				usr.overlays += new /obj/DF/fade2
				spawn(1)
					usr.overlays = null
					usr.overlays += new /obj/DF/fade3
					spawn(1)
						usr.overlays = null
						usr.overlays += new /obj/DF/fade4
						spawn(1)
							usr.overlays = null
							usr.overlays += new /obj/DF/fade5
							spawn(1)
								usr.overlays = null
		else
			usr.Selforb = 0
			usr.density = 1
			usr.overlays = new /obj/DF/fade5
			spawn(1)
				view(9)<< "[usr] fades back"
				usr.Exposing_Magic()
				usr.Energy -= 5
				usr.overlays = null
				usr.overlays += new /obj/DF/fade4
				spawn(1)
					usr.overlays = null
					usr.overlays += new /obj/DF/fade3
					spawn(1)
						usr.overlays = null
						usr.overlays += new /obj/DF/fade2
						spawn(1)
							usr.overlays = null
							usr.icon = new /mob/goodwitch()
							usr.overlays += new /obj/DF/fade1
							spawn(1)
								usr.overlays = null

	Dark_Long(var/mob/M in world)
		set category = "Skills"
		set name = "Dark Fade Long"
		set desc = "Teleporting by going into the floor"
		if(usr.Freeze==1)
			usr<<"Your frozen, you can't use magic"
			return
		if(usr.RolePlaying == 0)
			usr<<"Your not roleplaying"
			return
		if(M.RolePlaying == 0)
			usr<<"[M] isnt roleplaying"
			return
		if(usr.Energy <= 0)
			usr<<"You don't have the energy for this"
			return
		if(usr.death==1)
			usr<<"You are death"
			return
		if(M.death==1)
			usr<<"[M] is death"
			return
		if(M.erased==1)
			return
		if(usr.good==1 && M.indemonschool==1)
			return
		if(usr.evil==1 && M.inmagicschool==1)
			return
		if(usr.neutral==1)
			if(M.indemonschool==1||M.inmagicschool==1)
				return
		if(usr.evil==1 && M.indemonschool==1)
			usr.indemonschool=1
		if(usr.good==1 && M.inmagicschool==1)
			usr.inmagicschool=1
		if(M.block_tele==1)
			switch(alert(M,"[src] is trying to teleport to you! Allow [src] to come to you?","","Yes","No"))
				if("Yes")
					..()
				if("No")
					src<<"You cant sense [M]"
					return
		if(M.name == "Elder")
			usr<<"You dont know the location of the Elders"
			return
		if(M.inheaven==1)
			usr<<"You cannot go to this personne"
			return
		usr.power += 1
		usr.overlays = new /obj/DF/fade5
		view(9)<< "[usr] fades away"
		usr.Exposing_Magic()
		usr.Energy -= 10
		spawn(1)
			usr.overlays = null
			usr.overlays += new /obj/DF/fade4
			spawn(1)
				usr.overlays = null
				usr.icon = null
				usr.overlays += new /obj/DF/fade3
				spawn(1)
					usr.overlays = null
					usr.overlays += new /obj/DF/fade2
					spawn(1)
						usr.overlays = null
						usr.x = M:x
						usr.y = M:y+1
						usr.z = M:z
						usr.dir = SOUTH
						usr.icon = new /mob/goodwitch()
						M << "[usr.name] fades behind you!!!"
						usr.overlays += new /obj/DF/fade2
						spawn(1)
							usr.overlays = null
							usr.overlays += new /obj/DF/fade3
							spawn(1)
								usr.overlays = null
								usr.overlays += new /obj/DF/fade4
								spawn(1)
									usr.overlays = null
									usr.overlays += new /obj/DF/fade5
									spawn(1)
										usr.overlays = null
										usr.Selforb = 0
										usr.density = 1

	Dark_place()
		set category = "Skills"
		set name = "Dark Fade Place"
		set desc = "Teleporting by going into the floor"
		var/default_value = "Earth"
		var/list/places = list("Earth", "Hell Entrance","Underworld","Demon school","Dark Force", "Charmed manor", "Park", "Julian's House", "Kyros House", "DragoWings House", "Graveyard", "The Ultimate")
		choose_place = input(usr, default_value) in places
		switch(choose_place)
			if("Earth")
				usr.place = "Earth"
			if("Hell Entrance")
				usr.place = "Hell"
			if("Underworld")
				usr.place = "Hell2"
			if("Demon school")
				usr.place = "Demon school"
			if("Charmed manor")
				usr.place = "Charmed"
			if("Park")
				usr.place = "Park"
			if("Julian's House")
				usr.place = "SyncWolf"
			if("Kyros House")
				usr.place = "Zeniox"
			if("DragoWings House")
				usr.place = "Drago"
			if("Graveyard")
				usr.place = "Graveyard"
			if("The Ultimate")
				usr.place = "Ultimate"
			if("Dark Force")
				usr.place = "Dark Force"
		if(usr.Freeze==1)
			usr<<"Your frozen, you can't use magic"
			return
		if(usr.RolePlaying == 0)
			usr<<"Your not roleplaying"
			return
		if(usr.erased==1)
			return
		if(usr.Energy <= 0)
			usr<<"You don't have the energy for this"
			return
		if(usr.death==1)
			usr<<"You are death"
			return
		usr.density = 0
		usr.icon = null
		usr.Energy -= 5
		usr.power += 1
		usr.overlays = new /obj/DF/fade5
		view(9)<< "[usr] fades away"
		usr.Energy -= 10
		spawn(1)
			usr.overlays = null
			usr.overlays += new /obj/DF/fade4
			spawn(1)
				usr.overlays = null
				usr.icon = null
				usr.overlays += new /obj/DF/fade3
				spawn(1)
					usr.overlays = null
					usr.overlays += new /obj/DF/fade2
					spawn(1)
						usr.overlays = null
						if(usr.place=="Earth")
							usr.loc = locate(/turf/Area/Earth)
						if(usr.place=="Hell")
							usr.loc = locate(/turf/Area/Hell)
						if(usr.place=="Hell2")
							usr.loc = locate(/turf/Area/Hell2)
						if(usr.place=="Demon school")
							usr.loc = locate(/turf/Area/DemonSchool)
						if(usr.place=="Charmed")
							usr.loc = locate(/turf/Area/Charmed)
						if(usr.place=="Park")
							usr.loc = locate(/turf/Area/Park)
						if(usr.place=="SyncWolf")
							usr.loc = locate(/turf/Area/SyncWolfsHouse)
						if(usr.place=="Zeniox")
							usr.loc = locate(/turf/Area/ZenioxHouse)
						if(usr.place=="Drago")
							usr.loc = locate(/turf/Area/DragowingHouse)
						if(usr.place=="Graveyard")
							usr.loc = locate(/turf/Area/Graveyard)
						if(usr.place=="Ultimate")
							usr.loc = locate(/turf/Area/Ultimate)
						if(usr.place=="Dark Force")
							usr.loc = locate(/turf/Area/DarkForce)
						usr.icon = new/mob/goodwitch
						usr.overlays += new /obj/DF/fade2
						spawn(1)
							usr.overlays = null
							usr.overlays += new /obj/DF/fade3
							spawn(1)
								usr.overlays = null
								usr.overlays += new /obj/DF/fade4
								spawn(1)
									usr.overlays = null
									usr.overlays += new /obj/DF/fade5
									spawn(1)
										usr.overlays = null
										usr.Selforb = 0
										usr.density = 1
										usr.Exposing_Magic()

obj
	DarkBolt
		var
			power = 10

		icon='General.dmi'
		icon_state = "HighVoltage2"
		density = 1
		Bump(atom/M)
			if(istype(M,/mob/))
				for(var/mob/N in world)
					if(M:shielded==1)
						del(src)
						return
					if(M:Whitelighter==1)
						M:Whitelighter_Death()
						del(src)
						return
					if(M:containhollow==1)
						M:verbs += new /mob/DF/verb/Darkbolt
						N.verbs -= new /mob/DF/verb/Darkbolt
						view(9)<<"[M] has taken [N]'s power using the hollow"
						del(src)
						return
					if(src.owner == "[N.key]")
						N<<"You hit [M]!"
						M<<"You were hit by [N]!"
						M:health -= N.power/M:power
						M:health -= N.Strength
						N.power += 1
						N.deathcheck(M)
						for(var/obj/Fastenergy/T in world)
							if(T:owner == "[N.key]")
								del(T)
				del(src)
			else
				..()
			if(istype(M,/obj/))
				spawn(1)
					M.overlays = null
					spawn(1)
						M.overlays = null
						spawn(1)
							M.overlays = null
							del(M)


				del(src)
			else
				..()
mob/DF
	verb
		Darkbolt()		//attack a mob within 1 tile of you
			set category = "Skills"
			set name = "Dark Bolt"
			if(usr.Freeze==1)
				usr<<"Your frozen, you can't use magic"
				return
			if(usr.RolePlaying == 0)
				usr<<"You cannot use magic here"
				return
			if(usr.Energy<=0)
				usr<<"You don't have the energy to do this"
				return
			if(usr.attacking==1)
				return
			if(usr.Selforb == 0)
				var/obj/Fastenergy/F = new /obj/DarkBolt(src.loc)
				usr.Energy -= 5
				usr.Exposing_Magic()
				usr.attacking = 1
				F:owner = "[usr.key]"
				walk(F,usr.dir)
				sleep(8)
				usr.attacking = 0
				spawn(10)
					del(F)
			else
				usr<<"You cant do this while orbing"

mob/mysticlighter
	verb
		Orb()		//attack a mob within 1 tile of you
			set category = "Skills"
			set name = "Mystic Orb"
			if(usr.Freeze==1)
				usr<<"Your frozen, you can't use magic"
				return
			if(usr.Energy<=0)
				usr<<"You don't have the energy to do this"
				return
			if(usr.Selforb == 0)
				usr.Selforb = 1
				usr.density = 0
				usr.Exposing_Magic()
				usr.power += 1
				usr.overlays = new /obj/orb/rorbing1
				view(9)<< "[usr] orbs away"
				usr.Energy -= 5
				spawn(1)
					view(6)<<sound("Whitelighter Orb.wav")
					usr.overlays = null
					usr.overlays += new /obj/orb/rorbing2
					spawn(1)
						usr.overlays = null
						usr.overlays += new /obj/orb/rorbing3
						spawn(1)
							usr.overlays = null
							usr.overlays += new /obj/orb/rorbing4
							spawn(1)
								usr.overlays = null
								usr.icon = null
								usr.overlays += new /obj/orb/rorbing5
								spawn(1)
									usr.overlays = null
									usr.overlays += new /obj/orb/rorbing6
									spawn(1)
										usr.overlays = null
										usr.overlays += new /obj/orb/rorbing7
										spawn(1)
											usr.overlays = null
											usr.overlays += new /obj/orb/rorbing8
											spawn(1)
												usr.overlays = null
												usr.overlays += new /obj/orb/rorbing9
												spawn(1)
													usr.overlays = null
													usr.overlays += new /obj/orb/rorbing10
													spawn(1)
														usr.overlays = null

			else
				usr.Selforb = 0
				usr.density = 1
				usr.overlays = new /obj/orb/rorbing10
				spawn(1)
					view(6)<<sound("Whitelighter Orb.wav")
					view(9)<< "[usr] orbs in"
					usr.Exposing_Magic()
					usr.Energy -= 5
					usr.overlays = null
					usr.overlays += new /obj/orb/rorbing9
					spawn(1)
						usr.overlays = null
						usr.overlays += new /obj/orb/rorbing8
						spawn(1)
							usr.overlays = null
							usr.overlays += new /obj/orb/rorbing7
							spawn(1)
								usr.overlays = null
								usr.icon = null
								usr.overlays += new /obj/orb/rorbing6
								spawn(1)
									usr.overlays = null
									usr.overlays += new /obj/orb/rorbing5
									spawn(1)
										usr.overlays = null
										usr.icon = new /mob/goodwitch()
										usr.overlays += new /obj/orb/rorbing4
										spawn(1)
											usr.overlays = null
											usr.overlays += new /obj/orb/rorbing3
											spawn(1)
												usr.overlays = null
												usr.overlays += new /obj/orb/rorbing2
												spawn(1)
													usr.overlays = null
													usr.overlays += new /obj/orb/rorbing1
													spawn(1)
														usr.overlays = null






obj/orb
	rorbing1
		icon = 'magicgood.dmi'
		icon_state = "rl1"
		layer = MOB_LAYER
obj/orb
	rorbing2
		icon = 'magicgood.dmi'
		icon_state = "rl2"
		layer = MOB_LAYER
obj/orb
	rorbing3
		icon = 'magicgood.dmi'
		icon_state = "rl3"
		layer = MOB_LAYER
obj/orb
	rorbing4
		icon = 'magicgood.dmi'
		icon_state = "rl4"
		layer = MOB_LAYER
obj/orb
	rorbing5
		icon = 'magicgood.dmi'
		icon_state = "rl5"
		layer = MOB_LAYER
obj/orb
	rorbing6
		icon = 'magicgood.dmi'
		icon_state = "rl6"
		layer = MOB_LAYER
obj/orb
	rorbing7
		icon = 'magicgood.dmi'
		icon_state = "rl7"
		layer = MOB_LAYER
obj/orb
	rorbing8
		icon = 'magicgood.dmi'
		icon_state = "rl8"
		layer = MOB_LAYER
obj/orb
	rorbing9
		icon = 'magicgood.dmi'
		icon_state = "rl9"
		layer = MOB_LAYER
obj/orb
	rorbing10
		icon = 'magicgood.dmi'
		icon_state = "rl10"
		layer = MOB_LAYER
obj/orb
	rorbing11
		icon = 'magicgood.dmi'
		icon_state = "rl11"
		layer = MOB_LAYER
mob/mysticlighter
	verb
		Orb_object(atom/M as obj in oview(5,usr))		//attack a mob within 1 tile of you
			set category = "Skills"
			set name = "Mystic Orb Object"
			if(usr.Freeze==1)
				usr<<"Your frozen, you can't use magic"
				return
			if(usr.Energy<=0)
				usr<<"You don't have the energy to do this"
				return
			if(usr.Selforb == 0)
				if(M == null)
					return
				else
					usr.power += 1
					usr.Exposing_Magic()
					usr.Energy -= 5
					M.density = 0
					M.overlays += new /obj/orbo/rorbingobj1
					view(9)<< "[usr] moves [M]"
					view(6)<<sound("OrbingTelek.wav")
					spawn(1)
						if(M == null)
							return
						else
							M.overlays = null
							M.overlays += new /obj/orbo/rorbingobj2
						spawn(1)
							if(M == null)
								return
							else
								M.overlays = null
								M.overlays += new /obj/orbo/rorbingobj3
								spawn(1)
									if(M == null)
										return
									else
										M.overlays = null
										M.overlays += new /obj/orbo/rorbingobj4
										spawn(1)
											if(M == null)
												return
											else
												M.overlays = null
												M.icon = null
												M.overlays += new /obj/orbo/rorbingobj5
												spawn(1)
													if(M == null)
														return
													else
														M.overlays = null
														M.overlays += new /obj/orbo/rorbingobj6
														spawn(1)
															if(M == null)
																return
															else
																M.overlays = null
																M.overlays += new /obj/orbo/rorbingobj7
																spawn(1)
																	if(M == null)
																		return
																	else
																		M.overlays = null
																		M.overlays += new /obj/orbo/rorbingobj8
																		step(M,usr.dir)
																		spawn(1)
																			if(M == null)
																				return
																			else
																				step(M,usr.dir)
																				spawn(2)
																					if(M == null)
																						return
																					else
																						M.overlays = null
																						M.icon = new /obj/tile44()
																						M.density = 1
			else
				usr<<"You cant do this while orbing"

obj/orbo
	rorbingobj1
		icon = 'magicgood.dmi'
		icon_state = "robj1"
		layer = MOB_LAYER
obj/orbo
	rorbingobj2
		icon = 'magicgood.dmi'
		icon_state = "robj2"
		layer = MOB_LAYER
obj/orbo
	rorbingobj3
		icon = 'magicgood.dmi'
		icon_state = "robj3"
		layer = MOB_LAYER
obj/orbo
	rorbingobj4
		icon = 'magicgood.dmi'
		icon_state = "robj4"
		layer = MOB_LAYER
obj/orbo
	rorbingobj5
		icon = 'magicgood.dmi'
		icon_state = "robj5"
		layer = MOB_LAYER
obj/orbo
	rorbingobj6
		icon = 'magicgood.dmi'
		icon_state = "robj6"
		layer = MOB_LAYER
obj/orbo
	rorbingobj7
		icon = 'magicgood.dmi'
		icon_state = "robj7"
		layer = MOB_LAYER
obj/orbo
	rorbingobj8
		icon = 'magicgood.dmi'
		icon_state = "robj8"
		layer = MOB_LAYER


mob/mysticlighter
	verb
		Orb_longdist(var/mob/M in world)		//attack a mob within 1 tile of you
			set category = "Skills"
			set name = "Mystic Orb long"
			if(usr.Freeze==1)
				usr<<"Your frozen, you can't use magic"
				return
			if(usr.RolePlaying == 0)
				usr<<"Your not roleplaying"
				return
			if(usr.Energy<=0)
				usr<<"You don't have the energy to do this"
				return
			if(usr.death==1)
				usr<<"You are death"
				return
			if(M.death==1)
				usr<<"[M] is death"
				return
			if(M.erased==1)
				usr<<"[M] is erased"
				return
			if(usr.good==1 && M.indemonschool==1)
				return
			if(usr.evil==1 && M.inmagicschool==1)
				return
			if(usr.neutral==1)
				if(M.indemonschool==1||M.inmagicschool==1)
					return
			if(usr.evil==1 && M.indemonschool==1)
				usr.indemonschool=1
			if(usr.good==1 && M.inmagicschool==1)
				usr.inmagicschool=1
			if(M.block_tele==1)
				switch(alert(M,"[src] is trying to teleport to you! Allow [src] to come to you?","","Yes","No"))
					if("Yes")
						..()
					if("No")
						src<<"You cant sense [M]"
						return
			if(M.RolePlaying == 0)
				usr<<"[M] isnt roleplaying"
				return
			if(M.name == "Triad")
				usr<<"You dont know the location of the Triad"
				return
			if(M.name == "FirstTimePlayer")
				usr<<"You cannot teleport to this"
				return
				src<<"You cant sense [M]"
				return
			if(M.name == "The Hollow")
				usr<<"You dont know the location of the hollow"
				return
			if(usr.erased==1)
				usr<<"You have been erased"
				return
			if(M.inheaven==1)
				usr.inheaven = 1
			if(M.inheaven==0)
				usr.inheaven = 0
			if(M.inhell==1)
				usr<<"You cannot go there"
				return
			if(usr.Mysticlighter == 1)
				usr.power += 1
				usr.Energy -= 5
				usr.overlays = new /obj/orb/rorbing1
				view(9)<< "[usr] orbs away"
				view(9)<<sound("Whitelighter Orb.wav")
				usr.Exposing_Magic()
				spawn(1)
					usr.overlays = null
					usr.overlays += new /obj/orb/rorbing2
					spawn(1)
						usr.overlays = null
						usr.overlays += new /obj/orb/rorbing3
						spawn(1)
							usr.overlays = null
							usr.overlays += new /obj/orb/rorbing4
							spawn(1)
								usr.overlays = null
								usr.icon = null
								usr.overlays += new /obj/orb/rorbing5
								spawn(1)
									usr.overlays = null
									usr.overlays += new /obj/orb/rorbing6
									spawn(1)
										usr.overlays = null
										usr.overlays += new /obj/orb/rorbing7
										spawn(1)
											usr.overlays = null
											usr.overlays += new /obj/orb/rorbing8
											spawn(1)
												usr.overlays = null
												usr.overlays += new /obj/orb/rorbing9
												spawn(1)
													usr.overlays = null
													usr.overlays += new /obj/orb/rorbing10
													spawn(1)
														usr.overlays = null
														src.x = M:x
														src.y = M:y+1
														src.z = M:z
														src.dir = SOUTH
														M << "[src.name] orbed behind you!!!"
														usr.overlays = new /obj/orb/rorbing10
														spawn(1)
															usr.overlays = null
															usr.overlays += new /obj/orb/rorbing9
															spawn(1)
																usr.overlays = null
																usr.overlays += new /obj/orb/rorbing8
																spawn(1)
																	usr.overlays = null
																	usr.overlays += new /obj/orb/rorbing7
																	spawn(1)
																		usr.overlays = null
																		usr.icon = null
																		usr.overlays += new /obj/orb/rorbing6
																		spawn(1)
																			usr.overlays = null
																			usr.overlays += new /obj/orb/rorbing5
																			spawn(1)
																				usr.overlays = null
																				usr.icon = new /mob/goodwitch()
																				usr.overlays += new /obj/orb/rorbing4
																				spawn(1)
																					usr.overlays = null
																					usr.overlays += new /obj/orb/rorbing3
																					spawn(1)
																						usr.overlays = null
																						usr.overlays += new /obj/orb/rorbing2
																						spawn(1)
																							usr.overlays = null
																							usr.overlays += new /obj/orb/rorbing1
																							spawn(1)
																								usr.overlays = null
																								usr.Selforb = 0
																								usr.density = 1

mob/mysticlighter
	verb
		Orb_other(mob/M in view(9))		//attack a mob within 1 tile of you
			set name = "Mystic Orb Player"
			set category = "Skills"
			var/mob/X = input("Choose a target:","Target:") as mob in world
			if(usr.Freeze==1)
				usr<<"Your frozen, you can't use magic"
				return
			if(M.RolePlaying==0)
				usr<<"[M] isnt roleplaying"
				return
			if(X.RolePlaying==0)
				usr<<"[X] isnt roleplaying"
				return
			if(usr.Energy<=0)
				usr<<"You don't have the energy to do this"
				return
			if(usr.Selforb == 1||M.Selforb==1)
				usr<<"Not while orbing"
				return
			if(M.inhell==1)
				usr<<"You cannot send [M] there"
				return
			if(M.good==1 && X.indemonschool==1)
				return
			if(M.evil==1 && X.inmagicschool==1)
				return
			if(M.neutral==1)
				if(X.indemonschool==1||X.inmagicschool==1)
					return
			if(X.block_tele==1)
				switch(alert(X,"[M] is being teleported to you! Allow [M] to come to you?","","Yes","No"))
					if("Yes")
						..()
					if("No")
						usr<<"You cant sense [X]"
						return
			if(X.inheaven==1)
				M.inheaven = 1
				..()
			usr.power += 1
			usr.Energy -= 10
			M.overlays = new /obj/orb/orbing1
			view(9)<< "[M] gets orbed away"
			view(9)<<sound("Whitelighter Orb.wav")
			usr.Exposing_Magic()
			spawn(1)
				M.overlays = null
				M.overlays += new /obj/orb/rorbing2
				spawn(1)
					M.overlays = null
					M.overlays += new /obj/orb/rorbing3
					spawn(1)
						M.overlays = null
						M.overlays += new /obj/orb/rorbing4
						spawn(1)
							M.overlays = null
							M.icon = null
							M.overlays += new /obj/orb/rorbing5
							spawn(1)
								M.overlays = null
								M.overlays += new /obj/orb/rorbing6
								spawn(1)
									M.overlays = null
									M.overlays += new /obj/orb/rorbing7
									spawn(1)
										M.overlays = null
										M.overlays += new /obj/orb/rorbing8
										spawn(1)
											M.overlays = null
											M.overlays += new /obj/orb/rorbing9
											spawn(1)
												M.overlays = null
												M.overlays += new /obj/orb/rorbing10
												spawn(1)
													M.overlays = null
													M.x = X:x
													M.y = X:y+1
													M.z = X:z
													M.dir = SOUTH
													X << "[M.name] orbed behind you!!!"
													M.overlays = new /obj/orb/rorbing10
													spawn(1)
														M.overlays = null
														M.overlays += new /obj/orb/rorbing9
														spawn(1)
															M.overlays = null
															M.overlays += new /obj/orb/rorbing8
															spawn(1)
																M.overlays = null
																M.overlays += new /obj/orb/rorbing7
																spawn(1)
																	M.overlays = null
																	M.icon = null
																	M.overlays += new /obj/orb/rorbing6
																	spawn(1)
																		M.overlays = null
																		M.overlays += new /obj/orb/rorbing5
																		spawn(1)
																			M.overlays = null
																			M.icon = new /mob/goodwitch()
																			M.overlays += new /obj/orb/rorbing4
																			spawn(1)
																				M.overlays = null
																				M.overlays += new /obj/orb/rorbing3
																				spawn(1)
																					M.overlays = null
																					M.overlays += new /obj/orb/rorbing2
																					spawn(1)
																						M.overlays = null
																						M.overlays += new /obj/orb/rorbing1
																						spawn(1)
																							M.overlays = null
																							M.Selforb = 0
																							M.density = 1



mob/mysticlighter
	verb
		Orb_place()		//attack a mob within 1 tile of you
			set category = "Skills"
			set name = "Mystic Orb place"
			var/default_value = "Earth"
			var/list/places = list("Earth", "Hell", "Heaven", "Charmed manor", "Park", "Julian's House", "Kyros House", "DragoWings House", "Graveyard", "The Ultimate")
			choose_place = input(usr, default_value) in places
			switch(choose_place)
				if("Earth")
					usr.place = "Earth"
				if("Hell")
					usr.place = "Hell"
				if("Heaven")
					usr.place = "Heaven"
				if("Charmed manor")
					usr.place = "Charmed"
				if("Park")
					usr.place = "Park"
				if("Julian's House")
					usr.place = "SyncWolf"
				if("Kyros House")
					usr.place = "Zeniox"
				if("DragoWings House")
					usr.place = "Drago"
				if("Graveyard")
					usr.place = "Graveyard"
				if("The Ultimate")
					usr.place = "Ultimate"
			if(usr.Freeze==1)
				usr<<"Your frozen, you can't use magic"
				return
			if(usr.RolePlaying == 0)
				usr<<"Your not roleplaying"
				return
			if(usr.Energy<=0)
				usr<<"You don't have the energy to do this"
				return
			if(usr.death==1)
				usr<<"You are death"
				return
			if(usr.erased==1)
				return
			else
				if(usr.Mysticlighter == 1)
					usr.power += 1
					usr.Energy -= 10
					usr.overlays = new /obj/orb/rorbing1
					view(9)<< "[usr] orbs away"
					usr.Exposing_Magic()
					view(9)<<sound("Whitelighter Orb.wav")
					spawn(1)
						usr.overlays = null
						usr.overlays += new /obj/orb/rorbing2
						spawn(1)
							usr.overlays = null
							usr.overlays += new /obj/orb/rorbing3
							spawn(1)
								usr.overlays = null
								usr.overlays += new /obj/orb/rorbing4
								spawn(1)
									usr.overlays = null
									usr.icon = null
									usr.overlays += new /obj/orb/rorbing5
									spawn(1)
										usr.overlays = null
										usr.overlays += new /obj/orb/rorbing6
										spawn(1)
											usr.overlays = null
											usr.overlays += new /obj/orb/rorbing7
											spawn(1)
												usr.overlays = null
												usr.overlays += new /obj/orb/rorbing8
												spawn(1)
													usr.overlays = null
													usr.overlays += new /obj/orb/rorbing9
													spawn(1)
														usr.overlays = null
														usr.overlays += new /obj/orb/rorbing10
														spawn(1)
															usr.overlays = null
															if(usr.place=="Earth")
																usr.loc = locate(/turf/Area/Earth)
																usr.inheaven = 0
															if(usr.place=="Hell")
																usr.loc = locate(/turf/Area/Hell)
																usr.inheaven = 0
															if(usr.place=="Heaven")
																usr.loc = locate(/turf/Area/Heaven)
																usr.inheaven = 1
															if(usr.place=="Charmed")
																usr.loc = locate(/turf/Area/Charmed)
																usr.inheaven = 0
															if(usr.place=="Park")
																usr.loc = locate(/turf/Area/Park)
																usr.inheaven = 0
															if(usr.place=="SyncWolf")
																usr.loc = locate(/turf/Area/SyncWolfsHouse)
																usr.inheaven = 0
															if(usr.place=="Zeniox")
																usr.loc = locate(/turf/Area/ZenioxHouse)
																usr.inheaven = 0
															if(usr.place=="Drago")
																usr.loc = locate(/turf/Area/DragowingHouse)
																usr.inheaven = 0
															if(usr.place=="Graveyard")
																usr.loc = locate(/turf/Area/Graveyard)
																usr.inheaven = 0
															if(usr.place=="Ultimate")
																usr.loc = locate(/turf/Area/Ultimate)
																usr.inheaven = 0
															usr.overlays = new /obj/orb/rorbing10
															spawn(1)
																usr.overlays = null
																usr.overlays += new /obj/orb/rorbing9
																spawn(1)
																	usr.overlays = null
																	usr.overlays += new /obj/orb/rorbing8
																	spawn(1)
																		usr.overlays = null
																		usr.overlays += new /obj/orb/rorbing7
																		spawn(1)
																			usr.overlays = null
																			usr.icon = null
																			usr.overlays += new /obj/orb/rorbing6
																			spawn(1)
																				usr.overlays = null
																				usr.overlays += new /obj/orb/rorbing5
																				spawn(1)
																					usr.overlays = null
																					usr.icon = new /mob/goodwitch()
																					usr.overlays += new /obj/orb/rorbing4
																					spawn(1)
																						usr.overlays = null
																						usr.overlays += new /obj/orb/rorbing3
																						spawn(1)
																							usr.overlays = null
																							usr.overlays += new /obj/orb/rorbing2
																							spawn(1)
																								usr.overlays = null
																								usr.overlays += new /obj/orb/rorbing1
																								spawn(1)
																									usr.overlays = null
																									usr.Selforb = 0
																									usr.density = 1


mob/mysticlighter
	verb
		Orb_player_place(mob/M in view(9))		//attack a mob within 1 tile of you
			set category = "Skills"
			set name = "Mystic Orb player place"
			var/default_value = "Earth"
			var/list/places = list("Earth", "Hell", "Heaven", "Charmed manor", "Park", "Julian's House", "Kyros House", "DragoWings House", "Graveyard", "The Ultimate")
			choose_place = input(usr, default_value) in places
			switch(choose_place)
				if("Earth")
					M.place = "Earth"
				if("Hell")
					M.place = "Hell"
				if("Heaven")
					M.place = "Heaven"
				if("Charmed manor")
					M.place = "Charmed"
				if("Park")
					M.place = "Park"
				if("Julian's House")
					M.place = "SyncWolf"
				if("Kyros House")
					M.place = "Zeniox"
				if("DragoWings House")
					M.place = "Drago"
				if("Graveyard")
					M.place = "Graveyard"
				if("The Ultimate")
					M.place = "Ultimate"
			if(usr.Freeze==1)
				usr<<"Your frozen, you can't use magic"
				return
			if(M.RolePlaying == 0)
				usr<<"[M] isnt roleplaying"
				return
			if(usr.RolePlaying == 0)
				usr<<"Your not roleplaying"
				return
			if(M.Energy<=0)
				usr<<"You don't have the energy to do this"
				return
			if(usr.death==1)
				usr<<"You are death"
				return
			if(usr.erased==1)
				return
			if(M.erased==1)
				return
			else
				if(usr.Mysticlighter == 1)
					usr.power += 1
					usr.Energy -= 10
					usr.Exposing_Magic()
					M.overlays = new /obj/orb/rorbing1
					view(9)<< "[M] gets orbed away"
					view(9)<<sound("Whitelighter Orb.wav")
					spawn(1)
						M.overlays = null
						M.overlays += new /obj/orb/rorbing2
						spawn(1)
							M.overlays = null
							M.overlays += new /obj/orb/rorbing3
							spawn(1)
								M.overlays = null
								M.overlays += new /obj/orb/rorbing4
								spawn(1)
									M.overlays = null
									M.icon = null
									M.overlays += new /obj/orb/rorbing5
									spawn(1)
										M.overlays = null
										M.overlays += new /obj/orb/rorbing6
										spawn(1)
											M.overlays = null
											M.overlays += new /obj/orb/rorbing7
											spawn(1)
												M.overlays = null
												M.overlays += new /obj/orb/rorbing8
												spawn(1)
													M.overlays = null
													M.overlays += new /obj/orb/rorbing9
													spawn(1)
														M.overlays = null
														M.overlays += new /obj/orb/rorbing10
														spawn(1)
															M.overlays = null
															if(M.place=="Earth")
																M.loc = locate(/turf/Area/Earth)
																M.inheaven = 0
															if(M.place=="Hell")
																M.loc = locate(/turf/Area/Hell)
																M.inheaven = 0
															if(M.place=="Heaven")
																M.loc = locate(/turf/Area/Heaven)
																M.inheaven = 1
															if(M.place=="Charmed")
																M.loc = locate(/turf/Area/Charmed)
																M.inheaven = 0
															if(M.place=="Park")
																M.loc = locate(/turf/Area/Park)
																M.inheaven = 0
															if(M.place=="SyncWolf")
																M.loc = locate(/turf/Area/SyncWolfsHouse)
																M.inheaven = 0
															if(M.place=="Zeniox")
																M.loc = locate(/turf/Area/ZenioxHouse)
																M.inheaven = 0
															if(M.place=="Drago")
																M.loc = locate(/turf/Area/DragowingHouse)
																M.inheaven = 0
															if(M.place=="Graveyard")
																M.loc = locate(/turf/Area/Graveyard)
																M.inheaven = 0
															if(M.place=="Ultimate")
																M.loc = locate(/turf/Area/Ultimate)
																M.inheaven = 0
															M.overlays = new /obj/orb/rorbing10
															spawn(1)
																M.overlays = null
																M.overlays += new /obj/orb/rorbing9
																spawn(1)
																	M.overlays = null
																	M.overlays += new /obj/orb/rorbing8
																	spawn(1)
																		M.overlays = null
																		M.overlays += new /obj/orb/rorbing7
																		spawn(1)
																			M.overlays = null
																			M.icon = null
																			M.overlays += new /obj/orb/rorbing6
																			spawn(1)
																				M.overlays = null
																				M.overlays += new /obj/orb/rorbing5
																				spawn(1)
																					M.overlays = null
																					M.icon = new /mob/goodwitch()
																					M.overlays += new /obj/orb/rorbing4
																					spawn(1)
																						M.overlays = null
																						M.overlays += new /obj/orb/rorbing3
																						spawn(1)
																							M.overlays = null
																							M.overlays += new /obj/orb/rorbing2
																							spawn(1)
																								M.overlays = null
																								M.overlays += new /obj/orb/rorbing1
																								spawn(1)
																									M.overlays = null
																									M.Selforb = 0
																									M.density = 1
mob/mysticlighter
	verb
		Freeze_Player(mob/M in oview(9))
			set name = "Mystic Freeze Player"
			set category = "Skills"
			if(usr.Freeze==1)
				usr<<"Your frozen, you can't use magic"
				return
			if(usr.RolePlaying==0)
				usr<<"You cannot use magic here"
				return
			if(usr.Energy<=0)
				usr<<"You don't have the energy to do this"
				return
			if(M.containhollow==1)
				usr.verbs -= new /mob/mysticlighter/verb/Freeze_Player
				M.verbs += new /mob/mysticlighter/verb/Freeze_Player
				view(9)<<"[M] has taken [usr]'s power using the hollow"
				return
			M.Freeze = 1
			usr.Energy -= 5
			view(9)<<sound("temporalstasis.wav")
			view(9)<<"[M] freezes up"
			if(M.adjust == 1)
				M.overlays = null
				M.overlays += new /obj/Freeze/rorb1
				spawn(1)
					M.overlays = null
					M.overlays += new /obj/Freeze/rorb2
					spawn(1)
						M.overlays = null
						M.overlays += new /obj/Freeze/rorb3
						spawn(1)
							M.overlays = null
							M.overlays += new /obj/Freeze/rorb4
							sleep(30)
							M:Freeze = 0
							view(9)<<"[M] unfreezes"
							M:overlays = null
							return
			if(M.Intelligence >= usr.Intelligence)
				M.overlays = null
				M.overlays += new /obj/Freeze/rorb1
				spawn(1)
					M.overlays = null
					M.overlays += new /obj/Freeze/rorb2
					spawn(1)
						M.overlays = null
						M.overlays += new /obj/Freeze/rorb3
						spawn(1)
							M.overlays = null
							M.overlays += new /obj/Freeze/rorb4
							sleep(80)
							M:Freeze = 0
							view(9)<<"[M] unfreezes"
							M:overlays = null
							return
			if(M.Intelligence <= usr.Intelligence)
				M.overlays = null
				M.overlays += new /obj/Freeze/rorb1
				spawn(1)
					M.overlays = null
					M.overlays += new /obj/Freeze/rorb2
					spawn(1)
						M.overlays = null
						M.overlays += new /obj/Freeze/rorb3
						spawn(1)
							M.overlays = null
							M.overlays += new /obj/Freeze/rorb4
							sleep(150)
							M:Freeze = 0
							view(9)<<"[M] unfreezes"
							M:overlays = null
							return

obj/Freeze
	rorb1
		icon = 'magicgood.dmi'
		icon_state = "rf1"
		layer = MOB_LAYER
obj/Freeze
	rorb2
		icon = 'magicgood.dmi'
		icon_state = "rf2"
		layer = MOB_LAYER
obj/Freeze
	rorb3
		icon = 'magicgood.dmi'
		icon_state = "rf3"
		layer = MOB_LAYER
obj/Freeze
	rorb4
		icon = 'magicgood.dmi'
		icon_state = "rf4"
		layer = MOB_LAYER

mob/vampire/verb
	Bite(mob/M in oview(1))
		set category = "Skills"
		if(usr.Freeze==1)
			usr<<"Your frozen, you can't use magic"
			return
		if(usr.Energy <= 0)
			usr<<"You don't have the energy for this"
			return
		if(M:shielded==1)
			view(9)<<"[usr] cannot penetrated [M]'s shield"
			return
		if(usr.biting==1)
			return
		usr.biting = 1
		view(9)<<"[usr] bites [M] in his neck"
		M.health -= usr.Strength
		usr.deathcheck(M)
		sleep(8)
		usr.biting = 0

	Transform()
		set category = "Skills"
		if(usr.Freeze==1)
			usr<<"Your frozen, you can't use magic"
			return
		if(usr.Energy <= 0)
			usr<<"You don't have the energy for this"
			return
		if(usr.changed == 0)
			usr.icon = 'Goodwitchs.dmi'
			usr.icon_state = "Bat"
			usr.density = 0
			usr.Strength = usr.Strength/2
			usr.changed = 1
		else
			usr.icon = 'Goodwitchs.dmi'
			usr.icon_state = "Demon"
			usr.density = 1
			usr.Strength = usr.Strength*2
			usr.changed = 0
		usr.VampireNameChecker()


obj
	HiVoBolt
		var
			power = 10

		icon='General.dmi'
		icon_state = "HighVoltage"
		density = 1
		Bump(atom/M)
			if(istype(M,/mob/))
				for(var/mob/N in world)
					if(M:shielded==1)
						del(src)
						return
					if(M:Whitelighter==1)
						M:Whitelighter_Death()
						del(src)
						return
					if(M:containhollow==1)
						M:verbs += new /mob/mysticlighter/verb/Hivobolt
						N.verbs -= new /mob/mysticlighter/verb/Hivobolt
						view(9)<<"[M] has taken [N]'s power using the hollow"
						del(src)
						return
					if(src.owner == "[N.key]")
						N<<"You hit [M]!"
						M<<"You were hit by [N]!"
						M:health -= N.power/M:power
						M:health -= N.Strength
						N.power += 1
						N.deathcheck(M)
						for(var/obj/Fastenergy/T in world)
							if(T:owner == "[N.key]")
								del(T)
				del(src)
			else
				..()
			if(istype(M,/obj/))
				spawn(1)
					M.overlays = null
					spawn(1)
						M.overlays = null
						spawn(1)
							M.overlays = null
							del(M)


				del(src)
			else
				..()
mob/mysticlighter
	verb
		Hivobolt()		//attack a mob within 1 tile of you
			set category = "Skills"
			set name = "Mystic Bolt"
			if(usr.Freeze==1)
				usr<<"Your frozen, you can't use magic"
				return
			if(usr.RolePlaying == 0)
				usr<<"You cannot use magic here"
				return
			if(usr.Energy<=0)
				usr<<"You don't have the energy to do this"
				return
			if(usr.attacking==1)
				return
			if(usr.Selforb == 0)
				var/obj/Fastenergy/F = new /obj/HiVoBolt(src.loc)
				usr.Energy -= 5
				usr.Exposing_Magic()
				usr.attacking = 1
				F:owner = "[usr.key]"
				walk(F,usr.dir)
				sleep(8)
				usr.attacking = 0
				spawn(10)
					del(F)
			else
				usr<<"You cant do this while orbing"

mob/demon/verb/Ignite(mob/M in view(4)-usr)
	set category = "Skills"
	if(usr.Freeze==1)
		usr<<"Your frozen, you can't use magic"
		return
	if(usr.Selforb == 1)
		usr<<"Not while in orb"
		return
	if(usr.Ignite==1)
		return
	if(M.Selforb == 1)
		return
	if(M:shielded==1)
		view(9)<<"[M]'s shield blocks the attack"
		return
	if(M:Whitelighter==1)
		sleep(30)
		M:Whitelighter_Death()
	else
		usr.Ignite = 1
		M.overlays += new /obj/Ignite
		M.Freeze=1
		M.health -= usr.Strength
		sleep(30)
		usr.deathcheck(M)
		M.Freeze=0
		M.overlays=null
		usr.Ignite = 0

obj/Ignite
	icon = 'General.dmi'
	icon_state = "Ignite"
	density = 1
	layer = MOB_LAYER

mob/werewolf/verb
	Transform2()
		set category = "Skills"
		set name = "Transform"
		if(usr.Freeze==1)
			usr<<"Your frozen, you can't use magic"
			return
		if(usr.Selforb == 1)
			usr<<"Not while in orb"
			return
		if(usr.Energy <= 0)
			usr<<"You don't have the energy for this"
			return
		if(usr.changed == 0)
			usr.icon = 'Goodwitchs.dmi'
			usr.icon_state = "Werewolf"
			usr.density = 0
			usr.Strength += usr.level*500
			usr.Intelligence -= usr.level/100
			usr.verbs+=new/mob/werewolf/verb/Scratch
			usr.verbs-=/mob/verb/Punch
		else
			usr.icon = 'Goodwitchs.dmi'
			usr.icon_state = "Demon"
			usr.density = 1
			usr.Strength -= usr.level/500
			usr.Intelligence += usr.level*100
			usr.verbs-=new/mob/werewolf/verb/Scratch
			usr.verbs+=new/mob/verb/Punch
		usr.WerewolfNameChecker()
	Scratch(mob/M in oview(1))
		set category = "Skills"
		if(usr.Selforb == 1)
			usr<<"Not while in orb"
			return
		if(usr.Freeze==1)
			usr<<"Your frozen, you can't use magic"
			return
		if(usr.Energy <= 0)
			usr<<"You don't have the energy for this"
			return
		view(9) << "[usr] scratched [M]"
		M.health -= usr.Strength
		usr.deathcheck(M)
	Push(mob/M in oview(1))
		set category = "Skills"
		view(9) << "[usr] pushes [M] away"
		spawn(1)
			step(M,usr.dir)
			spawn(2)
				step(M,usr.dir)
				spawn(2)
					step(M,usr.dir)
					M.health -= usr.Strength/2
					usr.deathcheck(M)

obj
    beams7
        var
            power = 10

            hit = 0
            blast = 0
            energyhit = 0
        Ki_Blast7
            icon = 'magicgood.dmi'
            icon_state="flame-f"
            density = 1
            power = 10
            Bump(atom/M)
                hit = 1
                if(istype(M,/mob/))
                    for(var/mob/N in world)
                        if(M:Whitelighter==1)
                            del(src)
                            return
                        if(M:shielded==1)
                            del(src)
                            return
                        if(M:containhollow==1)
                            M:verbs += new /mob/demon/verb/Flame
                            N.verbs -= new /mob/demon/verb/Flame
                            view(9)<<"[M] has taken [N]'s power using the hollow"
                            N.blast = 0
                            del(src)
                            return
                        if(owner == "[N.key]")
                            N << "you shot [M]"
                            M << "[N] shot you"
                            M:health -= N.power/M:power
                            M:health -= N.Strength
                            N.deathcheck(M)
                            usr.power += 1
                            for(var/obj/beams7/Trail7/T in world)
                                if(T:owner == "[N.key]")
                                    usr.blast = 0
                                    del(T)

                    del(src)
                else
                    ..()

        Trail7
            icon = 'magicgood.dmi'
            icon_state="flame-b"
            density = 1

    proc
        Moving7(obj/O,mob/N,obj/F)
            if(O:hit == 0)
                sleep(1)
                var/m = new /obj/beams7/Trail7(O:loc)
                m:dir = usr.dir
                m:owner = F:owner
                usr.energyhit += 1
                step(O,usr.dir)
                usr.blast = 1
                if(usr.energyhit <= 10)
                    O:Moving7(O,N,m)
                else
                    usr.energyhit = 0
                    for(var/obj/beams7/Trail7/T in world)
                        if(T:owner == O:owner)
                            usr.blast = 0
                            del T
                    del O
            else
                for(var/obj/beams7/Trail7/T in world)
                    if(T:owner == O:owner)
                        usr.blast = 0

                        del T
                del O
mob/demon
    verb
        Flame()
            set category = "Skills"
            set name = "Flame"
            if(usr.Freeze==1)
                usr<<"Your frozen, you can't use magic"
                return
            if(usr.Energy<=0)
                usr<<"You don't have the energy to do this"
                return
            if(usr.RolePlaying == 0)
                usr<<"Your not roleplaying"
                return
            if(usr.Selforb == 0)
                if(usr.blast == 0)
                    usr.Exposing_Magic()
                    usr.Energy -= 5
                    usr.energyhit = 0
                    var/t = new /obj/beams7/Ki_Blast7(usr.loc)
                    step(t,usr.dir)
                    t:owner = "[usr.key]"
                    t:dir = "[usr.dir]"
                    step(t,usr.dir)
                    var/w
                    var/n = new /obj/beams7/Trail7(usr.loc)
                    w = usr.dir
                    step(n,w)
                    n:owner = "[usr.key]"
                    n:dir = w
                    t:Moving7(t,usr,n)
            else
                usr<<"You cant do this while orbing"


