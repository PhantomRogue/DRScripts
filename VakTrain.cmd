#######################################################################
###
###			Script to do Vakky Things
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
action quit when "Stop right there!"  The shout reverberates through the area as the guardsman charges towards you.  "You're under arrest!"

debug 10
var MoveToMob rossm|138
var MoveToGemsFromHunt lang|portal|375|gems
var GiantsToPawn lang|pawn
var MoveToHealer portal|375|healer
var MoveFromHealer exit|139
var MoveToGems portal|375|gems
var TotalLoops 0
var WeHunting 0
counter set 0


echo
echo Start anywhere in Lang/Theren area
echo
pause 1

start:
timer clear
timer start

	gosub MoveLooper MoveToMob
	setvariable WeHunting 1
	counter set 0
	send .vak YES
	waitfor HUNTINGISDONE
	send #script abort vak
	put she
	setvariable 0

	pause .5
## Hunting is done, go pop boxes
	put ret;ret
	pause 3
	gosub MoveLooper GiantsToPawn
	counter set 0
	
# Go outside to burgle
	put out;tie indi pou
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

## Finished burgling  Time to pop boxes
BoxPoppinRoutine:
	send .newdisarm
	match GoGetHealed YOUBLEWIT
	match MoveToArmor BOXESAREPOPPED
	matchwait

MoveToArmor:
## Put armor back on
	send .ved wear
	pause 8
	counter set 0
	GoGetHealed:
	pause 1


HealerSub:
## Go to the AutoHealer
	gosub MoveLooper MoveToHealer
	counter set 0
	pause 1
	put join list;sit
	waitfor Yrisa crosses Vakroth's name from the list.

	
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
	var EndTimer %t
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
	put rem pou;put pou in wa sa
	pause .5
	put ask wick for pouch;ask gems for pouch;wear pou
	pause .5
	counter set 0
	gosub MoveLooper MoveFromHealer
	goto BoxPoppinRoutine
	
HealNow:
	put #script abort vak;#script abort newdisarm
	pause .5
	put stow right;stow left
	counter set 0
	put ret;ret
	pause .5
	goto HealerSub