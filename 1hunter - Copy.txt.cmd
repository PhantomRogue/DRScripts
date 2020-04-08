####################################################
###                                              ###
###              TRIGGERS                        ###
###                                              ###
####################################################
action put quit when $health < 20
action put #beep when says
action put #beep when whispers
action put #beep when hugs
action put #beep when grins
action put #beep when waves to You
action put #beep when waves at You
action put #beep when winks at You
action put #beep when shakes You
action put #beep when leans on You
action put stow left;\pstow right;\p%lastcommand when Free up your hands first
action put tend my $1 when the bandages binding your (left arm|right arm|left hand|right hand|left leg|right leg|chest|abdomen|back|head|neck|left eye|right eye)
action goto Dead when your death cry echoes
action goto Dead when You are a ghost
action goto Panic when (stunning You|knocking You completely|dealing You a vicious)
action goto Panic when (You're badly hurt, |You're smashed up,|You're very badly hurt)
action goto Panic when (You're near death,|You're terribly wounded,|You're very beat up)
action put tend my $1 when The bandages binding your (left arm|right arm|left hand|right hand|left leg|right leg|chest|abdomen|back|head|neck|left eye|right eye)
action setvariable KillTime YES when BACKSTABTHISSHIT
action send $lastcommand when ^\.\.\.wait|^Sorry, you may only type
action send $lastcommand when ^You are still stunned

include spelltriggers.cmd
asdasdasdasd:
put perc
pause

var KillTime YES

var gems1 agate|alexandrite|amber|amethyst|andalusite|aquamarine|bead|beryl|bloodgem|bloodstone|carnelian|chrysoberyl|carnelian|chalcedony|platinum bar|copper bar|silver bar|gold bar|bronze bar
var gems2 chrysoberyl|chrysoprase|citrine|coral|crystal|diamond|diopside|emerald|egg|eggcase|garnet|gem|goldstone|glossy malachite
var gems3 (chunk of|some|piece of).*granite|hematite|iolite|ivory|jade|jasper|kunzite|lapis lazuli|malachite stone|minerals|moonstone|morganite|nugget|onyx
var gems4 opal|pearl|pebble|peridot|quartz|ruby|sapphire|spinel|star-stone|sunstone|talon|tanzanite|tooth|topaz|tourmaline|tsavorite|turquoise|zircon
var junkloot flint-tipped bolt|crossbow bolt|barbed arrow|scroll|tablet|vellum|sheiska leaf|ostracon|hhr'lav'geluhh bark|papyrus roll|smudged parchment|package|cebi root|flights|hisan salve|rock|map|jadice flower| rock
var arrowloot razor-tipped arrow|silver-tipped arrow|lemon yellow arrow|bodkin arrow|hele'la head arrow|basilisk head arrow
var coins gold coins|silver coins|bronze coins|platinum coins|gold coin|silver coin|bronze coin|platinum coin


##Monster Variables
var monsters1 gidii|goblin shaman|fendryad|nyad|madman|sprite|wood troll|lipopod|kelpie|vykathi builder|vykathi excavator
var monsters2 fire maiden|creeper|vine|thug|ruffian|footpad|cutthroat|gypsy marauder|young ogre|swain|kra'hei hatchling
var monsters3 nipoh oshu|dyrachis|shadoweaver|crag|frostweaver|atik'et|dryad|orc scout|eviscerator|guardian|pirate
var monsters4 geni|orc bandit|umbramagii|screamer|scout ogre|swamp troll|mountain giant
var monsters5 scavenger troll|sleazy lout|bucca|dragon fanatic|dusk ogre|tress|bloodvine
var monsters6 armored warklin|velver|orc reiver|kra'hei|dragon priest|lun'shele hunter|orc raider|folsi immola
var monsters7 faenrae assasin|telga moradu|trekhalo|orc clan chief|shadow master|malchata|sky giant|imp|dummy

var undead1 skeleton|soul|boggle|zombie|wind hound|fiend|spirit|ur hhrki'izh|spectral pirate|spectral sailor|shylvic
var undead2 skeleton kobold savage|skeleton kobold headhunter|skeletal sailor|olensari mihmanan
var undead3 emaciated umbramagus|zombie nomad|sinister maelshyvean heirophant|gargantuan bone golem|plague wraith|snaer hafwa|wir dinego
var undead4 skeletal peon|revivified mutt

var skinnablemonsters1 frog|silverfish|musk hog|grub|crayfish|burrower|crab|boar|skunk|badger|pothanit|trollkin
var skinnablemonsters2 kobold|s'lai scout|jackal|bobcat|cougar|grass eel|bear|ram|spider|wolf|boobrie|beisswurm|rock troll|sluagh
var skinnablemonsters3 serpent|firecat|vulture|arbelog|caiman|steed|larva|snowbeast|worm|unyn|gargoyle|crocodile
var skinnablemonsters4 merrows|viper|peccary|la'tami|barghest|angiswaerd hatchling|vykathi harvester|pard|moth|kartais
var skinnablemonsters5 la'heke|vykathi soldier|boa|warcat|moda|arzumo|carcal|blood warrior|goblin|cave troll|black ape
var skinnablemonsters6 rat|antelope|giant blight bat|leucro|wasp|mottled westanuryn|blight ogre|gryphon|caracal|basilisk
var skinnablemonsters7 dobek moruryn|sinuous elsralael|sleek hele'la|shadow mage|marbled angiswaerd|retan dolomar|faenrae stalker
var skinnablemonsters8 shadow beast|cinder beast|asaren celpeze|spirit dancer|scaly seordmaor|poloh'izh|armadillo|shalswar|brocket deer

var skinnableundead1 ghoul|squirrel|grendel|reaver|mey|shadow hound|lach|mastiff|gremlin
var skinnableundead2 zombie kobold savage|zombie kobold headhunter|ghoul crow|misshapen germish'din

var invasioncritters transmogrified oaf|flea-ridden beast|Prydaen|Rakash|bone warrior|shambling horror|skeletal peon|revivified mutt|putrefying shambler

var skinnablecritters %skinnablemonsters1|%skinnablemonsters2|%skinnablemonsters3|%skinnablemonsters4|%skinnablemonsters5|%skinnablemonsters6|%skinnablemonsters7|%skinnablemonsters8|%skinnableundead1|%skinnableundead2
var nonskinnablecritters %monsters1|%monsters2|%monsters3|%monsters4|%monsters5|%monsters6|%monsters7|%undead1|%undead2|%undead3|%undead4

var critters %nonskinnablecritters|%skinnablecritters|%invasioncritter

var Ranged Light_Crossbow|Heavy_Crossbow|Short_Bow|Long_Bow|Composite_Bow
var Thrown Light_Thrown|Heavy_Thrown
var Melee Halberd|Brawling|Light_Edged|Heavy_Edged|Twohanded_Edged|Twohanded_Blunt|Light_Blunt|Medium_Blunt|Heavy_Blunt|Medium_Edged|Quarter_Staff|Short_Staff|Pikes|Offhand_Weapon
var Magic Targeted_Magic|Primary_Magic
var CurrentType
var ArrayIndex 0
var changed 0
var BackstabFull No
var CurrentStance Parry


#####################################################
###                                               ###
###             VARIABLES                         ###
###                                               ###
#####################################################



#gosub starBuffCheckt

if_2 then var SkipHide Yes
else var SkipHide No

if_3 then var ScriptType %3
else var ScriptType Melee

goto %ScriptType

Wecht:
var SkipHide No
setvariable weapons Bow|blade|longbow
setvariable WSkill Short_Bow|Heavy_Edged|Long_Bow
goto goon

Ciravassus:
Cira:
var SkipHide No
setvariable weapons bow|Scimitar|Rock|Brawling
setvariable WSkill Short_Bow|Medium_Edged|Light_Thrown|Brawling
goto goon

VTrain:
var SkipHide Yes
var BackstabFull Yes
setvariable weapons Scimitar|claymore|broad|rock|crossbow|brawling
setvariable WSkill Medium_Edged|Twohanded_Edged|Heavy_Edged|Light_Thrown|Light_Crossbow|Brawling
goto goon

VBack:
var SkipHide Yes
setvariable weapons broad|rock|crossbow|brawling
setvariable WSkill Heavy_Edged|Light_Thrown|Light_Crossbow|Brawling
goto goon

VKill:
var SkipHide No
var BackstabFull Yes
setvariable weapons Scimitar
setvariable WSkill Medium_Edged
goto goon


Vakroth:
var SkipHide No
var BackstabFull Yes
setvariable weapons Scimitar|claymore
setvariable WSkill Medium_Edged|Twohanded_Edged
goto goon

Gil:
var SkipHide No
setvariable weapons Katar|Scimitar|Blade
setvariable WSkill Light_Edged|Medium_Edged|Heavy_Edged
goto goon


Jack:
Jackro:
var SkipHide No
setvariable weapons Katar|Sabre|Crossbow
setvariable WSkill Light_Edged|Medium_Edged|Light_Crossbow
goto goon

Thrown:
var SkipHide No
setvariable weapons rock
setvariable WSkill Light_Thrown
goto goon

Ove:
var SkipHide Yes
setvariable weapons Scimitar
setvariable WSkill Medium_Edged
goto goon


Magic:
var SkipHide No
setvariable weapons PM
setvariable WSkill Targeted_Magic
var SPELL bolt
goto goon


Zairius:
Zair:
var SPELL CL
var SkipHide Yes
setvariable weapons Scimitar|PM
setvariable WSkill Medium_Edged|Targeted_Magic
goto goon


Micheletto:
setvariable weapons longbow|jamb|Brawling
setvariable WSkill Long_Bow|Light_Edged|Brawling
goto goon

Melee:
var SkipHide No
setvariable weapons katar
setvariable WSkill Light_Edged
goto goon

Ranged:
if $charactername = Ciravassus then setvariable weapons bow
else setvariable weapons crossbow
if $charactername = Ciravassus then setvariable WSkill Long_Bow
else setvariable WSkill Short_Bow
goto goon

BackTrain:
setvariable weapons truncheon|chain|club|sap
setvariable WSkill Short_Staff|Heavy_Blunt|Medium_Blunt|Light_Blunt
goto goon

goon:
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
if %WeaponType = "Magic" then gosub Magic_Kill
else if %WeaponType = "Thrown" then gosub Throw_Kill
else if %WeaponType = "Ranged" then gosub Ranged_Kill
else if %BackstabFull = "Yes" or (%SkipHide = "No"  && ($Hiding.LearningRate < 28 && %WeaponType = "Melee")) then gosub kill_hide
else if %WeaponType = "Melee" && (%SkipHide = "Yes"  || (%WeaponType = "Melee" && $Hiding.LearningRate > 27)) then gosub Kill
gosub dodge
gosub Search
gosub Loot
goto Loop

dodge:
put dod
pause 1
return

StanceCheck:
if $Shield_Usage.LearningRate < 30 then put stance shie
if $Shield_Usage.LearningRate > 29 then put stance parr
return


SetupWeapons:
	#if %WeaponType = Melee then put she %result in qui
	#if %WeaponType = Thrown then put stow %result
	#if %WeaponType = Ranged then put wear %result
	eval result element("%weapons", %ArrayIndex)
	eval skill element("%WSkill", %ArrayIndex)
	if matchre ("%Ranged", "%skill") then var WeaponType Ranged
	if matchre ("%Thrown", "%skill") then var WeaponType Thrown
	if matchre ("%Melee", "%skill") then var WeaponType Melee
	if matchre ("%Magic", "%skill") then var WeaponType Magic
	gosub Setup_%WeaponType	
	#if %WeaponType = Melee then put wie %result
	#if %WeaponType = Thrown then put wie %result
	#if %WeaponType = Ranged then put remove %result
return

Setup_Magic:
	var HangBack Off
	pause 1
	if $charactername = Zairius then put wie sci;stance parr
	else put stance shie;
	return

Setup_Melee:
	pause .5
	var HangBack Off
	put wear right;stow right
	pause .5
	if %ScriptType = BackTrain || %skill = Brawling then put stance eva
	else put stance parr
	put wie %result
	return
	
Setup_Thrown:
	pause .5
	var HangBack Off
	put stow right
	if %ScriptType = BackTrain then put stance eva
	else put stance shie
	put wie %result;get %result
	pause .5
	put get buckl;wear buckl
	return
	
Setup_Ranged:
	if %result = "bow" || %result = "longbow" then var HangBack On
	else var HangBack Off
	put stow right;wear right
	if %ScriptType = BackTrain || $charactername = Wecht then 
	{
		pause .5
		put stance eva
	}
	else 
	{
		pause .5
		if $charactername = Micheletto then put rem buckl;stow buckl
		else put get buckl;wear buckl
		pause .5
		if $charactername = Micheletto then put stance eva
		else put stance shie
	}
	put remove %result;get %result
	return

loopArray:
	if $%skill.LearningRate > 30 then 
	{
		math ArrayIndex add 1
		gosub SetupWeapons
	}
	if %ArrayIndex > %total then gosub HOLD
	pause .5
	return	

HOLD:
#math ArrayIndex subtract %total
setvariable ArrayIndex 0
gosub SetupWeapons
return

CritterCheck:
gosub HuntTime
gosub BuffCheck
if $monstercount > %1 then return
pause 2
goto CritterCheck

Search:
pause .5
#gosub NecroStuff
if matchre ("$roomobjs", "(%skinnablecritters) ((which|that) appears dead|\(dead\))") then goto ArrangeStuff
#gosub ArrangeStuff
arrstuffdone:
pause .5
put loot goods
pause
gosub Loot 	 
return

NecroStuff:
if matchre ("$roomobjs", "(%critters) ((which|that) appears dead|\(dead\))") then goto SEAR_MONSTER
return

SEAR_MONSTER:
var Mob $1
gosub CheckHealth
return

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
put loot goods
pause .5
put exp
return

ArrangeStuff:
if $charactername = Vakroth then goto skinit
ArrangeStuff1:
matchre arrstuffdone corpse is worthless now|Arrange what|^You might want to kill it first|what?|cannot be|so you can't arrange it either
match skinit has already been arranged
match ArrangeStuff1 Roundtime
if $charactername = Ciravassus || $charactername = Wecht then put arrange all 
else put arrange
matchwait

skinit:
pause
put skin
pause 3
if %skill = "Brawling" || %skill = "Light_Thrown" then put empty right
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

if $charactername = Zairius then 
{
	if $SUF = "OFF" then gosub ReBuff SUF 10
	else if $SW = "OFF" then gosub ReBuff SW 10
	#else if $YS = "OFF" then gosub ReBuff YS 10
	#else if $ZE = "OFF" then gosub ReBuff ZE 5
}
if $charactername = Ciravassus || $charactername = Wecht then
{
	if $STW = "OFF" then gosub ReBuff STW 9 1
	#else if $HOL = "OFF" then gosub ReBuff HOL 10 5
	#else if $SOTT = "OFF" then gosub ReBuff SOTT 5

}
return

ReBuff:
if %HangBack = "On" then put ret
put prep $1 $2
pause 2
put harn $3
pause 5
put harn $3
pause 5
put cast
return

#########################################################
###                                                   ###
###                KILL LOOP                          ###
###                                                   ###
#########################################################

attpause:
pause 7
return

Kill:
if $stamina < 80 then gosub attpause
match Return balance]
match Return balanced]
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
###             AMBUSH KILL LOOP                      ###
###                                                   ###
#########################################################


Kill_hide:
put face next
pause
goto Advance

Advance:
put adv
pause
goto Hide

Hide:
match Stalk You melt into
match Stalk You blend in with
match Stalk Eh?
match Hide notices your attempt
put hide
matchwait

Stalk:
if $charactername = Gilthwerp then goto AttackIt
if $Stalking.LearningRate > 30 then goto Backstab
match Backstab You fail
match Hide You must be
match Hide try being out of sight
match Stalk ruining your hiding place
match Backstab You move
match Backstab already
match Search is nothing else
put stalk
matchwait

Backstab:
if $hidden = 0 then goto Hide
if %KillTime = "YES" then goto BACKSTABNOW
if $Backstab.LearningRate < 30 then goto AttackIt
BACKSTABNOW:
match Return balance]
match Return balanced]
match Return You turn to face
match Return referring
match Return Backstab what?
match Advance if you were closer
match Advance You aren't close enough to attack
match Hide must be hidden
match AttackHeavy  is too clumsy for such a delicate maneuver
match Ambush unsuitable for backstab
match Ambush Get a weapon that can puncture something
match Hide Roundtime
match Ambush lighter
match Ambush can't backstab that.
match AttackIt The best you could do is political
put backstab
matchwait

AttackHeavy:
match Return balance]
match Return balanced]
match Return You turn to face
match Return referring
match Advance not close enough
match Advance You aren't close enough to attack
match Hide must be hidden
match AttackIt too heavy for you to use like that
match AttackIt even standing up
match AttackIt already debilitated
match AttackIt out cold!
match AttackIt is not 
match Hide Roundtime
put ambush stun
matchwait


Ambush:
match Return balance]
match Return balanced]
match Return You turn to face
match Return referring
match Advance not close enough
match Advance You aren't close enough to attack
match Hide must be hidden
match AttackHeavy too heavy for you to use like that
match AttackIt even standing up
match AttackIt already debilitated
match AttackHeavy  is too clumsy for such a delicate maneuver
match Hide Roundtime
put amb slash
matchwait

AttackIt:
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
put att back
matchwait


#########################################################
###                                                   ###
###             RANGED KILL LOOP                      ###
###                                                   ###
#########################################################

regetbow:
 put wie %result;get %result

ranged_kill:
load:
# if %HangBack = "On" then put ret
 match loadpause ...wait
 match aimback to load the
 match aimback already loaded
 match retrieve You don't have the proper ammunition
 match retreat You are still stunned
 put load
 matchwait

loadpause:
 pause
 goto load

aimback:
aim:
 put aim
 goto range_stalk
 
range_stalk:
 if $charactername = Jackro || $charactername = Ciravassus then goto StalkTime
 else goto HideTime

StalkTime:
 match fire You move into position
 match fire You're already stalking
 match StalkTime ruining your hiding place
 put stalk
 matchwait

HideTime:
 put hide
 pause .5
 goto fire

fire:
if $hidden = 0 then goto HideTime
 pause
 matchre GetAmmo (balance]|balanced])
 match Return At what
 match ranged_kill Roundtime
 match Return I could not find what you were referring to.
 match range_stalk How can you poach if you are not hidden
 put poach
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



Throw_Kill:
 matchre Return (balanced]|balance])
 match throwit ...wait
 match getweapon Roundtime
 match getweapon What are you
 put throw
 matchwait

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
if $mana < 60 then gosub MagicAttack
	pause 2
	match facenext Your spell fails completely
	match facenext You are not engaged to anything, so you must specify a target to focus on
	match Magic_Kill have a spell prepared
	match nextup Roundtime
	put snap %SPELL
	matchwait
	nextup:
	if matchre ("$roomobjs", "(%critters) ((which|that) appears dead|\(dead\))") then return
	goto Magic_Kill
facenext:
put face next
goto Magic_Kill

MagicAttack:
pause 10
put attack
return


#######################################################
###                                                 ###
###            LOOTING                              ###
###                                                 ###
#######################################################

Loot:
if (matchre ("$roomobjs", "\b(%gems1|%gems2|%gems3|%gems4)\b(,|\.| and)")) then goto GET_GEM
if (matchre ("$roomobjs", "\b(%coins|%junkloot)\b(,|\.| and)")) then goto GET_COINS
if if (matchre ("$roomobjs", "\b(%arrowloot)\b(,|\.| and)")) then goto GET_ARROWS
ReturnFun:
return

GetAndPut:
put stow $1
pause 1
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
if %t > 76 and $Perception.LearningRate < 31 then put hunt
pause
#if %t > 76 and $Power_Perceive.LearningRate < 31 then put perc
if %t > 79 then gosub reset
return

reset:
timer clear
timer start
pause
return