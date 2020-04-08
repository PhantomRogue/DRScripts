reget:
pause 0.1
put get ana
put give white priest
match pause35 A white-clad priestess of Albreda ignores your offer
match reget The priestess accepts your offering
matchwait


pause35:
pause 25
pause10:
pause 10
put ask white priest for task;accept task
pause .5
goto reget
