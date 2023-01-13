#Favors

begin:
if_2 goto begin2
goto help
begin2:
if_1 goto start
goto help

help:
echo
echo **************************************************************
echo
echo You must enter your God as %_1, and the amount
echo of favors you wish to obtain as %_2
echo
echo The stow verb must be set (for instructions type"stow help"
echo
echo if you do not have a full gem pouch, then%_user1
echo through %user_6 must set to appraisable items,or you will
echo need to change the app: label to some other formof exp gain
echo 
echo **************************************************************
echo
echo
exit

start:
save %1
shift
counter set %1
put out
pause
match AtBank The hustle of crowds making their way between the secular and relig
match NotAtBank Obvious paths:
match NotAtBank Obvious exits:
PUT LOOK
MATCHWAIT

NotAtBank:
echo
echo
echo
echo
echo ******************************************************
echo Please start this script outside of the Crossing bank.
echo ******************************************************
echo
echo
exit

AtBank:
echo
echo
echo
echo
echo ******************************
echo HERE WE GO! GETTING %C FAVORS
echo ******************************
echo
echo
pause
goto stow

stow:
pause
match tofavors you put
match tofavors what were you wanting to stow
match help container
match tofavors Stow what?
put stow left
wait
put stow right
matchwait

tofavors:
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
move go bridge
move w
move w
move w
move w
move go gate
move nw
move w
move sw
move sw
move s
move w
move sw
move go path
move sw
move s
move sw
move sw
move se
move up
move up
move nw
move go trail
move go arch
move go stone
goto orb%c


orb9:
orb8:
orb7:
orb6:
orb5:
orb4:
orb3:
orb2:
orb1:
pray:
pause 1
put kneel
put pray
pause 1
put pray
put pray
pause 1
put say %s
put stand
pause 1
put get %s orb
pause 1
put go arch
pause 1
goto puzzle

orb0:
goto GoOn

puzzle:
pause
match plant plant
match sponge sponge
match jug jug
match tinders tinders
match vase vase
match shift bubbling pool
match look difficult
put look
matchwait

shift:
pause
match orb%c shatter
match subtract You put
put stow my orb
matchwait

subtract:
counter subtract 1
goto orb%c

plant:
pause
match plant shimy
match plant loosen
match open swift breeze moves into the room
put open window
matchwait

open:
pause
put go window
goto puzzle

sponge:
put clean altar
put climb stair
pause 1
put go door
goto puzzle

jug:
put fill font
put climb stair
pause 1
put go door
goto puzzle

tinders:
put light candle
put climb stair
pause 1
put go door
goto puzzle

vase:
put get flower
pause
put go path
pause
goto puzzle

look:
put look

GoOn:
move e
move go arch
move go trail
move se
move down
move down
move nw
move ne
move ne
move n
move ne
move go path
move ne
move e
move n
move ne
move ne
move e
move se
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
move s
move s
move s
move s
move s
move s
move se
move sw
move go gate
move n
pause
Match GoDoor iron-bound oak door
Match NoDoor Obvious paths:
put look
MatchWait

GoDoor:
Match NoDoor What were you referring to?
Match DoorGo Stained-glass gaethzen orbs circle the altar with
put go oak door
MatchWait

NoDoor:
move go stair
move up
move UP
move go door
move go clockwise
move go clockwise
move go clockwise
move go clockwise
move climb stair
move go clockwise
move go clockwise
move go clockwise
move go clockwise

DoorGo:
put awaken
counter set 0
goto getorb

getorb:
pause
match oknowgorub You get
match getorb You drop
match xaltar I could not find
match xaltar What were you
put get my %s orb
matchwait

checkexp:
pause
match oknowgorub % bewilder
match oknowgorub % mind lock
match oknowgorub % dazed
match oknowgorub % perplex
match oknowgorub % muddled
match oknowgorub % concentrating
match checkapp Exp Help
put EXP
matchwait

checkapp:
pause
put open my %4 pouch
pause
put app my %4 pouch
match gempouch you sort
match app I could not find
matchwait

app:
pause
put app my %user1
waitfor roundtime
pause
put app my %user2
waitfor roundtime
pause
put app my %user3
waitfor roundtime
pause
put app my %user4
waitfor roundtime
pause
put app my %user5
waitfor roundtime
pause
put app my %user6
waitfor roundtime
pause

gempouch:
pause
put app my pouch quick
waitfor roundtime
pause
put app my pouch
waitfor Roundtime
pause
put app my pouch careful
WaitFor Roundtime
pause
put close my pouch

ManaCheck:
pause
put mana
Match NoMagic trained in the ways of magic.
Match PerHar flowing through this area.
MatchWait

PerHar:
pause
put per
waitfor roundtime
pause
put har 5
WaitFor You
pause
put rel
pause
put har 10
WaitFor You
pause
put rel
put har 15
WaitFor You
pause
put rel
pause
put per
waitfor roundtime
pause
put har 5
WaitFor You
pause
put rel
pause
put har 10
WaitFor You
pause
pause
put rel
put har 15
WaitFor You
pause
put rel
pause

MoveC:
pause
put go c
pause
put per
WaitFor Roundtime
pause
pause
Match DoneMoveC an altar of translucent obsidian swirled with fiery
Match MoveC Obvious paths:
put look
MatchWait

DoneMoveC:
NoMagic:
goto checkexp

oknowgorub:
wait
match orbdone leading you to believe that
match oknowgorub not yet fully prepared.
match checkexp lacking in the type of sacrifice
match nomorerubs You rub a glowing
put rub my orb
matchwait

nomorerubs:
echo
echo *******************************
echo Can't get any more favors today
echo
echo You've only got %c Favors this script
echo ********************************
put drop orb
goto xaltar

orbdone:
pause
put put orb on altar
pause
counter add 1
goto getorb

xaltar:
pause
Match NoXDoor What were you
Match GoXDoor The astonishing sight of the grand temple
put go oak door
MatchWait

NoXDoor:
move go widdershins
move go widdershins
move go widdershins
move go widdershins
move climb stair
move go widdershins
move go widdershins
move go widdershins
move go widdershins
move go door
move down
move down
move down

GoXDoor:
move S
move go gate
move ne
move go bank
ECHO **********************************
echo ALL DONE! YOU'VE GOTTEN %C FAVORS
ECHO **********************************
exit

#favor

