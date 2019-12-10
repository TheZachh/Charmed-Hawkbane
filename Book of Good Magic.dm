//////////////////////////////////////////////////////////
//														//
//					Book of Good Magic					//
//														//
//////////////////////////////////////////////////////////
obj/BookOf/
	Book_Of_Good
		name = "Book of Good Magic"
		icon = 'General.dmi'
		icon_state = "book6"
		density = 1
		verb
			read()
				set src in oview(1)
				set name = "Read"
				switch(alert(usr,"What do you want to search for?","Search book of Good Magic","Personnes","Coverns"))
					if("Personnes")
						var/goodside = input("Search book for who?")in list("Kyle Warren","Adam Colbert","Kimpo Areon","Julian Turner","Samantha Matthews")
						if(goodside=="Kyle Warren")
							usr << browse(Personne_KyleWarren,"Window=Kyle Warren,size=450x400")
						if(goodside=="Adam Colbert")
							usr << browse(Personne_AdamColbert,"Window=Adam Colbert,size=450x400")
						if(goodside=="Kimpo Areon")
							usr << browse(Personne_KimpoAreon,"Window=Kimpo Areon,size=450x400")
						if(goodside=="Julian Turner")
							usr << browse(Personne_JulianTurner,"Window=Julian Turner,size=450x400")
						if(goodside=="Samantha Matthews")
							usr << browse(Personne_SamanthaMatthews,"Window=Samantha Matthews,size=450x400")
					if("Coverns")
						var/goodcovern = input("Search book for what Covern?")in list("Whitelighter Council","Magic School United")
						if(goodcovern=="Whitelighter Council")
							usr << browse(Covern_WhitelighterCouncil,"Window=Whitelighter Council,size=450x400")
						if(goodcovern=="Magic School United")
							usr << browse(Covern_MagicSchoolUnited,"Window=Magic School United,size=450x400")



//////////////////////////////////////////////////////////
//														//
//						Good Beings						//
//														//
//////////////////////////////////////////////////////////
var/const/Personne_KyleWarren = {"
<HTML><HEAD>
</HEAD>
<BODY BGCOLOR=black TEXT=white><CENTER><FONT FACE="Charming Font" SIZE="7" COLOR=darkblue><U>Kyle Warren</U></FONT></CENTER><P>
He was one of the earliest of Whitelighters in existence since the Hollow,<BR>
and is known for his knowledge, power, and wisdom.<BR>
He and 3 other Upper Level Whitelighters created the Whitelighter Council,>BR>
which is the ruler of Heaven because of no Elders are left alive.</BODY></HTML>"}
var/const/Personne_AdamColbert = {"
<HTML><HEAD>
</HEAD>
<BODY BGCOLOR=black TEXT=white><CENTER><FONT FACE="Charming Font" SIZE="7" COLOR=darkblue><U>Adam Colbert</U></FONT></CENTER><P>
A White Lighter who was, during his human life, a late night TV News reporter.<BR>
Unfortunatly, his life was cut short when he was attacked by a Dark Lighter noting his future as a White Lighter.<BR>
Although he escaped he accidentally walked into the path of an oncoming schoolbus<BR>
at which time he became a White Lighter who is both egotistical, cocky,<BR>
but ultimately seeks to do good.</BODY></HTML>"}
var/const/Personne_KimpoAreon = {"
<HTML><HEAD>
</HEAD>
<BODY BGCOLOR=black TEXT=white><CENTER><FONT FACE="Charming Font" SIZE="7" COLOR=darkblue><U>Kimpo Areon</U></FONT></CENTER><P>
Kimpo was an average person in his ''first'' life.<BR>
He always knew that there was something bigger in store for him.<BR>
He always loved to help people and bring others happiness.<BR>
Unfortunately Kimpo's life ended when he died in a plane crash to San Francisco.<BR>
Due to Kimpo's enthusiasm and his love of helping people, he was made a whitelighter by the Elders.<BR>
It is hard to see Kimpo these days since he is orbing around helping people here and there in ways that wouldn't expose magic.<BR>
Kimpo is described in the magical world as one of the most caring whitelighters to ever exist.</BODY></HTML>"}
var/const/Personne_Ranmaru = {"
<HTML><HEAD>
</HEAD>
<BODY BGCOLOR=black TEXT=white><CENTER><FONT FACE="Charming Font" SIZE="7" COLOR=darkblue><U>Ranmaru</U></FONT></CENTER><P>
Ranmaru is an Advance Whitelighter.Calm and Collected like most of the Whight lighters.<BR>
Mostly he has been seen to wander around whats left of the Charmed Manor and P3.<BR>
He Tends to Reasearch and Train rather than collect charges. His death was not average.<BR>
He was tortured for head to toe by demons,which he did not know at the time.<BR>
Though Seeming lazy and Useless. Ranmaru knows much about the Craft and current Demons and Witches that are introduced.<BR>
Since his first time of being a WL he has advanced his powers to having such the ablities to heal and Glamor into other beings.<BR>
After Years of studying and training about the Whitelighter way.<BR>
Ranmaru been promoted to Advanced Whitelighter status.Which Allowed him to have more freedom.</BODY></HTML>"}
var/const/Personne_JulianTurner = {"
<HTML><HEAD>
</HEAD>
<BODY BGCOLOR=black TEXT=white><CENTER><FONT FACE="Charming Font" SIZE="7" COLOR=darkblue><U>Julian Turner</U></FONT></CENTER><P>
<FONT FACE="Balthazar"Julian Turner is a upper level half demon,<BR>
Julian's true powers are unknown, but he has been seen using Telekinesis,
Energybolt's and the ability to shimmer to other planes.<BR></FONT></BODY></HTML>"}
var/const/Personne_SamanthaMatthews  = {"
<HTML><HEAD>
</HEAD>
<BODY BGCOLOR=black TEXT=white><CENTER><FONT FACE="Charming Font" SIZE="7" COLOR=darkblue><U>Samantha Matthews</U></FONT></CENTER><P>
Samantha just recentley found out about her powers getting attacked by a demon sent to kill her,<BR>
she orbed away then orbed back, she didnt know what happend so ran away.<BR>
She was looking up what she was and started looking up things about Wicca and found out some things leeding her to magic school.<BR>
Sammy wishes to figure more about her life and find out what her purpose it for life.<BR></FONT></BODY></HTML>"}

//////////////////////////////////////////////////////////
//														//
//						Covens							//
//														//
//////////////////////////////////////////////////////////

var/const/Covern_WhitelighterCouncil = {"
<HTML><HEAD>
</HEAD>
<BODY BGCOLOR=black TEXT=white><CENTER><FONT FACE="Charming Font" SIZE="7" COLOR=darkblue><U>Whitelighter Council</U></FONT></CENTER><P>
The Whitelighter Council was formed when a group of 4 powerful Whitelighters,<BR>
who got together to discuss the state of how things will run 'Up There'.<BR>
One thing they all agreed on was, is that there needs to be a leader so they decided to rule Heaven together because there were no more Elders alive.<BR>
Their main focus is leading the other Whitelighters but if forced they will kill to protect Heaven and Magic School.</BODY></HTML>"}
var/const/Covern_MagicSchoolUnited = {"
<HTML><HEAD>
</HEAD>
<BODY BGCOLOR=black TEXT=white><CENTER><FONT FACE="Charming Font" SIZE="7" COLOR=darkblue><U>Magic School United</U></FONT></CENTER><P>
A coven created by probably the most strongest personne there is.<BR>
The sole purpose of this Coven is to protect magic school from demons and other evil.<BR>
</BODY></HTML>"}
