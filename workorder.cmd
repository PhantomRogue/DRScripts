# get a workorder

# This script needs to know the following variables ahead of time: $craftpack

var WorkShort \b(bl|we|arm|car)(.+)?
var WorkLong blacksmith|weapon|armor|carving|
var MetalTypesShort bra|bro|cop|cov|iro|lea|nic|ora|pew|ste|tin|zin|ani|aur|dam|dar|ele|gla|gol|har|ker|lum|nin|ori|pla|tyr
var MetalTypesLong brass|bronze|copper|covellite|iron|lead|nickel|oravir|pewter|steel|tin|zinc|animite|audrualm|damite|darkstone|electrum|glaes|gold|haralun|kertig|lumium|niniam|orichalcum|platinum|tyrium


#put .enc harmony 40 quiet

if ("%1" = "") then
{
	echo USAGE .workorder <weapon|black>
	exit
}
eval WorkMatch tolower("%1")
if matchre(("%WorkMatch"), "(%WorkShort)") then
{
	if matchre("%WorkLong", "\|($1(\w+)?)\|") then var WorkType $1
	else exit
	shift
}
else 
{
	echo USAGE .workorder <weapon|black>
	exit
}

GO_TO_MASTER:
#	if $roomid != 645 then gosub GO_ROOM 645

GET_LOGBOOK:
	gosub GET my logbook

WORKORDER_REQUEST:
	action (workorder) var ItemNeeded $2 when Alright\, this is an order for (an?|some) (((\S+\s)+)?\S+)\. I
	action (workorder) var NumberNeeded $1 when I need (\d+) finely
	action (workorder) var ItemMaterial $1 when , made from (.*) material
	action (workorder) var OrderTimer $1 when and due in (\d+) roisaen\.
	action (workorder) on
WORKORDER_REQUEST_1:
	matchre GET_LOGBOOK ^\w+ shakes his head and says
	matchre CHECK_WORKBOOK ^\w+ shuffles through some notes and says
	match WORKORDER_WAIT says, "I am sorry, but you just received a work order.  Try again a little later perhaps."
	put ask talia for easy %WorkType work
	matchwait 2
	goto WORKORDER_REQUEST_1
	
WORKORDER_WAIT:
	delay 60
	goto WORKORDER_REQUEST

CHECK_WORKBOOK:
	put #echo >Log Orange Workorder for %NumberNeeded %ItemNeeded
	eval ItemNeeded replace("%ItemNeeded", " ", ".")
	eval ItemNeeded tolower("%ItemNeeded")
	eval ItemNeeded replacere("%ItemNeeded", " an?\.", " ")
	eval ItemNeeded replace("%ItemNeeded", " some.", " ")
	eval ItemNeeded replace("%ItemNeeded", "metal.", "")
	eval ItemNeeded replace("%ItemNeeded", "stone.", "")
	gosub put my logbook in my $craftpack
	action (workorder) off
	action (itemreqs) var ItemVol $1 when ^\s+\(\d+\) refined metal ingot \((\d+) volume\)
	action (itemreqs) var ItemAssemble $1 when ^\s+\(\d+\).* (hilt|haft|short \w+ cord|long \w+ cord|long \w+ pole|short \w+ pole)
	put .craftbook %WorkType %ItemNeeded
	waitfor Book Turned
	action (itemreqs) off
	gosub put my %WorkType book in my $craftpack
	goto INGOT_CHECK
	
INGOT_CHECK:
	if $roomid != 10 then gosub GO_ROOM 10
	goto FORGE_IT	

FORGE_IT:
	put .engineer stone %ItemNeeded %NumberNeeded
	waitfor Items Forged
	goto TURN_IN

	
	
TURN_IN:
### FIND TALIA
	put go door
	pause 3
	if matchre("$roomobjs", "Talia") then goto foundher
	else put s
	pause 3
	if matchre("$roomobjs", "Talia") then goto foundher
	else put w
	pause 3
	if matchre("$roomobjs", "Talia") then goto foundher
	else put n
	pause 3
	if matchre("$roomobjs", "Talia") then goto foundher
	else put s
	pause 3
	if matchre("$roomobjs", "Talia") then goto foundher
	else put w
	pause 3
	
foundher:
	gosub GET my logbook
	put give tali
	put read my logbook
	put read prestige board
	put #echo >Log Orange Workorder Completed.
	goto WORKORDER_REQUEST

### The gosubs below are part of my standard include, but I've pulled them out individually here to avoid having nested scripts	

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
	 match ERROR What were you referring to?
   matchre RETURN ^You get (a|an|some|your|the)|^You are already holding that\.|^You pick up
   send get %Get
   matchwait 2
	 goto GET.2

RETURN:
	return
	
ERROR:
	echo There was an error in the script.
	exit

GO_ROOM:
	pause 1
	match GOOD_MOVE YOU HAVE ARRIVED
	match GO_ROOM MOVE FAILED
	put #goto $1 $2
	matchwait
GOOD_MOVE:
	pause
	return