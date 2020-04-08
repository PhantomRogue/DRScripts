put #clear main
setvariable gs avenger
put #class arrive off
put #class combat off
put #class rp on
put #class racial on

put avoid !drag
waitforre ^You're now avoiding

put avoid !hold
waitforre ^You're now avoiding

put avoid !join
waitforre ^You're now avoiding

send ask %gs for leave
waitforre ^With a sad look, (a|an) .+ (avenger|colepexy|dirnel|guardian|narmorbreth|woodwisp)|^To whom are you speaking

send close my compendium
waitforre ^You close|^That is already|^What were

send stow right
waitforre ^You put|^Stow what

send stow left
waitforre ^You put|^Stow what


send open my compendium
pause

put #mapper load Map1_Crossing
put look
action put #queue clear;send $lastcommand when ^(\.\.\.wait|Sorry,)

goto PERC1

COMP:
if ($Scholarship.LearningRate >= 34) && ($First_Aid.LearningRate >= 34) || ($First_Aid.LearningRate >= 34) then goto MAGIC
if ("$righthandnoun" = "$cambrinth") then put stow my $cambrinth
put get my compendium
waitforre o
put turn my compendium
waitforre o
put study my compendium
wait
pause .2
goto HPERC

MAGIC:
if ($mana < 85) then goto APPRAISE
else if ($Attunement.LearningRate >= 34) && ($Arcana.LearningRate >= 34) && ($Primary_Magic.LearningRate >= 34) then goto COMP
if ("$righthandnoun" = "compendium") then put stow my compendium
send stop play
waitforre ^You stop playing your song|^In the name of love|^But you're not performing anything
put prep GS
wait
put charge my $cambrinth 11
waitfor Roundtime
pause .1
pause .1
send invoke my $cambrinth
gs1:
pause 2
match gs2 not understanding your question.
match castgs1 ^With a sad look
put ask %gs for leave
castgs1:
matchwait 1.5
put cast %gs
waitforre ^With a warrior's calm|^With a gracious smile|^A spotted fungus colepexy gracefully flitters into the area^Howling, a hairy dog-faced dirnel bounds in^A salty bulbous-eyed narmorbreth swims in|^Your heart skips a beat, but you are unable
goto HPERC
gs2:
pause 2
match gs3 not understanding your question.
match castgs2 ^With a sad look
put ask second %gs for leave
castgs2:
matchwait 1.5
put cast %gs
waitforre ^With a warrior's calm|^With a gracious smile|^A spotted fungus colepexy gracefully flitters into the area^Howling, a hairy dog-faced dirnel bounds in^A salty bulbous-eyed narmorbreth swims in|^Your heart skips a beat, but you are unable
goto HPERC

gs3:
pause 2
match gs1 not understanding your question.
match castgs3 ^With a sad look
put ask second %gs for leave
castgs3:
matchwait 1.5
put cast %gs
waitforre ^With a warrior's calm|^With a gracious smile|^A spotted fungus colepexy gracefully flitters into the area^Howling, a hairy dog-faced dirnel bounds in^A salty bulbous-eyed narmorbreth swims in|^Your heart skips a beat, but you are unable
goto HPERC

APPRAISE:
if ($Appraisal.LearningRate >= 34) then goto FORAGE
if matchre ("$monsterlist", "(%gs)") then goto APPRAISE2
waitforre ^With a warrior's calm|^With a gracious smile|^A spotted fungus colepexy gracefully flitters into the area^Howling, a hairy dog-faced dirnel bounds in^A salty bulbous-eyed narmorbreth swims in
APPRAISE2:
send appraise %gs quick
wait
pause
return
goto HPERC

FORAGE:
if ($Perception.LearningRate >= 34) then goto OTHER
send collect torn cloth
wait
pause
send collect torn cloth
wait
pause
KICK:
send kick pile
waitforre Assuming you mean a pile|^I could not find what you were referring to
send kick pile
waitforre Assuming you mean a pile|^I could not find what you were referring to
goto HPERC

OTHER:
pause 5
goto HPERC

HPERC:
pause .5
match %s You're not ready to do that again, yet.
match RETURN You close your eyes, drawing all your thoughts inward,
put perceive health
matchwait

PHMOVE:
pause .5
put #mapper walk %ROOMID
waitfor %ROOMDESC
pause .5
return

RETURN:
pause .5
return

PERC1:
save FORAGE
var ROOMID 218
var ROOMDESC Ragge's Locksmithing, Salesroom
gosub PHMOVE
gosub HPERC

PERC2:
save COMP
var ROOMID 426
var ROOMDESC The True Bard D'Or, Fine Instruments
gosub PHMOVE
gosub HPERC

PERC3:
save MAGIC
var ROOMID 23
var ROOMDESC The Crossing, Town Green Southwest
gosub PHMOVE
gosub HPERC

PERC4:
save APPRAISE
var ROOMID 192
var ROOMDESC Tembeg's Armory, Salesroom
gosub PHMOVE
gosub HPERC

PERC5:
save FORAGE
var ROOMID 14
var ROOMDESC The Crossing, Town Green North
gosub PHMOVE
gosub HPERC

PERC6:
save COMP
var ROOMID 191
var ROOMDESC Milgrym's Weapons, Showroom
gosub PHMOVE
gosub HPERC

PERC7:
save MAGIC
var ROOMID 15
var ROOMDESC The Crossing, Town Green Southeast
gosub PHMOVE
gosub HPERC

PERC8:
save APPRAISE
var ROOMID 189
var ROOMDESC Berolt's Dry Goods, Showroom
gosub PHMOVE
gosub HPERC

PERC9:
save FORAGE
var ROOMID 330
var ROOMDESC Town Hall, Citizenship Registration Office
gosub PHMOVE
gosub HPERC

PERC10:
save COMP
var ROOMID 341
var ROOMDESC Town Hall, Lottery Office
gosub PHMOVE
gosub HPERC

PERC11:
save MAGIC
var ROOMID 342
var ROOMDESC Town Hall, Genealogy Office
gosub PHMOVE
gosub HPERC

PERC12:
save APPRAISE
var ROOMID 394
var ROOMDESC Grisgonda's Gems and Jewels
gosub PHMOVE
gosub HPERC

PERC13:
save FORAGE
var ROOMID 621
var ROOMDESC MAMAS Company, Main Office
gosub PHMOVE
gosub HPERC

PERC14:
save COMP
var ROOMID 228
var ROOMDESC Catrox's Forge, Entryway
gosub PHMOVE
gosub HPERC

PERC15:
save MAGIC
var ROOMID 461
var ROOMDESC Marcipur's Stitchery, Workshop
gosub PHMOVE
gosub HPERC

PERC16:
save APPRAISE
var ROOMID 462
var ROOMDESC Talmai's Cobblery, Salesroom
gosub PHMOVE
gosub HPERC

PERC17:
save FORAGE
var ROOMID 797
var ROOMDESC The Bottom Line
gosub PHMOVE
gosub HPERC

PERC18:
save COMP
var ROOMID 894
var ROOMDESC Paladins' Guild, Stable
gosub PHMOVE
gosub HPERC

PERC19:
save MAGIC
var ROOMID 668
var ROOMDESC Hameel's Carpet Emporium
gosub PHMOVE
gosub HPERC

PERC20:
save APPRAISE
var ROOMID 796
var ROOMDESC Elite Architecture
gosub PHMOVE
gosub HPERC

PERC21:
save FORAGE
var ROOMID 226
var ROOMDESC Chizili's Alchemical Goods, Salesroom
gosub PHMOVE
gosub HPERC

PERC22:
save COMP
var ROOMID 219
var ROOMDESC Mauriga's Botanicals, Salesroom
gosub PHMOVE
gosub HPERC

PERC23:
save MAGIC
var ROOMID 405
var ROOMDESC The Crossing, Mongers' Square
gosub PHMOVE
gosub HPERC

PERC24:
save APPRAISE
var ROOMID 492
var ROOMDESC Taelbert's Inn, Tack Storage
gosub PHMOVE
gosub HPERC

PERC25:
save FORAGE
var ROOMID 125
var ROOMDESC The Crossing, Fostra Square
gosub PHMOVE
gosub HPERC

PERC26:
save COMP
var ROOMID 220
var ROOMDESC Falken's Tannery, Workshop
gosub PHMOVE
gosub HPERC

PERC27:
save MAGIC
var ROOMID 222
var ROOMDESC Falken's Tannery, Supply Room
gosub PHMOVE
gosub HPERC

PERC28:
save APPRAISE
var ROOMID 494
var ROOMDESC Bards' Guild, Commons
gosub PHMOVE
gosub HPERC

PERC29:
save FORAGE
var ROOMID 459
var ROOMDESC Cormyn's House of Heirlooms
gosub PHMOVE
gosub HPERC

PERC30:
save COMP
var ROOMID 356
var ROOMDESC Exterior Motives
gosub PHMOVE
gosub HPERC

PERC31:
save MAGIC
var ROOMID 771
var ROOMDESC Viper's Nest, The Pit
gosub PHMOVE
gosub HPERC

PERC32:
save APPRAISE
var ROOMID 223
var ROOMDESC Herilo's Artifacts, Showroom
gosub PHMOVE
gosub HPERC

PERC33:
save FORAGE
var ROOMID 357
var ROOMDESC Traders' Guild, Main Hall
gosub PHMOVE
gosub HPERC

PERC34:
save COMP
var ROOMID 575
var ROOMDESC The Raven's Court, Membership Desk
gosub PHMOVE
gosub HPERC

PERC35:
save MAGIC
var ROOMID 763
var ROOMDESC Ulven's Warehouse, Storage
gosub PHMOVE
gosub HPERC

gosub skill.check
goto PERC1

skill.check:
if $Empathy.LearningRate > 33 then
goto end
else
return

end:
send echo YOU ARE MIND LOCKED IN EMPATHY.
put #play MindLocked
put #class arrive on
put avoid all
waitforre ^All AVOID options cleared
send ask %gs for leave
waitforre ^With a sad look, (a|an) .+ (avenger|colepexy|dirnel|guardian|narmorbreth|woodwisp)|^To whom are you speaking
send close my compendium
waitforre ^You close|^That is already|^What were
send stow right
waitforre ^You put|^Stow what
send stow left
waitforre ^You put|^Stow what
put #mapper walk Empaths' Guild
waitfor Empaths' Guild, Main Room