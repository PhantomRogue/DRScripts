#######################################################################
###
###			Script to AFK Train Yosto the Necro
###
###		Uses Custom Scripts to Loop through doing Random shit
###		Version .1
###
###  put #var <variable> {#evalmath (<number/variable> <function> <number/variable>)}  - Global Math
####


action exit when eval $health < 45
action goto fullpouch when is too full to fit any more gems
action goto fullpouch when You think the (.*) gem pouch is too full to fit another gem into
action put tie pou when You've already got a wealth of gems in there
action goto HealNow when You're not in any condition to be stalking anyone

debug 10
var MoveToMob w gate|234
var MoveFromHuntToTown crossing
var MoveFromCrossingToTiger west|tiger|3
var MoveFromTigerToPawn crossing|crossing|pawn
var MoveToGemsFromHunt gems
var HuntingToPawn exit|139|pawn
var MoveToHealer 652|healer
var MoveFromHealer exit|139
var MoveToGems portal|375|gems
var MoveToMagic rakash|23
var MoveToEngineering engineer
var MoveToBard 470
var MoveToNEGate negate
var MoveToBardFromNEGate cross|470
	
	
var TotalLoops 0
var WeHunting 0
counter set 0


pause 1
## Start in  Lang
if_1 goto %1

start:
timer clear
timer start

	gosub MoveLooper MoveToMob
	setvariable WeHunting 1
	counter set 0
	send .hixin
	waitfor HUNTINGISDONE
	
HuntingIsDone:	
	send #script abort hixin
	put she;stow right
	setvariable 0

	pause .5
## Hunting is done, go pop boxes
	put ret;ret
	pause 3

	gosub MoveLooper MoveFromHuntToTown
	counter set 0
	
	gosub MoveLooper MoveFromCrossingToTiger
	counter set 0
	
# Go outside to burgle
	send .hix remove
	waitfor ARMORDONE
	pause 2
	send .burgle
	waitfor BURGLECOMPLETE
	pause 3
	send .hix wear
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

## Lets do an Work Order
	#gosub MoveLooper MoveToEngineering
	#counter set 0
	#pause 1
	#send .mastercraft
	#waitfor MASTERCRAFT DONE
	#pause 1	
	
Pawn:	
## Back to Lang
	#send .ptravel elb
	#waitfor DonePortalhax
	#pause 1
	
GatheringSub:	
## Lets do some Gathering for Outdoors EXP	
	gosub MoveLooper MoveToNEGate
	counter set 0
	
	send .rocks
	waitfor GATHERINGDONE
	pause .5
	
## Finished burgling  Time to do Performance!
BoxPoppinRoutine:
	gosub MoveLooper MoveToBardFromNEGate
	counter set 0
	
	send .play cast
	waitfor PERFORMANCEDONE
	
## Go do a Raven Run (App/Scholarship)
GoingToCrossing:
## We in Crossing, run the Raven!
	send .raven
	waitfor RAVENDONE

	HealerSub:
## Go to the AutoHealer
	gosub MoveLooper MoveToHealer
	counter set 0
	pause 1
	put join list;sit
	waitfor Yrisa crosses Hixin's name from the list.

	
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


LooperInfo:
	goto start



MoveLooper:
setvariable Mover %$1
MoveLooper1:
	eval item element("%Mover", %c)  
    eval number count("%Mover", "|")  
    if %c > %number then return
	send #goto %item
	waitfor YOUHAVEARRIVED
	counter add 1
	goto MoveLooper1
	
	
fullpouch:
	put #script abort vak;#script abort newdisarm
	pause .5
	put put $righthandnoun in backpack;put $lefthandnoun in backpack
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
	put #script abort yosto;#script abort newdisarm
	pause .5
	put stow right;stow left
	counter set 0
	put ret;ret
	pause .5
	goto HealerSub