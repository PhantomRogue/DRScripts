## Stupid Outdoorsmanskip script, just collect and kick rocks till locked

start:

put coll rock
pause 17
put kick rock
pause .5

if $Outdoorsmanship.LearningRate > 30 then goto StopThis
else goto start


StopThis:
put #parse GATHERINGDONE