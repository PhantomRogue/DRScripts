start:
#Climb Crossing Walls
action send $lastcommand when ^\.\.\.wait|^Sorry, you may only type


match emptyHands You glance down to see
match MAIN You glance down at your empty hands.
put glance
matchwait

MAIN:
ECHO
ECHO *** START OUTSIDE CROSSING BANK ***
ECHO
put set roomname
put awake
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
pause 3
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
pause 3
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
pause 3
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
pause 3
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
pause 3
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
pause 3
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
pause 3
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
pause 3
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
pause 3
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
pause 3
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
pause 3
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
pause 3
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
pause 3
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
pause 3
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
pause 3
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
pause 3
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
pause 3
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
put skill climb
if $Climbing.LearningRate > 24 then goto exit
goto MAIN


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

EMPTYHANDS:
echo
echo *** EMPTY YOUR HANDS ***
echo
exit

exit:
move nw
move n
move n
move n
move n
move n
move n
move w
move w
move n
move n
move w
move w
move go gate
move n

# monkeedu's Foraging Script v2.1
#

  echo *************************************************
  echo *** Foraging
  echo *************************************************
  echo
  debug off
  counter set 0
  if_1 goto glance
  goto trash

#******************************************************#
#  Messaging

 done:
  echo *************************************************
  echo *** Done.
  echo *************************************************
  echo
  goto braid1

 trash:
  echo *************************************************
  echo *** You need to give a trash can as variable 1.
  echo *************************************************
  echo
  goto done

 full:
  echo *************************************************
  echo *** Your need to empty your hands.
  echo *************************************************
  echo
  goto done

 clutter:
  echo *************************************************
  echo *** This area is too cluttered to forage in.
  echo *************************************************
  echo
  goto done

 report:
  echo *************************************************
  echo *** Foraged '%temp%' %c% times.
  echo *************************************************
  echo
  goto done

#******************************************************#
#  Main

 glance:
  pause .2
  match full in your right hand
  match guild You glance down at your empty hands.
  put glance
  matchwait

 guild:
  pause .2
  matchre normal /: Bard|: Cleric|: Commoner|: Necromancer|: Thief|: Empath|: Ranger|: Necro|: Moon/
  match careful Coins:
  put info
  matchwait
#####
#I have not tested with this Rangers, Necros or moonies
#Please let me know if this is a problem.
#
#####
 normal:
  save  
  goto check

 careful:
  save careful

 check:
  if_2 setvariable temp %2
  if_2 goto empty
  goto skill

 forage1:
  pause 1
  match full hands are full
  match clutter cluttered
  match forage2 You manage to find
  matchre forage1 /(Roundtime:|...wait)/
  put forage %temp %s
  matchwait

 forage2:
  pause 1
  match full hands are full
  match clutter cluttered
  match empty You manage to find
  matchre forage2 /(Roundtime:|...wait)/
  put forage %temp %s
  matchwait

 empty:
  counter add 2
  pause 2
  put put my %temp in bin
  pause 1
  put put my %temp in bin
  matchre report /mind lock|daze|bewild/
  match forage1 Points:
  put skill forag
  matchwait

#******************************************************#
#  Set Forage Item

  skill:
  pause .2
  matchre done /mind lock|dazed|bewild/
  matchre 320 /g:   5|g:   4|g:   39|g:   38|g:   37|g:   36|g:   35|g:   34|g:   33|g:   32|g:   31/
  matchre 300 /g:   30|g:   29/
  matchre 280 /g:   28|g:   279|g:   278|g:   277|g:   276|g:   275/
  matchre 275 /g:   27|g:   26|g:   25/
  matchre 240 /g:   24|g:   23/
  matchre 220 /g:   22|g:   21/
  matchre 200 /g:   20|g:   199|g:   198|g:   197|g:   196|g:   195/
  matchre 195 /g:   19|g:   18|g:   179|g:   178|g:   177|g:   176|g:   175/
  matchre 175 /g:   17|g:   16/
  matchre 150 /g:   15|g:   14|g:   13/
  match 120 g:   12
  match 110 g:   11
  match 100 g:   10
  match 90 g:     9
  match 80 g:     8
  match 70 g:     7
  matchre 65 /g:     69|g:     68|g:     67|g:     66|g:     65/
  match 60 g:     6
  match 50 g:     5
  match 40 g:     4
  match 30 g:     3
  match 20 g:     2
  match 10 g:     1
  matchre 0 /g:   |skill!/
  put skill forag
goto 120:
#  matchwait
####
# I had to comment out the above matchwait once I hit skill around 120ish
# If you need to go higher than group 120, change the above
# goto command with the group you wish to start at
# listed below.  If 120 is too high, find a group to start at that is lower, but
# eventually this script WILL get your skill if it is lower, just not higher
####
 setforage:
  pause 1
  match full hands are full
  match clutter cluttered
  match setempty You manage to find
  match setforage ...wait
  match %next Roundtime:
  put forage %last %s
  matchwait

 setempty:
  pause 1
  setvariable temp %last
  put put my %last in bin
  goto forage1

#******************************************************#
#  Forage List

 320:
 silverwoodstick:
  setvariable last silverwood stick
  setvariable next silverwoodlimb
  goto setforage
 silverwoodlimb:
  setvariable last silverwood limb
  setvariable next silverwoodbranch
  goto setforage
 300:
 silverwoodbranch:
  setvariable last silverwood branch
  setvariable next coin
  goto setforage
 coin:
  setvariable last coin
  setvariable next copperwoodstick
  goto setforage
 copperwoodstick:
  setvariable last copperwood stick
  setvariable next copperwoodlimb
  goto setforage
 copperwoodlimb:
  setvariable last copperwood limb
  setvariable next copperwoodbranch
  goto setforage
 280:
 copperwoodbranch:
  setvariable last copperwood branch
  setvariable next nuloestem
  goto setforage
 275:
 nuloestem:
  setvariable last nuloe stem
  setvariable next genichstem
  goto setforage
 genichstem:
  setvariable last genich stem
  setvariable next cebiroot
  goto setforage
 cebiroot:
  setvariable last cebi root
  setvariable next qunpollen
  goto setforage
 qunpollen:
  setvariable last qun pollen
  setvariable next jadicepollen
  goto setforage
 jadicepollen:
  setvariable last jadice pollen
  setvariable next butterflyorchid
  goto setforage
 240:
 butterflyorchid:
  setvariable last butterfly orchid
  setvariable next bloodwoodstick
  goto setforage
 bloodwoodstick:
  setvariable last bloodwood stick
  setvariable next bloodwoodlimb
  goto setforage
 bloodwoodlimb:
  setvariable last bloodwood limb
  setvariable next bloodwoodbranch
  goto setforage
 220:
 bloodwoodbranch:
  setvariable last bloodwood branch
  setvariable next osagestick
  goto setforage
 osagestick:
  setvariable last osage stick
  setvariable next osagelimb
  goto setforage
 osagelimb:
  setvariable last osage limb
  setvariable next osagebranch
  goto setforage
 osagebranch:
  setvariable last osage branch
  setvariable next honeycomb
  goto setforage
 200:
 honeycomb:
  setvariable last honey comb
  setvariable next mistwoodstick
  goto setforage
 mistwoodstick:
  setvariable last mistwood stick
  setvariable next mistwoodlimb
  goto setforage
 mistwoodlimb:
  setvariable last mistwood limb
  setvariable next mistwoodbranch
  goto setforage
 mistwoodbranch:
  setvariable last mistwood branch
  setvariable next yewstick
  goto setforage
 195:
 yewstick:
  setvariable last yew stick
  setvariable next yewlimb
  goto setforage
 yewlimb:
  setvariable last yew limb
  setvariable next yewbranch
  goto setforage
 yewbranch:
  setvariable last yew branch
  setvariable next coffeebean
  goto setforage
 175:
 coffeebean:
  setvariable last coffee bean
  setvariable next muljinsap
  goto setforage
 muljinsap:
  setvariable last muljin sap
  setvariable next wildorchid
  goto setforage
 wildorchid:
  setvariable last wild orchid
  setvariable next eghmokmoss
  goto setforage
 eghmokmoss:
  setvariable last eghmok moss
  setvariable next mistletoe
  goto setforage
 150:
 mistletoe:
  setvariable last mistle toe
  setvariable next willowbranch
  goto setforage
 willowbranch:
  setvariable last willow branch
  setvariable next redrose
  goto setforage
 120:
 redrose:
  setvariable last red rose
  setvariable next redwoodstick
  goto setforage
 redwoodstick:
  setvariable last redwood stick
  setvariable next redwoodlimb
  goto setforage
 redwoodlimb:
  setvariable last redwood limb
  setvariable next walnutbranch
  goto setforage
 walnutbranch:
  setvariable last walnut branch
  setvariable next redwoodbranch
  goto setforage
 redwoodbranch:
  setvariable last redwood branch
  setvariable next glayskerflower
  goto setforage
 glayskerflower:
  setvariable last glaysker flower
  setvariable next blocilberries
  goto setforage
 blocilberries:
  setvariable last blocil berries
  setvariable next willowstick
  goto setforage
 willowstick:
  setvariable last willow stick
  setvariable next walnutstick
  goto setforage
 walnutstick:
  setvariable last walnut stick
  setvariable next teakstick
  goto setforage
 teakstick:
  setvariable last teak stick
  setvariable next rosewoodstick
  goto setforage
 rosewoodstick:
  setvariable last rosewood stick
  setvariable next oakstick
  goto setforage
 oakstick:
  setvariable last oak stick
  setvariable next maplestick
  goto setforage
 maplestick:
  setvariable last maple stick
  setvariable next mahoganystick
  goto setforage
 mahoganystick:
  setvariable last mahogany stick
  setvariable next elmstick
  goto setforage
 elmstick:
  setvariable last elm stick
  setvariable next ebonystick
  goto setforage
 ebonystick:
  setvariable last ebony stick
  setvariable next sufilsap
  goto setforage
 sufilsap:
  setvariable last sufil sap
  setvariable next pigroot
  goto setforage
 110:
 pigroot:
  setvariable last pig root
  setvariable next briarberryroot
  goto setforage
 briarberryroot:
  setvariable last briarberry root
  setvariable next willowlimb
  goto setforage
 willowlimb:
  setvariable last willow limb
  setvariable next walnutlimb
  goto setforage
 walnutlimb:
  setvariable last walnut limb
  setvariable next teaklimb
  goto setforage
 teaklimb:
  setvariable last teak limb
  setvariable next rosewoodlimb
  goto setforage
 rosewoodlimb:
  setvariable last rosewood limb
  setvariable next oaklimb
  goto setforage
 100:
 oaklimb:
  setvariable last oak limb
  setvariable next maplelimb
  goto setforage
 maplelimb:
  setvariable last maple limb
  setvariable next mahoganylimb
  goto setforage
 mahoganylimb:
  setvariable last mahogany limb
  setvariable next elmlimb
  goto setforage
 elmlimb:
  setvariable last elm limb
  setvariable next ebonylimb
  goto setforage
 ebonylimb:
  setvariable last ebony limb
  setvariable next riolurleaf
  goto setforage
 riolurleaf:
  setvariable last riolur leaf
  setvariable next hulnikgrass
  goto setforage
 hulnikgrass:
  setvariable last hulnik grass
  setvariable next teakbranch
  goto setforage
 teakbranch:
  setvariable last teak branch
  setvariable next rosewoodbranch
  goto setforage
 rosewoodbranch:
  setvariable last rosewood branch
  setvariable next oakbranch
  goto setforage
 oakbranch:
  setvariable last oak branch
  setvariable next maplebranch
  goto setforage
 maplebranch:
  setvariable last maple branch
  setvariable next mahoganybranch
  goto setforage
 mahoganybranch:
  setvariable last mahogany branch
  setvariable next elmbranch
  goto setforage
 elmbranch:
  setvariable last elm branch
  setvariable next ebonybranch
  goto setforage
 ebonybranch:
  setvariable last ebony branch
  setvariable next greenmoss
  goto setforage
 greenmoss:
  setvariable last green moss
  setvariable next whiterose
  goto setforage
 90:
 whiterose:
  setvariable last white rose
  setvariable next tealeaf
  goto setforage
 tealeaf:
  setvariable last tea leaf
  setvariable next oldbutton
  goto setforage
 oldbutton:
  setvariable last old button
  setvariable next junliarstem
  goto setforage
 junliarstem:
  setvariable last junliar stem
  setvariable next sage
  goto setforage
 sage:
  setvariable last sage
  setvariable next plovikleaf
  goto setforage
 plovikleaf:
  setvariable last plovik leaf
  setvariable next nilosgrass
  goto setforage
 nilosgrass:
  setvariable last nilos grass
  setvariable next almond
  goto setforage
 almond:
  setvariable last almond
  setvariable next hickorystick
  goto setforage
 hickorystick:
  setvariable last hickory stick
  setvariable next cherrystick
  goto setforage
 cherrystick:
  setvariable last cherry stick
  setvariable next hickorylimb
  goto setforage
 hickorylimb:
  setvariable last hickory limb
  setvariable next cherrylimb
  goto setforage
 cherrylimb:
  setvariable last cherry limb
  setvariable next hickorybranch
  goto setforage
 hickorybranch:
  setvariable last hickory branch
  setvariable next cherrybranch
  goto setforage
 80:
 cherrybranch:
  setvariable last cherry branch
  setvariable next moss
  goto setforage
 moss:
  setvariable last moss
  setvariable next lavendar
  goto setforage
 lavendar:
  setvariable last lavendar
  setvariable next draconaeiablossom
  goto setforage
 draconaeiablossom:
  setvariable last draconaeia blossom
  setvariable next turnip
  goto setforage
 turnip:
  setvariable last turnip
  setvariable next gooseberries
  goto setforage
 gooseberries:
  setvariable last gooseberries
  setvariable next chamomile
  goto setforage
 chamomile:
  setvariable last chamomile
  setvariable next firstick
  goto setforage
 firstick:
  setvariable last fir stick
  setvariable next birchstick
  goto setforage
 birchstick:
  setvariable last birch stick
  setvariable next ashstick
  goto setforage
 70:
 ashstick:
  setvariable last ash stick
  setvariable next rose
  goto setforage
 rose:
  setvariable last rose
  setvariable next firlimb
  goto setforage
 firlimb:
  setvariable last fir limb
  setvariable next birchlimb
  goto setforage
 birchlimb:
  setvariable last birch limb
  setvariable next ashlimb
  goto setforage
 ashlimb:
  setvariable last ash limb
  setvariable next firbranch
  goto setforage
 firbranch:
  setvariable last fir branch
  setvariable next birchbranch
  goto setforage
 birchbranch:
  setvariable last birch branch
  setvariable next ashbranch
  goto setforage
 ashbranch:
  setvariable last ash branch
  setvariable next clover
  goto setforage
 clover:
  setvariable last clover
  setvariable next seolarnweed
  goto setforage
 seolarnweed:
  setvariable last seolarn weed
  setvariable next toadstool
  goto setforage
 toadstool:
  setvariable last toadstool
  setvariable next alderstick
  goto setforage
 alderstick:
  setvariable last alder stick
  setvariable next alderlimb
  goto setforage
 alderlimb:
  setvariable last alder limb
  setvariable next alderbranch
  goto setforage
 alderbranch:
  setvariable last alder branch
  setvariable next applestick
  goto setforage
 applestick:
  setvariable last apple stick
  setvariable next orange
  goto setforage
 orange:
  setvariable last orange
  setvariable next applelimb
  goto setforage
 applelimb:
  setvariable last apple limb
  setvariable next lemon
  goto setforage
 65:
 lemon:
  setvariable last lemon
  setvariable next clam
  goto setforage
 clam:
  setvariable last clam
  setvariable next wildcarrot
  goto setforage
 wildcarrot:
  setvariable last wild carrot
  setvariable next applebranch
  goto setforage
 applebranch:
  setvariable last apple branch
  setvariable next apple
  goto setforage
 apple:
  setvariable last apple
  setvariable next yelithroot
  goto setforage
 60:
 yelithroot:
  setvariable last yelith root
  setvariable next nemoihroot
  goto setforage
 nemoihroot:
  setvariable last nemoih root
  setvariable next asarwudenshell
  goto setforage
 asarwudenshell:
  setvariable last asarwuden shell
  setvariable next phelimshell
  goto setforage
 phelimshell:
  setvariable last phelim shell
  setvariable next briarberries
  goto setforage
 briarberries:
  setvariable last briar berries
  setvariable next sprucestick
  goto setforage
 sprucestick:
  setvariable last spruce stick
  setvariable next pinestick
  goto setforage
 pinestick:
  setvariable last pine stick
  setvariable next sprucelimb
  goto setforage
 sprucelimb:
  setvariable last spruce limb
  setvariable next pinelimb
  goto setforage
 pinelimb:
  setvariable last pine limb
  setvariable next aloeleaf
  goto setforage
 50:
 aloeleaf:
  setvariable last aloe leaf
  setvariable next sprucebranch
  goto setforage
 sprucebranch:
  setvariable last spruce branch
  setvariable next pinebranch
  goto setforage
 pinebranch:
  setvariable last pine branch
  setvariable next jasmineblossom
  goto setforage
 40:
 jasmineblossom:
  setvariable last jasmine blossom
  setvariable next nedorenshell
  goto setforage
 nedorenshell:
  setvariable last nedoren shell
  setvariable next fanashell
  goto setforage
 fanashell:
  setvariable last fana shell
  setvariable next sharktooth
  goto setforage
 sharktooth:
  setvariable last shark tooth
  setvariable next treeroot
  goto setforage
 30:
 treeroot:
  setvariable last tree root
  setvariable next redflower
  goto setforage
 redflower:
  setvariable last red flower
  setvariable next blueflower
  goto setforage
 blueflower:
  setvariable last blue flower
  setvariable next clamshell
  goto setforage
 clamshell:
  setvariable last clam shell
  setvariable next cherry
  goto setforage
 cherry:
  setvariable last cherry
  setvariable next strawberry
  goto setforage
 strawberry:
  setvariable last strawberry
  setvariable next blueberries
  goto setforage
 blueberries:
  setvariable last blueberries
  setvariable next georingrass
  goto setforage
 georingrass:
  setvariable last georin grass
  setvariable next torncloth
  goto setforage
 torncloth:
  setvariable last torn cloth
  setvariable next weed
  goto setforage
 weed:
  setvariable last weed
  setvariable next vine
  goto setforage
 vine:
  setvariable last vine
  setvariable next taffelberries
  goto setforage
 taffelberries:
  setvariable last taffelberries
  setvariable next snailshell
  goto setforage
 snailshell:
  setvariable last snail shell
  setvariable next scallion
  goto setforage
 20:
 scallion:
  setvariable last scallion
  setvariable next sap
  goto setforage
 sap:
  setvariable last sap
  setvariable next peat
  goto setforage
 peat:
  setvariable last peat
  setvariable next rustynail
  goto setforage
 rustynail:
  setvariable last rusty nail
  setvariable next log
  goto setforage
 log:
  setvariable last log
  setvariable next limb
  goto setforage
 limb:
  setvariable last limb
  setvariable next corn
  goto setforage
 corn:
  setvariable last corn
  setvariable next jadiceflower
  goto setforage
 jadiceflower:
  setvariable last jadice flower
  setvariable next stem
  goto setforage
 stem:
  setvariable last stem
  setvariable next seaweed
  goto setforage
 seaweed:
  setvariable last seaweed
  setvariable next grungyfeather
  goto setforage
 grungyfeather:
  setvariable last grungy feather
  setvariable next dirt
  goto setforage
 10:
 dirt:
  setvariable last dirt
  setvariable next cattail
  goto setforage
 cattail:
  setvariable last cattail
  setvariable next acorn
  goto setforage
 acorn:
  setvariable last acorn
  setvariable next seashell
  goto setforage
 seashell:
  setvariable last sea shell
  setvariable next shoetack
  goto setforage
 shoetack:
  setvariable last shoe tack
  setvariable next torch
  goto setforage
 torch:
  setvariable last torch
  setvariable next twig
  goto setforage
 0:
 twig:
  setvariable last twig
  setvariable next stick
  goto setforage
 stick:
  setvariable last stick
  setvariable next woodsplinter
  goto setforage
 woodsplinter:
  setvariable last wood splinter
  setvariable next brokenshell
  goto setforage
 brokenshell:
  setvariable last broken shell
  setvariable next shell
  goto setforage
 shell:
  setvariable last shell
  setvariable next root
  goto setforage
 root:
  setvariable last root
  setvariable next rock
  goto setforage
 rock:
  setvariable last rock
  setvariable next leaf
  goto setforage
 leaf:
  setvariable last leaf
  setvariable next grass
  goto setforage
 grass:
  setvariable last grass
  setvariable next breadcrumb
  goto setforage
 breadcrumb:
  setvariable last bread crumb
  setvariable next woodchip
  goto setforage
 woodchip:
  setvariable last wood chip
  setvariable next dustbunny
  goto setforage
 dustbunny:
  setvariable last dust bunny
  setvariable next branch
  goto setforage
 branch:
  setvariable last branch
  setvariable next fishbone
  goto setforage
 fishbone:
  setvariable last fish bone
  setvariable next berries
  goto setforage
 berries:
  setvariable temp berries
  goto forage

#******************************************************#


braid1:
getgrass:
put forage grass
match getgrass ...wait
match getgrass type ahead
match getgrass but are unable to find anything
match braidgrass You manage to find
matchwait

braidgrass:
pause 1
put braid my grass
match keepgoing ...wait
match keepgoing type ahead
match braidgrass begin to carefully braid your grass
match braidgrass isn't usable for anything yet
match braidgrass could become a good quality
match getgrass need to have more material in your other hand
match throwaway nothing more than wasted
matchwait

keepgoing:
pause 1
put braid my grass
match keepgoing ...wait
match keepgoing type ahead
match braidgrass begin to carefully braid your
match braidgrass isn't usable for anything yet
match braidgrass could become a good quality
match getgrass need to have more material in your other hand
match throwaway nothing more than wasted
put skill mech
match theend mind lock
matchwait

throwaway:
put put grass in bin
match throwaway ...wait
match throwaway type ahead
put skill mech
match theend mind lock
match getgrass EXP HELP
matchwait

theend:
put stand
move s
move go gate
move e
move e
move s
move s
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

swimstart:
move n
pause

movenw:
match movene You splash northwest
match movene You swim
match movenw You struggle
move nw
matchwait

movene:
match movese You splash northeast
match movese You swim
match movene You struggle
move ne
matchwait

movese:
match movesw You swim
match movesw You splash southeast
match movese You struggle
move se
matchwait

movesw:
match moves You splash southwest
match moves You swim
match movesw You struggle
move sw
matchwait

moves:
match swimstart EXP HELP
match swimend mind lock
move s
put skill swim
matchwait

swimend:
move e
pause
move e
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
move s
move s
move s
move s
move s
move s
move se
goto start

