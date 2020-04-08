put go gate
move w
move w
move w
move w
put search
waitfor roundtime
pause 1

put go path
move w
move w
move w
move w
move w
put look under brush
put lie down
put go opening
waitfor you crawl out of the passage into ...
pause 1
put stand
put go black arch
pause 1
put go black arch
pause 1
put go black arch
pause 1
put go black arch
pause 1
put go black arch
pause 1
put go black arch
pause 1
move down
put go dais
put pray
pause 1
put pray
pause 1
put pray
pause 1
put pray
pause 1
put 'Hodierna
put stand
put get orb
put go arch
goto puzzle

puzzle:
match plant plant
match sponge sponge
match jug jug
match tinders tinders
match vase vase
match look bubbling pool
match look difficult
match return A soft voice echoes in your mind
put look
matchwait

plant:
match plant shimy
match plant loosen
match open swift breeze moves into the room
put open window
matchwait

open:
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
put go path
goto puzzle

look:
put look

return:
put down
put up
put go white arch
pause 1
put go white arch
pause 1
put go white arch
pause 1
put go white arch
pause 1
put go white arch
pause 1
put go white arch
pause 1
put lay down
put go opening
waitfor you crawl out of the passage into ...
pause 1
put stand
put go trail
move e
move e
move e
move e
put go road
move e
move e
move e
move e
put go gate