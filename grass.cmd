#braid
action put #queue clear; send 1 $lastcommand when ^\.\.\.wait|^Sorry, you may only type

start:
forage:
pause
put forage grass
match braid1 some grass
match braid1 best grass
match forage Roundtime
matchwait

braid1:
pause
put braid my grass
match forage You need to have more material in your other hand to continue braiding.
match restart fumbl
match CheckEXP Roundtime:
match CheckEXP You begin to carefully braid your
matchwait

CheckEXP:
if $Mechanical_Lore.LearningRate > 30 then goto waitforstuff 
if $Mechanical_Lore.LearningRate < 31 then goto braid1

waitforstuff:
pause 60
goto CheckEXP

restart:
put put my grass in %1
goto start