start:
gosub MOVE n
gosub MOVE s
gosub MOVE n
gosub MOVE s
gosub MOVE n
gosub MOVE s
goto ExpCheck

ExpCheck:
put skill swim
matchre goclimb (mind lock|bewilder)
matchre start EXP HELP
matchwait

MOVE:
setvariable Direction $0
MOVE.RESUME:
matchre MOVE.RESUME ^You struggle
matchre MOVE.RESUME ^You slap
matchre MOVE.RESUME ^You work against
match MOVE.RESUME ...wait
matchre MOVE.RESUME ^You flounder
matchre MOVE.RESUME ^You blunder around
matchre MOVE.RESUME ^Sorry, you may only type ahead
matchre MOVE.RESUME ^You are engaged to.*\!
matchre MOVE.RESUME but can't seem to make much headway
matchre RETURN ^Obvious
matchre RETURN You can't swim
put %Direction
matchwait
RETURN:
return
