####################################################
###                                              ###
###              TRIGGERS                        ###
###                                              ###
###                                              ###
###     Yosto Hunter, Does not loot Boxes        ###
###      Does One loop, then will exit           ###
###        Used specifically for YostoTrain      ###
###                                              ###
###   If you want an AFK hunter, use .1hunter    ###
###                                              ###
####################################################
action put quit when $health < 40
action put #beep when says
action put #beep when whispers
action put #beep when hugs
action put #beep when grins
action put #beep when waves to You
action put #beep when waves at You
action put #beep when winks at You
action put #beep when You can use RESPOND
action put #beep when shakes You
action put #beep when leans on You
action send stand when $prone = 1
action send stand when $standing = 0
action put stow left;\pstow right;\p%lastcommand when Free up your hands first
action put tend my $1 when the bandages binding your (left arm|right arm|left hand|right hand|left leg|right leg|chest|abdomen|back|head|neck|left eye|right eye)
action goto Dead when your death cry echoes
action goto Dead when You are a ghost
action goto Panic when (You're badly hurt, |You're smashed up,|You're very badly hurt)
action goto Panic when (You're near death,|You're terribly wounded,|You're very beat up)
action put tend my $1 when The bandages binding your (left arm|right arm|left hand|right hand|left leg|right leg|chest|abdomen|back|head|neck|left eye|right eye)
action setvariable KillTime YES when BACKSTABTHISSHIT
action put #queue clear; send 1 $lastcommand when ^\.\.\.wait|^Sorry, you may only type
action send $lastcommand when ^You are still stunned
action var debil.target $1 when are facing (?:a|an)(.*) (?:\(\d\)\s) 
action var Guild $1;put #var Guild $1 when Guild:\s+(Barbarian|Bard|Cleric|Commoner|Empath|Moon Mage|Necromancer|Paladin|Ranger|Thief|Trader|Warrior Mage)$

put info
pause 5


if $Guild = Necromancer then include NecroHealer.cmd
asdasdasdasd:
put perc
pause

var KillTime YES

var gems1 agate|alexandrite|amber|amethyst|andalusite|aquamarine|bead|beryl|bloodgem|bloodstone|carnelian|chrysoberyl|carnelian|chalcedony|platinum bar|copper bar|silver bar|gold bar
var gems2 chrysoberyl|chrysoprase|citrine|coral|crystal|diamond|diopside|emerald|egg|eggcase|garnet|gem|goldstone|glossy malachite
var gems3 (chunk of|some|piece of).*granite|hematite|iolite|ivory|jade|jasper|kunzite|lapis lazuli|malachite stone|minerals|moonstone|morganite|gold nugget|onyx|platinum nugget|bronze nugget
var gems4 opal|pearl|pebble|peridot|quartz|ruby|sapphire|spinel|star-stone|sunstone|talon|tanzanite|topaz|tourmaline|tsavorite|turquoise|zircon
var metal1 Animite nugget|Audrualm nugget|Damite nugget|Darkstone nugget|Electrum nugget|Glaes nugget|Gold nugget|Haralun nugget|Icesteel nugget|Kertig nugget|Lumium nugget|Muracite nugget|Niello nugget|Niniam nugget|Orichalcum nugget|Platinum nugget|Silversteel nugget|Tyrium nugget|Vardite nugget|silver nugget
var metal2 Animite bar|Audrualm bar|Damite bar|Darkstone bar|Electrum bar|Glaes bar|Gold bar|Haralun bar|Icesteel bar|Kertig bar|Lumium bar|Muracite bar|Niello bar|Niniam bar|Orichalcum bar|Platinum bar|Silversteel bar|Tyrium bar|Vardite bar
var junkloot tooth|barbed arrow|scroll|tablet|vellum|sheiska leaf|ostracon|hhr'lav'geluhh bark|papyrus roll|smudged parchment|package|cebi root|flights|hisan salve|rock|map|jadice flower| rock|erythrite runestone|keyblank|bola|swallow-winged bolt
var arrowloot drake-fang arrow|razor-tipped arrow|silver-tipped arrow|lemon yellow arrow|bodkin arrow|angiswaerd arrow|hele'la head arrow|basilisk head arrow|cobalt blue arrow|claw-tipped arrow|stone-tipped arrow
var boltloot drake-fang bolt|flint-tipped bolt|crossbow bolt|basilisk bolt|soot-stained bolt
var coins gold coins|silver coins|bronze coins|platinum coins|gold coin|silver coin|bronze coin|platinum coin
var boxloot trunk,|box,|casket,|coffer,|crate,|chest,|skippet,|caddy,

##Monster Variables
var monsters1 gidii|goblin shaman|fendryad|nyad|madman|sprite|wood troll|lipopod|kelpie|vykathi builder|vykathi excavator|purifier
var monsters2 fire maiden|creeper|vine|thug|ruffian|footpad|cutthroat|gypsy marauder|young ogre|swain|kra'hei hatchling
var monsters3 nipoh oshu|dyrachis|shadoweaver|crag|frostweaver|atik'et|dryad|orc scout|eviscerator|guardian|pirate
var monsters4 geni|orc bandit|umbramagii|screamer|scout ogre|swamp troll|mountain giant
var monsters5 scavenger troll|sleazy lout|bucca|dragon fanatic|dusk ogre|tress|bloodvine
var monsters6 armored warklin|velver|orc reiver|kra'hei|dragon priest|lun'shele hunter|orc raider|folsi immola
var monsters7 faenrae assasin|telga moradu|trekhalo|orc clan chief|shadow master|malchata|sky giant|imp|dummy|fine ash|murky puddle

var undead1 skeleton|soul|boggle|wind hound|fiend|spirit|ur hhrki'izh|spectral pirate|spectral sailor|shylvic|zombie stomper
var undead2 skeleton kobold savage|skeleton kobold headhunter|skeletal sailor|olensari mihmanan
var undead3 emaciated umbramagus|zombie nomad|sinister maelshyvean heirophant|gargantuan bone golem|plague wraith|snaer hafwa|wir dinego
var undead4 skeletal peon|revivified mutt|origami bird|origami cow|origami dragon|origami duck|origami goblin|origami grasshopper|origami hat|origami mouse|origami sprite|origami yak|origami paper

var skinnablemonsters1 frog|silverfish|musk hog|grub|crayfish|burrower|crab|boar|skunk|badger|pothanit|trollkin
var skinnablemonsters2 kobold|s'lai scout|jackal|bobcat|cougar|grass eel|bear|ram|spider|wolf|boobrie|beisswurm|rock troll|sluagh
var skinnablemonsters3 serpent|firecat|vulture|arbelog|caiman|steed|larva|snowbeast|worm|unyn|gargoyle|crocodile
var skinnablemonsters4 merrows|viper|peccary|la'tami|barghest|angiswaerd hatchling|vykathi harvester|pard|moth|kartais
var skinnablemonsters5 la'heke|vykathi soldier|boa|warcat|moda|arzumo|carcal|blood warrior|goblin|cave troll|black ape
var skinnablemonsters6 rat|antelope|giant blight bat|leucro|wasp|mottled westanuryn|blight ogre|gryphon|caracal|basilisk
var skinnablemonsters7 dobek moruryn|sinuous elsralael|sleek hele'la|marbled angiswaerd|retan dolomar|faenrae stalker
var skinnablemonsters8 shadow beast|cinder beast|asaren celpeze|spirit dancer|scaly seordmaor|poloh'izh|armadillo|shalswar|brocket deer|razortusk sow|razortusk boar

var skinnableundead1 ghoul|squirrel|grendel|reaver|mey|shadow hound|lach|mastiff|gremlin
var skinnableundead2 zombie kobold savage|zombie kobold headhunter|ghoul crow|misshapen germish'din

var invasioncritters transmogrified oaf|flea-ridden beast|Prydaen|Rakash|bone warrior|shambling horror|skeletal peon|revivified mutt|putrefying shambler

var skinnablecritters %skinnablemonsters1|%skinnablemonsters2|%skinnablemonsters3|%skinnablemonsters4|%skinnablemonsters5|%skinnablemonsters6|%skinnablemonsters7|%skinnablemonsters8|%skinnableundead1|%skinnableundead2
var nonskinnablecritters %monsters1|%monsters2|%monsters3|%monsters4|%monsters5|%monsters6|%monsters7|%undead1|%undead2|%undead3|%undead4

var critters %nonskinnablecritters|%skinnablecritters|%invasioncritters

var Ranged Light_Crossbow|Heavy_Crossbow|Short_Bow|Long_Bow|Composite_Bow|Bow|Crossbow|Bow
var Thrown Light_Thrown|Heavy_Thrown
var Melee Halberd|Brawling|Heavy_Edged|Twohanded_Edged|Twohanded_Blunt|Small_Blunt|Medium_Blunt|Heavy_Blunt|Small_Edged|Quarter_Staff|Short_Staff|Pikes|Offhand_Weapon|Large_Edged
var Magic Targeted_Magic|Primary_Magic
var ExpertiseWeapons Expertise

## ExpertiseSets
var expEdge Small_Edged|Large_Edged|Twohanded_Edged
var expBlunt Small_Blunt|Large_Blunt|Twohanded_Blunt|Light_Thrown|Heavy_Thrown
var expStaff Staves
var expRanged Bow|Crossbow
var expBrawling Brawling
## End ExpertiseSets

var CurrentType
var ArrayIndex 0
var changed 0
var BackstabFull No
var CurrentStance Parry
var PowPerc No
var CompCounter 0
var WearBow On
var BowHide No

## Cyclic Toggles
var DEBIL.CYCLIC.ON 0
var SPELL.CYCLIC.ON 0

#####################################################
###                                               	#
###             VARIABLES                         	#
###                                               	#
###		Parameter1 - Hunter Type 					#
###						- BackTrain2HE				#
###						- BackTrainOtherShit		#
###		Parameter2 - Yes/No 						#
###						Loop or Just Once			#
###													#
#####################################################


var DoNecroHealing No
if_1 then goto %1

BackTrain2HE:
	var SkipHide No
	setvariable weapons claymore
	setvariable WSkill Twohanded_Edged
	goto goon

BackTrainOtherShit:
	var SkipHide Yes
	var BackstabFull No
	setvariable weapons broad|club|crossbow|broad
	setvariable WSkill Heavy_Thrown|Light_Thrown|Crossbow|Large_Edged
	goto goon


Ranged:
if $charactername = Koiln then setvariable weapons bow
else setvariable weapons bow
if $charactername = Koiln then setvariable WSkill Bow
else setvariable WSkill Bow
goto goon

BackTrain:
setvariable weapons truncheon|chain|club|sap
setvariable WSkill Short_Staff|Heavy_Blunt|Medium_Blunt|Light_Blunt
goto goon

goon:
if_4 then var ArrayIndex %4
eval total count("%weapons", "|")
eval result element("%weapons", %ArrayIndex)
eval skill element("%WSkill", %ArrayIndex)
gosub SetupWeapons
timer start
counter set 1

Start:
goto Loop

######################################################
###                                                ###
###                MAIN LOOP                       ###
###                                                ###
######################################################

Loop:
if %total > 0 then gosub loopArray
gosub CritterCheck
gosub StanceCheck
if $Appraisal.LearningRate < 31 then gosub Appraise
if $Guild = "Cleric" or $Guild = "Warrior Mage" or $Guild = "Necromancer" or $Guild = "Paladin" or $charactername = Lewix then gosub DebilCast
if %WeaponType = "Magic" then gosub Magic_Kill
else if %WeaponType = "Thrown" then gosub Throw_Kill
else if %WeaponType = "Ranged" then gosub Ranged_Kill
else if %BackstabFull = "Yes" or (%SkipHide = "No"  && ($Stealth.LearningRate < 28 && %WeaponType = "Melee")) then gosub kill_hide
else if %WeaponType = "Melee" && (%SkipHide = "Yes"  || (%WeaponType = "Melee" && $Stealth.LearningRate > 27)) then gosub Kill
gosub dodge
if %skill = Bow && %WearBow = Off then gosub RangedPrep
gosub Search
gosub Loot
goto Loop

dodge:
put dod
pause 1
return

###################################################################
###
###     Cast Per Mob
###   Changable in the Settings for the Character
###
###################################################################
DebilCast:
if DEBIL.CYCLIC.ON = 1 then goto returnc
put prep %DEBIL
match castdebil You feel fully prepared
match returnc You have no idea how to cast that spell
match DebilCast lost the spell you were
match redodebil You have already
matchwait
castdebil:
put cast
if DEBIL.CYCLIC = 1 then var DEBIL.CYCLIC.ON 1
match fnCast You can't cast that at yourself!
match returnc Maintaining two cyclic spells at once is beyond your mental comprehension, and the pattern dissipates
match returnc Roundtime
matchwait
returnc:
pause 2
return
redodebil:
put rel
pause .5
goto DebilCast

fnCast:
put face next;cast
goto returnc

TacticsTrain:
put circl
pause 5
put circl
pause 5
put circl
pause 5
put circl
pause 5
return

StanceCheck:
if $Shield_Usage.LearningRate < 30 then put stance shie
if $Shield_Usage.LearningRate > 29 then put stance parr
#if %ScriptType = "VKill" then put stance parr
if %skill = "Light_Thrown" || %skill = "Heavy_Thrown" || %skill = "Crossbow" || %skill = "Brawling" || %skill = "Bow" then put stance shie
return


SetupWeapons:
	eval result element("%weapons", %ArrayIndex)
	eval skill element("%WSkill", %ArrayIndex)
	if matchre ("%Ranged", "%skill") then var WeaponType Ranged
	if matchre ("%Thrown", "%skill") then var WeaponType Thrown
	if matchre ("%Melee", "%skill") then var WeaponType Melee
	if matchre ("%Magic", "%skill") then var WeaponType Magic	
	gosub Setup_%WeaponType	
return

BSChecker:
	matchre THE two-handed edged (weapon|grip)
	matchre HE heavy edged (weapon|grip)
	put swap my %result
	matchwait
THE:
	if %skill = "Twohanded_Edged" then goto BSMoveOn
	if %skill = "Large_Edged" then goto SwapAgain
HE:
	if %skill = "Twohanded_Edged" then goto SwapAgain
	if %skill = "Large_Edged" then goto BSMoveOn
	
SwapAgain:
	put swap my %result
BSMoveOn:
	return
	
Setup_Magic:
	var HangBack Off
	pause 1
	put stance shie
	pause .5
	put wie b s
	return

Setup_Melee:
	pause .5
	var HangBack Off
	put wear right;stow right
	pause 1
	if %ScriptType = BackTrain || %skill = Brawling then put stance eva
	else put stance parr
	put wie %result
	if %result = "bastard sword" || %result = "broadax" then gosub BSChecker
	return
	
Setup_Thrown:
	pause .5
	var HangBack Off
	put stow right;wear right
	pause 1
	if %ScriptType = BackTrain then put stance eva
	else put stance shie
	pause 1
	put wie %result;get %result
	pause 1
	return
	
Setup_Ranged:
	if %result = "bow" || %result = "longbow" then var HangBack On
	if %result = "bow" || %result = "longbow" then var WearBow Off
	else var HangBack Off
	put stow right;wear right
	pause
	if %ScriptType = BackTrain || $charactername = Wecht then 
	{
		pause .5
		put stance eva
	}
	else 
	{
		put stance shie
		pause .5
	}
	put remove %result;get %result
	pause
	return

loopArray:
	if $%skill.LearningRate > 26 then 
	{
		math ArrayIndex add 1
		if %skill = Bow then put get shie;wear shie
		gosub SetupWeapons
	}
	if %ArrayIndex > %total then gosub HOLD
	pause .5
	return	

HOLD:
## Script completed a loop, If we sent Parameter2 then We stop, else we loop
if_2 then
{
	put #parse HUNTINGISDONE
	put #script abort vhunter
}
else
{
	var ArrayIndex 0
	gosub SetupWeapons
}


return

CritterCheck:
if %skill = Bow && %WearBow = Off then gosub RangedPrep
gosub HuntTime
gosub BuffCheck
if $monstercount > 1 then return	
pause 2
goto CritterCheck

RangedPrep:
var WearBow On
put wear %result
var FirstRange ON
return

Search:
var Necrofied 0
pause .5
if matchre ("$roomobjs", "(%skinnablecritters) ((which|that) appears dead|\(dead\))")) then goto ArrangeStuff
arrstuffdone:
if %Necrofied = 0 && $Guild = Necromancer then goto NecroStuff
pause .5
put loot treasure
var Necrofied 0
pause
gosub Loot 	 
return

NecroStuff:
if matchre ("$roomobjs", "(%critters) ((which|that) appears dead|\(dead\))") then goto SEAR_MONSTER
return

SEAR_MONSTER:
var Mob $1
var Necrofied 1
if %DoNecroHealing = "Yes" then gosub CheckHealth
if $Guild == Necromancer && $Thanatology.LearningRate < 25 then put perf diss on %Mob
else gosub CheckHealth
pause
goto FromNecroSkin

SkinPrep:
put she %weapon;wie knife
pause
return

HuntPrep:
put she knife;wie %weapon
pause
return

SkinStuff:
put skin
pause 3
put stow left

## If we are backtraining (Future proof the script incase I use this for other shit), we are checking the Parameter1 for looting boxes or just gems/coins, AKA Backtraining, we arent getting boxes
if_1 then put loot treasure
else put loot goods
pause .5
put exp
return

ArrangeStuff:
#if $charactername = Cernrec then goto skinit
var sCritter $1
if $charactername = "Vakroth" then goto Bone_Prep
ArrangeStuff1:
NoBones:
matchre arrstuffdone corpse is worthless now|Arrange what|^You might want to kill it first|what?|cannot be|so you can't arrange it either
matchre skinit has already been arranged|don't know how to do that
matchre ArrangeStuff1 Roundtime|You can't do that while entangled in a web
if $Outfitting.Ranks > 50 then put arrange all 
if $Outfitting.Ranks < 50 then put arrange
matchwait

Bone_Prep:
put arrange all for bones
match skinit Roundtime 
match NoBones cannot produce bones
match arrstuffdone cannot be skinned, so you can't arrange it either
matchwait

skinit:
pause
if $Guild == Necromancer then goto NecroStuff
#if $Guild == Necromancer && $Thanatology.LearningRate < 33 then put perf diss on %sCritter
#else put skin
FromNecroSkin:
put skin
pause 3
if %skill = "Brawling" then put empty right
else put empty left
goto arrstuffdone

goback:
pause .5
return


#########################################################
###                                                   ###
###               Appraise LOOP                       ###
###                                                   ###
#########################################################
Appraise:
if matchre ("$monsterlist", "(%critters)") then goto AppIt
else return
AppIt:
put app $1 quick
pause
return



#########################################################
###                                                   ###
###                BUFF LOOP                          ###
###                                                   ###
#########################################################

BuffCheck:

if $charactername = Lewix then
{
	if $INST = "OFF" then gosub rebuff INST 10
	if $STW = "OFF" then gosub rebuff STW 10
}

if $charactername = Smawkins then
{
 if $ES = "OFF" then gosub ReBuff ES 3
}

if $charactername = Korlash then
{
	if $OBFUSCATION = "OFF" then gosub ReBuff OBFUSCATION 2 10 10
	if $PHP = "OFF" then gosub ReBuff PHP 5 10 10
	if $OBFUSCATION = "OFF" then gosub ReBuff OBFUSCATION 5 5
	if $CH = "OFF" then gosub ReBuff CH 10 2 2
}

if $charactername = Yosto then
{
	if $OBFUSCATION = "OFF" then gosub ReBuff OBFUSCATION 5 5
	if $MAF = "OFF" then gosub ReBuff MAF 5 5
#	if $CH = "OFF" then gosub ReBuff CH 10 2 2
	
}

if $charactername = Vakroth then
{
	if %PROW = "OFF" then gosub Khri Prow
	if %ELUS = "OFF" then gosub Khri elus
	if %STRIKE = "OFF" then gosub Khri strike
	if %FLIGHT = "OFF" then gosub Khri flight
	if %HASTEN = "OFF" then gosub Khri hasten
}

if $charactername = Hintoc then
{
	if $MAPP = "OFF" then gosub ReBuff MAPP 5 7
	if $MPP = "OFF" then gosub ReBuff MPP 5 8
}

if $charactername = Hixin then
{
	if $DRAGON = "OFF" then gosub ReForm dragon
	if $EAGLE = "OFF" then gosub ReForm Eagle	
}

if $charactername = Gilthwerp then
{
	if $DRAGON = "OFF" && %WeaponType = "Melee" then gosub ReForm dragon
	if $EAGLE = "OFF" && %WeaponType = "Ranged" then gosub ReForm Eagle
	#if $MONKEY = "OFF" then gosub ReForm monkey
	#if $health < 40 then gosub Berserk Famine
	if $stamina < 60 then gosub Berserk aval
}

if $charactername = Vedalken then 
{
	#if $SOD = "OFF" then gosub ReBuff SOD 20 5
	if $SH = "OFF" then gosub ReBuff SH 5
	else if $SEER = "OFF" then gosub ReBuff SEER 10
	#else if $MAF = "OFF" then gosub ReBuff MAF 30 7
}

if $charactername = Doz then 
{
	if $SUF = "OFF" then gosub ReBuff SUF 10
	if $ES = "OFF" then gosub ReBuff ES 10
	
}
if $charactername = Ciravassus || $charactername = Iakku then
{
	if $STW = "OFF" then gosub ReBuff STW 9 1
	#else if $HOL = "OFF" then gosub ReBuff HOL 10 5
	#else if $SOTT = "OFF" then gosub ReBuff SOTT 5

}
if $charactername = Coleman then
{
	if $FAE = "OFF" then gosub rebuff FAE 1
}

return
Khri:

put khri $1
pause 3
return

Berserk:
put bers $1
return

ReForm:
put form start $1
pause 2
return

Sing:
put sing $1
return

ReBuffCOL:
put #var moonup 0
if $Time.isKatambaUp = 1 then put #var moonup Kat
else if $Time.isXibarUp = 1 then put #var moonup Xib
else if $Time.isYavashUp = 1 then put #var moonup Yav
if $moonup = 0 then return
put prep col 10
put harn 10
pause 5
put harn 10
pause 5

put cast $moonup

pause 2
return


ReBuff:
if %HangBack = "On" then put ret
put prep $1 $2
pause 6
put harn $3
pause 5
put harn $3
pause 5
waitfor You feel fully
put cast
return


#########################################################
###                                                   ###
###             Expertise Training                    ###
###                                                   ###
#########################################################

ExpertiseTrain:
	if matchre ("%expRanged", "%skill") then goto ExpRangedTrain
	if matchre ("%expBlunt", "%skill") then goto ExpBluntTrain
	if matchre ("%expEdge", "%skill") then goto ExpEdgeTrain
	if matchre ("%expStaff", "%skill") then goto ExpStaffTrain
	if matchre ("%expBrawling", "%skill") then goto ExpBrawlTrain

GetExp:
 put get %result
 pause .5
 goto ExpertiseTrain
	
ExpBrawlTrain:
	put mane palm
	match Return rest a bit longer
	match Return balance]
	match Return balanced]
	match Return Roundtime
	matchwait
	
	
ExpRangedTrain:
 match ExpRangedTrain ...wait
 match powershotIt to load the
 match powershotIt already loaded
 match Return You don't have the proper ammunition
 match Return cannot manage to load your
 match Return You are still stunned
 put load
 matchwait

powershotIt:
	put mane powershot
	match Return rest a bit longer
	match Return balance]
	match Return balanced]
	match Return Roundtime
	match Return expert skill
	match Return maneuver
	match Return Your errant 
	match Return twang
	matchwait
	
ExpBluntTrain:
	put mane crash
	match Return rest a bit longer
	match GetExp With your fist
	match Return balance]
	match Return balanced]
	match Return Roundtime
	matchwait
	
ExpEdgeTrain:
	put mane cleave
	match weapondropped With your fist? 
	match Return rest a bit longer
	match Return balance]
	match Return balanced]
	match Return Roundtime
	matchwait

weapondropped:
	put get %result
	goto ExpEdgeTrain
	
ExpStaffTrain:
	put mane twirl
	match Return rest a bit longer
	match Return balance]
	match Return balanced]
	match Return Roundtime
	matchwait
	


#########################################################
###                                                   ###
###                KILL LOOP                          ###
###                                                   ###
#########################################################


attpause:
if $Guild = Barbarian and $stamina < 80 then put bers aval
put circl
pause 7

Kill:
if $Guild = Barbarian && $Expertise.LearningRate < 25 then gosub ExpertiseTrain
if matchre ("$roomobjs", "(%critters) ((which|that) appears dead|\(dead\))") then return
if $stamina < 80 then goto attpause
ExpertiseDone:
match Return balance]
match Return balanced]
match rekill still stunned
match waitmelee You aren't close enough to attack
match Return referring
match Return You turn to face
match rekill Roundtime
put att
matchwait

waitmelee:
waitfor melee
goto Kill

rekill:
pause .5
goto Kill

#########################################################
###                                                   ###
###                TACTICS LOOP                       ###
###                                                   ###
#########################################################


Tactical:
put circl
pause .5
#if $Tactics.LearningRate > 30 
return
#goto Kill

#########################################################
###                                                   ###
###             AMBUSH KILL LOOP                      ###
###                                                   ###
#########################################################


Kill_hide:
if $Guild = Barbarian && $Expertise.LearningRate < 25 then gosub ExpertiseTrain
if matchre ("$roomobjs", "(%critters) ((which|that) appears dead|\(dead\))") then return
setvariable clouted 0
put face next
pause
goto Advance

Advance:
put adv
pause
goto Hide

Hide:
match Backstab You melt into
match Backstab You blend in with
match Hide You can't do that while entangled in a web
match Backstab Eh?
match Hide notices your attempt
put hide
matchwait

Stalk:
if $charactername = Hixin || $charactername = Gilthwerp || $charactername = Vedalken || $charactername = Zone || $charactername = Spac || $charactername = Cernrec || $charactername = Hintoc || $charactername = Yosto then goto AttackIt
if $Stealth.LearningRate > 30 then goto Backstab
match Backstab You fail
match Hide You must be
match Hide try being out of sight
match Stalk ruining your hiding place
match Backstab You move
match standupstalk It's hard to stalk if you aren't in a position to move around.
match Backstab already
match Search is nothing else
put stalk
matchwait

standupstalk:
put stand
goto Stalk

Backstab:
if $hidden = 0 then goto Hide
if %KillTime = "YES" then goto BACKSTABNOW
if $Backstab.LearningRate < 30 && $Guild == Thief then goto AttackIt
BACKSTABNOW:
match Return balance]
match Return balanced]
match Return You turn to face
match Return referring
match Return Backstab what?
match Advance if you were closer
match Advance You aren't close enough to attack
match Hide must be hidden
match AttackIt bare hands
match AttackHeavy  is too clumsy for such a delicate maneuver
match Ambush unsuitable for backstab
match Ambush Get a weapon that can puncture something
match Hide Roundtime
match Ambush lighter
match Ambush can't backstab that.
match AttackIt The best you could do is political
match standupidiot You'll need to stand up first.
put backstab
matchwait

standupidiot:
put stand
goto Backstab

AttackHeavy:
if %clouted = 1 then goto AttackIt
match Return balance]
match Return balanced]
match Return You turn to face
match Return referring
match Advance not close enough
match Advance You aren't close enough to attack
match Hide must be hidden
match AttackIt too heavy for you to use like that
match AttackIt already impaired
match AttackIt even standing up
match AttackIt already debilitated
match AttackIt out cold!
match AttackIt is not 
match Hide Roundtime
put ambush
setvariable clouted 1
matchwait


Ambush:
if %clouted = 1 then goto AttackIt
match Return balance]
match Return balanced]
match Return slumps into a heap
match Return and breathes its last
match Return You turn to face
match Return referring
match Advance not close enough
match Advance You aren't close enough to attack
match Hide must be hidden
match AttackHeavy too heavy for you to use like that
match AttackHeavy have any legs
match AttackIt even standing up
match AttackIt already debilitated
match AttackIt already impaired
match AttackHeavy just isn't sharp enough 
match AttackHeavy  is too clumsy for such a delicate maneuver
match Hide Roundtime
put amb slash
setvariable clouted 1
matchwait

AttackIt:
if $stamina < 80 then gosub attpause
match Return balance]
match Return balanced]
match Return Face what
match Return You turn to face
match Return referring
match Advance not close enough
match Advance You aren't close enough to attack
match Hide must be hidden
match AttackIt already debilitated
match Hide Roundtime
if $Guild == Thief && %skill != "Twohanded_Edged" then put att
else put att 
matchwait


#########################################################
###                                                   ###
###             RANGED KILL LOOP                      ###
###                                                   ###
#########################################################

ShieldOn:
 put remo shie;stow shie
 pause 1
 goto load

regetbow:
 put wie %result;get %result
 pause 
 
if %WearBow = On then put rem %result
if %WearBow = On then var WearBow Off
var FirstRange OFF
goto load

ranged_kill:
if %FirstRange = "ON" then goto regetbow
if $Guild = Barbarian && $Expertise.LearningRate < 25 then gosub ExpertiseTrain
if matchre ("$roomobjs", "(%critters) ((which|that) appears dead|\(dead\))") then return

load:
 if %HangBack = "On" then put ret
 match loadpause ...wait
 match aimback to load the
 match aimback already loaded
 match retrieve You don't have the proper ammunition
 match ShieldOn cannot manage to load your
 match retreat You are still stunned
 put load
 matchwait

loadpause:
 pause
 goto load

aimback:
aim:
 put aim
 pause 1
 goto range_stalk
 
range_stalk:
 if %BowHide = "No" then goto firetimepause
 if $charactername = Jackro || $charactername = Ciravassus then goto StalkTime
 else goto HideTime

StalkTime:
 match fire You move into position
 match fire You're already stalking
 match StalkTime ruining your hiding place
 put stalk
 matchwait

HideTime:
 pause 1
 put hide
 pause 5
 goto waitforfire

waitforfire:
 match fire best shot 
 match stopaim aiming
 matchwait
 
stopaim:
goto aim
 
fire:
if $hidden = 0 then goto firetime
 matchre GetAmmo (balance]|balanced])
 match Return At what
 match ranged_kill Roundtime
 match Return I could not find what you were referring to.
 match range_stalk How can you poach if you are not hidden
 put poach
 matchwait

firetimepause:
put ret
match firetime best shot 
match stopaim aiming
 matchwait
 
firetime:
 matchre GetAmmo (balance]|balanced])
 match Return At what
 match ranged_kill Roundtime
 match Return I could not find what you were referring to.
 put fire
 matchwait




GetAmmo:
 goto Return

retrieve:
 retrieve2:
 gosub Loot
 goto ranged_kill

moveon:
 goto load


#########################################################
###                                                   ###
###             THROWN KILL LOOP                      ###
###                                                   ###
#########################################################

throwpause:
put circle
pause 7

Throw_Kill:
if $Guild = Barbarian && $Expertise.LearningRate < 25 then gosub ExpertiseTrain
if matchre ("$roomobjs", "(%critters) ((which|that) appears dead|\(dead\))") then return
if $stamina < 80 then goto throwpause

throwit:
 matchre ReturnThrow (balanced]|balance])
 match throwit ...wait
 match getweapon Roundtime
 match getweapon What are you
 put lob
 matchwait

 ReturnThrow:
 put get %result
 return
 
getweapon:
 pause
 put get %result
 goto Throw_Kill

#######################################################
###                                                 ###
###          MAGIC KILL LOOP                        ###
###                                                 ###
#######################################################

Magic_Kill:
if $Guild = "Warrior Mage" then put path foc damage
if $mana < 60 then gosub MagicAttack

if SPELL.CYCLIC.ON = 1 then goto TM_CHECK_BODIES
## If we using Cyclic TM, lets do a specific Rotation
if SPELL.CYCLIC = 1 then goto TM_CYCLIC

	pause 2
	match facenext Your spell fails completely
	match facenext You are not engaged to anything, so you must specify a target to focus on
	match Magic_Kill have a spell prepared
	match Magic_Kill Your concentration slips for a moment, and your spell is lost
	match Magic_Kill Currently lacking the skill to complete the pattern
	match facenext I could not find what you were referring to
	matchre nextup Roundtime|backfire|Your target pattern dissipates because the
	put target %SPELL;-12cast
	matchwait
	nextup:
	if matchre ("$roomobjs", "(%critters) ((which|that) appears dead|\(dead\))") then return
	goto Magic_Kill
facenext:
put face next
goto Magic_Kill

redocast:
put rel
pause 1
goto Magic_Kill

MagicAttack:
pause 10
put attack
return

TM_CYCLIC:
## Start the Cyclic
	put prep %SPELL
	pause 10
	put cast
	var SPELL.CYCLIC.ON 1
TM_CHECK_BODIES:
	pause 5
	if matchre ("$roomobjs", "(%critters) ((which|that) appears dead|\(dead\))") then return
	goto TM_CHECK_BODIES



#######################################################
###                                                 ###
###            LOOTING                              ###
###                                                 ###
#######################################################

Loot:
if (matchre ("$roomobjs", "\b(%gems1|%gems2|%gems3|%gems4)\b(,|\.| and)")) then goto GET_GEM
if (matchre ("$roomobjs", "\b(%coins|%junkloot)\b(,|\.| and)")) then goto GET_COINS
if (matchre ("$roomobjs", "\b(%arrowloot)\b(,|\.| and)")) then goto GET_ARROWS
if (matchre ("$roomobjs", "\b(%boltloot)\b(,|\.| and)")) then goto GET_BOLTS
if (matchre ("$roomobjs", "\b(%metal1|%metal2)\b(,|\.| and)")) then goto GetAndPut
if (matchre ("$roomobjs", "\b(%metal1|%metal2)\b(,|\.| and)")) && $Guild = Thief then goto GetBoxes
ReturnFun:
return

GetBoxes:
put stow box
pause 1
goto Loot

GetAndPut:
put stow $1
pause 1
goto Loot

GET_BOLTS:
put stow bolt
pause .5
goto Loot

GET_ARROWS:
put stow arrow
pause .5
goto Loot

GET_GEM:
put stow gem
pause .5
goto Loot

GET_COINS:
put stow $1
pause .4
goto Loot

GetGem:
put ret
put stow gem
pause
return

GetBox:
put get $1
match return You put your
match Done no matter how You arrange it.
put put $1 in my %boxcontainer
matchwait

GetCoin:
put ret
put get $1 coin
pause
return


#######################################################
###                                                 ###
###            NO CRITTERS - JUGGLING               ###
###                                                 ###
#######################################################

Juggle:
pause 15
goto CritterCheck




########################################################
###                                                  ###
###              MISC FUNCTIONS                      ###
###                                                  ###
########################################################

Panic:
put #beep
ECHO *** PANIC! ***
put ret
put quit
exit
pause
pause
goto panic

Dead:
put #beep
ECHO *** YOU'RE DEAD! ***
pause
put glance sabre
pause
put quit
goto Dead

Return:
return

Done:
put #beep
ECHO *** ALL DONE! GO PICK YOUR BOXES ***
pause
put ret
put khri silence
pause
pause
goto Done

HuntTime:
if %HangBack = "On" && %t > 76 then put ret
if %t > 76 then put hunt
pause
if %t > 76 && $Attunement.LearningRate < 31 then put perc
if %t > 79 then gosub reset
return

reset:
math CompCounter add 1
timer clear
timer start
pause
return

StudyComp:
put get comp
put study comp
pause 5
put stow comp
var CompCounter 0
return