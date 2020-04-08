#All Magiks
action var ClericMana $1 when for a total of (\d+) streams

echo To Skip to Specific Training, .cleric CastAug/CastWard/CastUtil

goto $charactername

Korlash:
var AugSpell IVM
var AugMana 16
var UtilSpell EOTB
var UtilMana 15
var WardSpell CH
var WardMana 10
var camb armb
var cambCharge 2
put remove %camb
if_1 gosub %1
goto Looper


Hixin:
var AugSpell CV
var AugMana 5
var UtilSpell PG
var UtilMana 5
var WardSpell CV
var WardMana 6
var camb ank
var cambCharge 2
put remove %camb
if_1 gosub %1
goto Looper



Yosto:
var AugSpell obfuscation
var AugMana 12
var UtilSpell EOTB
var UtilMana 5
var WardSpell MAF
var WardMana 10
var camb armb
var cambCharge 2
put remove %camb
if_1 gosub %1
goto Looper

Smawkins:
var AugSpell subs
var AugMana 5
var UtilSpell ignite
var UtilMana 5
var WardSpell ES
var WardMana 6
var camb ank
var cambCharge 2
put remove %camb
if_1 gosub %1
goto Looper


Hintoc:
var AugSpell mapp
var AugMana 20
var UtilSpell GAF
var UtilMana 18
var WardSpell mpp
var WardMana 21
var camb pend
var cambCharge 2
if_1 gosub %1
goto Looper

Doz:
var AugSpell suf
var AugMana 12
var UtilSpell zeph
var UtilMana 5
var WardSpell es
var WardMana 13
var camb cambrinth.ring
var cambCharge 2
put remove %camb
if_1 gosub %1
goto Looper


Vedalken:
var AugSpell seer
var AugMana 8
var UtilSpell seer
var UtilMana 8
var WardSpell PSY
var WardMana 12
var camb orb
var cambCharge 2
put remove %camb
if_1 gosub %1
goto Looper

checkSpell:
put discern $1
pause 10
#put #var globalvar #evalmath $globalvar - 1
math ClericMana subtract 4
echo %ClericMana
pause 1
return

exit:
put #parse MagicTrainComplete
exit

Looper:
if $Augmentation.LearningRate < 25 then gosub FirstCastAug
if $Warding.LearningRate < 25 then gosub FirstCastWard
if $Utility.LearningRate < 25 then gosub FirstCastUtil
if $Augmentation.LearningRate > 25 && $Warding.LearningRate > 25 && $Utility.LearningRate > 25 then gosub exit
goto Looper

FirstCastAug:
gosub checkSpell %AugSpell
CastAug:
gosub charge %camb
gosub cast %AugSpell %ClericMana
if $Augmentation.LearningRate > 30 then return
if $charactername = Hintoc then put pray keren
#if $charactername = Hixin then put predict weather
goto CastAug

FirstCastWard:
gosub checkSpell %WardSpell
CastWard:
gosub charge %camb
gosub cast %WardSpell %ClericMana
if $Warding.LearningRate > 30 then return
if $charactername = Hintoc then put pray keren
#if $charactername = Hixin then put predict weather
goto CastWard

FirstCastUtil:
gosub checkSpell %UtilSpell
CastUtil:
gosub charge %camb
gosub cast %UtilSpell %ClericMana
if $Utility.LearningRate > 30 then return
if $charactername = Hintoc then put pray keren
#if $charactername = Hixin then put predict weather
goto CastUtil


charge:
pause
put charge my %camb %cambCharge
match charge2 absorbs
match charge You fail
match focus Your harnessed energy dissipates
match focus resists,
match charge ...wait
match pause60 You strain
match pause60 You strain
matchwait

charge2:
pause
put charge my %camb %cambCharge
match focus absorbs
match charge2 You fail
match focus resists,
match focus Your harnessed energy dissipates
match charge2 ...wait
match pause60 You strain
matchwait

focus:
pause
put invoke my %camb
match Return ready
match focus but fail.
match focus ...wait
match Return intact
match pause60 You strain
matchwait

cast:
pause
put pre $1 $2
match castnow You feel fully pre
match cast ...wait
#match Return You have no idea how to cast that spell
matchwait

castnow:
put cast
goto Return

pause60:
pause 60
goto Return

Return:
return