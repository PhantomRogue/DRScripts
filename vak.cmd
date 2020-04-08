action send 1 $lastcommand when ^\.\.\.wait|^Sorry, you may only type
action send $lastcommand when ^You are still stunned
action goto DONE when eval $health < 55


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
var boxloot trunk|box|casket|coffer|crate|chest|skippet|caddy|strongbox

put wie glad


start:
put tb
pause 10
if $monstercount > 0 then gosub Kill_hide
pause 5
goto start

DONE:
put quit



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
match Hide You can't do that while entangled in a web
match Stalk Eh?
match Hide notices your attempt
put hide
matchwait

Stalk:
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
put ambush clout
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

Return:
pause 3
put loot
pause 3
gosub Loot
return


Loot:
if (matchre ("$roomobjs", "\b(%gems1|%gems2|%gems3|%gems4)\b(,|\.| and)")) then goto GET_GEM
if (matchre ("$roomobjs", "\b(%coins|%junkloot)\b(,|\.| and)")) then goto GET_COINS
if (matchre ("$roomobjs", "\b(%arrowloot)\b(,|\.| and)")) then goto GET_ARROWS
if (matchre ("$roomobjs", "\b(%boltloot)\b(,|\.| and)")) then goto GET_BOLTS
if (matchre ("$roomobjs", "\b(%metal1|%metal2)\b(,|\.| and)")) then goto GetAndPut
if (matchre ("$roomobjs", "\b(%boxloot)\b(,|\.| and)")) then goto GetBoxes
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
put stow gem
pause
return

GetBox:
put get $1
match return You put your
match Done no matter how you arrange it.
put put $1 in my %boxcontainer
matchwait

GetCoin:
put ret
put get $1 coin
pause
return

