//////////////////////////////////////
///////////   YOUR NAME HERE  //////////////
obj/housesign
	House_of_Ragnarok
		name = "Julian Turner House"
		icon = 'General.dmi'
		icon_state = "HouseSign"
		density = 1
		verb
			Read_Sign()
				set name = "Read sign"
				set src in oview(1)
				usr<<"Julian Turner lives here"
turf/teleport/HouseOutsideSyncWolf//the name of our turf
	Entered(mob/M)
		if(istype(M,/mob))//is it a mob that entered?
			usr.loc=locate(/turf/teleport/HouseInsideSyncWolf)
turf/teleport/HouseInsideSyncWolf//the name of our turf
	Entered(mob/M)
		if(istype(M,/mob))//is it a mob that entered?
			M.loc=locate(/turf/teleport/HouseOutsideSyncWolf)

turf/teleport/HouseInsideSyncWolfUp//the name of our turf
	Entered(mob/M)
		if(istype(M,/mob))//is it a mob that entered?
			M.loc=locate(/turf/teleport/HouseOutsideSyncWolfDown)
turf/teleport/HouseOutsideSyncWolfDown//the name of our turf
	Entered(mob/M)
		if(istype(M,/mob))//is it a mob that entered?
			M.loc=locate(/turf/teleport/HouseInsideSyncWolfUp)

///////////////////////////////////////
////////////      Zeniox      ///////////
obj/housesign
	House_of_Zeniox
		name = "Kyle's House"
		icon = 'General.dmi'
		icon_state = "HouseSign"
		density = 1
		verb
			Read_Sign()
				set src in oview(1)
				set name = "Read sign"
				usr<<"This is Kyle's house"
turf/teleport/HouseOutsideZeniox//the name of our turf
	Entered(mob/M)
		if(istype(M,/mob))//is it a mob that entered?
			usr.loc=locate(/turf/teleport/HouseInsideZeniox)
turf/teleport/HouseInsideZeniox//the name of our turf
	Entered(mob/M)
		if(istype(M,/mob))//is it a mob that entered?
			M.loc=locate(/turf/teleport/HouseOutsideZeniox)
turf/teleport/HouseInsideZenioxUp//the name of our turf
	Entered(mob/M)
		if(istype(M,/mob))//is it a mob that entered?
			M.loc=locate(/turf/teleport/HouseOutsideZenioxDown)
turf/teleport/HouseOutsideZenioxDown//the name of our turf
	Entered(mob/M)
		if(istype(M,/mob))//is it a mob that entered?
			M.loc=locate(/turf/teleport/HouseInsideZenioxUp)

///////////////////////////////////////
////////////      Name      ///////////
obj/housesign
	House_of_Name
		name = "Name's House"
		icon = 'General.dmi'
		icon_state = "HouseSign"
		density = 1
		verb
			Read_Sign()
				set name = "Read sign"
				set src in oview(1)
				usr<<"This is Name's house"
turf/teleport/HouseInsideName//the name of our turf
	Entered(mob/M)
		if(istype(M,/mob))//is it a mob that entered?
			M.loc=locate(/turf/teleport/HouseOutsideName)
turf/teleport/HouseOutsideName//the name of our turf
	Entered(mob/M)
		if(istype(M,/mob))//is it a mob that entered?
			M.loc=locate(/turf/teleport/HouseInsideName)

///////////////////////////////////////
obj/housesign
	House_of_Charmed
		name = "Charmed manor"
		icon = 'General.dmi'
		icon_state = "HouseSign"
		density = 1
		verb
			Read_Sign()
				set name = "Read sign"
				set src in oview(1)
				usr<<"This is the Charmed ones manor"
turf/teleport/HouseInsideCharmed//the name of our turf
	Entered(mob/M)
		if(istype(M,/mob))//is it a mob that entered?
			M.loc=locate(/turf/teleport/HouseOutsideCharmed)
turf/teleport/HouseOutsideCharmed//the name of our turf
	Entered(mob/M)
		if(istype(M,/mob))//is it a mob that entered?
			M.loc=locate(/turf/teleport/HouseInsideCharmed)
turf/teleport/HouseInsideCharmedDown//the name of our turf
	Entered(mob/M)
		if(istype(M,/mob))//is it a mob that entered?
			M.loc=locate(/turf/teleport/HouseInsideCharmedUp)
turf/teleport/HouseInsideCharmedUp//the name of our turf
	Entered(mob/M)
		if(istype(M,/mob))//is it a mob that entered?
			M.loc=locate(/turf/teleport/HouseInsideCharmedDown)

	Under_Construction
		name = "Closed duo to construction"
		icon = 'General.dmi'
		icon_state = "tile37"
		density = 1
		verb
			Read_Note()
				set name = "Read note"
				set src in oview(1)
				usr<<"This house is closed duo to construction"


////////////      DragoWing      ///////////
obj/housesign
	House_of_DragoWing
		name = "DragoWing's House"
		icon = 'General.dmi'
		icon_state = "HouseSign"
		density = 1
		verb
			Read_Sign()
				set name = "Read sign"
				set src in oview(1)
				usr<<"This is DragoWing's house"
turf/teleport/HouseInsideDrago//the name of our turf
	Entered(mob/M)
		if(istype(M,/mob))//is it a mob that entered?
			M.loc=locate(/turf/teleport/HouseOutsideDrago)
turf/teleport/HouseOutsideDrago//the name of our turf
	Entered(mob/M)
		if(istype(M,/mob))//is it a mob that entered?
			M.loc=locate(/turf/teleport/HouseInsideDrago)
turf/teleport/HouseInsideDragoDown//the name of our turf
	Entered(mob/M)
		if(istype(M,/mob))//is it a mob that entered?
			M.loc=locate(/turf/teleport/HouseInsideDragoUp)
turf/teleport/HouseInsideDragoUp//the name of our turf
	Entered(mob/M)
		if(istype(M,/mob))//is it a mob that entered?
			M.loc=locate(/turf/teleport/HouseInsideDragoDown)

///////////////////////////////////////
////////////      Ultimate      ///////////
obj/housesign
	The_Ultimate_Manor
		name = "Ultimate Manor"
		icon = 'General.dmi'
		icon_state = "HouseSign"
		density = 1
		verb
			Read_Sign()
				set name = "Read sign"
				set src in oview(1)
				usr<<"This is the manor of the Ultimate"
turf/teleport/HouseInsideUltimate//the name of our turf
	Entered(mob/M)
		if(istype(M,/mob))//is it a mob that entered?
			M.loc=locate(/turf/teleport/HouseOutsideUltimate)
turf/teleport/HouseOutsideUltimate//the name of our turf
	Entered(mob/M)
		if(istype(M,/mob))//is it a mob that entered?
			M.loc=locate(/turf/teleport/HouseInsideUltimate)
turf/teleport/HouseInsideUltimate2//the name of our turf
	Entered(mob/M)
		if(istype(M,/mob))//is it a mob that entered?
			M.loc=locate(/turf/teleport/HouseInsideUltimate1)
turf/teleport/HouseInsideUltimate1//the name of our turf
	Entered(mob/M)
		if(istype(M,/mob))//is it a mob that entered?
			M.loc=locate(/turf/teleport/HouseInsideUltimate2)

///////////////////////////////////////
obj/housesign
	House_of_Shop
		name = "Shop"
		icon = 'General.dmi'
		icon_state = "HouseSign"
		density = 1
		verb
			Read_Sign()
				set name = "Read sign"
				set src in oview(1)
				usr<<"Local Shop"


////////////      House1      ///////////
obj/housesign
	House_of_M1
		name = "Empty House Nr1"
		icon = 'General.dmi'
		icon_state = "HouseSign"
		density = 1
		verb
			Read_Sign()
				set name = "Read sign"
				set src in oview(1)
				usr<<"Empty house"
turf/teleport2/HouseInsideM1//the name of our turf
	Entered(mob/M)
		if(istype(M,/mob))//is it a mob that entered?
			M.loc=locate(/turf/teleport2/HouseOutsideM1)
turf/teleport2/HouseOutsideM1//the name of our turf
	Entered(mob/M)
		if(istype(M,/mob))//is it a mob that entered?
			M.loc=locate(/turf/teleport2/HouseInsideM1)
turf/teleport2/HouseInsideM1Up//the name of our turf
	Entered(mob/M)
		if(istype(M,/mob))//is it a mob that entered?
			M.loc=locate(/turf/teleport2/HouseInsideM1Down)
turf/teleport2/HouseInsideM1Down//the name of our turf
	Entered(mob/M)
		if(istype(M,/mob))//is it a mob that entered?
			M.loc=locate(/turf/teleport2/HouseInsideM1Up)

///////////////////////////////////////
////////////      House2      ///////////
obj/housesign
	House_of_M2
		name = "Empty House Nr2"
		icon = 'General.dmi'
		icon_state = "HouseSign"
		density = 1
		verb
			Read_Sign()
				set name = "Read sign"
				set src in oview(1)
				usr<<"Empty house"
turf/teleport2/HouseInsideM2//the name of our turf
	Entered(mob/M)
		if(istype(M,/mob))//is it a mob that entered?
			M.loc=locate(/turf/teleport2/HouseOutsideM2)
turf/teleport2/HouseOutsideM2//the name of our turf
	Entered(mob/M)
		if(istype(M,/mob))//is it a mob that entered?
			M.loc=locate(/turf/teleport2/HouseInsideM2)
turf/teleport2/HouseInsideM2Up//the name of our turf
	Entered(mob/M)
		if(istype(M,/mob))//is it a mob that entered?
			M.loc=locate(/turf/teleport2/HouseInsideM2Down)
turf/teleport2/HouseInsideM2Down//the name of our turf
	Entered(mob/M)
		if(istype(M,/mob))//is it a mob that entered?
			M.loc=locate(/turf/teleport2/HouseInsideM2Up)

///////////////////////////////////////
////////////      House3      ///////////
obj/housesign
	House_of_M3
		name = "Shuya's House"
		icon = 'General.dmi'
		icon_state = "HouseSign"
		density = 1
		verb
			Read_Sign()
				set name = "Read sign"
				set src in oview(1)
				usr<<"This is Shuya's house"
turf/teleport2/HouseInsideM3//the name of our turf
	Entered(mob/M)
		if(istype(M,/mob))//is it a mob that entered?
			M.loc=locate(/turf/teleport2/HouseOutsideM3)
turf/teleport2/HouseOutsideM3//the name of our turf
	Entered(mob/M)
		if(istype(M,/mob))//is it a mob that entered?
			M.loc=locate(/turf/teleport2/HouseInsideM3)
turf/teleport2/HouseInsideM3Up//the name of our turf
	Entered(mob/M)
		if(istype(M,/mob))//is it a mob that entered?
			M.loc=locate(/turf/teleport2/HouseInsideM3Down)
turf/teleport2/HouseInsideM3Down//the name of our turf
	Entered(mob/M)
		if(istype(M,/mob))//is it a mob that entered?
			M.loc=locate(/turf/teleport2/HouseInsideM3Up)

///////////////////////////////////////

obj/housesign
	Magic_School
		name = "Magic School"
		icon = 'General.dmi'
		icon_state = "HouseSign"
		density = 1
		verb
			Read_Sign()
				set name = "Read sign"
				set src in oview(1)
				usr<<"Welcome to Magic School"
	Demon_School
		name = "Demon School"
		icon = 'General.dmi'
		icon_state = "HouseSign"
		density = 1
		verb
			Read_Sign()
				set name = "Read sign"
				set src in oview(1)
				usr<<"Welcome to Demon School"
	Dark_Force
		name = "Dark Force"
		icon = 'General.dmi'
		icon_state = "HouseSign"
		density = 1
		verb
			Read_Sign()
				set name = "Read sign"
				set src in oview(1)
				usr<<"The Dark Force Lair"
