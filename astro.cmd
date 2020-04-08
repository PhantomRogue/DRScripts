
################################################################################################
#
#                            Written by Old Wolf
#  This is a quick and dirty Astrology script for young Moon Mages. Once
#  you know most of your constellations and planets you should probably 
#  use something a little more robust.
#
#  To use, type observ sky, then pick a moon or the sun. something that's visible and then type 
#    .astro sun  
#    or 
#    .astro kat 
#  or whatever constellation or body you know, and let it run until locked or the object 
#  disappears from the sky.
#################################################################################################

start:
send prep pg
pause 20
send cast
pause .5
reobs:
send observe %1 in the sky
pause 22

        matchre magic You have a (.+) understanding of the celestial influences over magic.
        matchre lore You have a (.+) understanding of the celestial influences over lore.
        matchre offensive You have a (.+) understanding of the celestial influences over offensive combat.
        matchre defensive You have a (.+) understanding of the celestial influences over defensive combat.
        matchre survival You have a (.+) understanding of the celestial influences over survival.
        matchre future You have a (.+) understanding of the celestial influences over future events.
        matchre reobs You feel you have sufficiently pondered your latest observation.|Roundtime
	send predict state all
	matchwait

magic:
pause 2
send align magic
pause 3
send predict future $charactername magic
pause 20
send predict anal
pause 20
goto start

lore:
pause 2
send align lore
pause 3
send predict future $charactername lore
pause 20
send predict anal
pause 20
goto start



offensive:
pause 2
send align offense
pause 3
send predict future $charactername offense
pause 20
send predict anal
pause 20
goto start

defensive:
pause 2
send align defense
pause 3
send predict future $charactername defense
pause 20
send predict anal
pause 20
goto start


survival:
pause 2
send align survival
pause 3
send predict future $charactername survival
pause 20
send predict anal
pause 20
goto start

future:
pause 2
send align future
pause 3
send predict future $charactername future
pause 20
send predict anal
pause 20
goto start
