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
var MoveToMob Rakash|149
var MoveToGemsFromHunt lang|portal|375|gems
var HuntingToPawn lang|pawn
var MoveToHealer portal|375|healer
var MoveFromHealer exit|139
var MoveToGems portal|375|gems
var MoveToMagic rakash|17
var TotalLoops 0
var WeHunting 0
counter set 0


pause 1

start:
timer clear
timer start

	gosub MoveLooper MoveToMob
	setvariable WeHunting 1
	counter set 0
	send .lewix
	waitfor HUNTINGISDONE
	send #script abort lewix
	put she
	setvariable 0

	pause .5
## Hunting is done, go pop boxes
	put ret;ret
	pause 3
	gosub MoveLooper HuntingToPawn
	counter set 0
	
# Go outside to burgle
	put out;tie blue pou
	pause 2
	send .burgle
	waitfor BURGLECOMPLETE


## Sell the Item
	put go pawn;sell $lefthandnoun
	pause 1
	put empty left;out
	pause 1
	
GatheringSub:	
## Lets do some Gathering for Outdoors EXP	
	send .rocks
	waitfor GATHERINGDONE
	pause .5

## Finished burgling  Time to do Magic!
BoxPoppinRoutine:
	send .cleric
	waitfor MagicTrainComplete
	
## Go do a Raven Run (App/Scholarship)
GoingToCrossing:
	put #goto lang
	waitfor YOUHAVEARRIVED
	send .ptravel cro
	waitfor DonePortalhax
	pause 1
## We in Crossing, run the Raven!
	send .raven
	waitfor RAVENDONE
	send .ptravel elb
	waitfor DonePortalhax
#	gosub MoveLooper MoveToGems

HealerSub:
## Go to the AutoHealer
	gosub MoveLooper MoveToHealer
	counter set 0
	pause 1
	put join list;sit
	waitfor Yrisa crosses Yosto's name from the list.

	
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