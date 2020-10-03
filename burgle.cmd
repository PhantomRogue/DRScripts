action send 1 $lastcommand when ^\.\.\.wait|^Sorry, you may only type
action send $lastcommand when ^You are still stunned

var Movement north|south|west|east|northeast|northwest|southeast|southwest
var returnmove north
action var Guild $1;put #var Guild $1 when Guild:\s+(Barbarian|Bard|Cleric|Commoner|Empath|Moon Mage|Necromancer|Paladin|Ranger|Thief|Trader|Warrior Mage)$
#if (matchre ("$roomexits", "\b(%Movement)\b(,|\.| and)")) then goto MoveRandom




put info

put get rope
put uncoil rope
pause 3

prep:
if $Guild = Thief then goto StartKhri


burgle:
if $hidden = 0 then gosub Hide
put burgle
pause .5
if (matchre ("$roomexits", "\b(%Movement)\b(,|\.| and)")) then goto MoveRandom

LookAndBurgle:
match KitchenSteal Kitchen
match BedroomSteal Bedroom
match ArmorySteal Armory
match LibrarySteal Library
match SanctumSteal Sanctum
match WorkRoomSteal Work Room
put look
matchwait

MoveRandom:
var NewMove $1
put %NewMove
gosub ReturnMove
pause .5
goto LookAndBurgle

BedroomSteal:
if $hidden = 0 then gosub Hide
put search bed
waitfor Roundtime
goto TimeToGo

ArmorySteal:
if $hidden = 0 then gosub Hide
put search rack
waitfor Roundtime
goto TimeToGo

LibrarySteal:
if $hidden = 0 then gosub Hide
put search bookshelf
waitfor Roundtime
goto TimeToGo

SanctumSteal:
if $hidden = 0 then gosub Hide
put search desk
waitfor Roundtime
goto TimeToGo

WorkRoomSteal:
if $hidden = 0 then gosub Hide
put search table
waitfor Roundtime
goto TimeToGo

KitchenSteal:
if $hidden = 0 then gosub Hide
put search count
waitfor Roundtime
gosub StowLoot


Hide:
put hide
pause 4
return

StowLoot:
put stow left
put go window
pause 2
put khri stop
put put rope in bag
put #parse BURGLECOMPLETE
exit

TimeToGo:
put %ReturnMove
put go window
pause 1
put khri stop
pause 1
put coil my rope
put stow rope
pause 1
put #parse BURGLECOMPLETE
exit

StartKhri:

put khri start plunder slight focus
pause 8
put khri start darken dampen
pause 8
goto burgle

ReturnMove:
if %NewMove = "north" then var ReturnMove south
if %NewMove = "south" then var ReturnMove north
if %NewMove = "east" then var ReturnMove west
if %NewMove = "west" then var ReturnMove east
if %NewMove = "northwest" then var ReturnMove southeast
if %NewMove = "northeast" then var ReturnMove southwest
if %NewMove = "southwest" then var ReturnMove northeast
if %NewMove = "southeast" then var ReturnMove northwest
return
