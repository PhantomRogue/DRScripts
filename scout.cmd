#Scout to a destination: XNE, XW, DIRGE, KAERNA, KNIFE

###################################
#Where To Go
###################################
WhereTo:
PUT LOOK
MATCH NTROF [Northern Trade Road, Open Forest]
MATCH NWONG [Northeast Wilds, Outside Northeast Gate]
MATCH NTRFL [Northern Trade Road, Farmlands]
MATCH NTRGL [Northern Trade Road, Grasslands]
MATCH NRFAR [North Road, Farmlands]
MATCH NRFER [North Road, Ferry]
MATCH NTRKVO [Northern Trade Road, Kaerna Village Outskirts]
MATCH NTRFOO [Northern Trade Road, Foothills]
MATCH WSF [Wilderness, Sparse Forest]
MATCH NTRFAR [Northern Trade Road, Farmstead]
MATCH MF [Mycthengelde, Flatlands]
MATCH NRBP [North Road, Barony Pass]
MATCH NRFAR [North Road, Farmlands]
MATCH NRRE [North Road, River's Edge]
MATCH NRDF [North Road, Danduwen Forest]
MATCHWAIT

###################################
#Therenborough
###################################
NRBP:
PUT LOOK
MATCH NRBP1%1 With one final sweep, the road
MATCH NRBP2%1 As the road twists and turns through sloping hills
MATCH NRBP3%1 Acres of fertile farmland stretch out to the south.
MATCHWAIT

NRFAR:
PUT LOOK
MATCH NRFAR1%1 Row after row of tidily formed haystacks fill the field to one side of the road.
MATCH NRFAR2%1 Tall stalks of golden sweetcorn grow in patches alongside the road.
MATCH NRFAR3%1 The North Road winds through a glen of fertile farmland,
MATCH NRFAR4%1 Tawny acres of birch trees and furlongs of picturesque crofter's
MATCHWAIT

NRBP1LANG:
MOVE S
NRBP2LANG:
MOVE SE
NRBP3LANG:
MOVE sw
NRFAR1LANG:
MOVE SW
NRFAR2LANG:
MOVE S
NRFAR3LANG:
MOVE S
NRFAR4LANG:
GOTO TrailMarker

###################################
#LANGENFIRTH
###################################
NRRE:
GOTO NRRE%1
NRRETHEREN:
MOVE N
GOTO NRRESKIP

NRDF:
PUT LOOK
NRRESKIP:
MATCH NRDF1%1 The melancholy cry of a riverbird comes from the south
MATCH NRDF2%1 The road travels at a fairly steep slant over inland hills,
MATCH NRDF3%1 A sweet, fruity scent fills the night air, radiating from the dark bushes that line the roadway.
MATCH NRDF4%1 Hedges of primroses and cat's-ear edge the road,
MATCHWAIT

NRDF1THEREN:
MOVE NW
NRDF2THEREN:
MOVE N
NRDF3THEREN:
MOVE NW
NRDF4THEREN:
GOTO TrailMarker

###################################
#Northwall Trail
###################################
NTROF:
GOTO NTROF%1
NTROFKAERNA:
MOVE se
MOVE s
MOVE sw
MOVE sw
MOVE s
MOVE s
GOTO TrailMarker
NTROFFERRY:
MOVE se
MOVE s
MOVE sw
MOVE sw
MOVE s
MOVE s
MOVE s
MOVE se
GOTO TrailMarker
NTROFDIRGE:
MOVE se
MOVE s
MOVE sw
GOTO TrailMarker
NTROFTHEREN:
NTROFLANG:
GOTO CantGetThere

###################################
#Northern Trade Road, Farmlands
###################################
NTRGL:
PUT LOOK
MATCH NTRGL1%1 Cattle wander aimlessly across the road
MATCH NTRGL2%1 Open grassland mingles with a thinning forest from the north.
MATCHWAIT

NTRFL:
PUT LOOK
MATCH NTRFL1%1 Rich farmland surrounds the road on both sides.
MATCH NTRFL2%1 The scent of freshly-tilled earth rises from the farms on both sides of the road.
MATCH NTRFL3%1 Neatly planted rows of grain mingle with tidy plots of vegetables
MATCH NTRFL3%1 Empty fields lie sleeping beneath the blanket of night.
MATCH NTRFL4%1 Open grassland mingles with small farmsteads as the wide road passes
MATCHWAIT

NTRGL2KAERNA:
MOVE S
MOVE SW
MOVE S
MOVE S
GOTO TrailMarker
NTRGL2FERRY:
MOVE S
MOVE SW
MOVE S
MOVE S
MOVE s
MOVE se
GOTO TrailMarker
NTRGL2DIRGE:
MOVE S
MOVE SW
GOTO TrailMarker
NTRGL2THEREN:
NTRGL2LANG:
GOTO CantGetThere

NTRGL1KAERNA:
MOVE SW
MOVE SW
MOVE S
MOVE S
GOTO TrailMarker
NTRGL1FERRY:
MOVE SW
MOVE SW
MOVE S
MOVE S
MOVE s
MOVE se
GOTO TrailMarker
NTRGL1DIRGE:
GOTO TrailMarker
NTRGL1THEREN:
NTRGL1LANG:
GOTO CantGetThere

NTRFL4KAERNA:
MOVE SW
MOVE S
MOVE S
GOTO TrailMarker
NTRFL4FERRY:
MOVE SW
MOVE S
MOVE S
MOVE s
MOVE se
GOTO TrailMarker
NTRFL4DIRGE:
MOVE ne
GOTO TrailMarker
NTRFL4THEREN:
NTRFL4LANG:
GOTO CantGetThere

NTRFL3KAERNA:
MOVE S
MOVE S
GOTO TrailMarker
NTRFL3FERRY:
MOVE S
MOVE S
MOVE s
MOVE se
GOTO TrailMarker
NTRFL3DIRGE:
MOVE ne
MOVE ne
GOTO TrailMarker
NTRFL3THEREN:
NTRFL3LANG:
GOTO CantGetThere

NTRFL2KAERNA:
MOVE S
GOTO TrailMarker
NTRFL2FERRY:
MOVE S
MOVE s
MOVE se
GOTO TrailMarker
NTRFL2DIRGE:
MOVE n
MOVE ne
MOVE ne
GOTO TrailMarker
NTRFL2THEREN:
NTRFL2LANG:
GOTO CantGetThere

NTRFL1KAERNA:
GOTO TrailMarker
NTRFL1FERRY:
MOVE s
MOVE se
GOTO TrailMarker
NTRFL1DIRGE:
MOVE n
MOVE n
MOVE ne
MOVE ne
GOTO TrailMarker
NTRFL1THEREN:
NTRFL1LANG:
GOTO CantGetThere

###################################
#Northeast Gate
###################################
NWONG:
GOTO NWONG%1

NWONGKAERNA:
MOVE n
GOTO TrailMarker
NWONGFERRY:
MOVE se
GOTO TrailMarker
NWONGDIRGE:
MOVE n
MOVE n
MOVE n
MOVE ne
MOVE ne
GOTO TrailMarker
NWONGTHEREN:
NWONGLANG:
GOTO CantGetThere

###################################
#Mycthengelde, Flatlands
###################################
MF:
GOTO MF%1
MFWOLF:
move nw
move nw
GOTO TrailMarker
MFKNIFE:
MFTHEREN:
MFLANG:
GOTO CantGetThere

###################################
#North Road Farmlands
###################################
NRFAR:
PUT LOOK
MATCH NRF1 The busy flow of commerce fills the road
MATCH NRF2 A sturdy covered bridge stretches across a narrow irrigation channel.
MATCHWAIT

NRF1:
GOTO NRF1%1
NRF1KAERNA:
MOVE nw
MOVE n
GOTO TrailMarker
NRF1DIRGE:
MOVE nw
GOTO TrailMarker
NRF1XING:
MOVE e
MOVE e
MOVE e
MOVE e
GOTO TrailMarker
NRF1THEREN:
NRF1LANG:
GOTO CantGetThere

NRF2:
GOTO NRF2%1
NRF2KAERNA:
MOVE GO BRIDGE
MOVE w
MOVE w
MOVE w
MOVE w
MOVE w
GOTO NRF1KAERNA
NRF2DIRGE:
MOVE GO BRIDGE
MOVE w
MOVE w
MOVE w
MOVE w
MOVE w
GOTO NRF1DIRGE
NRF2XING:
MOVE GO BRIDGE
MOVE w
GOTO TrailMarker
NRF2THEREN:
NRF2LANG:
GOTO CantGetThere

###################################
#North Road Ferry
###################################

NRFER:
GOTO NRFER%1
NRFERKAERNA:
MOVE s
GOTO TrailMarker
NRFERDIRGE:
MOVE s
MOVE s
GOTO TrailMarker
NRFERXING:
MOVE s
MOVE s
MOVE se
MOVE e
MOVE e
MOVE e
MOVE e
GOTO TrailMarker
NRFERTHEREN:
NRFERLANG:
GOTO CantGetThere

###################################
#Northern Trade Road, Kaerna Village Outskirts
###################################
NTRKVO:
GOTO NTRKVO%1
NTRKVOXING:
MOVE sw
MOVE s
GOTO TrailMarker
NTRKVODIRGE:
MOVE n
MOVE n
MOVE ne
MOVE n
GOTO TrailMarker
NTRKVOFERRY:
MOVE sw
MOVE s
MOVE s
MOVE s
MOVE s
GOTO TrailMarker
NTRKVOKNIFE:
MOVE n
MOVE n
MOVE ne
MOVE n
MOVE nw
MOVE nw
GOTO TrailMarker
NTRKVOTHEREN:
NTRKVOLANG:
GOTO CantGetThere

###################################
#Northern Trade Road, Foothills
###################################
NTRFOO:
GOTO NTRFOO%1
NTRFOOXING:
MOVE w
MOVE w
MOVE s
MOVE se
MOVE se
MOVE s
MOVE sw
MOVE s
MOVE s
GOTO NTRKVOXING
NTRFOODIRGE:
MOVE w
MOVE w
MOVE s
MOVE se
MOVE se
GOTO TrailMarker
NTRFOOFERRY:
MOVE w
MOVE w
MOVE s
MOVE se
MOVE se
MOVE s
MOVE sw
MOVE s
MOVE s
GOTO NTRKVOFERRY
NTRFOOKNIFE:
MOVE w
MOVE w
MOVE s
GOTO TrailMarker
NTRFOOTHEREN:
NTRFOOLANG:
GOTO CantGetThere

###################################
#Northern Trade Road, Farmstead
###################################
NTRFAR:
GOTO NTRFAR%1
NTRFARXING:
MOVE n
GOTO TrailMarker
NTRFARDIRGE:
MOVE n
MOVE n
MOVE ne
GOTO NTRKVODIRGE
NTRFARFERRY:
MOVE s
MOVE s
GOTO TrailMarker
NTRFARKNIFE:
MOVE n
MOVE n
MOVE ne
GOTO NTRKVOKNIFE
NTRFARTHEREN:
NTRFARLANG:
GOTO CantGetThere

###################################
#Wilderness, Sparse Forest
###################################
WSF:
GOTO WSF%1
WSFXING:
MOVE w
MOVE nw
MOVE n
GOTO TrailMarker
WSFKAERNA:
MOVE go gate
MOVE se
GOTO TrailMarker
WSFDIRGE:
WSFKNIFE:
WSFFERRY:
WSFTHEREN:
WSFLANG:
GOTO CantGetThere

###################################
#Trailmarker
###################################
Trailmarker:
PUT scout trail
MATCH NoTrailMarker Huh?
MATCH FoundTrailMarker roundtime
MATCHWAIT

NoTrailMarker:
ECHO ********* You messed up! Fix the script!
GOTO Done

FoundTrailMarker:
PUT go trail
WAITFOR As your journey ends, you gaze out at your new surroundings.
SHIFT
if_1 GOTO WhereTo
GOTO Done

CantGetThere:
###################################
#Can't Get There from He-ah.
###################################
ECHO ********* You can't get there from he-ah.
GOTO DONE
###################################
#Done
###################################
Done: