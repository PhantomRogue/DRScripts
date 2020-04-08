## Theurgy
## Coded by Czidvar
## v1.6

	debuglevel 5

###############################################
## TIPS:
##-I do not wear my Pilgrim's Badge & therefore
## the script gets it from a bag. If you wish to 
## wear yours, you'll have to add a routine to 
## remove/wear it.
##-You can just comment out a section you don't
## wish to use by putting a # in front of that
## line.
###############################################	
## SECTION HEADINGS:
## Altar Stuff
## Bathing Stuff
## Commune Stuff
## Misc Stuff
## Re-Supply Stuff
###############################################

## User Variables #############################
	var FlintBlade c k
	var HolyReceptacle chalice
	var Instrument bones
	var InstrumentCont backpack
	var PlaySongStyle scales off
	var PrayTo Keren

## The following can be an array of the communes you wish to use to learn Theurgy or a single commune.
## Make sure you input each one in ALL CAPS. If you use more than one, this section of the script will take a while until I figure out a better method for cycling them.
## Even if using one commune, leave the 0 to initialize the variable as an array.

	var Communes 0|ELUNED
	
##
## Do not edit the following unless you are absolutely sure of what you are doing or don't care if you break anything.
##
	
## Includes ###################################
	include TT_Base.cmd
	
## Script Variables ###########################
	var BathFull NO
	var BathTime 0
	var CommuneCount 0
	var DanceComplete NO
	var HaveChamomile 0
	var HaveIncense 0
	var HaveLavender 0
	var HaveSage 0
	var HaveWine 0
	var HerbsUsed 0
	var Winter NO
	
## Actions ####################################
	action var BathFull YES when waters of the pool are currently (very full|almost overflowing)\,
	action var DanceComplete YES when ^Your dance reaches its conclusion (at last|a perfect)\,
	action var HaveChamomile 1 when a bag of chamomile
	action var HaveIncense 1 when (a stick of|some) (fragrant|burnt) incense
	action var HaveLavender 1 when a bag of lavender
	action var HaveSage 1 when a bag of sage
	action var HaveWine 1 when some deep red wine
	action var Winter YES when currently winter
	
## Provincial Detection #######################
	if contains ("1|1j|1l|1m|2|2a|2d|4|4a|6|7|7a|8|8a|9b", "$zoneid") then goto MAIN.CROSSING

MAIN.CROSSING:
	send time
	var Province Crossing
	if ("$zoneid" != "1" && "$zoneid" != "2a") then
	{
		put #goto Crossing
		waitfor YOU HAVE ARRIVED
	}
	put .PayDebt
	waitfor DEBT PAID
	gosub CHECK.SUPPLIES
	gosub TITHE
	if ("$zoneid" != "2a" && "%Winter" != "YES") then
	{
		put #goto temple
		waitfor YOU HAVE ARRIVED
	}
	if ("$zoneid" = "2a" && "$roomid" != "11") then
	{
		put #goto 11
		waitfor YOU HAVE ARRIVED
	}
	gosub COMMUNES
	if ("%Winter" != "YES") then gosub FILL.BATH
	if ("%Winter" != "YES") then gosub BATHE
	gosub TO.CHAPEL
	#gosub CLEAN.ALTAR
	gosub PRAY.AND.KISS.ALTAR
	gosub PRAY.BADGE
	gosub WINE.ALTAR
	gosub INCENSE.ALTAR
	gosub DANCE.ALTAR
	gosub PLAY.ALTAR
	gosub PLANT.SIRESE
	goto EXIT

## Altar Stuff ################################
CLEAN.ALTAR:
	gosub GET my %HolyReceptacle
	gosub CHECK.RECEPTACLE
	gosub CLEAN.ALTAR.2
	gosub FILL.RECEPTACLE
	gosub STOW my %HolyReceptacle
	return
CLEAN.ALTAR.2:
	pause .2
	matchre CLEAN.ALTAR.2 ^\.\.\.wait|^Sorry
	matchre RETURN ^You feel that your gods|you have completed this ritual too recently in the past\.
	send clean altar with water in my %HolyReceptacle
	matchwait
	
DANCE.ALTAR:
	pause .2
	if ("%DanceComplete" = "YES") then return
	gosub FALLEN
	send dance
	pause .5
	goto DANCE.ALTAR
	
INCENSE.ALTAR:
	gosub WIELD my %FlintBlade
	gosub GET my incense
	gosub LIGHT.INCENSE
	gosub WAVE.INCENSE
	send snuff my incense
	waitforre ^You snuff out|^What were you referring to\?
	gosub STOW my incense
	gosub SHEATH my %FlintBlade
	return
LIGHT.INCENSE:
	pause .2
	matchre LIGHT.INCENSE ^\.\.\.wait|^Sorry|\, but nothing happens\.
	matchre RETURN smolders\, then bursts into flames\.
	send light my incense with flint
	matchwait
WAVE.INCENSE:
	pause .2
	matchre WAVE.INCENSE ^\.\.\.wait|^Sorry
	matchre RETURN ^You feel that your gods|you have completed this ritual too recently in the past\.|^You wave your .* over
	send wave incense at altar
	matchwait
	
PLAY.ALTAR:
	pause .2
	gosub GET my %Instrument
	gosub PLAY.INSTRUMENT
	gosub STOW %Instrument in my %InstrumentCont
	return
PLAY.INSTRUMENT:
	pause .2
	matchre PLAY.INSTRUMENT ^\.\.\.wait|^Sorry
	matchre RETURN ^You finish
	send play %PlaySongStyle on my %Instrument for %PrayTo 
	matchwait
	
PRAY.AND.KISS.ALTAR:
	pause .2
	send pray
	waitforre you kneel\, you make the Cleric\'s sign with your hand\.
	send pray %PrayTo
	waitforre ^You still your thoughts and whisper|Immersing yourself in your faith you murmur
	send kiss altar
	waitforre ^You bend forward to kiss
	gosub FALLEN
	return
	
WINE.ALTAR:
	pause .2
	gosub GET my wine
	send pour wine on altar
	waitforre ^You quietly pour some of the wine onto the altar\.
	gosub STOW wine
	return
	
	
## Bathing Stuff ##############################
BATHE:
	math BathTime add %HaveChamomile
	math BathTime add %HaveLavender
	math BathTime add %HaveSage
	if (%BathTime >= 2) then
	{
		gosub MOVE go bath
		if (%HaveChamomile = 1) then 
		{
			gosub GET my chamomile
			send rub my chamomile
			math HerbsUsed add 1
		}
		if (%HaveLavender = 1) then 
		{
			gosub GET my lavender
			send rub my lavender
			math HerbsUsed add 1
		}
		if (%HaveSage = 1 && "%HerbsUsed < 2) then 
		{
			gosub GET my sage
			send rub my sage
		}
		waitforre ^You feel that your gods have smiled upon you|you have completed this ritual too recently in the past\.
		gosub MOVE out
	}
	return
	
CHECK.BATH.LEVEL:
	pause .2
	matchre CHECK.BATH.LEVEL ^\.\.\.wait|^Sorry
	matchre FILL.POT (bone|currently|fairly|half|nearly) (empty|dry|full|shallow)|very shallow
	matchre RETURN currently (very full|almost overflowing)\,
	send peer bath
	matchwait
	
FILL.BATH:
	gosub CHECK.BATH.LEVEL
	if ("%BathFull" = "YES") then return
FILL.BATH.2:
	pause .2 
	matchre FILL.BATH.2 ^\.\.\.wait|^Sorry
	matchre CHECK.BATH.LEVEL ^Roundtime\:|^You feel that your gods|you have completed this ritual too recently in the past\.
	matchre RETURN ^The pool is already too full\!
	send pour pot in pool
	matchwait
	
FILL.POT:
	pause .2
	matchre FILL.POT ^\.\.\.wait|^Sorry
	matchre CHECK.POT ^Roundtime\:|^But the stone pot is already full\! 
	send fill pot with stream
	matchwait
CHECK.POT:
	matchre BLESS.POT ^The stone pot is full of .* river water\.
	matchre FILL.BATH.2 holy water\.
	send look in pot
	matchwait
BLESS.POT:
	gosub PREP bless 5
	pause 5
	gosub CAST water in pot
	goto FILL.BATH.2
	
## Commune Stuff ##############################
COMMUNES:
	math CommuneCount add 1
	if ("%Communes(%CommuneCount)" = "") then return
	gosub COMMUNE.%Communes(%CommuneCount)
	goto COMMUNES
	
COMMUNE.TAMSINE:
	gosub GET %HolyReceptacle
	gosub SPRINKLE
	gosub FILL.RECEPTACLE
	gosub STOW my %HolyReceptacle
	matchre RETURN ^You feel warmth spread throughout your body\,|^You feel like you have completed this commune too recently\.
	send commune
	matchwait
	
COMMUNE.ELUNED:
	gosub FORAGE dirt
	matchre RETURN ^You grind some dirt in your fist\, allowing the particles to slowly sprinkle to the ground\.
	matchre DUMP.DIRT ^You stop as you realize that you have attempted a commune too recently in the past\.|^You feel like you have completed this commune too recently\.
	send commune eluned
	matchwait
	
## Misc Stuff #################################
CHECK.RECEPTACLE:
	pause .2
	matchre CHECK.RECEPTACLE ^\.\.\.wait|^Sorry
	matchre FILL.RECEPTACLE ^There is nothing in there\.
	matchre BLESS.RECEPTACLE you see some water\.
	matchre RETURN holy water\.
	send look in my %HolyReceptacle
	matchwait
	
DUMP.DIRT:
	pause .2
	send drop dirt
	waitforre ^You drop some dirt\.
	return
	
FILL.RECEPTACLE:
	pause .2
	matchre FILL.RECEPTACLE ^\.\.\.wait|^Sorry
	matchre BLESS.RECEPTACLE ^You fill .* with water\.
	send fill my %HolyReceptacle with my water in my backpack
	matchwait
BLESS.RECEPTACLE:
	gosub PREP bless 5
	gosub CAST water in %HolyReceptacle
	return
	
PLANT.SIRESE:
	pause .2
	put #goto ne gate
	waitfor YOU HAVE ARRIVED
	put #goto sirese
	waitfor YOU HAVE ARRIVED
	gosub GATHER.SIRESE
	gosub MOVE s
	send plant seed
	waitforre ^You carefully dig a hole and cover your seed gently\.
	gosub GET my %HolyReceptacle
	gosub CHECK.RECEPTACLE
	gosub SPRINKLE.ROOM
	gosub STOW my %HolyReceptacle
	return
GATHER.SIRESE:
	pause .2
	matchre GATHER.SIRESE ^\.\.\.wait|^Sorry|^You come up empty handed\.
	matchre RETURN ^You find a tiny sirese seed and carefully collect it\.
	send gather seed
	matchwait
	
PRAY.BADGE:
	pause .2
	gosub GET my pilgrim badge
	send pray my pilgrim badge
	waitforre \, you sense the eyes of the gods upon you\.|^Roundtime\:
	gosub STOW my pilgrim badge
	return
	
SPRINKLE:
	action echo ][ ERROR! Out of Holy Water or using wrong receptacle. when ^Sprinkle that\?  I don't think so\.
	matchre SPRINKLE ^\.\.\.wait|^Sorry
	matchre RETURN ^You sprinkle yourself with some holy water\.
	send sprinkle %HolyReceptacle on $charactername
	matchwait
SPRINKLE.ROOM:
	action echo ][ ERROR! Out of Holy Water or using wrong receptacle. when ^Sprinkle that\?  I don't think so\.
	matchre SPRINKLE.ROOM ^\.\.\.wait|^Sorry
	matchre RETURN ^You sprinkle some holy water over
	send sprinkle %HolyReceptacle on room
	matchwait
	
TITHE:
	pause .2
	put #goto almsbox
	waitfor YOU HAVE ARRIVED
	send put 5 silver kron in almsbox
	waitforre ^You feel that your gods have smiled upon you|you have completed this ritual too recently in the past\.
	return
	
TO.CHAPEL:
	put #goto crossing
	waitfor YOU HAVE ARRIVED
	put #goto chapel
	waitfor YOU HAVE ARRIVED
	return

## Re-supply Stuff ############################
CHECK.DEBT:
	pause .2 
	matchre PAY.DEBT Debt\:
	matchre RETURN Wealth\:
	send wealth
	matchwait
PAY.DEBT:
	pause .2
	return
	## You owe 1 silver, 9 bronze, and 8 copper Kronars to the Principality of Zoluren. (198 copper Kronars)
	
CHECK.SUPPLIES:
	pause .2 
	matchre CHECK.SUPPLIES ^\.\.\.wait|^Sorry
	matchre RESUPPLY ^Roundtime\:
	send inv list
	matchwait
	
RESUPPLY:
	pause .2
	put #goto teller
	waitfor YOU HAVE ARRIVED
	gosub CHECK.DEBT
	send withdraw 5 silver
	math BathTime add %HaveChamomile
	math BathTime add %HaveLavender
	math BathTime add %HaveSage
	if ((%BathTime < 2) || (%HaveWine = 0) || (%HaveIncense = 0)) then
	{
		echo ][ Going to buy supplies!
		if ("%Province" = "Crossing") then
		{
			send withdraw 4 silver
			pause 1
			put #goto brother
			waitfor YOU HAVE ARRIVED
			if ((%BathTime < 2) && (%HaveChamomile = 0)) then
			{
				send buy chamomile
				pause .2
				send offer 25
				gosub STOW my chamomile
				var HaveChamomile 1
			}
			if ((%BathTime < 2) && (%HaveLavender = 0)) then
			{
				send buy lavender
				pause .2
				send offer 25
				gosub STOW my lavender
				var HaveLavender 1
			}
			if (%HaveWine = 0) then
			{
				send buy wine
				pause .2
				send offer 250
				gosub STOW my wine
				var HaveWine 1
			}
			if (%HaveIncense = 0) then
			{
				send buy incense
				pause .2 
				send offer 62
				gosub stow my incense
				var HaveIncense 1
			}
			pause 1
		}
	}
	return