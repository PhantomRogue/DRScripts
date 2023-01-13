#######################################################################
###
###			Gets Fir Talisman
###		Start in Crossing


action goto fullpouch when is too full to fit any more gems
action goto fullpouch when You think the (.*) gem pouch is too full to fit another gem into
action goto fullpouch when You think the gem pouch is too full to fit another gem into
action put tie pou;stow $lefthandnoun when You've already got a wealth of gems in there
action goto HealNow when You're not in any condition to be stalking anyone
action (heals) goto HealNow when eval $health < 55
action (heals) goto HealNow when eval $bleeding > 0
action put quit when eval $health < 15


# Quartz Gargs
	var MoveToMob fang|72

var MoveToSerpents e gate|131
var MoveFromSerpents river
var MoveToWall N gate|228

##Burgle Location

var MoveToFir negate|271
var MoveToCross crossing
var MoveToShard shard



var TotalLoops 0
var WeHunting 0
counter set 0


start:
timer clear
timer start

	
	gosub MoveLooper MoveToFir
	counter set 0
# Get Bark
bark:
	put pull tree
	pause 1
	if $righthandnoun == "bark" then goto gotbark
	else goto bark
gotbark:	
	gosub MoveLooper MoveToCross
	counter set 0	
	
	send .ptravel sha
	waitfor DonePortalhax
#	pause 1

## go to the wall
	gosub MoveLooper MoveToWall
	counter set 0
##Get Talisman
	put stow right;stow left
	pause .5
	put put RIGHT HAND IN FIRST HOLE
	put get fir bark
	pause 1
	 put PUT LEFT HAND IN SECOND HOLE
	 put stow bark
	 pause 1
	 put get water
	 put swap
	 pause 1
	 put put right hand in third hole
	 pause .5
	 put west
	 put go stair
	 pause .5
	 put stow right;stow left
	 pause .5
	 put get bark
	 put give bark to man
	 pause .5
	 gosub MoveLooper MoveToShard
	 counter set 0
	 send .ptravel cro
	 waitfor DonePortalhax









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