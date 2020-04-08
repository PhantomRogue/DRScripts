action send $lastcommand when ^\.\.\.wait|^Sorry, you may only type
#swim

start:
gosub MOVE sw
gosub MOVE ne
gosub MOVE sw
gosub MOVE ne
gosub MOVE sw
gosub MOVE ne
goto ExpCheck

ExpCheck:
put skill ath
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
matchre RETURN ^You can't swim
matchre RETURN ^Obvious
put %Direction
matchwait
RETURN:
return



swimpause:
put hid
pause 60
pause 60
pause 60
goto ExpCheck


waiting:
put juggle cub
pause 14
put juggle cub
pause 14
put juggle cub
pause 14
put juggle cub
pause 14
put juggle cub
pause 14
put juggle cub
pause 14
put juggle cub
pause 14
put juggle cub
pause 14
put juggle cub
pause 14
put juggle cub
pause 14
put juggle cub
pause 14

goto ExpCheck


goclimb:
put climb emb
put hide
pause 10
climbin:
put climb practice tree
match CheckEXP You finish
match start This climb is too
matchwait


CheckEXP:
put skill climbing
matchre goswim (bewildering|bewildered|dazed|lock)
matchre climbin (EXP HELP)
matchwait

goswim:
put div hol
goto start

GetChart:
put get my chart
pause .5
StudyChart:
put study my chart
waitfor Roundtime

put skill Scholarship
matchre start (mind lock|bewilder)
matchre StudyChart EXP HELP
matchwait

