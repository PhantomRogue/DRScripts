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

#  Loops through Magics, then Hunts, then does an Engineering Work Order
	counter set 0
#goto MoveLooper

start:
send #goto cleric
waitfor YOU HAVE ARRIVED
echo Time to Work your Magics!  Using Research
	send .research
	waitfor DONERESEARCH
echo 
echo Going to work on an Work Order, Engineering
echo 
send #goto Engineering
waitfor YOU HAVE ARRIVED
echo 
echo Doing a Work Order
echo 
send .mastercraft 2
waitfor MASTERCRAFT DONE
echo 
echo MasterCraft completed!  Lets try to hunt.  In order to hunt, you need to setup the Movement Variables
echo 
gosub MoveLooper MoveToHunt
send .1hunter 1 yes Hint




MoveLooper:
	eval item element("%MoveToHunt", %c)  
    eval number count("%MoveToHunt", "|%item")  
    if %c > %number then return
	send #goto %item
	waitfor YOU HAVE ARRIVED
	counter add 1
	goto MoveLooper