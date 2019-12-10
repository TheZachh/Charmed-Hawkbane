/* ~~~~~~~~~~ Task's ~~~~~~~~~~
 - witch magic not working on other good witches
	 - force charge system fix
 - vampire race
	 - redo char icons
		 - potions
 - house buying system
 - crystals
 - after potions add shop
 - upgrade phone
 - orb surroundings place
 - newspaper browser, containing updates and advice
	 - if 3x stronger, you can kill whitey

 - add cancel to orb  place ect
 - research facility

 - prepare for a P3
 - try to put a max powers steal using hollow
 - Nexus (boost on absorb, auto loose with time before reabsorbing)
 - Nexus summon and release spell
  (release: I am light I am one to strong to fight Go back to dark where shadows dwell You can not have this Halliwell Now go away and leave my sight And take away this endless night)
 - Finishing icons for rank completion, incl triad orb
 - Allow html in name
 - battle arena
*/


/*Avatar becoming spell: Ribus uero fecit orum bitis danae. Arca nvenio hospiyto fortis mundus*/


/*mob
	other
		verb
			Premonition()
				set category = "Skills"
				set name = "Premonition"
				var/list/being = new()
				for(var/mob/m in world)
					being += m
				being += "Cancel"
				var/who = input("Who do you wish to use Premonition on?","A Charmed Game",null) in being
				if(being!="Cancel")
					client.perspective = EYE_PERSPECTIVE
					client.eye = who
					sleep(20)
					client.perspective = MOB_PERSPECTIVE
					client.eye = usr*/