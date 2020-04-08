If_1 goto 2
1:
put forage branch
  match 1 ...wait
  match foundone branch
  match 1 Roundtime
 matchwait

foundone:
pause 1
put put my branch in my pack
  match foundone ...wait
  match 1 You put your branch
  match 1 What were you referring to?
  match branchdone That's too heavy to go in there!
 matchwait

branchdone:
put drop branch
pause 1
pause 1
move nw
move go gate
move w
move w
move s
move s
move w
move w
move s
move w
move s
put s
wait
put s
wait
pause 1
move go baz

2:
pause 1
put rem pack
  match 2 ...wait
  match gotbranch You take
  match gotbranch you are already holding that
  match donesell What were you referring to?
 matchwait

gotbranch:
put give pack to mags
  match asdasd Mags clucks her tongue, takes
  match asdasd She opens it, takes out all the kindling inside, 
  match nomore Mags chuckles and pats your hand affectionately.
 matchwait

asdasd:
put wear pack
goto donesell

donesell:
put dance
wait
put dance
wait
move n
move n
put n
wait
put n
wait
pause 1
move e
move n
move e
move e
move n
move n
move e
move e
move go gate
move se
goto 1


nomore:
Echo ***** 
Echo ***** YOU HAVE SOLD ALL THE BRANCHES YOU CAN.  TIME TO START TRADING FOR REAL
Echo ***** 
Echo ***** 
Echo ***** 
Echo *****
