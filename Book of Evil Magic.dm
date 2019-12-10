//////////////////////////////////////////////////////////
//														//
//					Book of Evil Magic					//
//														//
//////////////////////////////////////////////////////////
obj/BookOf/
	Book_Of_Evil
		name = "Book of Evil Magic"
		icon = 'General.dmi'
		icon_state = "book4"
		density = 1
		verb
			read()
				set src in oview(1)
				set name = "Read"
				switch(alert(usr,"What do you want to search for?","Search book of Evil Magic","Personnes","Factions"))
					if("Personnes")
						var/evilside = input("Search book for who?")in list("Ranarok HGM","Valafar","Devils Dragon","Urobach","Shencorex")
						if(evilside=="SyncWolf")
							usr << browse(Personne_SyncWolf,"Window=SyncWolf,size=450x400")
						if(evilside=="Valafar")
							usr << browse(Personne_Valafar,"Window=Valafar,size=450x400")
						if(evilside=="Devils Dragon")
							usr << browse(Personne_DevilsDragon,"Window=Devils Dragon,size=450x400")
						if(evilside=="Urobach")
							usr << browse(Personne_Urobach,"Window=Urobach,size=450x400")
						if(evilside=="Shencorex")
							usr << browse(Personne_Shencorex,"Window=Shencorex,size=450x400")
					if("Factions")
						var/evilfaction = input("Search book for what faction?")in list("Dark Force","Dominion")
						if(evilfaction=="Dark Force")
							usr << browse(Faction_DarkForce,"Window=Dark Force,size=450x400")
						if(evilfaction=="Dominion")
							usr << browse(Faction_Dominion,"Window=Dark Force,size=450x400")

//////////////////////////////////////////////////////////
//														//
//						Evil Beings						//
//														//
//////////////////////////////////////////////////////////
var/const/Personne_SyncWolf = {"
<HTML><HEAD>
</HEAD>
<BODY BGCOLOR=black TEXT=white><CENTER><FONT FACE="Charming Font" SIZE="7" COLOR=darkblue><U>SyncWolf</U></FONT></CENTER><P>
<FONT FACE="Balthazar"There isnt mutch known about SyncWolf,<BR>
He is clasified as a upper level demon<BR>
and headmaster of Demon School.<BR>
There is no known way to vanquish SyncWolf.<BR>
He is considered dangerous and best avoided.</FONT></BODY></HTML>"}
var/const/Personne_Valafar = {"
<HTML><HEAD>
</HEAD>
<BODY BGCOLOR=black TEXT=white><CENTER><FONT FACE="Charming Font" SIZE="7" COLOR=darkblue><U>Valafar</U></FONT></CENTER><P>
<FONT FACE="Balthazar"Valafar is a demonic bounty hunter.<BR>
His hunger for powers makes him kill people for money to pay the powerbrokers.<BR>
If he's after you, you can do 3 things:<BR>
pay him off<BR>
kill the guy who hired him<BR>
kill Valafar himself although that might be the most difficult thing to do.</FONT></BODY></HTML>"}
var/const/Personne_DevilsDragon = {"
<HTML><HEAD>
</HEAD>
<BODY BGCOLOR=black TEXT=white><CENTER><FONT FACE="Charming Font" SIZE="7" COLOR=darkblue><U>Devils Dragon</U></FONT></CENTER><P>
<FONT FACE="Balthazar"DevilsDragon,a powerfull half demon with a big hunger for power.<BR>
Anyone who crosses his way wont live to tell.<BR>
He want to advenge the death of the source by killing all good witches,<BR>
and he hopes that one day he will become the source himself.<P></FONT></BODY></HTML>"}
var/const/Personne_Urobach = {"
<HTML><HEAD>
</HEAD>
<BODY BGCOLOR=black TEXT=white><CENTER><FONT FACE="Charming Font" SIZE="7" COLOR=darkblue><U>Urobach</U></FONT></CENTER><P>
<FONT FACE="Balthazar"Zander Cage is a half demon known by the name Urobach.<BR<
Urobach only desires power and death<BR>
while Zander is more neutral and will do what he needs to do and does not care about the war or power.<BR>
Because of Urobach's destructive behavior you will not see him much,<BR>
but when he does come out then run and hide.</FONT></BODY></HTML>"}
var/const/Personne_Shencorex = {"
<HTML><HEAD>
</HEAD>
<BODY BGCOLOR=black TEXT=white><CENTER><FONT FACE="Charming Font" SIZE="7" COLOR=darkblue><U>Shencorex</U></FONT></CENTER><P>
<FONT FACE="Balthazar"Shencorex, an Upper Level Demon who has been known throughout the Underworld for ages.<BR>
Despite his numerous attempts to rule, he now looks to his former role model,<BR>
the former demon of Fear, Barbas,<BR>
as his influence for his new reign of terror.<BR>
no vanquishing spell or potion exists yet.</FONT></BODY></HTML>"}

//////////////////////////////////////////////////////////
//														//
//						Factions						//
//														//
//////////////////////////////////////////////////////////

var/const/Faction_DarkForce = {"
<HTML><HEAD>
</HEAD>
<BODY BGCOLOR=black TEXT=white><CENTER><FONT FACE="Charming Font" SIZE="7" COLOR=darkblue><U>Dark Force</U></FONT></CENTER><P>
<FONT FACE="Balthazar"The Dark Force is a powerfull faction,<BR>
and ruler of the Underworld<BR>
The members follow a simple rule,<BR>
The faction comes first, your need second.<BR>
These member posses great powers and are known to drive people insane.<BR>
Since there isnt mutch known about them,<BR>
there is no known way to vanquish these members.
they are considered dangerous and best avoided.<P>
The Dark Force is known for the Source his demise, after its revival.</FONT></BODY></HTML>"}
var/const/Faction_Dominion = {"
<HTML><HEAD>
</HEAD>
<BODY BGCOLOR=black TEXT=white><CENTER><FONT FACE="Charming Font" SIZE="7" COLOR=darkblue><U>Dominion</U></FONT></CENTER><P>
<FONT FACE="Balthazar"The Dominion is a group of followers of the source.<BR>
Their goal is to bring back the source at all costs.<BR>
Their leader was an ex-member of the brotherhood of thorn, named Urobach.<BR>
In the group there are many servants of the source,<BR>
from the triad, other brotherhood members, and other faction members.<BR>
The only people who can't join the Dominon are Vampires and Werewolves.</FONT></BODY></HTML>"}

