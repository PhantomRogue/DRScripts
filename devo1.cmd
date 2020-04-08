var LastCommune Eluned

communecheck:
evalmath timeSinceLastCommune $gametime - $LastCommune
if %timeSinceLastCommune > 1260 then goto sense
return

sense:
match Eluned Meraud
put commune sense
matchwait 2
goto meraud

Eluned:
put fo dirt
pause 0.5
pause 0.5
put commune Eluned
pause 0.5
pause 0.5
put #var LastCommune $gametime
goto devotion

Meraud:
put get my water
put sprinkle my water on $charactername
pause 1
put stow my water
pause 1
gosub light
put wave incense at $charactername
pause 1
put commune Meraud
pause 0.5
pause 0.5
put #var LastCommune $gametime
goto Devotion

light:
put get incense
put lower incense
pause 1
put get cut
put get flint
pause 1
put light incense with flint
pause 0.5
pause 0.5
put stow cut
put stow flint
pause 1
put get incense
return

Devotion:
put rem bad;pray bad
pause 10
return 