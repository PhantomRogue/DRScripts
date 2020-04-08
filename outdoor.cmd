

start:
put coll rock
waitfor Roundtime
pause 1
put kick rock
if $Perception.LearningRate > 30 then exit
goto start