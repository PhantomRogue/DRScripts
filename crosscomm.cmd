goto start

start:
	put stow right 
	pause
	put stow left
	pause
	echo *** STARTING DEVOTION ****
	echo
	echo
	put commune
	echo
	echo
	put prep bless
	put #goto TGNE
	waitfor YOU HAVE ARRIVED
	put get vial
	put fill vial with water
	put cast water in vial
	pause
	put stow vial
	goto bath

bath:
	put #goto dura
	waitfor YOU HAVE ARRIVED
	put order sage
	pause
	put offer 25
	pause
	put stow sage
	pause
	put order laven
	pause
	put offer 25
	pause
	put stow laven
	pause
	put order wine
	pause
	put offer 250
	pause
	put stow wine
	pause
	put #goto temple
	waitfor YOU HAVE ARRIVED
	put #goto 11
	waitfor YOU HAVE ARRIVED
	goto bath2

bath2:
	put look pool
	match fill dry.
	match fill shallow.
	match fill half full
	match fill nearly full
	match bath3 is full
	match bath3 overflowing.
	match bath3 very full
	matchwait

fill:
	put prep bless
	pause
	put fill pot with rivulet
	waitfor Roundtime
	pause 5
	put cast water
	pause
	put pour pot into bath
	waitfor Roundtime
	goto bath2

bath3:
	put go pool
	put get laven
	pause
	put rub lavender
	pause
	put get sage
	pause
	put rub sage
	waitfor You wake up once more,
	goto altar

altar:
	pause 2
	move out
	move e
	move se
	move ne
	move e
	put kneel
	pause
	move go pass
	goto stand1

stand1:
	put dance
	match stand1 unbalanced
	match stand1 weight
	match 1 leap
	matchwait

1:
	pause
	move s
	put kneel
	pause
	put kiss altar
	pause 2
	goto touch

touch:
	put touch altar
	match stand You see yourself laughing
	match stand vision
	match touch K>
	matchwait
	
stand:
	put stand
	match stand unbalanced
	match stand weight
	match seed You stand back
	matchwait

seed:
	echo
	echo
	put commune
	echo
	echo
	pause 2
	move n
	put kneel
	pause
	move go pass
	
stand2:
	put dance
	match stand2 unbalanced
	match stand2 weight
	match 2 leap
	matchwait

2:
pause
put #goto crossing
waitfor YOU HAVE ARRIVED
put #goto ne g
waitfor YOU HAVE ARRIVED
put #goto 341
waitfor YOU HAVE ARRIVED

goto seed2

seed2:
put gather seed
match seed2 empty handed.
match seed3 seed
matchwait

seed3:
put #goto crossing
waitfor YOU HAVE ARRIVED

put #goto refe
waitfor YOU HAVE ARRIVED
put meditate
pause 1
pause 1
put #goto 349
waitfor YOU HAVE ARRIVED
goto seed4

seed4:
put plant seed
pause 2
pause
put get vial
put sprinkle vial on room
put stow vial
pause
put go arch
pause
echo
echo
put commune
echo
echo
pause 2
goto recite

recite:
put get my wine
pause
put pour wine on altar
pause
put stow wine
pause
put Recite Phelim, give me strength for my righteous vengeance.\; Chadatru, guide my sword to swing in justice.\; verild, give me the power to conquer my enemies.\; Truffenyi, let me not lose sight of compassion and mercy\; Else, I will become like those I despise.\; Urrem'tier, receive into your fetid grasp these wicked souls\; May that Tamsine's realms never know their evil ways again;
pause
put dance
pause 1
pause 1
put dance
pause 1
pause 1
put dance
pause 1
pause 1
echo
echo ENDING DEVOTION
echo
put commune
echo
echo