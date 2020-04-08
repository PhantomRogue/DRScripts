#Brawler

##Monster Variables

var gems1 agate|alexandrite|amber|amethyst|andalusite|aquamarine|bar|bead|beryl|bloodgem|bloodstone|carnelian|chrysoberyl|carnelian|chalcedony
var gems2 chrysoberyl|chrysoprase|citrine|coral|crystal|diamond|diopside|emerald|egg|eggcase|garnet|gem|goldstone|glossy malachite
var gems3 (chunk of|some|piece of).*granite|hematite|iolite|ivory|jade|jasper|kunzite|lapis lazuli|malachite stone|minerals|moonstone|morganite|nugget|onyx
var gems4 opal|pearl|pebble|peridot|quartz|ruby|sapphire|spinel|star-stone|sunstone|talon|tanzanite|tooth|topaz|tourmaline|tsavorite|turquoise|zircon
var junkloot scroll|tablet|vellum|sheiska leaf|ostracon|hhr'lav'geluhh bark|papyrus roll|smudged parchment|fragment|package|dira|card
var coins gold coins|silver coins|bronze coins|platinum coins|gold coin|silver coin|bronze coin|platinum coin

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
var skinnablemonsters8 shadow beast|cinder beast|asaren celpeze|spirit dancer|scaly seordmaor|poloh'izh|armadillo|shalswar

var skinnableundead1 ghoul|squirrel|grendel|reaver|mey|shadow hound|lach|mastiff|gremlin
var skinnableundead2 zombie kobold savage|zombie kobold headhunter|ghoul crow|misshapen germish'din

var invasioncritters transmogrified oaf|flea-ridden beast|Prydaen|Rakash|bone warrior|shambling horror|skeletal peon|revivified mutt|putrefying shambler

var skinnablecritters %skinnablemonsters1|%skinnablemonsters2|%skinnablemonsters3|%skinnablemonsters4|%skinnablemonsters5|%skinnablemonsters6|%skinnablemonsters7|%skinnablemonsters8|%skinnableundead1|%skinnableundead2
var nonskinnablecritters %monsters1|%monsters2|%monsters3|%monsters4|%monsters5|%monsters6|%monsters7|%undead1|%undead2|%undead3|%undead4

var critters %nonskinnablecritters|%skinnablecritters|%invasioncritter
action send $lastcommand when ^\.\.\.wait|^Sorry, you may only type


start:
	pause 1
	if matchre ("$roomobjs", "(%skinnablecritters) ((which|that) appears dead|\(dead\))") then gosub SKIN_MONSTER
	if matchre ("$roomobjs", "(%nonskinnablecritters) ((which|that) appears dead|\(dead\))") then gosub SKIN_MONSTER
	if matchre ("$roomobjs", "(%invasioncritters) ((which|that) appears dead|\(dead\))") then gosub SKIN_MONSTER

	if matchre ("$monsterlist", "%critters") then gosub Kill
goto start

SKIN_MONSTER:

	pause 1
	var Mob $1
ArrangeStuff:
	pause
ArrangeStuff1:
	matchre goback corpse is worthless now|Arrange what|^You might want to kill it first|so you can't arrange it either
	match skinit has already been arranged as much as you can manage
	match ArrangeStuff1 Roundtime
	put arrange
	matchwait

skinit:
#	if $Thanatology.LearningRate < 31 then put perf arise on %Mob
#	if $Thanatology.LearningRate > 31 then put skin
	put skin
	pause 3
	put empty left;loot
	pause 4
	gosub Loot
	return

goback:
#	if $Thanatology.LearningRate < 31 then put perf arise on %Mob
#	if $Thanatology.LearningRate > 31 then put skin
	put skin
	pause
	put loot
	pause 1
	gosub Loot
	return

attpause:
pause 7

Kill:
if $stamina < 80 then goto attpause
put att
match return balance]
match return balanced]
match searchit At what are you
match Kill position.]
match Kill opponent.]
match Kill advantage.]
match Kill overwhelming you.]
match wait There is nothing else to face
matchwait

return:
return

wait:
match att position.]
match att opponent.]
match att advantage.]
match att overwhelming you.]
match att melee
match att IDLE
matchwait

Loot:
if (matchre ("$roomobjs", "\b(%gems1|%gems2|%gems3|%gems4)\b(,|\.| and)")) then goto GET_GEM
if (matchre ("$roomobjs", "\b(%coins|%junkloot)\b(,|\.| and)")) then goto GET_COINS
ReturnFun:
return

GetAndPut:
put stow $1
pause 1
goto Loot

GET_GEM:
put stow gem
pause .5
goto Loot

GET_COINS:
put stow $1
pause .4
goto Loot
