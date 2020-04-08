action put #queue clear; send 1 $lastcommand when ^\.\.\.wait|^Sorry, you may only type

action var CONTENTS $1 when ^You rummage through .+ and see (.*)\.  
action var GEM_VALUE $1 when ^You are certain that the .+ worth exactly (\d+) \w+\.$

action var PG 1 when ^The world around you brightens considerably.
action var PG 1 when ^The world around you wavers briefly, then brightens considerably.
action var PG 0 when ^The world around you returns to its mundane appearance.
var PG 0

var GEMPOUCH purple pouch
send stow left
pause 0.5
send stow right
pause 0.5
CG_RUMMAGE:
ECHO *
ECHO * Building Array for Gems from Pouch
ECHO *
pause 0.5
 send rummage my %GEMPOUCH
 waitforre ^You rummage 
 
 eval CONTENTS replace("%CONTENTS", ", ", "|")  
 eval CONTENTS replace("%CONTENTS", " and ", "|")  
 var CONTENTS |%CONTENTS| 
 eval CG_POUCH_TOTAL count("%CONTENTS", "|")  
 echo %CG_POUCH_TOTAL 

 Loop:
	
        eval GEM element("%CONTENTS", 1)  
        eval number count("%CONTENTS", "|%GEM")  
        var count 0
        gosub RemoveLoop
        action var GEM $1 when ^@a .* (\S+)$
        put #parse @%GEM
        counter set %count
        gosub GET_GEM
        if %CONTENTS != "|" then goto Loop
		CG_CLEANUP:
		unvar PG
		unvar BEFORE
		unvar DIFFERENCE
		unvar GEM_PERCENT
		unvar GEM_INCREASE
		unvar GEM_VALUE 
		unvar CONTENTS
		unvar GEM
		unvar CG_POUCH_TOTAL
       		exit  

           
 RemoveLoop: 
         eval number count("%CONTENTS", "|%GEM|") 
         eval CONTENTS replace("%CONTENTS", "|%GEM|", "|") 
         eval CONTENTS replace("%CONTENTS", "||" "|") 
         evalmath count %count + %number 
         if !contains("%CONTENTS", "|%GEM|") then return 
         goto RemoveLoop




GET_GEM:
if %c = 0 then return
echo *** Checking for PG on self
if ("%PG" != "1") then goto CAST_PG_SELF
ECHO *** Checking moons
if $Time.isKatambaUp = 1 then goto GET_GEM_1
if $Time.isXibarUp = 1 then goto GET_GEM_1
if $Time.isYavashUp = 1 then goto GET_GEM_1
goto NO_MOONS

GET_GEM_1:
ECHO *
ECHO * Getting out a gem!
ECHO *
send get %GEM from %GEMPOUCH
counter subtract 1
ECHO *
ECHO * Getting Initial Gem Apprasial
ECHO *
goto PG_GEM

manawait:
pause 10
if ("%PG" != "1") then goto CAST_PG_SELF


PG_GEM:
CAST_CG:
if ($righthandnoun = "nugget" or $righthandnoun = "bar" or $righthandnoun = "stones") then goto STOW_GEM
if ($lefthandnoun = "nugget" or $lefthandnoun = "bar" or $lefthandnoun = "stones") then goto STOW_GEM
pause 0.5
ECHO *
ECHO * Going to Clarify the Gem now!
ECHO *
if $mana < 70 then goto manawait
send prepare cg 30
pausesend predict weather
waitfor You feel fully prepa
send harn 10
pause 4
match NO_MOONS You need a visible moon for this.
match CAST_PG_SELF inner structure, you are unable to improve its quality.
match CAST_CG backfires
matchre STOW_GEM (There's not much to see in there|You can't clarify)
match STOW_GEM gleams with new luster.
match GEM_SHATTERED shatters!
send cast %GEM
matchwait

GEM_SHATTERED:
ECHO *
ECHO * Ouch, it shattered!
ECHO *
pause 0.5
send release
goto GET_GEM

CAST_PG_SELF:
ECHO *
ECHO * Oh noes!  I don't have Piercing Gaze up, casting it!
ECHO *
pause
put pre pg 
waitfor You feel fully prepared to cast your
send harn 10
pause 4
send cast
pause 3.5
goto GET_GEM


NO_MOONS:
echo ***********
echo **NO MOON**
echo ***********
send put %GEM in my purp pouch
goto RemoveLoop

STOW_GEM:
ECHO *
ECHO * Getting Apprasial for after it was Clarified!
ECHO *
send put %GEM in my blue pou
pause 0.5
goto GET_GEM


