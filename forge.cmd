### USAGE .forge <weapon|black> <name.of.weapon> <metal for ingot> (tempered yes|no) (balance|hone) (number to make for workorder)
### Items in < > are required options, in ( ) are not.
### e.g.: .forge weapon dire.mace steel no hone 4

# variables this script needs to know to run: $craftpack, $hammer, $tongs

var BooksShort \b(bl|we|arm|car)(.+)?
var BooksLong	blacksmith|weapon|armor|carving
var MetalTypesLong bra|bro|cop|cov|iro|lea|nic|ora|pew|ste|tin|zin|ani|aur|dam|dar|ele|gla|gol|har|ker|lum|nin|ori|pla|tyr
var metalTypesLong brass|bronze|copper|covellite|iron|lead|nickel|oravir|pewter|steel|tin|zinc|animite|audrualm|damite|darkstone|electrum|glaes|gold|haralun|kertig|lumium|niniam|orichalcum|platinum|tyrium

pause 5

#debug 5
if ("%1" = "") then
{
	echo USAGE .forge <weapon|black> <item crafted> <metal for ingot> (tempered yes|no) (balance|hone) (number to make for workorder)
	exit
}

eval BookMatch tolower("%1")
if matchre("%BookMatch", "%BooksShort") then
{
	var BookType %1
	shift
}
else
{
	echo USAGE .forge <weapon|black> <item crafted> <metal for ingot> (tempered yes|no) (balance|hone) (number to make for workorder)
	exit
}

put #var forgeitem %1
eval ForgeNoun replacere("%1", "\S+\.", "")
if contains("$forgeitem", "ball.and.chain") then put #var forgenoun ball
else put #var forgenoun %ForgeNoun
shift

var Material %1
shift

if matchre(tolower("%1"), "(y|no)") then
{
	if "$1" = "y" then var Temper 1
	else var Temper 0
	shift
}
else var Temper 0

if matchre(tolower("%1"), "(bal|hon)") then
{
	var Tech $1
	if "%tech" = "bal" then var Tech 1
	else var Tech 2
	shift
}
else var Tech 0

if ("%1" = "") then
{
	var MaxItems 1
	var Workorder 0
}	
else
{
	setvar MaxItems %1
	setvar Workorder 1
}
var ItemsCount 0

BEGIN:
	gosub CAM_FILL
TOOL_FIX:
	pause .5
	put .fix shovel
	waitfor ITEM FIXED
	pause .5
	put .fix $tongs
	waitfor ITEM FIXED
	pause .5
	put .fix $hammer
	waitfor ITEM FIXED
	pause 1
START_FORGE:
	gosub CAM_FILL
	gosub PUT my $lefthandnoun in my $craftpack
	gosub PUT my $righthandnoun in my $craftpack
	pause .5
BOOK_READ:
	if %ItemsCount = 0 then
	{
		action (itemreqs) var Assemble $1 when ^\s+\(\d+\).* (hilt|haft|short \w+ cord|long \w+ cord|long \w+ pole|short \w+ pole)
		put .craftbook %BookType $forgeitem
		waitfor Book Turned
		action (itemreqs) off
		pause .5
	}
	eval Assemble replace("%Assemble", " ", ".")
	eval Assemble replacere("%Assemble", "leather\.|wooden\.|cloth\.", "")
	if "%Material" = "plasteel" then gosub GET my steel ingot from my bright pouch
	else gosub GET my %Material ingot from my $craftpack
	if "%Material" = "plasteel" then gosub PUT my steel ingot on anvil
	else gosub PUT my %Material ingot on anvil
	pause .5

BOOK_STUDY:
	if %ItemsCount > 0 then gosub GET my %BookType book
	matchre BOOK_STUDIED ^Roundtime
	put study my %BookType book
	matchwait 2
	goto BOOK_STUDY

BOOK_STUDIED:
	if (("$lefthandnoun" <> "hammer") || ("$lefthandnoun" <> "tongs")) then gosub PUT my $lefthandnoun in my $craftpack
	if (("$righthandnoun" <> "hammer") || ("$rightthandnoun" <> "tongs")) then gosub PUT my $righthandnoun in my $craftpack
	pause .5
	gosub GET $hammer
	gosub GET $tongs
	pause .5

FIRST_STRIKE:
	matchre TUB_TIME ^The .* now appears ready for cooling in the slack tub
	matchre TUB_TIME ^The .* now appears ready for quench hardening in the slack tub
	matchre TUB_TIME ^The .* is complete and ready for a quench hardening in the slack tub
	match TUB_TIME That tool does not seem suitable for that task
	matchre NEED_BELLOWS ^As you finish the fire flickers and is unable to consume its fuel
	matchre NEED_BELLOWS ^As you finish working the fire dims and produces less heat from the stifled coals
	match NEED_FUEL The fire needs more fuel before you can do that.
	matchre NEED_FUEL ^As you complete working the fire dies down and needs more fuel
	matchre NEED_FUEL ^As you complete working the fire dies down and appears to need some more fuel
	matchre TURN_TONGS ^The .* could use some straighting along the horn of the anvil
	matchre TURN_TONGS ^You notice the .* would benefit from some soft reworking
	match NO_PROBLEM Roundtime:
	put pound ingot on anvil with my $hammer
	matchwait 5
	goto FIRST_STRIKE

NEXT_STRIKE:
	matchre TUB_TIME ^The .* now appears ready for cooling in the slack tub
	matchre TUB_TIME ^The .* now appears ready for quench hardening in the slack tub
	matchre TUB_TIME ^The .* is complete and ready for a quench hardening in the slack tub
	match TUB_TIME That tool does not seem suitable for that task
	matchre NEED_BELLOWS ^As you finish the fire flickers and is unable to consume its fuel
	matchre NEED_BELLOWS ^As you finish working the fire dims and produces less heat from the stifled coals
	match NEED_FUEL The fire needs more fuel before you can do that.
	matchre NEED_FUEL ^As you complete working the fire dies down and needs more fuel
	matchre NEED_FUEL ^As you complete working the fire dies down and appears to need some more fuel
	matchre TURN_TONGS ^The .* could use some straighting along the horn of the anvil
	matchre TURN_TONGS ^You notice the .* would benefit from some soft reworking
	match NO_PROBLEM Roundtime:
	put pound $forgenoun on anvil with my $hammer
	matchwait 5
	goto NEXT_STRIKE

TURN_TONGS:
	pause 0.5
	match NO_PROBLEM Roundtime
	put turn $forgenoun with my $tongs
	matchwait 2
	goto TURN_TONGS

NEED_BELLOWS:
	pause .5
	if ("$lefthandnoun" <> "bellows") then gosub PUT my $lefthandnoun in my $craftpack
	pause .5
	gosub GET bellows from my $craftpack
NEED_BELLOWS_1:
	match GOOD_POUND Roundtime
	put push my bellows
	matchwait 2
	goto NEED_BELLOWS_1

NEED_FUEL:
	pause .5
	if ("$lefthandnoun" <> "shovel") then gosub PUT my $lefthandnoun in my $craftpack
	pause .5
	gosub GET my shovel
NEED_FUEL_1:
	match GOOD_POUND Roundtime
	put push fuel with my shovel
	matchwait 2
	goto NEED_FUEL_1

GOOD_POUND:
	pause .5
	if ("$lefthandnoun" <> "tongs") then gosub PUT my $lefthandnoun in my $craftpack
	if ("$righthandnoun" <> "hammer") then gosub PUT my $righthandnoun in my $craftpack
	pause .5
	put get my $hammer from my $craftpack
	put get my $tongs from my $craftpack
NO_PROBLEM:
	if matchre("$roomobjs", "ingot") then goto STOW_INGOT
	pause
	goto NEXT_STRIKE

STOW_INGOT:
	pause .5
	gosub PUT my $tongs in my $craftpack
	gosub GET ingot
	if "%Material" = "plasteel" then gosub PUT my ingot in my bright pouch
	else gosub PUT my ingot in my $craftpack
	gosub GET my $tongs
	goto NO_PROBLEM

TUB_TIME:
	pause .5
	gosub PUT my $lefthandnoun in my $craftpack
	gosub PUT my $righthandnoun in my $craftpack
	pause 0.5
TUB_TIME_1:
	match ASSEMBLE Roundtime
	put push tub
	matchwait 2
	GOTO TIME_TIME_1
	goto ASSEMBLE

GRINDER:
	match GRINDER Roundtime
	match GRINDER It seems to be picking up speed now but is still rather slow.
	match GRINDER Ok, it seems to be picking up speed now, though still rather slow.
	match GRINDER Straining a bit less you add force to the grindstone, making it spin even faster.
	match GRIND_IT Straining a bit less you maintain force to the grindstone, keeping it spinning fast.
	put turn grind
	matchwait 2
	goto GRINDER

GRIND_IT:
	match GRINDER The grinding wheel is not spinning fast
	match GRIND_IT Roundtime
	match OIL With grinding complete
	put push grindstone with my $forgenoun
	matchwait 5
	goto GRIND_IT

ASSEMBLE:
	gosub GET $forgenoun
	if (%ASSEMBLE <> "") then
	{
		gosub get my %Assemble
		put assemble my $forgenoun with my %Assemble
		pause
	}
	if "%BookType" = "weapon" then
	{
		gosub CAM_FILL
		goto GRINDER
	}

OIL:
	gosub GET oil from my $craftpack
OIL_1:
	match OILED Roundtime
	put pour my oil on my $forgenoun
	matchwait 2
	goto OIL_1
OILED:
	gosub PUT my oil in my $craftpack

APP:
if %Workorder = 1 then goto TEMPERING
	put .forgeapp
	pause
	put analyze my $forgenoun
	pause 5
	put app my $forgenoun careful
	pause 5
TEMPERING:
	if %Temper = 1 then
	{
		put .temper $forgenoun
		waitfor Item Tempered
	}
GRINDING:
	if %Tech = 1 then
	{
		put .grind $forgenoun balance
		waitfor Item Ground
		goto WORKORDER
	}
	if %Tech = 2 then
	{
		put .grind $forgenoun hone
		waitfor Item Ground
		goto WORKORDER
	}
WORKORDER:	
	if %Workorder = 1 then
	{
		gosub GET my forging logbook
		put bundle my $forgenoun with my logbook
		pause 1
		put read my forging logbook
		gosub PUT my forging logbook in my $craftpack
	}

MORE_CHECK:	
	math ItemsCount add 1
	if (%MaxItems > %ItemsCount) then goto START_FORGE

echo ********************
echo * ALL DONE!  WHEE! *
echo ********************
put #script abort enc;-stop sing;-release all
put #echo >Log Black,Red Forging Done!
put #play info
put #parse Items Forged
exit

### The gosubs below are part of my standard include, but I've pulled them out individually here to avoid having nested scripts	

CAM_FILL:
	matchre CAM_FILL \.\.\.wait|absorbs
	matchre CAM_FOCUS dissipates|cannot harness
	matchre RETURN Something in the area|Something is damping
	put charge my $cambrinth 15
	matchwait 2
	goto CAM_FILL

CAM_FOCUS:
	match CAM_FOCUS ...wait
	matchre RETURN You reach for its center and forge a magical link to it|Your link.*is intact
	matchre RETURN Something in the area|Something is damping
	put focus my $cambrinth $cam_mana
	matchwait 2
	goto CAM_FOCUS

PUT:
	var put $0
PUT.1:
  matchre PUT.1 ^\.\.\.wait|^Sorry
	matchre RETURN ^You drop|^You put|^You reverently place|^As you start to place|^What were you referring to\?|^You briefly twist the top|^As you put the
	put put %put
	matchwait 2
	goto PUT.1

GET:
   var Get $0
GET.2:
   pause .2
   matchre GET.2 ^\.\.\.wait|^Sorry
   matchre RETURN ^You get |^You are already holding that\.|^You pick up
   send get %Get
   matchwait 2
	 goto GET.2

STOW:
   var Stow $0
STOW.2:
   pause .2
   matchre STOW.2 ^\.\.\.wait|^Sorry
   matchre RETURN ^You put (a|an|some|your|the)|Stow what\?
   send stow %Stow
   matchwait 2
	 goto STOW.2

RETURN:
	return