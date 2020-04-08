new.primer:
setvariable hwater vial
setvariable primer %1
pause 0.5
put tap my stick
goto prep
match recall I could not find
match mech.check You tap a
matchwait


mech.check:
pause 0.5
put exp mech
match recall Bewildering
match recall bewildered
match recall dazed
match recall mind lock
match get.primer EXP HELP
matchwait

get.primer:
pause 0.5
action instant goto get.primer when crumbles to dust
put get %primer primer
match recall What were you referring 
match turn You get a
matchwait

turn:
pause 0.5
put turn pri
matchre study You open
matchre study You flip forward
matchre prep You flip to the end
matchwait

study:
pause 0.5
put study pri
match turn You have already studied this page
match turn Roundtime
matchwait

prep:
pause 0.5
put stow %primer primer
pause 0.5
put get %hwater
pause 1
put get my stick
pause 0.5
put prep bless 5
pause 1
put spri %hwater on stick
pause 5
put cast my stick
pause 0.5
put fill %hwater with water
pause 0.5
put stow %hwater
pause 0.5
put get rit knife
goto carving

Carving:
pause 0.5
put carve my stick with my rit knife
pause 0.5
put glance
match goshaping block
match carving stick
matchwait

goshaping:
pause 0.5
put stow knife
pause 0.5
put get shaper
pause
goto Shaping


Shaping:
pause 0.5
put shape block to %primer
wait
pause 1
put glance
match shaping block
match done bead
matchwait

Done:
pause 0.5
put stow shaper
pause 0.5
put app bead
wait
pause 1
put put bead in pit
goto new.primer