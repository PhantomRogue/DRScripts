#debug 10

action put #queue clear; send 1 $lastcommand when ^\.\.\.wait|^Sorry, you may only type|^You are still stunned
action goto QUIT when eval $health < 60
action var Eluned Closed when The waters of Eluned
action var Tasmine Closed when You have been recently enlightened
action var Truffenyi Closed when You are still captivated by
action var Conduit Closed when You will not be able to open another divine conduit
action var Devotion Low when You feel unclean and|parched and thirsting for nourishment|You call out to your|you sense that your god is barely aware of|when you sense that your efforts have not gone|when you sense a distinct link between you
var Conduit Ready
var Eluned Ready
var Tasmine Ready
var Truffenyi Ready
var Devotion Normal
var DIRT.HOLDER velvet reticule

CommuneSense:
  pause 0.5
  send COMMUNE
  send COMMUNE SENSE
  gosub RT.Wait
  if %Devotion = Low then goto LowDevotion
  if %Conduit = Closed then goto ConduitClosed
  if %Eluned = Ready then goto Eluned
  if %Tasmine = Ready then goto Tasmine
  if %Truffenyi = Ready then goto Truffenyi
  goto CommuneDone

CommuneSense2:
  var Devotion Normal
  pause 2
  send COMMUNE
  send COMMUNE SENSE
  gosub RT.Wait
  goto Truffenyi

Eluned:
  if $Theurgy.LearningRate > 25 then goto TheurgyEXP
  gosub EMPTYHANDS
  send GET MY VIAL
  matchre Eluned3 You manage to find|to find
  matchre Eluned2 and believe you would have better luck|Roundtime
  send FORAGE DIRT
  matchwait 5

Eluned2:
  matchre Eluned3 You draw out|You get|You pick up|You are already|You push the release|Your hands are
  match SkipEluned What were you
  send PUSH MY %DIRT.HOLDER
  matchwait 5
  goto SkipEluned

Eluned3:
  send COMMUNE ELUNED
  send GET WATER FROM MY VIAL
  waitforre You draw out|You get|You pick up|You are already|What were you
  gosub EMPTYHANDS
  echo **
  echo ** ELUNED DONE
  echo **
  goto Tasmine

Tasmine:
  if $Theurgy.LearningRate > 25 then goto TheurgyEXP
  if %Tasmine = Closed then goto CommuneSense2
  gosub EMPTYHANDS
  send GET MY HOLY WATER
  waitforre You draw out|You get|You pick up|You are already
  send SPRI WATER ON HINTOC
  send COMMUNE
  gosub STOWR
  echo **
  echo ** TASMINE DONE
  echo **
  goto CommuneSense2

Truffenyi:
  if $Theurgy.LearningRate > 16 then goto TheurgyEXP
  if %Devotion = Low then goto LowDevotion
  if %Conduit = Closed then goto ConduitClosed
  if %Truffenyi = Closed then goto CommuneDone
  gosub EMPTYHANDS
  send GET MY WOLF BEAD
  waitforre You draw out|You get|You pick up|You are already|What were you
  send COMMUNE TRUFF
  gosub STOWR
  echo **
  echo ** TRUFFENYI DONE
  echo **
  goto CommuneDone

SkipEluned:
  echo **
  echo ** NO DIRT, SKIPPING ELUNED
  echo **
  gosub EMPTYHANDS
  goto Tasmine

TheurgyEXP:
  echo **
  echo ** THEURGY FIELD EXP IS TOO HIGH TO DO COMMUNE
  echo **
  goto CommuneDone

ConduitClosed:
  echo **
  echo ** PLEASE WAIT FOR ANOTHER CONDUIT TO OPEN
  echo **
  goto CommuneDone

LowDevotion:
  echo **
  echo ** YOUR DEVOTION IS TOO LOW TO CONTINUE
  echo **
  goto CommuneDone

EMPTYHANDS:
  gosub STOWL
  gosub STOWR
  return

STOWR:
  send STOW R
  waitforre You put|Stow
  return

STOWL:
  send STOW L
  waitforre You put|Stow
  return

RT.WAIT:
  pause
  pause 1
  return

CommuneDone:
  Exit

QUIT:
  echo Health is low! Aborting script.
  exit