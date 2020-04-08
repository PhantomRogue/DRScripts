var hum $hum
action goto WTF.WAIT when All this climbing back and forth is getting a bit tiresome

CRO.CLIMB:
if $Climbing.LearningRate >= 29 then goto QUIT
counter set 0

CLIMB.EXP:
	if $Climbing.LearningRate > 27 then goto QUIT
	else
	goto CLIMB

CLIMB:
startclimb:
#This Script created by the player of Kraelyst
#Climb Crossing Walls
#debuglevel 5
counter add 1
ECHO
ECHO *** STARTING CLIMBING SESSION %c ***
ECHO
pause 0.1
put set roomname
wait
put hum %hum
pause 0.5
CLIMBGO:
	gosub move NORTHWEST
	gosub move NORTH
	gosub move NORTH
	gosub move NORTH
	gosub move NORTH
	gosub move NORTH
	gosub move NORTH
	gosub move EAST
	gosub move EAST
	gosub move NORTH
	gosub move EAST
	gosub move EAST
	gosub move NORTH
	gosub move NORTH
	gosub move EAST
	gosub move go stair
	gosub move SOUTH

CLIMB-001:
SAVE FAIL-001
	if ($stamina < 70) then gosub FATIGUE_WAIT
		matchre CLIMB-001 /\.\.\.wait|type ahead/i
		match PASS-001 [Outside East Wall, Footpath]
		matchre FAIL-001 This climb is|You finish practicing|You must be standing|steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|A wave of dizziness hits you|Struck by vertigo
		match FALLEN slip after a few feet
	put climb break
	matchwait

PASS-001:
pause 0.2
put hum %hum
wait
gosub move NORTH
gosub move go gate
gosub move WEST
gosub move go stair
gosub move SOUTH
goto CLIMB-002

FAIL-001:
pause 0.5
goto CLIMB-002

CLIMB-002:
SAVE FAIL-002
	if ($stamina < 70) then gosub FATIGUE_WAIT
		matchre CLIMB-002 /\.\.\.wait|type ahead/i
		match PASS-002 [Northeast Wilds, Outside Northeast Gate]
		matchre FAIL-002 This climb is|You finish practicing|You must be standing|steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|A wave of dizziness hits you|Struck by vertigo
		match FALLEN slip after a few feet
	put climb embrasure
	matchwait

FAIL-002:
	pause 0.1
	gosub move n
	gosub move go stair
	gosub move e
	gosub move go gate
PASS-002:
	gosub move go footpath
	goto CLIMB-01

CLIMB-01:
if $Climbing.LearningRate > 33 then goto endearly
	if ($stamina < 60) then gosub FATIGUE_WAIT
	SAVE FAIL-01
		matchre CLIMB-01 /\.\.\.wait|type ahead/i
		match PASS-01 [Crossing,
		matchre FAIL-01 You must be standing|steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|A wave of dizziness hits you|Struck by vertigo
		match FALLEN slip after a few feet
	put app wall quick
	pause
	pause
	put climb wall
	matchwait

PASS-01:
	gosub move n
	gosub move go stair
	gosub move e
	gosub move go gate
	gosub move go footpath
	goto FAIL-01

FAIL-01:
	gosub move s
	gosub move down
	gosub move s
	gosub move s
	gosub move sw
	goto CLIMB-02

CLIMB-02:
if $Climbing.LearningRate > 33 then goto endearly
	if ($stamina < 60) then gosub FATIGUE_WAIT
	SAVE FAIL-02
		matchre RETREAT You are engaged|You cannot
		matchre CLIMB-02 /\.\.\.wait|type ahead/i
		match PASS-02 [Crossing,
		matchre FAIL-02 You must be standing|steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|A wave of dizziness hits you|Struck by vertigo
		match FALLEN slip after a few feet
	put climb wall
	matchwait

PASS-02:
	gosub move s
	gosub move go stair
	gosub move go gate
	gosub move go bush
	gosub move n
	goto CLIMB-03

FAIL-02:
	gosub move s
	goto CLIMB-03

CLIMB-03:
if $Climbing.LearningRate > 33 then goto endearly
	if ($stamina < 60) then gosub FATIGUE_WAIT
	SAVE FAIL-03
		matchre RETREAT You are engaged|You cannot
		matchre CLIMB-03 /\.\.\.wait|type ahead/i
		match PASS-041 [Crossing, East Wall Battlements]
		match PASS-03 [Crossing,
		matchre FAIL-03 You continue|This climb is|You finish practicing|You must be standing|steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|A wave of dizziness hits you|Struck by vertigo
		match FALLEN slip after a few feet	
	put climb wall
	matchwait

PASS-03:
	gosub stand
	gosub move s
	gosub move go stair
	gosub move go gate
	goto CLIMB-04

FAIL-03:
	gosub move s
	goto CLIMB-04

CLIMB-04:
if $Climbing.LearningRate > 33 then goto endearly
	if ($stamina < 60) then gosub FATIGUE_WAIT
	SAVE FAIL-04
		matchre RETREAT You are engaged|You cannot
		matchre CLIMB-04 /\.\.\.wait|type ahead/i
		matchre FAIL-04 You finish|You must be standing|steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|A wave of dizziness hits you|Struck by vertigo
		matchre PASS-041 [Crossing, East Gate Battlements]
		matchre PASS-04 [Crossing, East Gate Battlements]
		match FALLEN slip after a few feet
	put climb wall
	matchwait

PASS-041:
	gosub move s
	goto CLIMB-05

PASS-04:
	goto CLIMB-05

FAIL-04:
	gosub move s
	gosub move go gate
	gosub move go stair
	goto CLIMB-05

CLIMB-05:
if $Climbing.LearningRate > 33 then goto endearly
if ($stamina < 50) then gosub FATIGUE_WAIT
SAVE FAIL-05
match PASS-05 [Eastern Tier, Outside Gate]
match PASS-052 [Outside East Wall, Footpath]
matchre FAIL-05 You must be standing|steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|A wave of dizziness hits you|Struck by vertigo
match FALLEN slip after a few feet
put climb embrasure
matchwait

PASS-052:
gosub move s
gosub move s

PASS-05:
gosub move go gate
gosub move go stair
FAIL-05:
gosub move n
goto CLIMB-06

CLIMB-06:
if $Climbing.LearningRate > 33 then goto endearly
	if ($stamina < 50) then gosub FATIGUE_WAIT
	SAVE FAIL-06
		matchre RETREAT You are engaged|You cannot
		matchre CLIMB-06 /\.\.\.wait|type ahead/i
		match PASS-06 [Outside East Wall, Footpath]
		matchre FAIL-06 You must be standing|steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|A wave of dizziness hits you|Struck by vertigo
		match FALLEN slip after a few feet
	put climb break
	matchwait

PASS-06:
	gosub move s
	gosub move go gate
	gosub move go stair
	gosub move n
	goto CLIMB-07

FAIL-06:
	goto CLIMB-07

CLIMB-07:
if $Climbing.LearningRate > 33 then goto endearly
	if ($stamina < 50) then gosub FATIGUE_WAIT
	SAVE FAIL-07
		matchre RETREAT You are engraged|You cannot
		matchre CLIMB-07 /\.\.\.wait|type ahead/i
		match PASS-07 [Outside East Wall, Footpath]
		matchre FAIL-07 You must be standing|steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|A wave of dizziness hits you|Struck by vertigo
		match FALLEN slip after a few feet
	put app emb quick
	pause
	pause
	put climb embrasure
	matchwait

PASS-07:
	gosub move s
	gosub move s
	gosub move go gate
	goto TRAVEL-08

FAIL-07:
	gosub move s
	gosub move go stair
	goto TRAVEL-08

TRAVEL-08:
	put hum %hum
	wait
	gosub move w
	gosub move w
	gosub move w
	gosub move w

	gosub move nw
	gosub move n
	gosub move n
	gosub move n
	gosub move n
	gosub move n
	gosub move n
	gosub move w
	gosub move w
	gosub move w
	gosub move w
	gosub move go bridge
	gosub move w
	gosub move w
	gosub move w
	gosub move w
	gosub move go stair
	gosub move s

CLIMB-08:
if $Climbing.LearningRate > 33 then goto endearly
	if ($stamina < 50) then gosub FATIGUE_WAIT
	SAVE FAIL-08
		matchre RETREAT You are engaged|You cannot
		matchre CLIMB-08 /\.\.\.wait|type ahead/i
		match PASS-08 [Mycthengelde, Flatlands]
		matchre FAIL-08 You must be standing|steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|A wave of dizziness hits you|Struck by vertigo
		match FALLEN slip after a few feet
	put climb embrasure
	matchwait

PASS-08:
	goto CLIMB-09

FAIL-08:
	gosub move n
	gosub move go stair
	gosub move go gate
	gosub move nw
	goto CLIMB-09

CLIMB-09:
if $Climbing.LearningRate > 33 then goto endearly
	if ($stamina < 50) then gosub FATIGUE_WAIT
	SAVE FAIL-09
		matchre RETREAT You are engaged|You cannot
		matchre CLIMB-09 /\.\.\.wait|type ahead/i
		match PASS-09 [Crossing, West Wall Battlements]
		matchre FAIL-09 You must be standing|steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|A wave of dizziness hits you|Struck by vertigo
		match FALLEN slip after a few feet
	put climb wall
	matchwait

PASS-09:
	gosub move n
	goto CLIMB-10

FAIL-09:
	gosub move se
	gosub move go gate
	gosub move go stair
	goto CLIMB-10

CLIMB-10:
if $Climbing.LearningRate > 33 then goto endearly
	if ($stamina < 50) then gosub FATIGUE_WAIT
	SAVE FAIL-10
		matchre RETREAT You are engaged|You cannot
		matchre CLIMB-10 /\.\.\.wait|type ahead/i
		match PASS-10 [Mycthengelde, Flatlands]
		matchre FAIL-10 You must be standing|steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|A wave of dizziness hits you|Struck by vertigo
		match FALLEN slip after a few feet
	put climb embrasure
	matchwait

PASS-10:
	gosub move go gate
	gosub move go stair
	FAIL-10:
	gosub move e
	goto CLIMB-11

CLIMB-11:
if $Climbing.LearningRate > 33 then goto endearly
	if ($stamina < 50) then gosub FATIGUE_WAIT
	SAVE FAIL-11
		matchre RETREAT You are engaged|You cannot	
		matchre CLIMB-11 /\.\.\.wait|type ahead/i
		match PASS-11 [Northwall Trail, Wooded Grove]
		matchre FAIL-11 You must be standing|steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|A wave of dizziness hits you|Struck by vertigo
		match FALLEN slip after a few feet
	put climb break
	matchwait

PASS-11:
	gosub move s
	gosub move go gate
	gosub move go stair
	gosub move e
	goto CLIMB-12

FAIL-11:
	pause
	goto CLIMB-12

CLIMB-12:
if $Climbing.LearningRate > 33 then goto endearly
	if ($stamina < 50) then gosub FATIGUE_WAIT
	SAVE FAIL-12
		matchre RETREAT You are engaged|You cannot
		matchre CLIMB-12 /\.\.\.wait|type ahead/i
		match PASS-12 [Northwall Trail, Wooded Grove]
		matchre FAIL-12 You must be standing|steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|A wave of dizziness hits you|Struck by vertigo
		match FALLEN slip after a few feet	
	put climb embrasure
	matchwait

PASS-12:
	goto CLIMB-13

FAIL-12:
	gosub move w
	gosub move go stair
	gosub move go gate
	gosub move go trail
	gosub move ne
	goto CLIMB-13

CLIMB-13:
if $Climbing.LearningRate > 33 then goto endearly
	if ($stamina < 50) then gosub FATIGUE_WAIT
	SAVE FAIL-13
		matchre RETREAT You are engaged|You cannot
		matchre CLIMB-13 /\.\.\.wait|type ahead/i
		match PASS-13 [Crossing, North Wall Battlements]
		matchre FAIL-13 You must be standing|steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|A wave of dizziness hits you|Struck by vertigo
		match FALLEN slip after a few feet
	put climb wall
	matchwait

PASS-13:
	gosub move w
	gosub move go stair
	gosub move go gate
	gosub move go trail
	goto CLIMB-14

FAIL-13:
	gosub move sw
	goto CLIMB-14

CLIMB-14:
if $Climbing.LearningRate > 33 then goto endearly
	if ($stamina < 50) then gosub FATIGUE_WAIT
	SAVE FAIL-14
		matchre RETREAT You are engaged|You cannot
		matchre CLIMB-14 /\.\.\.wait|type ahead/i
		match PASS-14 [Crossing, North Wall Battlements]
		matchre FAIL-14 You must be standing|steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|A wave of dizziness hits you|Struck by vertigo
		match FALLEN slip after a few feet
	put climb wall
	matchwait

PASS-14:
	gosub move w
	gosub move go stair
	gosub move go gate
	goto CLIMB-15

FAIL-14:
	gosub move s
	goto CLIMB-15

CLIMB-15:
if $Climbing.LearningRate > 33 then goto endearly
	if ($stamina < 50) then gosub FATIGUE_WAIT
	SAVE FAIL-15
		matchre RETREAT You are engaged|You cannot
		matchre CLIMB-15 /\.\.\.wait|type ahead/i
		match PASS-15 [Crossing, West Gate Battlements]
		matchre FAIL-15 You must be standing|steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|A wave of dizziness hits you|Struck by vertigo
		match FALLEN slip after a few feet
	put climb wall
	matchwait

PASS-15:
	gosub move go stair
	goto TRAVEL-15

FAIL-15:
	gosub move go gate
	goto TRAVEL-15

TRAVEL-15:
pause 0.5
gosub move e
gosub move e
gosub move e
gosub move e
gosub move e
gosub move e
gosub move e
gosub move e
gosub move e
gosub move s
gosub move s
gosub move s
gosub move s
gosub move s
gosub move s
gosub move se
goto CLIMB.EXP

WTF.WAIT:
echo
echo *** YOU ARE GOING TOO FAST!
echo *** ADD A FEW APPRAISALS IN TO BREAK UP YOUR CLIMBING
echo 
pause 6
goto %s

FATIGUE_WAIT:
echo
echo *** PAUSING TO RESTORE FATIGUE... ***
echo
	if ($stamina >= 95) then return
	pause 5
	goto FATIGUE_WAIT
	
#======================
 
stand:
	if $standing = 0 then put stand
	if $standing = 0 then put dance
	return

FALLEN:
	pause
		matchre STOOD You stand|You are already standing
		matchre FALLEN cannot manage to stand|The weight of all your possessions
		matchre FALLEN ^\.\.\.wait|^Sorry, you may only type
	put stand
	matchwait

STOOD:
	goto %s

QUIT:
	echo 
	echo *** DONE! ***
	echo
	pause 0.5
	echo
	echo
	put #echo >Log Lime *** Climbed Xing walls %c times to $Climbing.LearningRate / 34***
	pause 
	put #parse DONE CLIMBING
	put #parse CLIMBING DONE
	put #parse CLIMBING LOCKED
	pause 0.5
	put glance
    exit

RETREAT:
put ret
put ret
pause
goto %S

RETURN:
pause 0.1
RETURN

move:
 var move.direction $0
 moving:
 matchre stand.then.move ^You must be standing to do that\.|^You can't do that while lying down\.|^Stand up first\.
 matchre pause.then.move %retry.command.triggers
 matchre retreat.from.melee.then.move ^You are engaged to .+ melee range\!|^You try to move, but you're engaged\.
 matchre retreat.from.pole.then.move ^You are engaged to .+ at pole weapon range\!|^While in combat\?  You'll have better luck if you first retreat\.
 matchre move.return ^Obvious
 matchre move.error ^You can't go there\.|^You can't swim in that direction\.
 put %move.direction
 matchwait
 stand.then.move:
 gosub stand
 goto moving
 pause.then.move:
 pause .2
 goto moving
 retreat.from.melee.then.move:
 put retreat
 retreat.from.pole.then.move:
 gosub stand
 put retreat
 goto moving
 move.error:
 echo * Bad move direction, will try next command in 1 second. *
 put .alert
 pause
 return
 move.return:
 return
 
 endearly:
 pause 1
 if $zoneid = 1 then
 {
 goto quit
 }
 if $zoneid = 8 then
 {
 put #goto 43
 waitfor YOU HAVE ARRIVED
 goto quit
 }
 if $zoneid = 6 then
 {
 put #goto 116
 waitfor YOU HAVE ARRIVED
 put #goto 15
 waitfor YOU HAVE ARRIVED
 goto quit
 }
 if $zoneid = 4 then
 {
 put #goto 15
 waitfor YOU HAVE ARRIVED
 goto quit
 }
 if $zoneid = 3 then
 {
 put #goto 15
 waitfor YOU HAVE ARRIVED
 goto quit
 }
 goto quit