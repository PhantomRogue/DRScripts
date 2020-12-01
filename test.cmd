var Melee Halberd|Brawling|Heavy_Edged|Twohanded_Edged|Twohanded_Blunt|Small_Blunt|Medium_Blunt|Heavy_Blunt|Small_Edged|Quarter_Staff|Short_Staff|Pikes|Offhand_Weapon|Large_Edged
var Movement north|south|west|east|northeast|northwest|southeast|southwest
var Numbers 123|1|2|5|12|55|22|11|9|631|1231

include js_arrays.js

var ClericMana 55
var MinPrep 5
var CambCharge

var CambCharge {eval {math {%ClericMana multiply .75}}}

echo %CambCharge

evalmath CambCharge round(%CambCharge)

math CambCharge subtract %MinPrep
math CambCharge divide 2
evalmath CambCharge round(%CambCharge)

echo %CambCharge

exit








ACTION var nextAttack $1 WHEN \bby landing (?:a|an) (.*)

pause 1
eval nextAttack replace("%nextAttack", ", ", "|")  
eval nextAttack replace("%nextAttack", " and ", "|")
eval nextAttack replace("%nextAttack", ".", "") 
eval nextAttack replace("%nextAttack", "a ", "") 
eval nextAttack replace("%nextAttack", "an ", "") 
var nextAttack %nextAttack
eval total count("%nextAttack", "|") 

var index 0
loop:
eval attack element("%nextAttack", %index)
echo %attack
evalmath index %index + 1
pause 1
if %index > %total then goto ResetLoop
goto loop

ResetLoop:
echo Yer Done!