goto %1

Arthe:
put n
put out
pause .1
put tell cara to follow
put e
waitfor , following you.
put tell cara to lead to dale
waitfor [Valley, Village Gate]
put tell cara to follow
put g gate
waitfor , following you.
put n
waitfor , following you.
put n
waitfor , following you.
put n
waitfor , following you.
put n
waitfor , following you.
put w
waitfor , following you.
move g door
put g door
exit

Cross:
put e;go door
pause .1
put o
put tell cara to follow
put e
waitfor , following you.
put tell cara to lead to crossing
waitfor [Northeast Wilds, Outside Northeast Gate]
put tell cara to follow
put go gate
waitfor , following you.
put #var Caravan 1
put #goto 380
exit

Leth:
put out
put #goto ferry
waitfor YOU HAVE ARRIVED
put hide
waitfor pulls into the dock
put go ferr
waitfor about a fourth of the way 
put exp
waitfor reaches the dock and its crew 
put go dock
waitfor , following you.
put tell caravan lead to leth deriel
put tell caravan go faster
gosub put tell caravan go faster
waitfor The weathered caravan stops and waits, having arrived at its destination.
put #goto outp
exit


Move:
setvariable move $0
Move1:
pause .1
if $standing = 0 then put stand
matchre Move1 \.\.\.wait|Sorry, you may only
matchre ret You are engaged|while in combat|You'll have better luck if you first retreat
#matchre lost Please rephrase that|What were you referring to|You can't go there
matchre MoveStow Free up your hands first
Matchre Move1 unharmed but feel foolish.
Matchre Move1 Struck by vertigo
Matchre Move1 but the steepness
Matchre Move1 but reach a point where your footing
matchre return Obvious exits|Obvious paths
put %move
matchwait

return:
return

LethToCross:
put e;o
put #goto 115
waitfor YOU HAVE ARRIVED
put tell cara to lead to cross
waitfor arried at its destination
put tell cara to follow
put n
waitfor pulls into the dock
put go ferr
waitfor about a fourth of the way
put exp
waitfor reaches the dock and
put go dock
waitfor , following you
put #goto 380
exit