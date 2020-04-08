action goto DONE when reaches over and holds your hand|grabs your arm and drags you|clasps your hand tenderly
action goto DONE when eval $webbed = 1
action goto DONE when eval $stunned = 1
action goto DONE when eval $health < 10
action goto DONE when eval $dead = 1
action goto DONE when mouse|MINUTES|RESPOND|squeak



start:
put climb practice %1
match CheckEXP You finish pract
match start This climb is too
matchwait


CheckEXP:
put skill athlet
matchre waitforit (bewildering|bewildered|dazed|lock)
matchre start (EXP HELP)
matchwait


waitforit:
pause 60
put exp
pause 60
goto CheckEXP

DONE:
put quit
exit