mob/Human
	New()//when a mob is created
		sleep(20)
		if(isnull(src.client))//if it's not human
			ai_random_wander()//wander
			return..()//continue on with normal New() (create and whatnot)
		else
			return..()


	Human1
		name = "Human"
		icon = 'Goodwitchs.dmi'
		icon_state = "whitelighter"
		density = 1
		race = "Human"
		age = "?"
		gender1 = "Male"
		NPC = 1
		good = 1
		Human = 1
		level = 1
		Greet()
			..()
			view(9)<<"[src]: Hiya, how are you?"
	Human2
		name = "Human"
		icon = 'Goodwitchs.dmi'
		icon_state = "Demon"
		density = 1
		race = "Human"
		age = "?"
		gender1 = "Male"
		NPC = 1
		good = 1
		level = 1
		Human = 1
		Greet()
			..()
			view(9)<<"[src]: What do you want?"
	Human3
		name = "Female human"
		icon = 'Goodwitchs.dmi'
		icon_state = "badwitch"
		density = 1
		race = "Human"
		age = "?"
		gender1 = "Female"
		NPC = 1
		good = 1
		Human = 1
		level = 1
		Greet()
			..()
			view(9)<<"[src]: Hi there."
	Human4
		name = "Female human"
		icon = 'Goodwitchs.dmi'
		icon_state = "goodwitch"
		density = 1
		race = "Human"
		age = "?"
		gender1 = "Female"
		level = 1
		NPC = 2
		good = 1
		Human = 1
		Greet()
			..()
			view(9)<<"[src] ignores the greeting"
	Human5
		name = "Female human"
		icon = 'Goodwitchs.dmi'
		icon_state = "godwitch"
		density = 1
		race = "Human"
		age = "?"
		gender1 = "Female"
		NPC = 1
		good = 1
		Human = 1
		level = 1
		Greet()
			..()
			view(9)<<"[src]: Good day"
	Human6
		name = "Human"
		icon = 'Goodwitchs.dmi'
		icon_state = "Darklighter"
		density = 1
		race = "Human"
		age = "?"
		gender1 = "Male"
		level = 1
		NPC = 2
		good = 1
		Human = 1
		Greet()
			..()
			view(9)<<"[src] mummbles back"

	Kittie
		name = "Kittie"
		icon = 'Goodwitchs.dmi'
		icon_state = "Kittie"
		density = 1
		race = "Cat"
		age = "?"
		gender1 = "Male"
		good = 1
		Animal = 1
		Human = 0

	Kittie2
		name = "Julian's Kittie"
		icon = 'Goodwitchs.dmi'
		icon_state = "JuliansCat"
		density = 1
		race = "Kittie"
		age = "?"
		gender1 = "Male"
		good = 1
		Human = 0
		Animal = 1

	Doggie
		name = "Doggie"
		icon = 'Goodwitchs.dmi'
		icon_state = "DOG"
		density = 1
		race = "Dog"
		age = "?"
		gender1 = "Male"
		good = 1
		Human = 0
		Animal = 1

	proc
		ai_random_wander()
			if(src.key)
				return
			else
				walk_rand(src,8)
				spawn(13)//delay for one tick
					ai_random_wander()//wander some more


mob/verb/Greet()
   set src in view()
   view(9) << "[usr] greets [src]."
