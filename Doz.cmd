goto %1

remove:
put rem shie;stow shie
pause .5
put rem plate;stow plate
pause 1
put rem gau;stow gau
pause .5
put rem helm;stow helm
pause 1
put #parse ARMORDONE
exit


wear:
put get my shie;wear shie
pause .5
put get my plate;wear plate
pause 1
put get my gau;wear gau
pause .5
put get my helm;wear helm
pause 1
put #parse ARMORDONE
exit