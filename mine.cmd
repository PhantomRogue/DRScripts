### Can make just about any room have a huge Quantity by prospect careful right after ya prospect normal?
### For rooms you want to start off with a shovel, issue 1 parameter e.g.: .mine 1
### For rooms you want to rip through and empty without saving stuff, issue 2 parameters e.g: .mine 1 2

#debug 10
### Bard crap - ignore it you nonhaxxorz

### Set this to how many seconds you want to wait in-between swinging your pick or shovel
var MINEPAUSE 2

### Set this to the number of times you want to mine, not get anything, and then mine careful (can set from %1)
var CLEANNUMBER 6

### Set this to the maximum number of times you want to use prospect danger before stopping. Set to 0 to disable.
var DANGER_USES 0

### Don't mess with these unless you like breaking scripts
var COUNTER %CLEANNUMBER
var SWITCH 0
IF_1 var SWITCH 1
var SHOVELONLY 0
IF_1 var SHOVELONLY 1
var PICKONLY 0
IF_2 var PICKONLY 1
var CAREFUL_DONE 0
var ROOM_CLEAN_CHECK 0
var DANGER_USED 0
var DANGER_CHECK 0
var NO_COLLECT 0
var FREED 0

### Various actions to catch important events.
action var DANGER_CHECK 1 when ^A bitter smell seeps into the air.
action var DANGER_CHECK 1 when ^Studying the geology, you are certain that continued mining will be rather dangerous.
action var DANGER_CHECK 1 when ^Studying the geology, you are certain that continued mining will be somewhat dangerous.
action var DANGER_CHECK 1 when ^The ground rumbles ominously.
action var DANGER_CHECK 1 when ^The floor shudders briefly,
action var UNCONCIOUS 1 when ^A large, oblong fragment slams into your forehead and you feel yourself toppling backwards as the world goes black!
action var PINNED 1 when You seem to be pinned in place.$

action var FREED 1 when The world slowly comes into focus again
action var FREED 1 when You finally manage to clear away enough rubble to lever yourself free.

action var ROOM_RESET 1 when deed resources
action var ROOM_RESET 1 when ^Miners stand ready to trade resources in for deeds
action var CAREFUL_CHECK 1 when scattering of resources
action var MINED_OUT 1 when Your analysis has revealed no additional resources to be unearthed here

var MINED_OUT 0
### Start doing stuff
pause .5
gosub put my $lefthandnoun in my $craftpack
gosub put my $righthandnoun in my $craftpack
if %SHOVELONLY = 1 && %PICKONLY = 0 then gosub get my shovel
else gosub get my pickaxe
pause .5

MAIN:
	if %UNCONCIOUS = 1 then goto UNCONCIOUS
	if %PINNED = 1 then goto PINNED
	if %DANGER_CHECK = 1 then goto DANGER_CHECK

	if "$roomplayers" <> "" and %ROOM_CLEAN_CHECK = 0 then 
	{
		goto ROOMDONE
	}
	math ROOM_CLEAN_CHECK set 1

ROOM_MINE:
	pause %MINEPAUSE
ROOM_MINE_1:
	var ROOM_RESET 0
	var CAREFUL_CHECK 0
	if %UNCONCIOUS = 1 then goto UNCONCIOUS
	if %PINNED = 1 then goto PINNED
	if %DANGER_CHECK = 1 then goto DANGER_CHECK
	if %COUNTER < %CLEANNUMBER then
	{
		matchre ROOM_MINE_1 ^\.\.\.wait|you may only type
		match ROOM_MINED Roundtime
		put mine
		matchwait 2
		goto ROOM_MINE_1
	}
	else
	{
		matchre ROOM_PROSPECTED Roundtime|Your analysis has revealed no additional resources to be unearthed here
		put pros
		matchwait 2
		goto ROOM_MINE_1
	}

ROOM_PROSPECTED:
	if %ROOM_RESET = 0 then
	{
		if ((%CAREFUL_DONE = 1) && (%t < 600)) then goto ROOMDONE
		else goto CAREFUL_CHECK
	}
#	if %MINED_OUT = 1
#	if (((%MINED_OUT = 1) || (%CAREFUL_CHECK = 1)) && ((%CAREFUL_DONE = 1) && (%t < 600))) then goto ROOMDONE
#	if ((%MINED_OUT = 1) || (%CAREFUL_CHECK = 1)) && ((%CAREFUL_DONE = 0) || (%t > 600))) then goto CAREFUL_CHECK
	if %ROOM_RESET = 1 then goto ROOM_RESET
#	goto ROOMDONE
	
ROOM_RESET:
	math COUNTER set 0
	goto ROOM_MINE

ROOM_MINED:
	math COUNTER add 1

ROOM_CHECK:
	if matchre ("$roomobjs", "(tin nugget|coal nugget)") then 
	{
		math NO_COLLECT set 1
		math DANGER_USED set 1
		math CAREFUL_DONE set 1
	}
ROOM_CHECK_1:
	if %UNCONCIOUS = 1 then goto UNCONCIOUS
	if %PINNED = 1 then goto PINNED
	if %DANGER_CHECK = 1 then goto DANGER_CHECK
	pause .5
	if (%PICKONLY = 1) then goto ROOM_MINE
	if matchre("$roomobjs", "((?:covellite|gold|silver|tyrium|platinum|orichalcum|darkstone|animite|niniam|haralun|lumium|damite|kertig|glaes|electrum|oravir|anlora-avtoma|audrualm|niello) (nugget|shard|tear|fragment|lump))") then 
	{
		var ITEM $0
		math COUNTER set 0
		pause .5
		if (%NO_COLLECT = 0) then
		{
			gosub get %ITEM
			gosub put my %ITEM in my backp
			if ((%SWITCH = 0) && (%PICKONLY = 0)) then
			{
				pause .5
				#gosub put my pickaxe in my $craftpack
				#gosub get my shovel
				math SWITCH set 1
			}
			goto ROOM_CHECK_1
		}
	}
	else goto ROOM_MINE

	### I don't deed/care about boulders
	#if matchre ("$roomobjs", "(boulder)") then
	#{
	#	pause .5
	#	put push boulder
	#	put stow left
	#}
	#goto ROOM_MINE

CAREFUL_CHECK:
	if %UNCONCIOUS = 1 then goto UNCONCIOUS
	if %PINNED = 1 then goto PINNED
	if %DANGER_CHECK = 1 then goto DANGER_CHECK
	if ((%CAREFUL_DONE = 0) || ((%CAREFUL_DONE = 1) && (%t > 600))) then goto CAREFUL
	goto MAIN

CAREFUL:
	var MINED_OUT 0
	timer clear
	timer start
	pause
	matchre CAREFUL_1 Roundtime|Your analysis has revealed no additional resources to be unearthed here.
	put prospect CAREFUL
	matchwait 2
	goto CAREFUL

CAREFUL_1:
	pause
	math CAREFUL_DONE set 1
	math COUNTER set 1
	goto MAIN

DANGER_CHECK:
	if %UNCONCIOUS = 1 then goto UNCONCIOUS
	if %PINNED = 1 then goto PINNED

DANGER:
	put #play abort;#echo ***** DANGER MINER-ROBINSON!!! *****
	pause 0.5
	match ROOMDONE Unfortunately, you are unable to find any way around the instability in the geology.
	matchre DANGER_1 Using a discarded stone you make several notations on the wall|continued mining here would be slightly dangerous
	match NODANGER You scan the area for danger and find nothing of concern lurking within the nearby geology.
	put prospect DANGER
	matchwait 2
	goto DANGER

DANGER_1:
	pause
	math DANGER_USED set 1
	if (%DANGER_USES > 0) && (%DANGER_USED >= %DANGER_USES) then goto ROOMDONE
NODANGER:
	var DANGER_CHECK 0
	math COUNTER set %CLEANNUMBER
	goto MAIN

UNCONCIOUS:
	put #play abort;#echo ***** UNCONCIOUS!!! *****
	if %FREED = 0 then waitfor The world slowly comes into focus again
	var UNCONSCIOUS 0
	goto FREED

PINNED:
	put #play abort;#echo ***** PINNED!!! *****
	if %FREED = 0 then waitfor You finally manage to clear away enough rubble to lever yourself free.
	var PINNED 0
	goto FREED

FREED:
	var FREED 0
	pause
	put stand
	pause
	if $standing <> 1 then goto FREED
	math COUNTER set %CLEANNUMBER
	goto MAIN


ROOMDONE:
	pause .5
	gosub put $lefthandnoun in my $craftpack
	gosub put $righthandnoun in my $craftpack

### .fix is a separate script	
TOOL_FIX:
	pause .5
	put .fix shovel
	waitfor ITEM FIXED
	pause .5
	gosub put my shovel in my $craftpack
	pause .5
	put .fix pickaxe
	waitfor ITEM FIXED
	gosub put my pickaxe in my $craftpack
	pause .5

ALLDONE:
	put enc
	put #parse Mining Done
	exit

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
   matchre RETURN ^You get (a|an|some|your|the)|^You are already holding that\.|^You pick up
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
