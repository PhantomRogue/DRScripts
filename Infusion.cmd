
action setvariable aspect.light Dolphin when the image of a deer drinking from a flowing stream
action setvariable aspect.light Panther when the image of a cluster of twinkling stars
action setvariable aspect.light Cat when the image of a grimacing woman in the throes of childbirth
action setvariable aspect.light Ram when the image of a flourishing rose garden
action setvariable aspect.light Cobra when the image of a shattered egg
action setvariable aspect.light Wolf when the image of a charred black stave
action setvariable aspect.light Boar when the image of a longbow
action setvariable aspect.light Raven when the image of a bowl of striped peppermint
action setvariable aspect.light Lion when the image of a pack of well-groomed battle hounds
action setvariable aspect.light Wren when the image of a plump opera singer
action setvariable aspect.dark Dolphin when the image of a great tidal wave
action setvariable aspect.dark Panther when the image of a child shivering fearfully in the throes of a nightmare
action setvariable aspect.dark Cat when image of a pair of twin crossed swords with jagged blades
action setvariable aspect.dark Ram when the image of a jagged crystalline blade
action setvariable aspect.dark Cobra when the image of an erupting volcano
action setvariable aspect.dark Wolf when the image of a long flowing skirt
action setvariable aspect.dark Boar when the image of a berserking barbarian
action setvariable aspect.dark Raven when the image of a shattered caravan wheel
action setvariable aspect.dark Lion when the image of a bloodstained stiletto
action setvariable aspect.dark Wren when the image of a cracked mirror
action (aspect) setvariable aspect $1 when (Dolphin|Panther|Cat|Ram|Cobra|Wolf|Boar|Raven|Lion|Wren)
action setvariable coffin.ready $1 when bier bearing the image .* (Dolphin|Panther|Cat|Ram|Cobra|Wolf|Boar|Raven|Lion|Wren)
action setvariable coffin.ready no when A steel-reinforced ebony coffin hangs in the air 
action setvariable coffin.ready no when  A steel-reinforced ebony coffin lies on the floor near the biers
action (aspect) inactivate

infusion:
action (aspect) activate
put look sun
pause 0.5
put look star
pause 0.5
action (aspect) inactivate
pause 0.5
put look bier
pause 1
if %aspect = %coffin.ready then goto cofin.ready
pause 0.5
put turn crank
pause 0.5
pause 0.5
move s
move go white tap
gosub aspect.light.look
move se
move go black tap
gosub aspect.dark.look
move sw
move n
put pull lev
pause 0.5
pause 0.5
put look bier
if %aspect = %coffin.ready then goto coffin.ready
goto infusion

coffin.ready:
put open coffin
pause 0.5
put go coffin
pause 0.5
put close coffin
put #echo Wait a bit, you'll drop down and get stunned but the room is safe
put #abortscript

aspect.light.look:
	put look wheel
	pause 1
	if %aspect = %aspect.light then goto return
	gosub pull.rope 
	goto aspect.light.look

aspect.dark.look:
	put look wheel
	pause 1
	if %aspect = %aspect.dark then goto return
	gosub pull.rope
	goto aspect.dark.look

pull.rope:
	put pull rope
	match return grinding
	match return wheel turns
	match pull.rope You'll have to get a better grip 
	matchwait 

return:
	return