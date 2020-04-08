#Zoluren - CONTINUOUS

var user7 steel-wheeled

ECHO *******************
ECHO ** If you use Wizard, set your User7 variable to your caravan type
ECHO ** If you use Stormfront, ...
ECHO ** If you use Genie, change the "var user7" line above to your caravan type
ECHO **
ECHO ** Please note that this script is mostly a starting point with only travel and contract trading
ECHO ** Users are encouraged to modify the script to train more skills
ECHO **
ECHO ** To run the script, have a caravan already rented, and start the script inside any Zoluren trading outpost, or at any location that the caravan leads to
ECHO *******************

put stow right

if_1 goto %1

Start:
put look
match Cross0 [Traders' Guild, Shipment Center
match Arthe0 [Swotting Hall, Trader's Center
match Stone0 [Stone Clan, Trader's Guild Outpost
match Dirge0 [Darkstone Inn, Stables
match Tiger0 [Tiger Clan, Trader's Guild Outpost
match Wolf0 [Wolf Clan Trader Outpost
match Leth0 [Eshar's Trading Post, Main Room
match AtDirge [North Roads Caravansary]
match AtArthe [Valley, Village Gate]
match AtCross [Northeast Wilds, Outside Northeast Gate]
match AtLeth [Southern Trade Route, Outside Leth Deriel]
match AtFerryS [Southern Trade Route, Segoltha Plain]
match AtStone [Lairocott Brach, Entrance]
match FC [The Crossing, Alfren's Ferry]
match StableCrossing [Haldofurd's Barn, Caravan Stable
matchwait



Oops:
ECHO *********************************
ECHO ** LOOK AT YOUR CARAVAN! **
ECHO *********************************
goto %s

Cross0:
put get my crossing contract
match Cross1 referring
match Cross00 You get 
matchwait

Cross00:
put give clerk
pause 1
goto Cross0

Cross1:
move east
Cross1b:
put ask minister for con
match Cross2b "Return when you have done it."
match Cross2 for a total of
match CrossPay The minister reminds you
matchwait

CrossPay:
put pay clerk
goto Cross1b

Cross2b:
move west
goto CrossLook1

Cross2:
SAVE CrossLook1
move w
put give clerk
pause 1
put pay clerk
put read my contract
MATCH Stow guild office at
matchwait

CrossLook1:
move out
put east
waitfor following you.
save CrossLook1b
put look %user7 caravan
put glance
CrossLook1b:
match Oops belonging to
match CrossLook2 from Leth
match LethAsk You glance
matchwait

LethAsk:
pause 1
save LethAskb
put look %user7 caravan
put glance
LethAskb:
match LethW0 from Wolf Clan and destined for Leth
match LethT0 from Tiger Clan and destined for Leth
match LethD0 from Dirge and destined for Leth
match LethS0 from Stone Clan and destined for Leth
match LethA0 from Arthe Dale and destined for Leth
match CrossLook2 You glance
matchwait

CrossLook2:
pause 1
save CrossLook2b
put look %user7 caravan
put glance
CrossLook2b:
match Oops belonging to
match CrossLook3a from Tiger Clan
match CrossLook3b You glance
match Oops belonging to
matchwait

CrossLook3a:
pause 1
save CrossLook3ab
put look %user7 caravan
put glance
CrossLook3ab:
match Oops belonging to
match CA from Wolf Clan
match CrossLook4 You glance
matchwait

CrossLook3b:
pause 1
save CrossLook3bb
put look %user7 caravan
put glance
CrossLook3bb:
match Oops belonging to
match CrossLook4 from Wolf Clan
match CT You glance
matchwait

CrossLook4:
pause 1
save CrossLook4b
put look %user7 caravan
put glance
CrossLook4b:
match Oops belonging to
match CT destined for Tiger
match CT destined for Wolf
match CA You glance
matchwait

CA:
put tell caravan to lead to arthe dale
SAVE CA2
pause 1
goto TrainCrossArthe
CA2:
waitfor [Valley, Village Gate]
put tell cara to follow
AtArthe:
put go gate
waitfor following you.
put n
waitfor following you.
put n
waitfor following you.
put n
waitfor following you.
put n
waitfor following you.
put w
put stow right
waitfor following you.
put go door
put go door
goto Arthe0

CT:
put w
waitfor following you.
put n
waitfor caravan arrives from the south, following you.
put n
waitfor caravan arrives from the south, following you.
put n
waitfor caravan arrives from the south, following you.
put n
waitfor caravan arrives from the south, following you.
put n
waitfor caravan arrives from the south, following you.
put n
waitfor caravan arrives from the south, following you.
put w
waitfor caravan arrives from the east, following you.
put w
waitfor caravan arrives from the east, following you.
put w
waitfor caravan arrives from the east, following you.
put go gate
waitfor following you.
put go path
waitfor following you.
put w
waitfor caravan arrives from the east, following you.
put w
waitfor caravan arrives from the east, following you.
put nw
waitfor caravan arrives from the southeast, following you.
put w
waitfor caravan arrives from the east, following you.
put w
waitfor caravan arrives from the east, following you.
put nw
waitfor caravan arrives from the southeast, following you.
put w
waitfor caravan arrives from the east, following you.
put w
waitfor caravan arrives from the east, following you.
put sw
waitfor caravan arrives from the northeast, following you.
put w
waitfor caravan arrives from the east, following you.
put w
waitfor caravan arrives from the east, following you.
put nw
waitfor caravan arrives from the southeast, following you.
put nw
waitfor caravan arrives from the southeast, following you.
put w
waitfor caravan arrives from the east, following you.
put go gate
waitfor following you.
put s
waitfor caravan arrives from the north, following you.
put se
waitfor caravan arrives from the northwest, following you.
put s
waitfor caravan arrives from the north, following you.
put sw
waitfor caravan arrives from the northeast, following you.
put nw
waitfor caravan arrives from the southeast, following you.
put nw
put stow right
waitfor caravan arrives from the southeast, following you.
put go outpost 
goto Tiger0

Tiger0:
SAVE TigerLook
put get my tiger contract
match Tiger1 referring
match Tiger00 You get 
matchwait

Tiger00:
put give clerk
pause 1
goto Tiger0

Tiger1:
put ask mini for con
match Tiger2 for a total of
match TigerLook "Return when you have done it."
match TigerPay The minister reminds you
matchwait

TigerPay:
put pay clerk
goto Tiger1

Tiger2:
put give clerk
put pay clerk
pause 2
put read my contract
MATCH Stow guild office 
matchwait

TigerLook:
pause 1
put out
put southeast
waitfor following you.
save TigerLook1b
put look %user7 caravan
TigerLook1b:
match Oops belonging to
match TW destined for Wolf
match TigerLook2 A sturdy crate
matchwait

TigerLook2:
pause 1
save TigerLook2b
put look %user7 caravan
TigerLook2b:
match Oops belonging to
match TC from Wolf Clan
match TW A sturdy crate
matchwait

TW:
put se
waitfor caravan arrives from the northwest, following you.
put ne
waitfor caravan arrives from the southwest, following you.
put n
waitfor caravan arrives from the south, following you.
put nw
waitfor caravan arrives from the southeast, following you.
put n
waitfor caravan arrives from the south, following you.
put go gate
waitfor following you.
put w
waitfor caravan arrives from the east, following you.
put nw
waitfor caravan arrives from the southeast, following you.
put w
waitfor caravan arrives from the east, following you.
put w
waitfor caravan arrives from the east, following you.
put go brook
waitfor following you.
put w
waitfor caravan arrives from the east, following you.
pause 1
put w
waitfor caravan arrives from the east, following you.
pause 1
put w
waitfor caravan arrives from the east, following you.
put sw
waitfor caravan arrives from the northeast, following you.
put w
waitfor caravan arrives from the east, following you.
put sw
waitfor caravan arrives from the northeast, following you.
put s
waitfor caravan arrives from the north, following you.
put s
waitfor caravan arrives from the north, following you.
put e
waitfor caravan arrives from the west, following you.
put go bush
waitfor following you.
put s
waitfor caravan arrives from the north, following you.
put sw
waitfor caravan arrives from the northeast, following you.
put s
put stow right
waitfor caravan arrives from the north, following you.
put go outpost
goto Wolf0

TC:
put se
waitfor caravan arrives from the northwest, following you.
put ne
waitfor caravan arrives from the southwest, following you.
put n
waitfor caravan arrives from the south, following you.
put nw
waitfor caravan arrives from the southeast, following you.
put n
waitfor caravan arrives from the south, following you.
put go gate
waitfor following you.
put e
waitfor caravan arrives from the west, following you.
put se
waitfor caravan arrives from the northwest, following you.
put se
waitfor caravan arrives from the northwest, following you.
put e
waitfor caravan arrives from the west, following you.
put e
waitfor caravan arrives from the west, following you.
put ne
waitfor caravan arrives from the southwest, following you.
put e
waitfor caravan arrives from the west, following you.
put e
waitfor caravan arrives from the west, following you.
put se
waitfor caravan arrives from the northwest, following you.
put e
waitfor caravan arrives from the west, following you.
put e
waitfor caravan arrives from the west, following you.
put se
waitfor caravan arrives from the northwest, following you.
put e
waitfor caravan arrives from the west, following you.
put e
waitfor caravan arrives from the west, following you.
put go path
waitfor following you.
put go gate
waitfor following you.
put e
waitfor caravan arrives from the west, following you.
put e
waitfor caravan arrives from the west, following you.
put e
waitfor caravan arrives from the west, following you.
put s
waitfor caravan arrives from the north, following you.
put s
waitfor caravan arrives from the north, following you.
put s
waitfor caravan arrives from the north, following you.
put s
waitfor caravan arrives from the north, following you.
put s
waitfor caravan arrives from the north, following you.
put s
waitfor caravan arrives from the north, following you.
put go door
goto Cross0

Wolf0:
SAVE WolfLook
put get my wolf contract
match Wolf1 referring
match Wolf00 You get
matchwait

Wolf00:
put give clerk
pause 1
goto Wolf0

Wolf1:
put ask mini for con
match Wolf2 for a total of
match Wolf2b "Return when you have done it."
match WolfPay The minister reminds you
matchwait

WolfPay:
put pay clerk
goto Wolf1

Wolf2b:
move out
move north
goto WolfLook

Wolf2:
put give clerk
put pay clerk
pause 2
put read my contract
MATCH Stow guild office
matchwait

WolfLook:
put out
put north
waitfor following you.
save WolfLook1b
put look %user7 caravan
WolfLook1b:
match Oops belonging to
match WT destined for Tiger
match WolfLook2 A sturdy crate
matchwait

WolfLook2:
pause 1
save WolfLook2b
put look %user7 caravan
WolfLook2b:
match Oops belonging to
match WC from Tiger
match WT A sturdy crate
matchwait

WT:
put ne
waitfor caravan arrives from the southwest, following you.
put n
waitfor caravan arrives from the south, following you.
put go bush
waitfor following you.
put w
waitfor caravan arrives from the east, following you.
put n
waitfor caravan arrives from the south, following you.
put n
waitfor caravan arrives from the south, following you.
put ne
waitfor caravan arrives from the southwest, following you.
put e
waitfor caravan arrives from the west, following you.
put ne
waitfor caravan arrives from the southwest, following you.
put e
waitfor caravan arrives from the west, following you.
put go brook
waitfor following you.
put e
waitfor caravan arrives from the west, following you.
pause 1
put e
waitfor caravan arrives from the west, following you.
pause 1
put e
waitfor caravan arrives from the west, following you.
put e
waitfor caravan arrives from the west, following you.
put se
waitfor caravan arrives from the northwest, following you.
put e
waitfor caravan arrives from the west, following you.
put go gate
waitfor following you.
put s
waitfor caravan arrives from the north, following you.
put se
waitfor caravan arrives from the northwest, following you.
put s
waitfor caravan arrives from the north, following you.
put sw
waitfor caravan arrives from the northeast, following you.
put nw
waitfor caravan arrives from the southeast, following you.
put nw
put stow right
waitfor caravan arrives from the southeast, following you.
put go outp
goto Tiger0

WC:
put ne
waitfor caravan arrives from the southwest, following you.
put n
waitfor caravan arrives from the south, following you.
put go bush
waitfor following you.
put n
waitfor caravan arrives from the south, following you.
put w
waitfor caravan arrives from the east, following you.
put n
waitfor caravan arrives from the south, following you.
put ne
waitfor caravan arrives from the southwest, following you.
put e
waitfor caravan arrives from the west, following you.
put ne
waitfor caravan arrives from the southwest, following you.
put e
waitfor caravan arrives from the west, following you.
put go brook
waitfor following you.
put e
waitfor caravan arrives from the west, following you.
pause 1
put e
waitfor caravan arrives from the west, following you.
pause 1
put e
waitfor caravan arrives from the west, following you.
put e
waitfor caravan arrives from the west, following you.
put se
waitfor caravan arrives from the northwest, following you.
put e
waitfor caravan arrives from the west, following you.
put e
waitfor caravan arrives from the west, following you.
put se
waitfor caravan arrives from the northwest, following you.
put se
waitfor caravan arrives from the northwest, following you.
put e
waitfor caravan arrives from the west, following you.
put e
waitfor caravan arrives from the west, following you.
put ne
waitfor caravan arrives from the southwest, following you.
put e
waitfor caravan arrives from the west, following you.
put e
waitfor caravan arrives from the west, following you.
put se
waitfor caravan arrives from the northwest, following you.
put e
waitfor caravan arrives from the west, following you.
put e
waitfor caravan arrives from the west, following you.
put se
waitfor caravan arrives from the northwest, following you.
put e
waitfor caravan arrives from the west, following you.
put e
waitfor caravan arrives from the west, following you.
put go path
waitfor following you.
put go gate
waitfor following you.
put e
waitfor caravan arrives from the west, following you.
put e
waitfor caravan arrives from the west, following you.
put e
waitfor caravan arrives from the west, following you.
put s
waitfor caravan arrives from the north, following you.
put s
waitfor caravan arrives from the north, following you.
put s
waitfor caravan arrives from the north, following you.
put s
waitfor caravan arrives from the north, following you.
put s
waitfor caravan arrives from the north, following you.
put s
waitfor caravan arrives from the north, following you.
put go door
goto Cross0

Arthe0:
SAVE ArtheLook
pause 1
put get my arthe contract
match Arthe1 referring
match Arthe00 You get
matchwait

Arthe00:
put give clerk
pause 1
goto Arthe0

Arthe1:
put ask mini for con
match Arthe2 for a total of
match ArtheLook "Return when you have done it."
match ArthePay The minister reminds you
matchwait

ArthePay:
put pay clerk
goto Arthe1

Arthe2:
put give clerk
put pay clerk
pause 2
put read my contract
MATCH Stow guild office
matchwait

ArtheLook:
move go door
put out
put tell caravan to lead to stone clan
pause 4
save ArtheLook1b
put look %user7 caravan
ArtheLook1b:
match Oops belonging to
match AS Wolf Clan and destined for Dirge.
match AS Tiger Clan and destined for Dirge.
match AS Crossing and destined for Dirge.
match AS Deriel and destined for Dirge.
match AS Wolf Clan and destined for Stone
match AS Tiger Clan and destined for Stone
match AS Crossing and destined for Stone
match AS Deriel and destined for Stone
match ArtheLook2 A sturdy crate
matchwait

ArtheLook2:
pause 1
save ArtheLook2b
put look %user7 caravan
ArtheLook2b:
match Oops belonging to
match ArtheLook3 Dirge and destined for
match AC Stone Clan and destined
match AS A sturdy crate
matchwait

ArtheLook3:
pause 1
save ArtheLook3b
put look %user7 caravan
ArtheLook3b:
match Oops belonging to
match AC Stone Clan and destined for
match AC Dale and destined for Wolf
match AC Dale and destined for Tiger
match AC Dale and destined for Leth
match AC Dale and destined for The Crossing
match AC Dale and destined for Dirge
match AS A sturdy crate
matchwait

AS:
SAVE ASa
pause 1
goto TrainArtheStone
ASa:
waitfor The Guild Stables
put tell cara to wait
move go outpost
put stow right
goto Stone0

Stone0:
SAVE StoneLook
put get my stone contract
match Stone1 referring
match Stone00 You get
matchwait

Stone00:
put give clerk
pause 1
goto Stone0

Stone1:
put ask mini for con
match Stone2 for a total of
match StoneLook "Return when you have done it."
match StonePay The minister reminds you
matchwait

StonePay:
put pay clerk
goto Stone1

Stone2:
put give clerk
put pay clerk
pause 2
put read my contract
MATCH Stow guild office
matchwait

StoneLook:
put out
put tell caravan to lead to dirge
pause 3
save StoneLook1b
put look %user7 caravan
StoneLook1b:
match Oops belonging to
match SD Wolf Clan and destined for Dirge.
match SD Tiger Clan and destined for Dirge.
match SD Crossing and destined for Dirge.
match SD Arthe Dale and destined for Dirge.
match SD Deriel and destined for Dirge.
match StoneLook2 A sturdy crate
matchwait

StoneLook2:
pause 1
save StoneLook2b
put look %user7 caravan
StoneLook2b:
match Oops belonging to
match StoneLook3 from Dirge
match SD A sturdy crate
matchwait

StoneLook3:
pause 1
save StoneLook3b
put look %user7 caravan
StoneLook3b:
match Oops belonging to
match SA destined for Arthe
match StoneLook4 A sturdy crate
matchwait

StoneLook4:
pause 1
save StoneLook3b
put look %user7 caravan
StoneLook3b:
match Oops belonging to
match SC from Arthe
match SA A sturdy crate
matchwait

Dirge0:
SAVE Dirge
put get my dirge contract
match Dirge1 referring
match Dirge00 You get
matchwait

Dirge00:
put give clerk
pause 1
goto Dirge0

Dirge1:
move climb stair
Dirge1b:
put ask mini for con
match Dirge2 for a total of
match Dirge2b "Return when you have done it."
match DirgePay The minister reminds you
matchwait

DirgePay:
put pay clerk
goto Dirge1

Dirge2b:
move climb stair
move out
goto Dirge

Dirge2:
move climb stair
put give clerk
put pay clerk
pause 2
put read my contract
MATCH Stow guild office
matchwait

Dirge:
put out
put go gate
waitfor following you.
put s
waitfor following you.
put s
waitfor following you.
put s
waitfor following you.
put e
waitfor following you.
put ne
waitfor following you.
put se
waitfor following you.
put e
waitfor following you.
put sw
waitfor following you.
put w
waitfor following you.
put sw
waitfor following you.
put w
waitfor following you.
put go road
waitfor following you.
put tell caravan lead to crossing
pause 3
put look %user7 caravan
match DS destined for Stone
match DirgeLook A sturdy crate
matchwait

DirgeLook:
pause 1
save DirgeLook1b
put look %user7 caravan
DirgeLook1b:
match Oops belonging to
match DirgeLook2 from Stone
match DS A sturdy crate
matchwait

DirgeLook2:
pause 1
save DirgeLook2b
put look %user7 caravan
DirgeLook2b:
match Oops belonging to
match DA destined for Arthe
match DirgeLook3 A sturdy crate
matchwait

DirgeLook3:
pause 1
save DirgeLook3b
put look %user7 caravan
DirgeLook3b:
match Oops belonging to
match DC from Arthe
match DA A sturdy crate
matchwait

DS:
put tell caravan to lead to stone clan
waitfor The Guild Stables
put tell cara to wait
move go outpost
put stow right
goto Stone0

DA:
put tell caravan to lead to arthe dale
SAVE DAa
pause 1
goto TrainFromDirge
DAa:
waitfor [Valley, Village Gate]
put tell cara to follow
put go gate
waitfor following you.
put n
waitfor following you.
put n
waitfor following you.
put n
waitfor following you.
put n
waitfor following you.
put w
put stow right
waitfor following you.
put go door
put go door
goto Arthe0

DC:
put tell caravan to lead to crossing
SAVE DCa
pause 1
goto TrainFromDirge
DCa:
waitfor [Northeast Wilds, Outside Northeast Gate]
put tell cara foll
put go gat
waitfor following you.
put w
waitfor following you.
put w
waitfor following you.
put s
waitfor following you.
put s
waitfor following you.
put w
waitfor following you.
put w
waitfor following you.
put s
waitfor following you.
put w
waitfor following you.
put w
waitfor following you.
put w
waitfor following you.
put w
waitfor following you.
put w
waitfor following you.
put w
waitfor following you.
put go bridge
waitfor following you.
put s
waitfor following you.
put w
waitfor following you.
put s
waitfor following you.
put s
waitfor following you.
put s
waitfor following you.
put s
waitfor following you.
put s
put stow right
waitfor following you.
put go door
goto Cross0

SD:
put tell caravan to lead to dirge
SAVE SD2
pause 1
goto TrainStoneDirge
SD2:
waitfor [North Roads Caravansary]
AtDirge:
put tell cara to foll
put go path
waitfor following you.
put e
waitfor caravan arrives from the west, following you.
put ne
waitfor caravan arrives from the southwest, following you.
put e
waitfor caravan arrives from the west, following you.
put ne
waitfor caravan arrives from the southwest, following you.
put w
waitfor caravan arrives from the east, following you.
put nw
waitfor caravan arrives from the southeast, following you.
put sw
waitfor caravan arrives from the northeast, following you.
put w
waitfor caravan arrives from the east, following you.
put n
waitfor caravan arrives from the south, following you.
put n
waitfor caravan arrives from the south, following you.
put n
waitfor caravan arrives from the south, following you.
put go gate
put stow right
waitfor following you.
put go stable
goto Dirge0

AtStone:
put tell cara follow
put down
waitfor following you.
put stow right
put climb trail
waitfor following you.
put go outpost
goto Stone0

SA:
put tell caravan lead to arthe dale
SAVE SAa
pause 1
goto TrainStoneArthe
SAa:
waitfor [Valley, Village Gate]
put tell cara to follow
put go gate
waitfor following you.
put n
waitfor following you.
put n
waitfor following you.
put n
waitfor following you.
put n
waitfor following you.
put w
put stow right
waitfor following you.
put go door
put go door
goto Arthe0

SC:
put tell caravan to lead to crossing
SAVE SCa
pause 1
goto TrainStoneCrossing
SCa:
waitfor [Northeast Wilds, Outside Northeast Gate]
AtCross:
put tell cara foll
put go gat
waitfor following you.
put w
waitfor following you.
put w
waitfor following you.
put s
waitfor following you.
put s
waitfor following you.
put w
waitfor following you.
put w
waitfor following you.
put s
waitfor following you.
put w
waitfor following you.
put w
waitfor following you.
put w
waitfor following you.
put w
waitfor following you.
put w
waitfor following you.
put w
waitfor following you.
put go bridge
waitfor following you.
put s
waitfor following you.
put w
waitfor following you.
put s
waitfor following you.
put s
waitfor following you.
put s
waitfor following you.
put s
waitfor following you.
put s
put stow right
waitfor following you.
put go door
goto Cross0

AC:
SAVE ACa
put tell caravan to lead to crossing
pause 1
goto TrainArtheCrossing
ACa:
waitfor [Northeast Wilds, Outside Northeast Gate]
put tell cara foll
put go gat
waitfor following you.
put w
waitfor following you.
put w
waitfor following you.
put s
waitfor following you.
put s
waitfor following you.
put w
waitfor following you.
put w
waitfor following you.
put s
waitfor following you.
put w
waitfor following you.
put w
waitfor following you.
put w
waitfor following you.
put w
waitfor following you.
put w
waitfor following you.
put w
waitfor following you.
put go bridge
waitfor following you.
put s
waitfor following you.
put w
waitfor following you.
put s
waitfor following you.
put s
waitfor following you.
put s
waitfor following you.
put s
waitfor following you.
put s
put stow right
waitfor following you.
put go door
goto Cross0

CF2:
put open my lavender box
put s
waitfor caravan arrives from the north, following you.
put s
waitfor caravan arrives from the north, following you.
put s
waitfor caravan arrives from the north, following you.
put s
waitfor caravan arrives from the north, following you.
put s
waitfor caravan arrives from the north, following you.
put s
waitfor caravan arrives from the north, following you.
goto CF3
CF:
put west
waitfor following you.
CF3:
put s
waitfor following you.
put s
waitfor following you.
put s
waitfor following you.
put se
waitfor following you.
put sw
waitfor following you.
put go pier
waitfor following you.
save lookdock
goto Ferry

FL:
save LookGate
put tell caravan to lead to leth
waitfor [Southern Trade Route, Outside Leth Deriel
goto AtLeth
goto Fold

AtLeth:
put tell cara foll
put go gate
waitfor following you.
put se
waitfor following you.
put se
waitfor following you.
put se
waitfor following you.
put se
waitfor following you.
put se
waitfor following you.
put se
waitfor following you.
put se
waitfor following you.
put se
put stow right
waitfor following you.
put go shanty
goto Leth0

Leth0:
put get my leth contract
match Leth1 referring
match Leth00 You get
matchwait

Leth00:
put give clerk
pause 1
goto Leth0

Leth1:
put ask mini for con
match Leth2 for a total of
match LethPay The minister reminds you
matchwait

LethPay:
put pay clerk
goto Leth1

Leth2:
SAVE LF
put give clerk
put pay clerk
pause 2
put read my contract
MATCH Stow guild office
matchwait

LethW0:
pause 1
save LethW0b
put look %user7 caravan
put glance
LethW0b:
match CF from Dirge and destined for Leth
match CF from Stone Clan and destined for Leth
match CF from Arthe Dale and destined for Leth
match LethW1 from Tiger Clan and destined for Leth
match CrossLook2 You glance
matchwait

LethW1:
pause 1
save LethW1b
put look %user7 caravan
put glance
LethW1b:
match CF Crossing and destined for Leth
match CF from Arthe Dale and destined for Leth
match CF from Dirge and destined
match CF from Stone Clan and destined
match CA You glance
matchwait

LethT0:
pause 1
save LethT0b
put look %user7 caravan
put glance
LethT0b:
match CF from Dirge and destined for Leth
match CF from Stone Clan and destined for Leth
match CF from Arthe Dale and destined for Leth
match LethW1 from Wolf Clan and destined for Leth
match CrossLook2 You glance
matchwait

LethD0:
pause 1
save LethD0b
put look %user7 caravan
put glance
LethD0b:
match CF from Wolf Clan and destined for Leth
match CF from Tiger Clan and destined for Leth
match CF from Stone Clan and destined for Leth
match CF from Arthe Dale and destined for Leth
match LethD1 You glance
matchwait

LethD1:
pause 1
save LethD1b
put look %user7 caravan
put glance
LethD1b:
match CloseBox Crossing and destined for Leth
match CrossLook2 You glance
matchwait

LethS0:
pause 1
save LethS0b
put look %user7 caravan
put glance
LethS0b:
match CF from Wolf Clan and destined for Leth
match CF from Tiger Clan and destined for Leth
match CF from Dirge and destined for Leth
match CF from Arthe Dale and destined for Leth
match LethS1 You glance
matchwait

LethS1:
pause 1
save LethS1b
put look %user7 caravan
put glance
LethS1b:
match CloseBox Crossing and destined for Leth
match CrossLook2 You glance
matchwait

LethA0:
pause 1
save LethA0b
put look %user7 caravan
put glance
LethA0b:
match CF from Wolf Clan and destined for Leth
match CF from Tiger Clan and destined for Leth
match CF from Dirge and destined for Leth
match CF from Stone Clan and destined for Leth
match LethA1 You glance
matchwait

LethA1:
pause 1
save LethA1b
put look %user7 caravan
put glance
LethA1b:
match CrossLook2 Crossing and destined for Leth
match CrossLook2 You glance
matchwait



LF:
pause 1
put out
put nw
waitfor caravan arrives from the southeast, following you.
put nw
waitfor caravan arrives from the southeast, following you.
put nw
waitfor caravan arrives from the southeast, following you.
put nw
waitfor caravan arrives from the southeast, following you.
put nw
waitfor caravan arrives from the southeast, following you.
put nw
waitfor caravan arrives from the southeast, following you.
put nw
waitfor caravan arrives from the southeast, following you.
put nw
waitfor caravan arrives from the southeast, following you.
put go gate
waitfor following you.
put tell caravan to lead to crossing
waitfor stops and waits, having arrived at its destination.
put tell cara foll
put n
waitfor following you.
SAVE LookDock
goto Ferry

FC:
put go square
waitfor following you.
put ne
waitfor following you.
put nw
waitfor following you.
put n
waitfor following you.
put n
waitfor following you.
put n
put stow right
waitfor following you.
put go door
goto Cross0


AtFerryS:
put tell car follow
put n
waitfor following you.
Ferry:
put go ferry
match OnFerry following you.
match WaitFerry There is no ferry here to go aboard.
match WaitFerry I could not find what you were referring to.
match WaitFerry stuck here until the next one arrives.
match WaitFerry You will have to wait for the next one.
matchwait

WaitFerry:
put hide
match Ferry pulls into the dock.
match Ferry pulls up to the dock.
matchwait

OnFerry:
goto TrainFerry
OnFerry2:
match GoDock crew ties the ferry off.
matchwait

Stow:
put stow my contract
waitfor You put
goto %s

GoDock:
put gO dOcK
match GoDock ...wait
match OnFerry2 What docks?
match OffFerry [The Crossing, Alfren's Ferry]
match OffFerry [Southern Trade Route, Segoltha South Bank]
matchwait

OffFerry:
waitfor following you
put look
match FC [The Crossing, Alfren's Ferry]
match FL [Southern Trade Route, Segoltha South Bank]
matchwait

StableCrossing:
put tell cara go fast
put out
waitfor following you.
put e
waitfor following you.
put s
waitfor following you.
put s
waitfor following you.
put s
waitfor following you.
put s
waitfor following you.
put s
waitfor following you.
put s
waitfor following you.
put go door
goto Cross0

TrainFerry:
put hold feedbag
put give caravan
pause 2
put wear feedbag
ECHO ** This can be a good place to insert some training, but keep it short since ferry rides are not very fast now
ECHO ** If you input training here, have the last line be GOTO GODOCK
put hide
goto OnFerry2

TrainArtheStone:
TrainStoneArthe:
TrainStoneDirge:
put hold feedbag
put give caravan
pause 2
put wear feedbag
ECHO ** This can be a good place to insert some training
goto %s

TrainCrossArthe:
put hold feedbag
put give caravan
pause 2
put wear feedbag
ECHO ** This can be a good place to insert a run to the bank or training
goto %s

TrainArtheCrossing:
TrainStoneCrossing:
put hold feedbag
put give caravan
pause 2
put wear feedbag
ECHO ** This can be a good place to insert some training
goto %s

TrainFromDirge:
put hold feedbag
put give caravan
pause 2
put wear feedbag
put forage grass
pause 6
put put my grass in my feedbag
put forage grass
pause 6
put put my grass in my feedbag
put forage grass
pause 6
put put my grass in my feedbag
put forage grass
pause 6
put put my grass in my feedbag
ECHO ** This can be a good place to insert some training
goto %s

