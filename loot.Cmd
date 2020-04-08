#loot a room


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
var boxloot trunk|box|casket|coffer|crate|chest|skippet|caddy




Loot:
if (matchre ("$roomobjs", "\b(%gems1|%gems2|%gems3|%gems4)\b(,|\.| and)")) then goto GET_GEM
if (matchre ("$roomobjs", "\b(%coins|%junkloot)\b(,|\.| and)")) then goto GET_COINS
if (matchre ("$roomobjs", "\b(%arrowloot)\b(,|\.| and)")) then goto GET_ARROWS
if (matchre ("$roomobjs", "\b(%boltloot)\b(,|\.| and)")) then goto GET_BOLTS
if (matchre ("$roomobjs", "\b(%metal1|%metal2)\b(,|\.| and)")) then goto GetAndPut
if (matchre ("$roomobjs", "\b(%boxloot)\b(,|\.| and)")) then goto GetBoxes
ReturnFun:
exit

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
match Done no matter how You arrange it.
put put $1 in my %boxcontainer
matchwait

GetCoin:
put ret
put get $1 coin
pause
return