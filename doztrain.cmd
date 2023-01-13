#######################################################################
###
###			Script to AFK Train Yosto the Necro
###
###		Uses Custom Scripts to Loop through doing Random shit
###		Version .1
###
###  put #var <variable> {#evalmath (<number/variable> <function> <number/variable>)}  - Global Math
####


action goto fullpouch when is too full to fit any more gems
action goto fullpouch when You think the (.*) gem pouch is too full to fit another gem into
action goto fullpouch when You think the gem pouch is too full to fit another gem into
action put tie pou;stow $lefthandnoun when You've already got a wealth of gems in there
action goto HealNow when You're not in any condition to be stalking anyone
action (heals) goto HealNow when eval $health < 55
action (heals) goto HealNow when eval $bleeding > 0
action put quit when eval $health < 15


#debug 10
# Tresses
#	var MoveToMob boar|boar|257
#	var MoveToGemsFromHunt hib|hib|map150|gems
#	var HuntingToPawn hib|hib|37

# Black Leucs
#	var MoveToMob negate|leuc|9	
#	var MoveToGemsFromHunt ntr|cross|map150|gems
#	var HuntingToPawn ntr|277
#	var MoveToHealerFromHunting ntr|cross|map150|healer

# Quartz Gargs
	var MoveToMob fang|72
	var MoveToGemsFromHunt gems
	var HuntingToPawn exit|139|202
	var MoveToHealerFromHunting healer
	var ReStartLocation cross
	var HuntingToTown exit|139
	var MoveFromTownToBurge w gate|tiger|3
	var MoveFromTigerToPawn cross|cross|pawn
	var MoveToMagic 150
	var MoveFromHuntingToTown exit|139
	var MoveToOutsideBank 42

# Lang Swamps
#	var MoveToMob 71
#	var MoveToGemsFromHunt map150|gems
#	var HuntingToPawn 4
#	var MoveToHealerFromHunting map150|healer
#	var ReStartLocation elb
#	var HuntingToBurgle

	
var MoveToShard shard

var MoveToSprites 9|sprites|19
var MoveFromSprites ratha

var MoveToSilverLeucs nw gate|71
var MoveFromSilverLeucs ratha

var MoveToSerpents e gate|131
var MoveFromSerpents river


##Burgle Location

#var MoveToHealer map150|healer
#var MoveFromHealer exit|139
#var MoveToGems map150|gems
#var MoveToMagic 44

var TotalLoops 0
var WeHunting 0
counter set 0


if_1 goto %1

start:
timer clear
timer start

## Lets make sure we are in Ratha
# if $zoneid <> 90 then 
# {
#	send .ptravel rat
#	waitfor YOUHAVEARRIVED
#	pause 1
# }

	gosub MoveLooper MoveToMob
	setvariable WeHunting 1
	counter set 0
	send .dd
	waitfor HUNTINGISDONE
	send #script abort dd
	put she;stow $righthandnoun
	pause 1
	put rel ee
	setvariable 0

	pause .5
## Hunting is done, go pop boxes
	put ret;ret
	pause 3
	gosub MoveLooper MoveFromHuntingToTown
	counter set 0
	gosub MoveLooper MoveFromTownToBurge
	counter set 0
	
	setvariable WeHunting 0
	
# Go burgle in Tiger Clan (No Jailtime)

	send .doz remove
	waitfor ARMORDONE
	pause 2
	send .burgle
	waitfor BURGLECOMPLETE
	pause 3
	send .doz wear
	waitfor ARMORDONE
	pause 2

	pause 1
	gosub MoveLooper MoveFromTigerToPawn
	counter set 0

## Sell the Item
	put sell $righthandnoun;sell $lefthandnoun
	pause 1
	put empty left;empty right
	pause 1
	
#Time to head to TGS to do some Gatherin and Magics
	gosub MoveLooper MoveToMagic
	counter set 0
	
GatheringSub:	
## Lets do some Gathering for Outdoors EXP	
	send .rocks
	waitfor GATHERINGDONE
	pause .5

## Finished burgling  Time to do Magic!
BoxPoppinRoutine:
	send .summon
	waitfor MagicTrainComplete
	put #var powerwalk 1
	
## Go do a Raven Run (App/Scholarship)
GoingToCrossing:
#	send .ptravel cro
#	waitfor DonePortalhax
#	pause 1
## We in Crossing, run the Raven!
	send .raven
	waitfor RAVENDONE
	
## Do a Climbing Run
	gosub MoveLooper MoveToOutsideBank
	counter set 0

	send .cc
	waitfor CLIMBINGDONE
	

## Lets backtrain!	Heading to Sprites
	put #var powerwalk 1
	send .ptravel river
	waitfor DonePortalhax
	gosub MoveLooper MoveToSerpents
	counter set 0

## BackTraining
	## DD Paran 1 = BackTrain, Param 2 = Only once
	send .dd Yes Yes
	waitfor HUNTINGISDONE
	pause 1
	put rel ee
	put wear right;stow right
	gosub MoveLooper MoveFromSerpents
	counter set 0
	pause 1

HealerSub:
## Go to the AutoHealer
	gosub MoveLooper MoveToHealer
	counter set 0
	pause 1
WeAtHealer:
	put join list;sit
	waitfor Yrisa crosses Doz's name from the list.
	action (heals) on

	
#
# Lets Deposit all our moneys
#
	send .fbank
	waitfor BANKINGDONG
	pause 1

	
## Go back outside of Fang and restart
	gosub MoveLooper MoveFromHealer
	counter set 0
	pause .5

	
## Head  back to restart
	send .ptravel %ReStartLocation
	waitfor DonePortalhax

LooperInfo:
	goto start



MoveLooper:
setvariable Mover %$1
MoveLooper1:
	eval item element("%Mover", %c)  
    eval number count("%Mover", "|")  
    if %c > %number then return
	send #goto %item
	match MoveLooperFail MOVE FAILED
	match MoveContinue YOUHAVEARRIVED
	matchwait
MoveContinue:
	counter add 1
MoveLooperFail:
	goto MoveLooper1
	
	
fullpouch:
	put #script abort dd
	pause .5
	put put $righthandnoun in haver;put $lefthandnoun in haver
	counter set 0
	if %WeHunting == 1 then gosub MoveLooper MoveToGemsFromHunt
	else gosub MoveLooper MoveToGems
	## We at the Gemsmith, remove pouch, put it in our water sack and get a new one
	put rem pou;put pou in backp
	pause .5
	put ask wick for pouch;ask gems for pouch;wear pou
	pause .5
	counter set 0
	gosub MoveLooper MoveFromHealer
	goto BoxPoppinRoutine
	
HealNow:
	action (heals) off
	put #script abort dd
	pause .5
	counter set 0
	if %WeHunting == 1 then gosub MoveLooper MoveToHealerFromHunting
	counter set 0
	pause .5	
	goto WeAtHealer