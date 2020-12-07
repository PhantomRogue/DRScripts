#######################################################################
###
###			Cleric Master Script
###
###		Uses Custom Scripts to Loop through doing Cleric Training
###		Version .1
###
###

#debug 10
var MoveToHunt e gate|131
var MoveToCity river|cleric
var MoveToHealer portal|healer

var MoveToMagics cleric
var MoveToEngineer engineer

var MoveToHealer portal|445|healer
var MoveFromHealer exit|139
var MoveToGems portal|445|gems
var MoveToMagic 44

var MovetoCrossBank teller

#  Loops through Magics, then Hunts, then does an Engineering Work Order
	counter set 0

echo
echo  MUST START INSIDE RIVERHAVEN
echo	
	
start:

## Starting with hunting
	
HUNTING:
	gosub MoveLooper MoveToHunt
	send .hintoc
	waitfor HUNTINGISDONE
	send #script abort hintoc
	put she;stow $righthandnoun
	pause 1
	setvariable 0
	pause .5
	
## Hunting is done, Lets do all of our other shit
	put ret;ret
	pause 3
	gosub MoveLooper MoveToCity
	counter set 0


## Doing Magic
	gosub MoveLooper MoveToMagics
	counter set 0
	send .cleric
	waitfor MagicTrainComplete

## Lets collect some rocks
	send .rocks
	waitfor GATHERINGDONE
	pause .5

## Doing some Engineering work orders
	gosub MoveLooper MoveToEngineer
	counter set 0
	pause 1
	send .mastercraft 2
	waitfor MASTERCRAFT DONE

## Lets deposit any money made from Doing Work Orders and get some healing
HealerSub:
## Go to the AutoHealer
	gosub MoveLooper MoveToHealer
	counter set 0
	pause 1
	put join list;sit
	waitfor Yrisa crosses Hintoc's name from the list.

#
# Lets Deposit all our moneys
#
	send .fbank
	waitfor BANKINGDONG
	pause 1	

## Heading outside	
	gosub MoveLooper MoveFromHealer
	counter set 0
	pause .5
	
## We back outside Fang, lets do some Cleric Stuff and run the Raven
	
## Go do a Raven Run (App/Scholarship)
GoingToCrossing:
	send .ptravel cro
	waitfor DonePortalhax
	pause 1

	## We in Crossing, run the Raven!
	send .raven
	waitfor RAVENDONE
	
## Raven is Done, lets get some money from the bank and do some Theurgy/Rituals
	gosub MoveLooper MovetoCrossBank
	counter set 0
	put with 800 kronar
	pause 1
	send .crosscomm
	waitfor COMMUNEDONE
	
## We completed a run!  Lets head back to Riverhaven and hunt some more
	send .ptravel river
	waitfor DonePortalhax
	pause 1

goto start

MoveLooper:
	eval item element("%MoveToHunt", %c)  
    eval number count("%MoveToHunt", "|%item")  
    if %c > %number then return
	send #goto %item
	waitfor YOU HAVE ARRIVED
	counter add 1
	goto MoveLooper