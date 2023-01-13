#Ved

goto %1

wear:
put open backp
pause .5
put get gaunt
put wear gaunt
pause .5
put get coif
put wear coif
pause .5
put get mail
put wear mail
pause .5
put get sipar
put wear sipar
pause .1
goto blah

remove:
rem:
put open backp
pause .5
put rem gaunt
put stow gaunt
pause .5
put rem coif
put stow coif
pause .5
put rem mail
put stow mail
pause .5
put rem sipar
put stow sipar
pause .1
goto blah


blah:
put #parse ARMORDONE