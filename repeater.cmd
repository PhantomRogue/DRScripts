#Snap

action put #queue clear; send 1 $lastcommand when ^\.\.\.wait|^Sorry, you may only type

start:
put %1
waitfor Roundtime
pause 1
goto start