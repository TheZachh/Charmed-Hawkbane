//Spell: Nos dico super inconcesses,vox bonus quod malum.Ultirusque a profugus,addo is hic, addo is iam.

obj/Hollow
	Hollow_Box
		name = "The Hollow"
		icon = 'General.dmi'
		icon_state = "Hollow"
		density = 1
		verb
			Contain_Hollow(msg as text)
				set src in view(2)
				if(findtext(msg,"Nos dico super inconcesses,vox bonus quod malum.Ultirusque a profugus,addo is hic, addo is iam."))
					if(usr.key=="YOUR NAME HERE")
						usr << "You try to contain the hollow"
						sleep(3)
						usr.containhollow = 1
						view(9)<<"[usr] has absorbed the hollow into himself"
						usr.race = "Hollow"
						return
					if(usr.power>=2500000)
						usr << "You try to contain the hollow"
						sleep(3)
						usr.containhollow = 1
						view(9)<<"[usr] has absorbed the hollow into himself"
						usr.race = "Hollow"
						sleep(9000)
						usr<<"The hollow has left your body"
						usr.containhollow = 0
						usr.race = usr.choosenrace
						return
					if(usr.power>=1000000)
						usr << "You try to contain the hollow"
						sleep(3)
						usr.containhollow = 1
						view(9)<<"[usr] has absorbed the hollow into himself"
						usr.race = "Hollow"
						sleep(600)
						usr<<"You start to feel strange"
						sleep(50)
						if(usr.containhollow==0)
							return
						view(9)<<"The Hollow has destroyed [usr] and returns to its box"
						usr.health = 0
						usr.deathcheck()
						usr.containhollow=0
						usr.race = usr.choosenrace
						return
					if(usr.power>=500000)
						usr << "You try to contain the hollow"
						sleep(3)
						usr.containhollow = 1
						view(9)<<"[usr] has absorbed the hollow into himself"
						usr.race = "Hollow"
						sleep(150)
						usr<<"You start to feel strange"
						sleep(50)
						if(usr.containhollow==0)
							return
						view(9)<<"The Hollow has destroyed [usr] and returns to its box"
						usr.health = 0
						usr.deathcheck()
						usr.containhollow=0
						usr.race = usr.choosenrace
						return
					usr << "You try to contain the hollow"
					sleep(3)
					usr.kills += 1
					usr << "The hollow is to strong for you to contain and it kills you"
					usr.maxhealth = 0
					usr.deathcheck()
					view(9)<<"[usr] got vanquished trying to contain the Hollow"
				else
					usr<<"Nothing happens"
			Release_Hollow()
				set src in view(2)
				if(usr.containhollow==1)
					view(9)<<"[usr] releases the hollow back into its box"
					usr.containhollow = 0
					usr.race = usr.choosenrace
				else
					usr<<"You do not contain the Hollow"
			Get_Box()
				set src in oview(1)
				set name = "Get Hollow box"
				if(usr.key=="YOUR NAME HERE")
					Move(usr)
					view(9)<<"[usr] takes the [src]"
					return
				else if(usr.power>=2500000)
					Move(usr)
					view(9)<<"[usr] takes the [src]"
			Drop_Box()
				usr<<"You drop the box"
				src.loc=locate(usr.x,usr.y+1,usr.z)

