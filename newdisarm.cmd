#Genie 3 version of Han's script. Thanks Han

action goto Dead when your death cry echoes
action goto Dead when You are a ghost
action goto Panic when (stunning you|knocking you completely|dealing you a vicious)
action goto Panic when (You're badly hurt, |You're smashed up,|You're very badly hurt)
action goto Panic when (You're near death,|You're terribly wounded,|You're very beat up)
action math GemCount add $1 when quickly fill it with (\d+) gem
action math Plats add $1 when You pick up (\d+) platinum
action math Golds add $1 when You pick up (\d+) gold
action setvariable pouchval $1 when You sort through the gems and finally decide that they're worth a total of about (\d+) 

VAR trigger off
VAR speed normal
setvariable pouchval 0
setvariable BeginningPouch 0
setvariable EndingPouch 0
setvariable Plats 0
setvariable Golds 0
setvariable GemCount 0
send .ved remove
pause 5

put tie pou
put app pouch quick
pause 7
setvariable BeginningPouch %pouchval

if_1 goto %1

#default
setvariable trapcount 0
setvariable boxcount 0
setvariable lockcount 0
setvariable afterloot dismantle
setvariable container1 bag
setvariable container2 cloak
setvariable pouchtype indigo
goto starter

ved:
setvariable trapcount 0
setvariable boxcount 0
setvariable lockcount 0
setvariable afterloot dismantle
setvariable container1 backp
setvariable container2 cloak
setvariable pouchtype indigo
goto starter


starter:
#full gem pouch
action goto fullpouch when fit any more gems

#armor interrupt
ACTION goto armor when Your armor hinders your attempt

#trapped interrupt
action goto trapid when is not fully disarmed, making any chance of picking it unlikely

#blown trap interrupts
ACTION goto blewit when (Almost immediately, you grow dizzy, tottering from side to side until finally collapsing to the ground, dead asleep|The dart flies through your fingers and plants itself solidly in your forehead|With a sinister swishing noise|There is a sudden flash of greenish light|A stoppered vial opens with a pop|A stream of corrosive acid sprays out from|Just as your ears register the sound of a sharp snap|you realize that you must have been less than successful|you find yourself being hurled half-senseless through the air|you suddenly feel horribly transformed|emits a sound like tormented souls being freed|you notice the world around you has gotten much bigger|If you had to guess, you would say your carelessness did not disarm the trap)

#room trap saves
ACTION var roomtrap shrapnel when packed tightly with a powder
ACTION var roomtrap concussion when small wad of brown clay
ACTION var roomtrap laughing gas when a black gaseous substance
ACTION var roomtrap reaper when A crust-covered black scarab
ACTION var roomtrap naptha when A tiny striker is
ACTION var roomtrap gasser when vial of lime green liquid
ACTION var roomtrap teleport when thin metal circle that has been lacquered
action send $lastcommand when ^\.\.\.wait|^Sorry, you may only type

put khri safe focus sight
pause 7
put khri haste plunder
pause 7


whatbox:
save whatbox
MATCH setcoffer coffer
MATCH setskippet skippet
MATCH setstrongbox strongbox
MATCH setcrate crate
MATCH setchest chest
MATCH setcasket casket
MATCH setcaddy caddy
MATCH settrunk trunk
MATCH setbox box
match done there is nothing in there
PUT rumm my %container1
MATCHWAIT
goto done

setcoffer:
math boxcount add 1
SETVARIABLE boxtype coffer
GOTO getbox
setskippet:
math boxcount add 1
SETVARIABLE boxtype skippet
GOTO getbox
setbox:
math boxcount add 1
SETVARIABLE boxtype box
GOTO getbox
setstrongbox:
math boxcount add 1
SETVARIABLE boxtype strongbox
GOTO getbox
setcrate:
math boxcount add 1
SETVARIABLE boxtype crate
GOTO getbox
setchest:
math boxcount add 1
SETVARIABLE boxtype chest
GOTO getbox
setcasket:
math boxcount add 1
SETVARIABLE boxtype casket
GOTO getbox
setcaddy:
math boxcount add 1
SETVARIABLE boxtype caddy
GOTO getbox
settrunk:
math boxcount add 1
SETVARIABLE boxtype trunk
GOTO getbox

getbox:
save getbox
MATCH getboxpause \.\.\.wait
MATCH getboxpause Sorry,
MATCH app You get
MATCH done referring to
PUT get my %boxtype
MATCHWAIT

app:
save app
match app \.\.\.wait
match app Sorry,
match trapid Roundtime
put app my %boxtype quick
matchwait

trapid:
save trapid
MATCH trapid \.\.\.wait
MATCH trapid Sorry,
match armor Your armor hinders your attempt
#sets speed based on chances
MATCH trapid fails to reveal to you what type of trap protects it
match trapquick trivially constructed 
match trapquick This trap is a laughable matter, you could do it blindfolded
match trapquick An aged grandmother could defeat this trap in her sleep
match trapquick will be a simple matter for you to disarm
match trapnormal should not take long with your skills
match trapnormal You think this trap is precisely at your skill level
match trapnormal with only minor troubles
match trapnormal trap has the edge on you, but you've got a good shot at disarming
match trapnormal You have some chance of being able to disarm
match trapcareful odds are against you
match trapcareful would be a longshot
match trapcareful You have an amazingly minimal chance
MATCH tohard You really don't have any chance
MATCH tohard Prayer would be a good start for any
match tohard You could just jump off a cliff and save
MATCH tohard You probably have the same shot as a snowball
MATCH tohard A pitiful snowball encased in the Flames
match trapquick Somebody has already located and identified the current trap
#Already disarmed
match getpick Roundtime
PUT disarm id
MATCHWAIT

trapblind:
math trapcount add 1
setvariable speed blind
setvariable afterloot trapanalyze
goto disarm
trapquick:
math trapcount add 1
setvariable speed quick
setvariable afterloot trapanalyze
goto disarm
trapnormal:
math trapcount add 1
setvariable speed normal
setvariable afterloot dismantle
goto disarm
trapcareful:
math trapcount add 1
setvariable speed careful
setvariable afterloot dismantle
goto disarm

disarm:
save disarm
MATCH disarm Sorry,
MATCH disarm \.\.\.wait
match trapid proves too difficult to manipulate
MATCH disarm did not disarm
MATCH trapnormal caused something to shift
Match disarm You work with the trap for a while but are unable to make any progress
match trapid is not yet fully disarmed
Match getpick Roundtime
MATCH getpick positive attitude
PUT disarm %speed
MATCHWAIT

trapanalyze:
save trapanalyze
match trapanalyze Sorry,
match trapanalyze \.\.\.wait

match trapanalyze FAIL
match trapanalyze unable to determine
match dismantle Roundtime
match dismantle Unable to locate the object you specified
match dismantle You've already analyzed this trap in preparation
match dismantle positive attitude
put disarm analyze
matchwait

harvest:
save harvest
match harvest Sorry,
match harvest \.\.\.wait

match harvest You fumble around with the trap apparatus

match dismantle much for it to be successfully harvested.

match dropper Roundtime
put disarm harvest
matchwait

dropper:
save dropper
match dropper Sorry,
match dropper \.\.\.wait
match dismantle You drop
match dismantle Your left hand is already empty
put empty left hand
matchwait

getpick:
save getpick
MATCH pickid from inside
MATCH getpick \.\.\.wait
match regetpick You need a free hand to pick that up
PUT get lockpick from my %container2
MATCHWAIT

regetpick:
put stow left
goto getpick

pickid:
save pickid
MATCH pickid \.\.\.wait
MATCH pickid Sorry,
match armor Your armor hinders your attempt
match getpick Find a more appropriate tool and try again
match pickid fails to teach you anything about the lock guarding
#sets speed based on chances
match pickquick trivially constructed 
match pickquick An aged grandmother could
match pickquick you could do it blindfolded
match pickquick will be a simple matter for you to unlock
match pickquick should not take long with your skills
match pickquick You think this lock is precisely at your skill level
match pickquick with only minor troubles
match picknormal lock has the edge on you, but you've got a good shot at
match picknormal You have some chance of being able to
match picknormal odds are against you
match pickcareful would be a longshot
match pickcareful You have an amazingly minimal chance
MATCH tohard You really don't have any chance
MATCH tohard Prayer would be a good start for any
match tohard You could just jump off a cliff and save
MATCH tohard You probably have the same shot as a snowball
MATCH tohard A pitiful snowball encased in the Flames
#Already disarmed
match stowpick not even locked
match pickanalyze Roundtime
PUT pick id
MATCHWAIT

pickblind:
math lockcount add 1
echo blind
setvariable speed blind
goto pickanalyze
pickquick:
math lockcount add 1
setvariable speed quick
echo quick
goto pickanalyze
picknormal:
math lockcount add 1
setvariable speed normal
goto pickanalyze
pickcareful:
math lockcount add 1
setvariable speed careful
goto pickanalyze

pickanalyze:
save pickanalyze
match pickanalyze Sorry,
match pickanalyze \.\.\.wait
match pick This lock has already helpfully been analyzed
match pick Roundtime
put pick analyze
matchwait

pick:
save pick
MATCH pick Sorry,
MATCH pick \.\.\.wait
match getpick Find a more appropriate tool and try again
match pickid You discover another lock
match pick You are unable to make any progress towards opening the lock
MATCH stowpick Roundtime
MATCH stowpick But it's wide open!
MATCH stowpick It's not even locked
MATCH stowpick positive attitude

MATCH getpick With a grimace, you discard the now useless lockpick

PUT pick %speed
MATCHWAIT

stowpick:
save stowpick
MATCH stowpick \.\.\.wait
MATCH stowpick Sorry,
MATCH open You put
match open referring to
PUT put my lockpick in my %container2
MATCHWAIT

open:
save open
MATCH open ...wait
MATCH open Sorry,
MATCH coin You open
MATCH coin already open
PUT open my %boxtype
MATCHWAIT

coin:
save coin
MATCH coin ...wait
MATCH coin Sorry,
MATCH coin You pick up
MATCH loot referring to?
PUT get my coin
MATCHWAIT

openpouch:
save openpouch
MATCH openpouch ...wait
MATCH openpouch Sorry,
MATCH gems You open
MATCH gems positive attitude
PUT open my pouch
MATCHWAIT

gems:
save gems
MATCH gems ...wait
MATCH gems Sorry,
MATCH openpouch Open your
match fullpouch fit any more gems
match fullpouch fit anything else
MATCH %afterloot You fill
match %afterloot You open
MATCH %afterloot aren't any gems
PUT fill my %pouchtype pouch with my %boxtype
MATCHWAIT

fullpouch:
save fullpouch
wait
goto gems

loot:
save loot
MATCH loot ...wait
MATCH loot Sorry,
MATCH %afterloot nothing in there
match loot ...wait
matchre lootit (tablet|scroll|roll|bark|parchment|card|map|ostracon|platinum nugget|gold nugget|Animite nugget|Audrualm nugget|Damite nugget|Darkstone nugget|Electrum nugget|Glaes nugget|Gold nugget|Haralun nugget|Icesteel nugget|Kertig nugget|Lumium nugget|Muracite nugget|Niello nugget|Niniam nugget|Orichalcum nugget|Platinum nugget|Silversteel nugget|Tyrium nugget|Vardite nugget|Animite bar|Audrualm bar|Damite bar|Darkstone bar|Electrum bar|Glaes bar|Gold bar|Haralun bar|Icesteel bar|Kertig bar|Lumium bar|Muracite bar|Niello bar|Niniam bar|Orichalcum bar|Platinum bar|Silversteel bar|Tyrium bar|Vardite bar|electrum nugget|silver nugget)
match gems Encumbrance
PUT look in my %boxtype
put encum
MATCHWAIT

unrecognizedloot:
put drop my %boxtype
goto exp

lootit:
put get $1 from my %boxtype
put put $1 in my wa sa
pause 2
goto loot


lootjunk:
put get $1 from my %boxtype
put drop my $1
pause
goto loot

cardloot:
save
put get card from my %boxtype
put stow my card
goto loot
runeloot:
save
put get rune from my %boxtype
put stow my rune
goto loot

dismantle:
setvariable afterloot dismantle
save dismantle
MATCH dispause Sorry,
MATCH dispause ...wait
MATCH exp positive attitude
MATCH trapid You must first disarm
match unrecognizedloot You can not dismantle 
MATCH exp Rolling your shoulders to loosen them
MATCH exp You move your hands
MATCH exp You place some meat
match exp You must be holding the object you wish to dismantle.
match ecp Unable to locate the object you specified.
PUT dismantle my %boxtype
MATCHWAIT

dispause:
pause 1
goto dismantle

exp:
echo Total Gems so Far:  %GemCount
echo Total Money so far:  %Plats Plat %Golds Gold
echo ------
pause 2
goto whatbox

blewit:
ECHO ********************
ECHO ** YOU BLEW IT! **
ECHO ********************

put #PARSE YOUBLEWIT
EXIT

tohard:
ECHO ******************************
ECHO ** OK this is way to hard **
ECHO ******************************
EXIT

#roomtrap:
# ECHO *******************************************
# ECHO ** Sorry bud room trap, are you alone? **
# ECHO *******************************************
# WAITFOR positive attitude
# GOTO disarm

done:
# Get Final Pouch
put khri stop
put app pouch quick
pause 7
var EndingPouch %pouchval
math EndingPouch sub %BeginningPouch
echo Total From Gems: {%EndingPouch} 
pause 1
math EndingPouch divide %GemCount
math $$charactername.Gems add %GemCount
echo Avg Gem: {%EndingPouch} 
put #parse BOXESAREPOPPED
EXIT

armor:
#echo >Log Yo genius, ditch the armor! Then type YES.
WAITFOR positive attitude
goto %s 

Dead:
dead:
Panic:
panic:
put #beep
ECHO *** PANIC! ***
put ret
put quit
exit
pause
pause
goto panic