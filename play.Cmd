#play
put get %1
start:
put play walt
waitfor You finish playing

if $Performance.LearningRate < 32 then goto start
else exit
