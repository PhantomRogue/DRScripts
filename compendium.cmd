action send $lastcommand when ^\.\.\.wait|^Sorry, you may only type
action send $lastcommand when ^You are still stunned

var loopCount 0

put get my compendium
waitfor You


turn:
pause 1
match study Rat
match study Croff
match study Gnome
match study Dwarven
match study Halfling
match study Kaldar
match study Rakash
match study Prydaen
match study S'Kra Mur
match study Elothean
match study Goblin
match study Gor'Tog
match study Elven
match study Human
match study Gidii
match study Leucro
match study Peccary physiology
match study Caiman
match study Troll
match turn Lach
put turn my compendium
matchwait

study:
match reset_scholarship Roundtime:
match count_scholarship Why do you need to study this chart again
put study my compendium
matchwait

reset_scholarship:
var loopCount 0
goto check_scholarship

count_scholarship:
math loopCount add 1
if %loopCount > 8 then goto switch_compendium

check_scholarship:
if $Scholarship.LearningRate > 30 then goto done
if $Scholarship.LearningRate < 29 then goto turn

switch_compendium:
var loopCount 0
put stow compendium
waitfor You
put get other compendium
waitfor You
goto turn

done:
matchre pauser (mind lock|bewilder|dazed|perplex)
match turn EXP HELP
put skill scholarship
matchwait

pauser:
pause 69
pause 60
pause 60
goto done
