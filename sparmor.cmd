goto %1

remove:
put rem buckl;stow buckl
pause .5
put rem longc;stow longc
pause 1
put rem greaves ;stow greaves 
pause .5
put rem cowl;stow cowl 
pause .5
put rem greaves;stow greaves  
pause 1
put #parse ARMORDONE
exit


wear:
put get my buckl;wear buckl
pause .5
put get my longc;wear longc
pause 1
put get my greaves ;wear greaves 
pause .5
put get my cowl;wear cowl 
pause .5
put get my greaves;wear greaves  

pause 1
put #parse ARMORDONE
exit