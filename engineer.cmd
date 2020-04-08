MAIN:
if %c >= %3 then goto exit
pause 2
echo -------------------------------
echo =  You have made %c %2 's
echo =
echo -------------------------------
setvariable lasttool book
put get my deed
put tap my deed
pause 2
put get %1
pause 2
put get my carv book
put study book
waitfor Roundtime
pause 2
put stow %lasttool
put get chisels
setvariable lasttool chis
put carve my %1 with chis
match riff jagged edges
match rasp uneven
match rasp no longer level
match polish discol
match carve Roundtime
matchwait

carve:
put stow %lasttool
pause
put get chis
setvariable lasttool chis
#put hum %3
put carve %2 with chis
match stow You cannot figure
match assemble [Ingredients
match riff jagged edges
match rasp uneven
match rasp no longer level
match polish discol
match carve Roundtime
match carve ...w
matchwait

riff:
put stow %lasttool
put get riff
setvariable lasttool riff
put rub %2 with riff
match riff ...w
match assemble [Ingredients
match stow Applying the final
match carve Roundtime
matchwait

rasp:
put stow %lasttool
put get rasp
setvariable lasttool rasp
put scrape %2 with rasp
match rasp ...w
match assemble [Ingredients
match stow Applying the final
match carve Roundtime
matchwait


polish:
put stow %lasttool
put get polish
setvariable lasttool polish
put apply polish to my %2
match polish ...w
match assemble [Ingredients
match stow Applying the final
match carve Roundtime
matchwait

assemble:
put stow right
put get chis
setvariable lasttool chis
put carve %2 with chis
match cord cord to continue
match pole pole to continue
match cord pole is not required
match pole cord is not required
match assemble ...w
matchwait

cord:
put stow %lasttool
put get cord in my bag
setvariable lasttool cord
put assemble %2 with my cord
put analyze %2
match carve further carving
match carve You do not see anything
match rasp rasp
match riff riffler
match polish polish
match pole cord is not required
matchwait

pole:
put stow right
put get pole in my bag
setvariable lasttool pole
put assemble %2 with my pole
put analyze %2
match carve further carving
match carve You do not see anything
match rasp rasp
match riff riffler
match polish polish
match cord pole is not required
matchwait

stow:
put analyze %2
waitfor Roundtime
pause 1
put stow left
put stow right
pause
put get my logb
put get %2 from backp
pause 2
put bundle my %2 with my logb
pause 
put put logb in haver
counter add 1
goto MAIN

exit:
put Items Forged