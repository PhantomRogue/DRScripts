action put listen $2 when ^To learn from (him|her), you must LISTEN TO (\w+)
goto End.Include
#####################

Wear:
match Wear ...wait
match Wear type ahead
matchre Return ^You sling
matchre Return ^You attach
matchre Return ^You put
matchre Return ^You strap
matchre Return ^You work your way into
matchre Return ^You slide your left arm through
matchre Return ^You hang
matchre Return ^You slip
matchre Return ^You drape
matchre Return ^You slide
matchre Return ^You are already wearing that\.
matchre Return ^Wear what\?
matchre Return ^You can't wear any more items like that\.
matchre location.unload1 ^You should unload the
matchre location.unload1 ^You need to unload the
put wear $0
matchwait


Remove:
match Remove ...wait
match Wear type ahead
matchre Return ^You take
matchre Return ^You slide
matchre Return ^You sling
matchre Return ^Roundtime
matchre Return ^You remove
matchre Return ^You pull off
matchre Return ^You pull your
matchre Return ^Remove what\?
matchre Return ^You count out
matchre Return ^You work your way out of
matchre Return ^You aren't wearing that\.
matchre Return ^What were you referring to\?
matchre Return ^You loosen the straps securing
put remove $0
matchwait
#####################

Pray:
var Pray $0
match Pray ...wait
matchre Return ^You begin to pray
matchre Return ^You bow your head
matchre Return ^You pray fervently\.
matchre Return ^You want to pray here\?
matchre Return ^As you utter your prayer
matchre Return ^You kneel down and begin to pray\.
matchre Return ^You continue praying for guidance\.
matchre Return ^You beseech your God for mercy\.
matchre Return ^You begin to pray, kneeling before the altar\.
matchre Return ^Your fervent prayers are met with a sense of peace and security\.
matchre Return ^The soft sound of your prayers wraps itself around you and brings you a sense of tranquility\.
matchre Return ^As you feel your connection to them grow, you sense the eyes of the gods upon you\.
matchre PrayTimer ^You feel that the light gods have cast their benevolent
matchre PrayTimer ^You feel that your gods have smiled
matchre PrayTimer ^You sense that you are as pure of spirit
put pray $0
matchwait 2
goto Return

PrayTimer:
if "%Pray" = "my badge" then put #var DevotionBadge $gametime
if "%Pray" = "eylhaar" then put #var DevotionPray $gametime
goto Return
#####################
Stand:
matchre Return ^You stand back up\.
matchre Return ^You swim back up
matchre Return ^You are already standing\.
matchre stand1 ^You are so unbalanced you cannot manage to stand\.
matchre stand1 ^You are overburdened and cannot manage to stand\.
matchre stand1 ^The weight of all your possessions prevents you from standing\.
matchre stand1 ^Roundtime
put stand
matchwait
#####################
Put:
match Put ...wait
matchre Return ^You drop
matchre Return ^You put
matchre Return ^You reverently place
matchre Return ^As you start to place
matchre Return ^What were you referring to\?
matchre Return ^You briefly twist the top
matchre Return ^As you put the wax label
matchre Return ^You tuck 
put put $0
matchwait

Take:
match Take ...wait
matchre Return ^You get
matchre Return ^You pick up
matchre Return ^You pull
matchre Return ^You remove
matchre Return ^What were you referring 
matchre Return ^What do you want 
match Take ...wait
match Take type ahead
put take $0
matchwait

Stow:
match Stow ...wait
match Stow type ahead
matchre Return ^You put
put stow $0
matchwait
#####################
Lean:
matchre Return ^You lean
matchre Return ^You shift your weight\.
matchre Return ^I could not find what you were referring to\.
put lean
matchwait
#####################

Travel:
setvariable dest $0
Travel.1:
match Return YOU HAVE ARRIVED
match Travel.1 MOVE FAILED
put #goto %dest
matchwait 


Move:
#Running heedlessly over the rough terrain|A bony hand reaches up out of the bog and clamps its cold skeletal fingers|can't seem to make much headway
matchre stand.then.move ^You must be standing to do that\.
matchre stand.then.move ^You can't do that while lying down\.
matchre stand.then.move ^You can't do that while kneeling.
matchre pause.then.move ^You are too tired
matchre pause.then.move ^All this climbing back and forth is getting a bit tiresome
matchre pause.then.move ^Your excessive speed causes you to lose your footing
matchre pause.then.move ^You work against the current
matchre retreat.then.move ^You are engaged to
matchre retreat.then.move ^You'll have better luck if you first retreat
matchre retreat.then.move While in combat
matchre Dig.then.move ^You struggle forward
matchre Dig.then.move ^Like a blind, lame duck, you wallow in the mud
matchre Dig.then.move ^The mud holds you tightly
matchre Dig.then.move ^You find yourself stuck in the mud
matchre stow.them.move ^Free up your hands first
matchre Return ^Obvious
matchre Return It's pitch dark and you can't see a thing
matchre move.error ^You can't go there\.
matchre move.error ^You can't swim in that direction\.
put $0
matchwait

stand.then.move:
gosub Stand
goto Move

pause.then.move:
pause .2
goto Move

retreat.then.move:
gosub retreat
goto Move

move.error:
echo * Bad move direction, will try next command in 1 second. *
pause
goto Move

Dig.then.move:
pause .1
put dig %move.direction
pause .5
pause .5
goto Move

stow.them.move:
gosub stowing
goto Move
#########################

Spell.Pause:
pause
Spell:
match Spell.Pause type ahead
match Spell.Pause ...wait
match Spell.Wait You begin chanting a prayer
match Spell.Wait You close your eyes and breathe deeply,
match Spell.Wait You trace an arcane sigil in the air,
match Spell.Wait Heatless orange flames blaze between your fingertips
match Spell.Wait Your eyes darken to black as a starless night
match Spell.Wait You raise your arms skyward, chanting
match Spell.Wait You are already preparing
match Spell.Wait Icy blue frost crackles up your arms
match Spell.Wait You make a careless gesture as you chant the words
match Spell.Wait Tiny tendrils of lightning jolt between your hands
match Spell.Wait The wailing of lost souls accompanies your preparations
match Spell.Wait Your skin briefly withers and tightens, becoming gaunt
match Spell.Wait Images of streaking stars falling from the heavens flash across your vision
match Spell.Wait A nagging sense of desperation guides your hands through the motions
match Spell.Wait You hastily shout the arcane phrasings needed to prepare
match Spell.Wait You deftly waggle your fingers in the precise motions needed to prepare
match Spell.Wait With great force, you slap your hands together before you and slowly pull them apart,
match Spell.Wait With no small amount of effort, you slowly recall the teachings
match Spell.Wait You struggle against your bindings to prepare
match Spell.Wait You raise one hand before you and concentrate
match Spell.Wait As you begin to focus on preparing
put pre $1 $2
matchwait

Spell.Wait:
if $3 > 0 then pause $3
else waitfor You feel fully prepared to cast
if "$preparedspell" = "Benediction" then put cast eylhaar
else put cast
return
#####################
Hum.Start:
put .hum
put hum $HUM_SONG
return

Hum.Stop:
put #script abort hum
put stop play
return


##########################
Return:
return

End.Include: