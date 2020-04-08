## Base.cmd
## Written by Czidvar
## v1.9

	#debuglevel 5
	#timer start
   
## Actions ######################################
	action instant var ClimbSlow ON when ^You are too tired to climb that\.
	action put #play Speech;put #flash when ^\w+ asks, \"|exclaims, \"|hisses, \"|lectures, \"|says, \"|^You hear .+ say|^You hear the voice of

## Variables #####################################

## Go To Base's End ##############################
	echo ][ Base Include Loaded
	goto END.OF.BASE
   
## LABELS ########################################
## Misc Action Labels ############################	
FALLEN:
	pause .2
	matchre FALLEN ^\.\.\.wait|^Sorry
	matchre RETURN You stand|You are already standing
	matchre FALLEN cannot manage to stand\.|The weight of all your possessions
	send stand
	matchwait
   
FORAGE:
	var Forage $0
FORAGE.2:
	pause .2
	matchre FORAGE ^\.\.\.wait|^Sorry
	matchre RETURN ^You manage to find
	matchre FORAGE ^Roundtime\:
	send forage %Forage
	matchwait
	
GET:
	var Get $0
GET.2:
	pause .2
	matchre GET.2 ^\.\.\.wait|^Sorry
	matchre RETURN ^You get (a|an|some|your|the)|^You are already holding that\.
	send get %Get
	matchwait
   
PUT:
	var Put $0
PUT.2:
	pause .2
	matchre PUT.2 ^\.\.\.wait|^Sorry
	matchre RETURN ^You put (a|an|some|your|the)
	send put %Put
	matchwait
	
REMOVE:
	var Remove $0
REMOVE.2:
	pause .2
	matchre REMOVE.2 ^\.\.\.wait|^Sorry
	matchre RETURN ^You remove
	send remove %Remove
	matchwait
	
SHEATH:
	var Sheath $0
SHEATH.2:
	pause .2
	matchre SHEATH.2 ^\.\.\.wait|^Sorry
	matchre RETURN ^You sheath
	send sheath %Sheath
	matchwait
	
STOW:
	var Stow $0
STOW.2:
	pause .2
	matchre STOW.2 ^\.\.\.wait|^Sorry
	matchre RETURN ^You put (a|an|some|your|the)|^Stow what\?
	send stow %Stow
	matchwait
	
WEAR:
	var Wear $0
WEAR.2:
	pause .2
	matchre WEAR.2 ^\.\.\.wait|^Sorry
	matchre RETURN ^You (attach|wear)
	send wear %Wear
	matchwait
	
WIELD:
	var Wield $0
WIELD.2:
	pause .2
	matchre WIELD.2 ^\.\.\.wait|^Sorry
	matchre RETURN ^You draw out (a|an|some|your|the)
	send wield %Wield
	matchwait
	

## Magic ###################################
PREP:
	var Prep $0
PREP.2:
	pause .2
	matchre PREP.2 ^\.\.\.wait|^Sorry
	matchre RETURN ^You begin chanting a prayer|^With rigid movements you prepare|^You raise your head skyward\, 
	send prep %Prep
	matchwait
CAST:
	var Cast $0
CAST.2:
	pause .2
	matchre CAST.2 ^\.\.\.wait|^Sorry
	matchre RETURN ^You gesture
	send cast %Cast
	matchwait

CHARGE:
	var Charge $0
CHARGE.2:
	pause .2
	matchre CHARGE.2 ^\.\.\.wait|^Sorry
	matchre RETURN ^Roundtime\:
	send charge %Charge
	matchwait
	
HARNESS:
	var Harnes $0
HARNESS.2:
	pause .2
	matchre HARNESS.2 ^\.\.\.wait|^Sorry
	matchre RETURN ^Roundtime\:
	send harness %Harness
	matchwait
   
INVOKE:
	var Invoke $0
INVOKE.2:
	pause .2
	matchre INVOKE.2 ^\.\.\.wait|^Sorry
	matchre RETURN forge a magical link
	send invoke %Invoke
	matchwait

## Movement ################################
CLIMB:
	var ClimbSpot $0
CLIMB.2:
	pause .2
	matchre CLIMB.2 ^\.\.\.wait|^Sorry
	matchre CLIMB.SUCCESS ^\[
	matchre CLIMB.FAIL You must be standing|steepness is intimidating|can\'t seem to find purchase|find it hard going\.|your footing is questionable|wave of dizziness|Struck by vertigo
	matchre CLIMB.REST ^You are too tired to
	matchre FALLEN slip after a few feet
	send climb %ClimbSpot
	matchwait
CLIMB.REST:
	pause 1
	if ("$stamina" >= "50") then goto CLIMB.2
	goto CLIMB.REST
CLIMB.SUCCESS:
	var ClimbOutcome PASS
	goto RETURN
CLIMB.FAIL:
	var ClimbOutcome FAIL
	goto RETURN
	
MOVE:
	var Dir $0
MOVE.2:
	matchre MOVE.2 ^\.\.\.wait|^Sorry
	matchre RETURN ^Obvious
	send %Dir
	matchwait

SWIM:
	var Dir $0
SWIM.2:
	pause .2
	matchre SWIM.2 ^\.\.\.wait|^Sorry|make much headway|can\'t get anywhere|blunder around|^You slap at the water in a sad failure
	matchre RETURN ^\[
	send %Dir
	matchwait


## Generic Labels ##########################
RETURN:
	return
   
EXIT:
	put #parse END SCRIPT;#flash;#beep
	exit
	matchwait

END.OF.BASE: