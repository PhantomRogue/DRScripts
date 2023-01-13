#All Magiks
#debug 10
action var ClericMana $1 when  reinforce it with (\d+) more
action var MinPrep $1 when  at minimum (\d+) mana streams 
action var Sleeping 0 when You awaken from your reverie and begin to take in the world around you
action var Sleeping 1 when You draw deeper into rest, trying to destress from a hard 
##action var SleepToggler 1 when eval $Arcana.LearningRate > 25

echo To Skip to Specific Training, .cleric CastAug/CastWard/CastUtil
var SleeperCaster 0
var Sleeping 0

if $Arcana.LearningRate > 20 then var var SleeperCaster 1

goto $charactername

Korlash:
var AugSpell IVM
var AugMana 2
var UtilSpell EOTB
var UtilMana 3
var WardSpell CH
var WardMana 3
var camb armb
var cambCharge 10
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
var AugMana 10
var UtilSpell EOTB
var UtilMana 6
var WardSpell MAF
var WardMana 6
var camb armb
var cambCharge 8
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
var camb squircle
var cambCharge 2
put get my %camb
pause 1
#gosub RitualFocus
pause 1
if_1 gosub %1
goto Looper

Doz:
var AugSpell suf
var AugMana 12
var UtilSpell zeph
var UtilMana 9
var WardSpell es
var WardMana 10
var camb kiwi
var cambCharge 8
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
 ## Cheeky Math to start to pump alot of mana into spells, will use 75% of the Discern Max, 
 ## since we charging twice, getting half that value to charge the Cambrinth
 ## If we run out of mana too fast, we can use 1/3 of the Charge, just change ClericMana divide 2
	put discern $1
	pause 10
	math ClericMana multiply .9
	evalmath ClericMana round(%ClericMana)
	math ClericMana divide 3
	evalmath ClericMana round(%ClericMana)
	var cambCharge %ClericMana
	pause 10
return

exit:
put wear %camb;stow %camb
pause 1
put awake
put #parse MagicTrainComplete
exit

Looper:
	if $Utility.LearningRate < 25 then gosub FirstCastUtil
	if $Augmentation.LearningRate < 25 then gosub FirstCastAug
	if $Warding.LearningRate < 25 then gosub FirstCastWard
	if $Augmentation.LearningRate > 25 && $Warding.LearningRate > 25 && $Utility.LearningRate > 25 then goto exit
goto Looper

FirstCastAug:
	gosub checkSpell %AugSpell
CastAug:
	gosub charge %camb
	gosub cast %AugSpell
	if $Augmentation.LearningRate > 28 then return
	if $charactername = Hintoc then put pray keren
	if $charactername = Lewix then put predict weather
goto CastAug

FirstCastWard:
	gosub checkSpell %WardSpell
CastWard:
	gosub charge %camb
	gosub cast %WardSpell
	if $Warding.LearningRate > 28 then return
	if $charactername = Hintoc then put pray keren
	if $charactername = Lewix then put predict weather
goto CastWard

FirstCastUtil:
	gosub checkSpell %UtilSpell
CastUtil:
	gosub charge %camb
	gosub cast %UtilSpell
	if $Utility.LearningRate > 28 then return
	if $charactername = Hintoc then put pray keren
	if $charactername = Lewix then put predict weather
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
	match charge3 absorbs
	match charge2 You fail
	match focus resists,
	match focus Your harnessed energy dissipates
	match charge2 ...wait
	match pause60 You strain
	matchwait
	
charge3:
	pause
	put charge my %camb %cambCharge
	match focus absorbs
	match charge3 You fail
	match focus resists,
	match focus Your harnessed energy dissipates
	match charge3 ...wait
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
		## Abuse SleepingState to train magic better
	if %Sleeping = 1 then put awake
	pause 1	
	put cast
	pause 2
		## Go check Arcana and Sleeping to see if we need to re-sleep
	gosub Check.Arcana
goto Return

pause60:
	pause 60
goto Return

Return:
	return
	
Check.Arcana:
		## If Arcana is above 25 and we arent sleeping, lets Sleep, else we stay awake
		##		We use Arcana as the check so we dont waste REXP during charging and spell prep  Thanks Damian!
  if $Arcana.LearningRate > 25 && %Sleeping = 0 then put sleep;sleep
  return	


RitualFocus:
	put charge my %camb 10
	pause 10
	put charge my %camb 10
	pause 10
	put charge my %camb 10
	pause 10
	put charge my %camb 10
	pause 10
	put prep pom
	put invoke earc
	waitfor You feel fully pre
	put cast
	pause 1
	waitfor Roundtime
	put wear earc
	pause 1
return