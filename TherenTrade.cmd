echo ********************************************************************************************
echo *** You will need a number of variables set to run this script, and a few items ***
echo
echo *** First the items, have a fiddle, something to juggle, and a compendium ***
echo *** It will not break the script if you don't have these, you'll just not learn the skills ***
echo *** Variables are....
echo *** jugg = your juggling items
echo *** container = your bag, backpack, rucksack, etc
echo *** hum = the song you will hum as you walk about
echo *** contract = normal run - ask min for work  *   finishing run - shake head
echo *** contractcheck = normal run - second   *  finishing run - first
echo *** You can change the last two at any point while running, and it will not collect new contracts
echo
echo **********************************************************************************************
echo
pause 10
put dep all
put s
put out
put hum %hum
put sw
put s
put s
put w
put w
put s
put go gate
put collect grass
pause 15
pause
pause
put stow grass in feed
put stow grass in feed
put stow grass in feed
put stow grass in feed
put stow grass in feed
put drop my grass
put drop my grass
pause
put hum %hum
put get passport
match needpass I could not
match needpass crumble
match needpass What were you referring to?
match gotpass you get
matchwait

gotpass:
put put passport in my %container
pause
put go gate
put n
put e
put e
put n
put n
put ne
put go bank
put n
goto therenbank

needpass:
pause 1
put go gate
move n
move e
move e
move n
move n
move ne
move ne
move n
move ne
move go arch
move nw
move nw
move nw
move w
move w
move ne
move ne
move go arch
move n
move n
move n
move go golden arch
move ne
gettingpass:
put ask licen for pass
pause 1
put ask licen for pass
pause 1
put tap my passp
match gettingpass I could not
match passinhand You tap
matchwait
passinhand:
put put passport in my %container
move sw
move go golden arch
move go black arch
move s
move s
move go door
move sw
move sw
move e
move e
move se
move se
move se
move go ar
move sw
move s
move sw
put go bank
move n
goto therenbank

therenbank:
put dep all
put withdraw 5 plat lirum
put withdraw 10 gold lirum
put withdraw 80 silver lirum
put withdraw 1000 bronze lirum
pause
goto therenstart

therenstart:
put s
put out
put sw
put go exch
put go door
put pay clerk
pause 3
put stop hum
put spec fine
put %contract
pause 3
put give clerk
pause 2
put pay clerk
put read my contract
pause 2
put put contract in my %container
goto therentoforn

therentoforn:
put hum %hum
put w
put out
put tell cara to follow
wait
put rem my feed
wait
put give cara
wait
put wear my feed
wait
put tell cara to go fast
wait
move s
waitfor following you
move s
waitfor following you
move w
waitfor following you
move w
waitfor following you
move s
waitfor following you
put go gate
waitfor following you
put go wall
waitfor following you
put w
pause
waitfor following you
put hum %hum
move n
waitfor following you
move nw
waitfor following you
move n
waitfor following you
move nw
waitfor following you
move ne
waitfor following you
move n
waitfor following you
move ne
waitfor following you
move ne
waitfor following you
move nw
waitfor following you
move ne
waitfor following you
put hum %hum
move n
waitfor following you
move go road
waitfor following you
move n
waitfor following you
move ne
waitfor following you
move nw
waitfor following you
move nw
waitfor following you
move n
waitfor following you
move n
waitfor following you
put hum %hum
move nw
waitfor following you
move n
waitfor following you
move climb path
waitfor following you
move up
waitfor following you
move up
waitfor following you
move up
waitfor following you
move up
waitfor following you
move up
waitfor following you
move ne
waitfor following you
move ne
waitfor following you
move n
waitfor following you
move nw
waitfor following you
move climb path
waitfor following you
move climb ramp
waitfor following you
move go bridge
waitfor following you
move w
waitfor following you
move w
waitfor following you
put hum %hum
move go gate
waitfor following you
move go pavil
move w
put get forn contract
put give clerk
pause 2
put get forn contract
put give clerk
pause 2
put get forn contract
put give clerk
pause 2
put pay clerk
pause 3
put stop hum
put spec fine
put %contract
pause 3
put give clerk
pause 2
put pay clerk
put read my contract
pause 2
put put contract in my %container
pause
goto forntohvaral

forntohvaral:
put hum %hum
pause 1
move e
move out
put rem my feed
wait
put give caravan
wait
put wear my feed
wait
put tell caravan to go fast
wait
put tell caravan to follow
wait
move w
waitfor following you
move go door
waitfor following you
move w
waitfor following you
put get my pass
wait
move go gate
waitfor following you
put put passport in my %container
wait
put tell caravan to lead to Hvaral
pause
pause
put hum %hum
put get compend
put open compend
put turn my compend
put study my compend
pause 13
pause
pause
put turn my compend
put study my compend
pause 13
pause
pause
put turn my compend
put study my compend
pause 13
pause
pause
put put my compend in my %container
pause
waitfor stops and waits, having arrived
put tell caravan to follow
move go gate
waitfor following you
move w
waitfor following you
move w
waitfor following you
move nw
waitfor following you
move go door
put get hva contract
put give clerk
pause 2
put get hva contract
put give clerk
pause 2
put get hva contract
put give clerk
pause 2
put pay clerk
pause 3
put spec fine
put %contract
pause 3
put give clerk
pause 2
put pay clerk
put read my contract
pause 2
put put contract in my %container
pause
goto musparicheck

musparicheck:
put tap %contractcheck musp contract in my %container
match hvaraltoforn What were you referring to?
match hvaraltoforn I could not find
match  hvaraltomuspari you tap
matchwait

hvaraltomuspari:
pause 1
put hum %hum
move out
put rem my feed
wait
put give caravan
wait
put wear my feed
wait
put tell caravan to go fast
wait
put tell caravan to follow
wait
move se
waitfor following you
move e
waitfor following you
move s
waitfor following you
move w
waitfor following you
put hum %hum
move sw
waitfor following you
move nw
waitfor following you
move go ramp
waitfor following you
move w
waitfor following you
put hum %hum
goto boardmusparibarge

boardmusparibarge:
put tell caravan to follow
put go barge
match musparibargewait I could not find what
match musparibargewait What were you
match musparibargewait There is no
match musparibargewait do that right now
match musparibarge crew members 
matchwait

musparibargewait:
put rem feed
wait
put give cara
wait
put wear feed
wait
put stop hum
put get fiddle
put asses my fiddle
pause 8
put asses my fiddle
pause 8
put asses my fiddle
pause 8
pause
put put fiddle in my %container
pause
goto boardmusparibarge

musparibarge:
put hum %hum
put get my %jugg
put juggle my %jugg
pause 15
put juggle my %jugg
pause 15
put put my %jugg in my %container
goto muspariarrive

muspariarrive:
put tell caravan to follow
pause 1
put go platform
match musparibarge What were you
match musparibarge do that right now
match bargetomuspari Barge Platform
matchwait

bargetomuspari:
put rem feed
wait
put give cara
wait
put wear feed
pause 3
put hum %hum
move go ramp
waitfor following you
move go gate
waitfor following you
move nw
waitfor following you
move nw
waitfor following you
move nw
waitfor following you
move nw
waitfor following you
move w
waitfor following you
move go caravansary
waitfor following you
move n
put get musp contract
put give clerk
pause
put get musp contract
put give clerk
pause
put get musp contract
put give clerk
pause
put get musp contract
put give clerk
pause
put get musp contract
put give clerk
pause
put get musp contract
put give clerk
pause
put get musp contract
put give clerk
pause
put get musp contract
put give clerk
pause
put pay clerk gold
pause
move n
put stop hum
put spec fine
put %contract
pause
move s
put give clerk
pause
put pay clerk
pause
put read my contract
put put contract in my %container
pause
pause
put pay clerk
pause
move out
put hum %hum
move out
waitfor following you
move e
waitfor following you
move se
waitfor following you
move se
waitfor following you
move se
waitfor following you
move se
waitfor following you
move go gate
waitfor following you
move go ramp
waitfor following you
goto boardmusparibargeback

boardmusparibargeback:
put tell caravan to follow
put go barge
match musparibargebackwait I could not find what
match musparibargebackwait What were you
match musparibargebackwait There is no
match musparibargebackwait do that right now
match musparibargeback crew members 
matchwait

musparibargebackwait:
put stop hum
put get fiddle
put asses my fiddle
pause 8
put asses my fiddle
pause 8
put asses my fiddle
pause 8
pause
put hum %hum
put put fiddle in my %container
pause
goto boardmusparibargeback

musparibargeback:
pause
put hum %hum
put get compend
put open compend
put turn compend
put study compend
pause 12
pause
pause
put put compend in my %container
goto muspariarriveback

muspariarriveback:
put tell caravan to follow
pause 1
put go dock
match musparibargeback What were you
match musparibargeback do that right now
match bargetomuspariback Dry Dock
matchwait

bargetomuspariback:
pause 5
put hum %hum
move e
waitfor following you
move go ramp
waitfor following you
move se
waitfor following you
move ne
waitfor following you
move e
waitfor following you
move n
waitfor following you
move w
waitfor following you
move nw
waitfor following you
put go door
put get hva contract
put give clerk
pause 2
put get hva contract
put give clerk
pause 2
put get hva contract
put give clerk
pause 2
put pay clerk
pause 3
put stop hum
put spec fine
put %contract
pause 3
put give clerk
pause 2
put pay clerk
put read my contract
pause 2
put put contract in my %container
pause
put hum %hum
goto hvaraltoforn

hvaraltoforn:
pause 1
put tell caravan to follow
move out
put tell caravan to follow
put rem feed
wait
put give cara
wait
put wear feed
wait
move se
waitfor following you
move e
waitfor following you
move e
waitfor following you
move go gate
waitfor following you
put tell caravan to lead to Fornsted
pause
pause
put hum %hum
put get compend
put open compend
put turn my compend
put study my compend
pause 13
pause
pause
put turn my compend
put study my compend
pause 13
pause
pause
put turn my compend
put study my compend
pause 13
pause
pause
put put my compend in my %container
pause
waitfor stops and waits, having arrived
put tell caravan to follow
wait
put get my pass
wait
move go gate
waitfor following you
put put passport in my %container
wait
move e
waitfor following you
move go door
waitfor following you
move e
waitfor following you
move go pavil
move w
put get forn contract
put give clerk
pause 2
put get forn contract
put give clerk
pause 2
put get forn contract
put give clerk
pause 2
put pay clerk
pause 3
put stop hum
put spec fine
put %contract
pause 3
put give clerk
pause 2
put pay clerk
put read my contract
pause 2
put put contract in my %container
pause
put hum %hum
goto forntolang

forntolang:
pause 1
move e
move out
put rem feed
wait
put give cara
wait
put wear feed
wait
put tell caravan to follow
move go gate
waitfor following you
move go bridge
waitfor following you
move e
waitfor following you
move e
waitfor following you
move d
waitfor following you
move climb path
waitfor following you
move se
waitfor following you
put hum %hum
move s
waitfor following you
move sw
waitfor following you
move sw
waitfor following you
move d
waitfor following you
move d
waitfor following you
move d
waitfor following you
move d
waitfor following you
move d
waitfor following you
put hum %hum
move climb path
waitfor following you
move s
waitfor following you
move se
waitfor following you
move s
waitfor following you
move s
waitfor following you
move se
waitfor following you
move se
waitfor following you
move sw
waitfor following you
move s
waitfor following you
move w
waitfor following you
move s
waitfor following you
move sw
waitfor following you
move se
waitfor following you
put hum %hum
move sw
waitfor following you
move sw
waitfor following you
move s
waitfor following you
move sw
waitfor following you
move se
waitfor following you
move s
waitfor following you
move se
waitfor following you
move s
waitfor following you
put e
waitfor following you
put hum %hum
move go wall
waitfor following you
pause 2
put rem feed
wait
put give cara
wait
put wear feed
wait
pause
pause
move go gate
waitfor following you
move n
waitfor following you
move e
waitfor following you
move e
waitfor following you
move n
waitfor following you
move n
waitfor following you
put go exch
put go door
put get theren contract
put give clerk
pause 2
put get theren contract
put give clerk
pause 2
put get theren contract
put give clerk
pause 2
put pay clerk
pause 3
put stop hum
put spec fine
put %contract
pause 3
put give clerk
pause 2
put pay clerk
put read my contract
pause 2
put put contract in my %container
pause
put hum %hum
put w
put out
put tell caravan to follow
pause
pause
move s
waitfor following you
move s
waitfor following you
move w
waitfor following you
move w
waitfor following you
move s
waitfor following you
put go gate
waitfor following you
pause
put tell caravan to wait
pause
put go gate
put n
put e
put e
put n
put n
put ne
put go bank
put n
put dep all
put withdraw 5 plat lirum
put withdraw 10 gold lirum
put withdraw 80 silver lirum
put withdraw 1000 bronze lirum
pause
put s
put out
put sw
put s
put s
put w
put w
put s
put go gate
pause
put tell caravan to lead to Lang
pause
pause
put hum %hum
put get compend
put open compend
put turn my compend
put study my compend
pause 13
pause
pause
put turn my compend
put study my compend
pause 13
pause
pause
put turn my compend
put study my compend
pause 13
pause
pause
put turn my compend
put study my compend
pause 13
pause
pause
put turn my compend
put study my compend
pause 13
pause
pause
put put my compend in my %container
pause
waitfor stops and waits, having arrived
put tell caravan to follow
wait
move s
waitfor following you
move se
waitfor following you
move s
waitfor following you
move sw
waitfor following you
move sw
waitfor following you
move go exchange
pause 2
put get lang contract
put give clerk
pause 2
put get lang contract
put give clerk
pause 2
put get lang contract
put give clerk
pause 2
put pay clerk
pause 3
put stop hum
put spec fine
put %contract
pause 3
put give clerk
pause 2
put pay clerk
put read my contract
pause 2
put put contract in my %container
pause
put hum %hum
goto havencheck

havencheck:
put tap %contractcheck river contract in my %container
match langtohaven you tap
match langtotheren What were you referring to?
match langtotheren I could not find
matchwait

langtohaven:
pause 1
move out
put tell caravan to follow
move s
waitfor following you
move s
waitfor following you
move e
waitfor following you
move e
waitfor following you
move s
waitfor following you
move se
waitfor following you
move go land
waitfor following you
put hum %hum
move n
waitfor following you
move e
waitfor following you
goto boardhavenbarge

boardhavenbarge:
put go barge
match havenbarge following you
match havenbargewait stuck here until
match havenbargewait You will have to wait
match havenbargewait What were you
match havenbargewait There is no
matchwait

havenbargewait:
put stop hum
put get fiddle
put hide
pause 10
put asses my fiddle
pause 8
put asses my fiddle
pause 8
put asses my fiddle
pause 8
pause
put put fiddle in my %container
pause
goto boardhavenbarge

havenbarge:
put hum %hum
put rem feed
pause
put give cara
pause
put wear feed
pause
put collect wood chip
pause 17
put kick chips
pause 2
put stand
pause 1
put collect wood chip
pause 17
put kick chips
pause 2
put stand
pause 1
put collect wood chip
pause 17
put kick chips
pause 2
put stand
pause 1
put collect wood chip
pause 17
put kick chips
pause 2
put stand
pause 1
put collect wood chip
pause 17
put kick chips
pause 2
put stand
pause 5
goto havenarrive

havenarrive:
put tell caravan to follow
pause 1
put go pier
match havenbarge What were you
match havenbarge do that right now
match havenbarge not yet docked
match bargetohaven shipment board
matchwait

bargetohaven:
pause 5
put hum %hum
put tell caravan to go fast
wait
put tell cara to follow
wait
move e
waitfor following you
move s
waitfor following you
move e
waitfor following you
move go arch
waitfor following you
move nw
waitfor following you
move go alley
put pay clerk
pause
put get river contract
put give clerk
pause 2
put get river contract
put give clerk
pause 2
put get river contract
put give clerk
pause 2
put get river contract
put give clerk
pause 2
put get river contract
put give clerk
pause 2
put get river contract
put give clerk
pause 2
put get river contract
put give clerk
pause 2
put get river contract
put give clerk
pause 2
pause 1
put pay clerk
wait
move go step
move out
pause 2
put stop hum
put spec fine
put %contract
wait
move go door
move go step
put give clerk
wait
put pay clerk
wait
put read my cont
put put contract in my %container
pause 2
put hum %hum
put tell cara to follow
put out
put tell cara to follow
put rem my feed
wait
put give caravan
wait
put wear my feed
wait
move go pier
waitfor following you
move go arch
waitfor following you
move w
waitfor following you
move n
waitfor following you
move w
waitfor following you
pause
goto boardhavenbargeback

boardhavenbargeback:
put go barge
match havenbargeback following you
match havenbargewaitback stuck here until
match havenbargewaitback You will have to wait
match havenbargewaitback What were you
match havenbargewaitback There is no
matchwait

havenbargewaitback:
put stop hum
pause
pause
put get fiddle
put hide
pause 10
put asses my fiddle
pause 8
put asses my fiddle
pause 8
put asses my fiddle
pause 8
pause
put hum %hum
put put fiddle in my %container
pause
goto boardhavenbargeback

havenbargeback:
put hum %hum
put collect wood chip
pause 17
put kick chips
pause 2
put stand
pause 1
put collect wood chip
pause 17
put kick chips
pause 2
put stand
pause 1
put collect wood chip
pause 17
put kick chips
pause 2
put stand
pause 1
put collect wood chip
pause 17
put kick chips
pause 2
put stand
pause 1
put hum %hum
put collect wood chip
pause 17
put kick chips
pause 2
put stand
pause 1
goto havenarriveback

havenarriveback:
put tell caravan to follow
pause 1
put go wharf
match havenbargeback What were you
match havenbargeback do that right now
match havenbargeback not yet docked
match wharftolang news stand
matchwait

wharftolang:
put hum %hum
pause 4
put tell caravan to follow
move w
waitfor following you
move s
waitfor following you
move w
waitfor following you
move nw
waitfor following you
move n
waitfor following you
move w
waitfor following you
move w
waitfor following you
move n
waitfor following you
move n
waitfor following you
move go exchange
pause 2
put get lang contract
put give clerk
pause 2
put get lang contract
put give clerk
pause 2
put get lang contract
put give clerk
pause 2
put pay clerk
pause 3
put stop hum
put spec fine
put %contract
pause 3
put give clerk
pause 2
put pay clerk
put read my contract
pause 2
put put contract in my %container
pause
put hum %hum
goto havencheck

langtotheren:
pause 1
pause 1
move out
put tell caravan to follow
pause
put hum %hum
move ne
waitfor following you
move ne
waitfor following you
move n
waitfor following you
move nw
waitfor following you
move n
waitfor following you
move n
waitfor following you
move n
waitfor following you
move go bridge
waitfor following you
move n
waitfor following you
move n
waitfor following you
move go shore
waitfor following you
move n
waitfor following you
move nw
waitfor following you
move n
waitfor following you
move nw
waitfor following you
put hum %hum
move ne
waitfor following you
move nw
waitfor following you
move n
waitfor following you
move n
waitfor following you
move ne
waitfor following you
move nw
waitfor following you
put tell caravan to lead to Theren
pause
put hum %hum
pause
put get compend
put open compend
put turn my compend
put study my compend
pause 13
pause
pause
put turn my compend
put study my compend
pause 13
pause
pause
put turn my compend
put study my compend
pause 13
pause
pause
put turn my compend
put study my compend
pause 13
pause
pause
put turn my compend
put study my compend
pause 13
pause
pause
put put my compend in my %container
pause
waitfor stops and waits, having arrived
put tell caravan to follow
wait
move go gate
waitfor following you
move n
waitfor following you
move e
waitfor following you
move e
waitfor following you
move n
waitfor following you
move n
waitfor following you
put go exch
put go door
put get theren contract
put give clerk
pause 2
put get theren contract
put give clerk
pause 2
put get theren contract
put give clerk
pause 2
put pay clerk
pause 3
put stop hum
put spec fine
put %contract
pause 3
put give clerk
pause 2
put pay clerk
put read my contract
pause 2
put put contract in my %container
pause
put hum %hum
goto bank

bank:
put w
put o
put tell caravan to wait
pause
put ne
put go bank
put n
put dep all
echo
echo *** a Somniumvisum Production. Please make all donations to Theren Guard in thanks ***
echo
pause 1
put bal
pause 10
goto mechcheck

mechcheck:
put %contract
match end You shake
match start whom are you speaking
match start What were you
match start Can't find
matchwait

mech:
put s
put out
put sw
put s
put s
put w
put w
put s
put go gate
put go tra
put go path
pause
put hum %hum
put forage grass
pause 5
put braid my grass
pause 6
pause
put braid my grass
pause 6
pause
put braid my grass
pause 6
pause
put braid my grass
pause 6
pause
put forage grass
pause 5
put braid my grass
pause 6
pause
put braid my grass
pause 6
pause
put braid my grass
pause 6
pause
put braid my grass
pause 6
pause
put forage grass
pause 5
put braid my grass
pause 6
pause
put braid my grass
pause 6
pause
put braid my grass
pause 6
pause
put braid my grass
pause 6
pause
put drop my grass
put drop my grass
put dump junk
pause
put hum %hum
put forage grass
pause 5
put braid my grass
pause 6
pause
put braid my grass
pause 6
pause
put braid my grass
pause 6
pause
put braid my grass
pause 6
pause
put forage grass
pause 5
put braid my grass
pause 6
pause
put braid my grass
pause 6
pause
put braid my grass
pause 6
pause
put braid my grass
pause 6
pause
put forage grass
pause 5
put braid my grass
pause 6
pause
put braid my grass
pause 6
pause
put braid my grass
pause 6
pause
put braid my grass
pause 6
pause
put drop my grass
put drop my grass
put dump junk
pause
pause
put go road
put go tra
move s
move se
move sw
move sw
move s
move s
move w
move sw
move s
move sw
move sw
move sw
move se
move sw
move sw
move s
move s
move sw
move s
move s
move w
move sw
move se
move sw
move s
move s
move sw
move s
move se
move s
move s
move sw
move sw
move s
move se
move s
move s
move se
move e
move s
move se
move sw
move s
move s
move se
move sw
move se
move s
move se
move s
move go stone bridge
move s
move s
move go southern shore
move s
move s
move s
move se
move s
move sw
move se
move s
move s
move s
move se
put w
put w
put n
put n
put w
put w
put sw
put sw
put w
goto climb

climb:
pause
put climb practice second tree
waitfor you finish practicing
goto checkclimb

checkclimb:
pause
put skill climb
match climb EXP HELP
match climbend 34/34
match climbend 33/34
match climbend 32/34
match climbend 31/34
match climbend 30/34
match climbend 29/34
match climbend 28/34
match climbend 27/34
match climbend 26/34
match climbend 25/34
match climbend 24/34
match climbend 23/34
match climbend 22/34
match climbend 21/34
match climbend 20/34
match climbend 19/34
match climbend 18/34
match climbend 17/34
match climbend 16/34
match climbend 15/34
match climbend 14/34
match climbend 13/34
match climbend 12/34
match climbend 11/34
match climbend 10/34
matchwait

climbend:
put stop climb
put e
put ne
put ne
put e
put e
put s
put s
put e
put e
move nw
move n
move n
move n
move nw
move ne
move n
move nw
move n
move n
move n
move go stone bridge
move n
move n
move go northern shore
move n
move nw
move n
move nw
move ne
move nw
move n
move n
move ne
move nw
move n
pause
move w
move nw
move n
move n
move nw
move n
move ne
move ne
move n
move n
move nw
move n
move ne
move n
move n
move ne
move nw
move ne
move e
move n
move n
move ne
move n
move n
move ne
move ne
move nw
move ne
move ne
move ne
move n
move ne
move e
move n
move n
move ne
move ne
move nw
move n
put go gate
put n
put e
put e
put n
put n
put ne
put go bank
put n
pause
goto start

end:
put tap contract in my %container
match finish What were you referring to?
match finish I could not find
match start you tap
matchwait

finish:
put s
put out
put sw
put go exch
put go door
put return caravan
pause 3
put w
put out
put ne
put go bank
put n
put smile
put bal
put exp
pause 15
put quit
