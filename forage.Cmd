## Stupid Outdoorsmanskip script, just collect and kick rocks till locked

start:

put forage rock
pause 17
put put my rock in buck
pause .5

if $Outdoorsmanship.LearningRate > 30 then goto StopThis
else goto start


StopThis:
put #parse GATHERINGDONE