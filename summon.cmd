
#debug 10
start:
if $Summoning.LearningRate > 20 then goto end
if %lastact = imped then goto imped
admit:
var lastact admit
match imped Going any further while in this plane would be fatal
match imped you feel that you have reached your limit
match start you feel that you can still gather
match admit ...wait
send summon admit
matchwait
imped:
var lastact imped
#match admit
match start energy to purge
match admit1 you feel that you have exhausted your planar charge
match admit1 you cannot discharge the remaining extraplanar energy from your body
match imped ...wait
send summon imped
matchwait
admit1:
var lastact admit
goto start

end:
send .cleric