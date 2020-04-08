#pp - Moonie Stylz

action $lastcommand when (^Sorry|^...wait)


put get my stones
beginpower:
	
	put power
	waitfor Roundtime
	pause

	put per kata
	waitfor Roundtime
	pause

	put per xiba
	waitfor Roundtime
	pause

	put per yava
	waitfor Roundtime
	pause

	put per moon
	waitfor Roundtime
	pause
	
	put per per
	waitfor Roundtime
	pause
	
	put per manip
	waitfor Roundtime
	pause

	put per psy
	waitfor Roundtime
	pause

	put per trans
	waitfor Roundtime
	pause

	put per planet
	waitfor Roundtime
	pause

	put predict weather
	waitfor Roundtime
	pause
	
	goto checkPP

stoner:
start:
forage:
pause
put forage grass
match braid1 some grass
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
matchre beginpower (lock|daze|bewilder)
matchre braid1 EXP HELP
put skill mech
matchwait

waitforstuff:
pause 60
goto CheckEXP

restart:
put put my grass in %1
goto start

checkPP:
put skill attune
matchre stoner (lock|daze|bewilder)
matchre beginpower EXP HELP
matchwait