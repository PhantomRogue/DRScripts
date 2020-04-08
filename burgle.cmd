action send 1 $lastcommand when ^\.\.\.wait|^Sorry, you may only type
action send $lastcommand when ^You are still stunned
action goto DONE when eval $health < 55


prep:
put get lockp
put khri start plunder slight focus
pause 8
put khri start darken dampen evan
pause 8


if $hidden = 0 then gosub Hide
put burgle
pause 3
match KitchenSteal Kitchen
match BedroomSteal Bedroom
match ArmorySteal Armory
match LibrarySteal Library
match SanctumSteal Sanctum
match WorkRoomSteal Work Room
put look
matchwait



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