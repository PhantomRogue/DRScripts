var Melee Halberd|Brawling|Heavy_Edged|Twohanded_Edged|Twohanded_Blunt|Small_Blunt|Medium_Blunt|Heavy_Blunt|Small_Edged|Quarter_Staff|Short_Staff|Pikes|Offhand_Weapon|Large_Edged
var Movement north|south|west|east|northeast|northwest|southeast|southwest
var Numbers 123|1|2|5|12|55|22|11|9|631|1231

var RedirectLoc left hand|right hand|right arm|left arm|left
var CurrentLoc 0
var LocCount 0
include js_arrays.js
action goto LoopData when ^You touch
eval item element("%RedirectLoc", %CurrentLoc)  

start:


goto tester

LoopData:

evalmath LocCount %LocCount + 1
if %LocCount > 4 then evalmath CurrentLoc %CurrentLoc + 1
if %LocCount > 4 then var LocCount 0
eval item element("%RedirectLoc", %CurrentLoc)  

echo %LocCount
echo %item
echo %CurrentLoc
goto start



ACTION var nextAttack $1 WHEN \bby landing (?:a|an) (.*)

put anal hog

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


tester:
eval coinsonground count("$roomobjs", ",")
put echo %coinsonground
