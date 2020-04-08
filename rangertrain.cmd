if_2 goto %2
if_1 goto rmscout



match rmscout Outside Northeast Gate
match instructions Obvious paths:
put look
matchwait

rmSCOUT:

match rmtrack1 Guild: Ranger
match rmnegtobank2 Coins:
put info
matchwait


rmtrack1:
match scouttracking 
match rmtrack0 Scouting:
put exp survival 44
matchwait

scouttracking:

move north
move north
move north
move northeast
move northeast
move north
move northwest
move northwest
move north
move north
move northeast
move northwest
move north
move north
move east
move down
move down

trackLook:  

match trackscare a scarecrow
match not down.
match atgate up.
match atgate2 north.
match check east.
match check east,
match check west.
put look
matchwait


check:   
match trackscare a scarecrow
match not down.
match check1 east.
match check1 east,
match check2 west.
put look
matchwait

check1:   
pause
match trackscare a scarecrow
match check1 east.
match check1 east,
match check2 west.
match check2 You can't go there.
put east
put look
matchwait

check2:   
pause
match trackscare a scarecrow
match check1 east.
match check2 east,
match check2 west.
match check1 You can't go there.
put west
put look
matchwait

track1:   
nextroom

trackscare:   
match trackcheck You refocus on
match trackcheck You determine to track
match check what were you
put track scarecrow
matchwait

trackcheck:  
match trackcheck3 east.
match trackcheck2 east,
match trackcheck1 west.
put look
matchwait

trackcheck1:   
move west

trackcheck2:  
move west

trackcheck3:   
move go path
move west
move south
move south
move go gate
move up
move up
goto tracking

again:   


Tracking:  
match not But you are not tracking anything
match again You are unable
match again lose
match tracked You pick up
match tracking ...wait
put track
matchwait

tracked:   

match again Unable to find
match track1 As your journey ends
goto trackexpcheck

not:  
pause
move down
move down

atgate:   
move go gate

atgate2:  

move north
move north
move east
move go path
goto check

trackExpcheck:  

match trackdone bewildering
match trackdone bewildered
match trackdone mind lock
match trackdone dazed
match tracklook deaths
put skill scouting
matchwait

trackDone:
match trackdone1 A modwyn vine arbor
match trackdone2 A large section of the garden
match trackdone2 A section of the plot has
match trackdone3 Row upon row of cabbages,
put look
matchwait


trackdone1:
move west
goto trackdone

trackdone2:
move west
goto trackdone

trackdone3:
move go path
move south
move west
move south
move go gate
move up
move up
move west
move south
move south
move southeast
move southwest
move south
move south
move southeast
move southeast
move south
move southwest
move southwest
move south
move south
move south
goto rmnegtobank

rmTRACK0:
move n
rmTRACK:
put scout trail
waitfor roundtime
pause
	match rmNEGATE Obvious paths: northeast, south.
	match rmTROLL Obvious paths: southwest.
	match rmLAVA Obvious paths: northeast, west.
	match rmGRASS Obvious paths: north, south.
put go trail
	matchwait
 
 
rmNEGATE:
move s
move s
	match rmnegtobank % daze
	match rmnegtobank % bewild
	match rmnegtobank % mind lock
	match rmTRACK EXP HELP
put skill scouting
	matchwait


rmTROLL:
move go gate
move n
move ne
move go gate
goto rmtrack

rmLAVA:
move ne
move w
move nw
move sw
move w
goto rmtrack

rmGRASS:
move n
move n
goto rmtrack


rmnegtobank:

move s
rmnegtobank2:
put go gate
move w
move w
move s
move s
move w
move w
move s
move w
move w
move s
move s
move s
move s
move s
move s
move se
goto rmclimbexp

rmclimbexp:

put skill climb
match climb EXP HELP
match quit mind lock
match quit dazed
match quit bewilder
matchwait


CLIMB:
pause
move NoRTHWEST
move NoRTH
move NoRTH
move NoRTH
move NoRTH
move NoRTH
move NoRTH
move EaST
move EaST
move NoRTH
move EaST
move EaST
move NoRTH
move NoRTH
move EaST
move gO stair
move SoUTH

CLIMB-001:
match PASS-001 [Outside East Wall, Footpath]
match FAIL-001 You must be standing
match FAIL-001 steepness is intimidating
match FAIL-001 can't seem to find purchase
match FAIL-001 find it hard going.
match FAIL-001 your footing is questionable
match FAIL-001 slip after a few feet
match FAIL-001 A wave of dizziness hits you
match FAIL-001 Struck by vertigo
put climb break
matchwait

PASS-001:
move NoRTH
move gO gate
move WeST
move gO stair
move SoUTH
goto CLIMB-002

FAIL-001:
pause
goto CLIMB-002

CLIMB-002:
match PASS-002 [Northeast Wilds, Outside Northeast Gate]
match FAIL-002 You must be standing
match FAIL-002 steepness is intimidating
match FAIL-002 can't seem to find purchase
match FAIL-002 find it hard going.
match FAIL-002 your footing is questionable
match FAIL-002 slip after a few feet
match FAIL-002 A wave of dizziness hits you
match FAIL-002 Struck by vertigo
put ClIMB embrasure
matchwait

FAIL-002:
move n
move go stair
move e
move go gate
PASS-002:
move gO footpath
goto CLIMB-01

CLIMB-01:
SAVE FAIL-01
match PASS-01 [Crossing, East Wall Battlements]
match FAIL-01 You must be standing
match FAIL-01 steepness is intimidating
match FAIL-01 can't seem to find purchase
match FAIL-01 find it hard going.
match FAIL-01 your footing is questionable
match FALLEN slip after a few feet
match FAIL-01 A wave of dizziness hits you
match FAIL-01 Struck by vertigo
put ClIMB wall
matchwait

PASS-01:
move n
move gO stair
move e
move gO gate
move gO footpath
goto FAIL-01

FAIL-01:
move s
move down
move s
move s
move sw
goto CLIMB-02

CLIMB-02:
SAVE FAIL-02
match PASS-02 [Crossing, East Wall Battlements]
match FAIL-02 You must be standing
match FAIL-02 steepness is intimidating
match FAIL-02 can't seem to find purchase
match FAIL-02 find it hard going.
match FAIL-02 your footing is questionable
match FALLEN slip after a few feet
match FAIL-02 A wave of dizziness hits you
match FAIL-02 Struck by vertigo
put ClIMB wall
matchwait

PASS-02:
move s
move gO stair
move gO gate
move gO bush
move n
goto CLIMB-03

FAIL-02:
move s
goto CLIMB-03

CLIMB-03:
SAVE FAIL-03
match PASS-03 [Crossing, East Wall Battlements]
match FAIL-03 You must be standing
match FAIL-03 steepness is intimidating
match FAIL-03 can't seem to find purchase
match FAIL-03 find it hard going.
match FAIL-03 your footing is questionable
match FALLEN slip after a few feet
match FAIL-03 A wave of dizziness hits you
match FAIL-03 Struck by vertigo
put ClIMB wall
matchwait

PASS-03:
move s
move gO stair
move gO gate
goto CLIMB-04

FAIL-03:
move s
goto CLIMB-04

CLIMB-04:
SAVE FAIL-04
match PASS-04 [Crossing, East Gate Battlements]
match FAIL-04 You must be standing
match FAIL-04 steepness is intimidating
match FAIL-04 can't seem to find purchase
match FAIL-04 find it hard going.
match FAIL-04 your footing is questionable
match FALLEN slip after a few feet
match FAIL-04 A wave of dizziness hits you
match FAIL-04 Struck by vertigo
put ClIMB wall
matchwait

PASS-04:
pause
goto CLIMB-05

FAIL-04:
move gO gate
move gO stair
goto CLIMB-05

CLIMB-05:
SAVE FAIL-05
match PASS-05 [Eastern Tier, Outside Gate]
match FAIL-05 You must be standing
match FAIL-05 steepness is intimidating
match FAIL-05 can't seem to find purchase
match FAIL-05 find it hard going.
match FAIL-05 your footing is questionable
match FALLEN slip after a few feet
match FAIL-05 A wave of dizziness hits you
match FAIL-05 Struck by vertigo
put ClIMB embrasure
matchwait

PASS-05:
move gO gate
move gO stair
FAIL-05:
move n
goto CLIMB-06

CLIMB-06:
SAVE FAIL-06
match PASS-06 [Outside East Wall, Footpath]
match FAIL-06 You must be standing
match FAIL-06 steepness is intimidating
match FAIL-06 can't seem to find purchase
match FAIL-06 find it hard going.
match FAIL-06 your footing is questionable
match FALLEN slip after a few feet
match FAIL-06 A wave of dizziness hits you
match FAIL-06 Struck by vertigo
put ClIMB break
matchwait

PASS-06:
move s
move gO gate
move gO stair
move n
goto CLIMB-07

FAIL-06:
pause
goto CLIMB-07

CLIMB-07:
SAVE FAIL-07
match PASS-07 [Outside East Wall, Footpath]
match FAIL-07 You must be standing
match FAIL-07 steepness is intimidating
match FAIL-07 can't seem to find purchase
match FAIL-07 find it hard going.
match FAIL-07 your footing is questionable
match FALLEN slip after a few feet
match FAIL-07 A wave of dizziness hits you
match FAIL-07 Struck by vertigo
put ClIMB embrasure
matchwait

PASS-07:
move s
move s
move gO gate
goto TRAVEL-08

FAIL-07:
move s
move gO stair
goto TRAVEL-08

TRAVEL-08:
move w
move w
move w
move w
move nw
move n
move n
move n
move n
move n
move n
move w
move w
move w
move w
move gO bridge
move w
move w
move w
move w
move gO stair
move s

CLIMB-08:
SAVE FAIL-08
match PASS-08 [Mycthengelde, Flatlands]
match FAIL-08 You must be standing
match FAIL-08 steepness is intimidating
match FAIL-08 can't seem to find purchase
match FAIL-08 find it hard going.
match FAIL-08 your footing is questionable
match FALLEN slip after a few feet
match FAIL-08 A wave of dizziness hits you
match FAIL-08 Struck by vertigo
put ClIMB embrasure
matchwait

PASS-08:
pause
goto CLIMB-09

FAIL-08:
move n
move go stair
move go gate
move nw
goto CLIMB-09

CLIMB-09:
SAVE FAIL-09
match PASS-09 [Crossing, West Wall Battlements]
match FAIL-09 You must be standing
match FAIL-09 steepness is intimidating
match FAIL-09 can't seem to find purchase
match FAIL-09 find it hard going.
match FAIL-09 your footing is questionable
match FALLEN slip after a few feet
match FAIL-09 A wave of dizziness hits you
match FAIL-09 Struck by vertigo
put ClIMB wall
matchwait

PASS-09:
move n
goto CLIMB-10

FAIL-09:
move se
move gO gate
move gO stair
goto CLIMB-10

CLIMB-10:
SAVE FAIL-10
match PASS-10 [Mycthengelde, Flatlands]
match FAIL-10 You must be standing
match FAIL-10 steepness is intimidating
match FAIL-10 can't seem to find purchase
match FAIL-10 find it hard going.
match FAIL-10 your footing is questionable
match FALLEN slip after a few feet
match FAIL-10 A wave of dizziness hits you
match FAIL-10 Struck by vertigo
put ClIMB embrasure
matchwait

PASS-10:
move gO gate
move gO stair
FAIL-10:
move e
goto CLIMB-11

CLIMB-11:
SAVE FAIL-11
match PASS-11 [Northwall Trail, Wooded Grove]
match FAIL-11 You must be standing
match FAIL-11 steepness is intimidating
match FAIL-11 can't seem to find purchase
match FAIL-11 find it hard going.
match FAIL-11 your footing is questionable
match FALLEN slip after a few feet
match FAIL-11 A wave of dizziness hits you
match FAIL-11 Struck by vertigo
put ClIMB break
matchwait

PASS-11:
move s
move gO gate
move gO stair
move e
goto CLIMB-12

FAIL-11:
pause
goto CLIMB-12

CLIMB-12:
SAVE FAIL-12
match PASS-12 [Northwall Trail, Wooded Grove]
match FAIL-12 You must be standing
match FAIL-12 steepness is intimidating
match FAIL-12 can't seem to find purchase
match FAIL-12 find it hard going.
match FAIL-12 your footing is questionable
match FALLEN slip after a few feet
match FAIL-12 A wave of dizziness hits you
match FAIL-12 Struck by vertigo
put ClIMB embrasure
matchwait

PASS-12:
pause
goto CLIMB-13

FAIL-12:
move w
move gO stair
move gO gate
move gO trail
move ne
goto CLIMB-13

CLIMB-13:
SAVE FAIL-13
match PASS-13 [Crossing, North Wall Battlements]
match FAIL-13 You must be standing
match FAIL-13 steepness is intimidating
match FAIL-13 can't seem to find purchase
match FAIL-13 find it hard going.
match FAIL-13 your footing is questionable
match FALLEN slip after a few feet
match FAIL-13 A wave of dizziness hits you
match FAIL-13 Struck by vertigo
put ClIMB wall
matchwait

PASS-13:
move w
move gO stair
move gO gate
move gO trail
goto CLIMB-14

FAIL-13:
move sw
goto CLIMB-14

CLIMB-14:
SAVE FAIL-14
match PASS-14 [Crossing, North Wall Battlements]
match FAIL-14 You must be standing
match FAIL-14 steepness is intimidating
match FAIL-14 can't seem to find purchase
match FAIL-14 find it hard going.
match FAIL-14 your footing is questionable
match FALLEN slip after a few feet
match FAIL-14 A wave of dizziness hits you
match FAIL-14 Struck by vertigo
put ClIMB wall
matchwait

PASS-14:
move w
move gO stair
move gO gate
goto CLIMB-15

FAIL-14:
move s
goto CLIMB-15

CLIMB-15:
SAVE FAIL-15
match PASS-15 [Crossing, West Gate Battlements]
match FAIL-15 You must be standing
match FAIL-15 steepness is intimidating
match FAIL-15 can't seem to find purchase
match FAIL-15 find it hard going.
match FAIL-15 your footing is questionable
match FALLEN slip after a few feet
match FAIL-15 A wave of dizziness hits you
match FAIL-15 Struck by vertigo
put ClIMB wall
matchwait

PASS-15:
move gO stair
goto TRAVEL-15

FAIL-15:
move gO gate
goto TRAVEL-15

TRAVEL-15:
move e
move e
move e
move e
move e
move e
move e
move e
move e
move s
move s
move s
move s
move s
move s
move se
pause
goto rmclimbexp
put skill climb
match climb EXP HELP
match quit mind lock
match quit dazed
match quit bewilder
matchwait 


FALLEN:
pause
match STOOD You stand
match STOOD You are already standing
match FALLEN cannot manage to stand.
match FALLEN The weight of all your possessions
match FALLEN ...wait
put StAND
matchwait

STOOD:
goto %s

QUIT:
goto banktoneg

compstart:

match open You get a
match what what were you
match open you are already
put get my compendium
matchwait

open:
match study you open
match study that is already open
put open my comp
matchwait

study:
match exp begin
match exp continue
match exp impossible
put study my comp
matchwait

turnp:
pause

turn:
match study you turn
match turnp ...wait
put turn my comp
matchwait

what:
echo ***no compendium found or is in a closed container***
echo ***skipping compendium section***
goto banktoneg

exp:
	match compdone mind lock
	match turn EXP HELP
	put skill first
	matchwait

compdone:
put close my compendium
put stow my compendium

goto banktoneg

banktoneg:
move nw
move n
move n
move n
move n
move n
move n
move e
move e
move n
move e
move e
move n
move n
move e
move e
put go gate
#goto app
goto neg_to_brook

NEG_TO_BROOK:
NEG_TO_BROOK1:
move go gate
move w
move w
move s
move s
move w
move w
TO_BROOK:
move s
move w
move w
move w
move w
move w
move w
move go bridge
move w
move w
move w
move w
move go gate
move go path
move w
move w
move nw
move w
move w
move nw
move w
move w
move sw
move w
move w
move nw
move nw
move w
move w
move nw
move w
move w
move go brook

SWIM_PAUSE:
pause
SWIM:
SWIM_LOOK:

	match SWIM_N Woodland Path, Brook
	match NEG_TO_BROOK1 a bucket of viscous gloop
	match SWIM_BNW northeast, south, northwest
	match SWIM_BNE northeast, southeast
	match SWIM_BSE southeast, southwest
	match SWIM_BSW southwest, northwest
put look
	matchwait
#Remove the below # sign to skip the swimming if you no longer learn from the goblin brook
#goto app
SWIM_N_PAUSE:
pause
SWIM_N:
	match SWIM_ASW You can't swim
	match SWIM_N roundtime
	match SWIM_N_PAUSE ...wait
put n
	matchwait

SWIM_DIR_PAUSE:
pause
SWIM_DIR:
	match SWIM_A%s You can't swim
	match SWIM_A%s roundtime
	match SWIM_DIR_PAUSE ...wait
put %s
	matchwait

SWIM_BNE:
SWIM_ANW:
save NE
goto SWIM_DIR

SWIM_BSE:
SWIM_ANE:
save SE
goto SWIM_DIR


SWIM_BSW:
SWIM_ASE:
save SW
goto SWIM_DIR


SWIM_BNW:
SWIM_ASW:
save NW

SWIM_EXP:
	match APP bewild
	match APP dazed
	match APP mind lock
	match SWIM_DIR EXP HELP
put skill swimming
	matchwait

NEG_BROOK_APP:
move go gate
move w
move w
move s
move s
move w
move w
move s
move w
move w
move w
move w
move w
move w
move go bridge
move w
move w
move w
move w
move go gate
move go path
move w
move w
move nw
move w
move w
move nw
move w
move w
move sw
move w
move w
move nw
move nw
move w
move w
move nw
move w
move w
move go brook
move n
pause
pause
goto APPRAISE

APP:
APPRAISE:
	match NEG_BROOK_APP bucket
	match APP_SOUTH out of the brook
put look
	matchwait

APP_SOUTH_PAUSE:
pause
APP_SOUTH:
	match APP_SOUTH_PAUSE ...wait
	match APP_SOUTH_PAUSE type ahead
	match APP_NE roundtime
put app South quick
	matchwait

APP_NE_PAUSE:
pause
APP_NE:
	match APP_NE_PAUSE ...wait
	match APP_NE_PAUSE type ahead
	match APP_NW roundtime
put app NE quick
	matchwait

APP_NW_PAUSE:
pause
APP_NW:
	match APP_NW_PAUSE ...wait
	match APP_NW_PAUSE type ahead
	match APP_EXP roundtime
put app NW quick
	matchwait

APP_EXP:
	match APP_DONE bewild
	match APP_DONE dazed
	match APP_DONE mind lock
	match APP_SOUTH EXP HELP
put skill app
	matchwait


APP_DONE:
goto BROOK_TO_NEG


BROOK_TO_NEG_PAUSE:
pause
BROOK_TO_NEG:
	match BROOK_TO_NEG_PAUSE ...wait
	match BTW roundtime
put south
	matchwait

BTW_PAUSE:
pause
BTW:
	match BTW2 roundtime
	match BROOK_TO_NEG You can't swim
	match BTW_PAUSE ...wait
put east
	matchwait
BTW2_PAUSE:
pause
BTW2:
	match BTW3 obvious
	match BTW2_PAUSE ...wait
put east
	matchwait
BTW3:
move e
move se
move e
move e
move se
move se
move e
move e
move ne
move e
move e
move se
move e
move e
move se
move e
move e
move go path
move go gate
move e
move e
move e
move e
move e
move e
move e
move e
move e
move e
move e
move n
move e
move e
move n
move n
move e
move e
move go gate
goto perception

PERCEPTION:
put get my %1
wait


P_JUGGLE_RC:
counter set 0
P_JUGGLE_ADD:
counter add 1
goto P_JUGGLE%c
P_JUGGLE_PAUSE:
pause

P_JUGGLE4:
P_JUGGLE3:
P_JUGGLE2:
P_JUGGLE1:
labelerror:
	match P_JUGGLE_STAND stand
	match JUGGLE_WOUND injur
	match P_JUGGLE_PAUSE ...wait
	match P_JUGGLE_PAUSE type ahead
	match P_JUGGLE_ADD roundtime
	match juggleshift What were you referring to?
put juggle my %1
	matchwait

juggleshift:
goto forage

P_JUGGLE_STAND_PAUSE:
pause
P_JUGGLE_STAND:
	match P_JUGGLE_STAND_PAUSE roundtime
	match P_JUGGLE1 you stand
put stand
	matchwait

p_juggle20:
p_juggle15:
p_juggle10:
P_JUGGLE5:
	match juggle_done bewild
	match juggle_DONE dazed
	match juggle_DONE mind lock
	match juggle_add EXP HELP
put skill perception
	matchwait



p_juggle25:
JUGGLE_WOUND:
JUGGLE_DONE:
pause
put stow my %1

match rmscout Guild: Empath
match forage Coins:
put info
matchwait


FORAGE:
put go gate
move w
move s
move s
move s
move s
move sw
move w
move w
move s
move s
move s
move s
move s
move s
put climb stair
move down
put go dock

fishbegin:
match fishpause Waste not, want not.
match fishstart You select
put get pole
matchwait

fishpause:
pause 30
goto fishbegin

fishstart:
match bait The pole isn't baited
match fishcasting The pole is baited
put look my pole
matchwait


fishcasting:
put cast my pole
pause 5

reelin:
match tangle You'll need to untangle the fishing line first.
match reelin wind
match caught work it free from the hook.
match fishcasting pulled in all the way.
match fishcasting That's all of it!
put pull my pole
matchwait

tangle:
put untang my pole
goto reelin

caught:
match creppo creppo
match muska muskalundge
match seaweed seaweed
match turtle turtle
match grek grek
match nomlas nomlas
put glance
matchwait

fishexpcheck:
match fishdone mind lock
match fishdone bewildering
match fishdone bewildered
match fishdone dazed
match bait EXP HELP
put skill foraging
matchwait



bait:
match bait ...wait
match fishcasting meat onto the hook.
match bait [Roundtime
put get bait
matchwait

nomlas:
match nomlas ...wait
put throw my nomlas
goto fishexpcheck

creppo:
match creppo ...wait
put throw my creppo
goto fishexpcheck

muska:
match muska ...wait
put throw my muska
goto fishexpcheck

turtle:
match turtle ...wait
put throw my turtle
goto fishexpcheck

seaweed:
match seaweed ...wait
put drop my seaweed
goto fishexpcheck

grek:
match grek ...wait
put throw my grek
goto fishexpcheck

fishdone:
put throw my pole
move n
put climb stair
move up
move n
move n
move n
move e
move e
move n
move n
move n
move ne
move n
move n
move n
move n
move e
put go gate
goto FOR_DONE


FOR_DONE:
# remove the # sign below to make the script loop automatically

#goto rmscout

goto wanttobedone

wanttobedone:

echo *** If you want the script to stop type stop ***
echo *** If you would like to continue for another loop type Go ***

match exitscript stop
match looping Go what?
matchwait

looping:
goto rmscout

instructions:
echo *** to use this script you must start at the NE Gate ***
echo *** to start this script you need to tell it what ***
echo *** you juggle with.  useage: .train <jugglie> ***
echo *** IE: .train dragons ***

exitscript: