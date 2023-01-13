#play

#You fumble slightly as you begin a quiet folk song on your bones.
#You begin a
#You begin some 

var PlayModes scales|arpeggios|ditty|folk|ballad|waltz|lullaby|march|jig|lament|wedding|hymn|rumba|polka|battle|reel|elegy|serenade|minuet|psalm|dirge|gavotte|tango|tarantella|bolero|nocturne|requiem|fantasia|rondo|aria|sonata|andconcerto
var ArrayIndex 0

var GoodStart You fumble slightly as you begin
eval total count("%PlayModes", "|")

put get %1

start:
eval result element("%PlayModes", %ArrayIndex)
put play %result
	matchre play /\.\.\.wait|Sorry, you may only type ahead/
	match WaitforDone You are already
	match WaitforDone masterful concerto
	matchre harder You effortlessly begin|your skill in your craft
	matchre WaitforDone off-key ruff|off-key scales|with only the slightest hint of difficulty
	matchre easier You fumble slightly as you begin|You struggle to begin
	matchre harder You begin a|You begin some|You begin to hum
	matchwait
	
#matchre WaitforDone with only the slightest hint of difficulty
#matchre TryNext You fumble slightly as you begin a quiet folk song on your bones|You struggle to begin a quiet wedding march on your bones.


harder:
math ArrayIndex add 1
put stop play
pause 1
goto start

easier:
math ArrayIndex subtract 1
put stop play
pause 1
goto start

WaitforDone:
waitfor You finish playing


goon:
if $Performance.LearningRate < 32 then goto start
else put #parse PERFORMANCEDONE
