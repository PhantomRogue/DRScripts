action instant var meraud.commune ON when (A spark of Meraud's spirit is within|Meraud is smiling down|Meraud's benevolent eyes are upon|Meraud's influence is woven into|Meraud's power still holds your attention|auspices of Meraud|blessing of Meraud|touched by Meraud|favored by Meraud|miracle of Meraud|power of Meraud)
action instant var tasmine.commune ON when (spark of Tamsine's spirit|Tamsine's benevolent eyes|touched by Tamsine|enlightened by Tamsine)
action instant var eluned.commune ON when waters of Eluned


action instant var meraud.commune OFF;var eluned.commune OFF;var truffenyi.commune OFF;var tasmine.commune OFF;var no.commune NO when You are not a vessel for the gods at present
action instant var no.commune YES when You will not be able to open another divine conduit yet


##debuglevel 10
action instant setvariable crittername $1 when .* (\S+) ((which|that) appears dead|\(dead\))
action instant setvariable crittername $1 when  .* (\w+) ((which|that) appears dead|\(dead\))

var meraud.commune OFF
var tasmine.commune OFF
var eluned.commune OFF
var no.commune NO
action goto change.state when You stop as you realize that you have attempted a commune too recently in the past.
return.to.meraud:
gosub clear
meraud.check:
gosub commune.check

var tempstow none
if "$righthand" != "Empty" then var tempstow $righthand
if "$righthand" != "Empty" then gosub verb stow right
if "%meraud.commune" != "ON" then gosub do.meraud


var eluned.time $gametime
math eluned.time subtract $last.eluned
if %eluned.time > 1200 then gosub do.eluned

skipcomm:

#	var tasmine.time $gametime
#    math tasmine.time subtract $last.tasmine
  #   if %tasmine.time > 1200 then gosub do.tasmine

var pray.time $gametime
math pray.time subtract $last.pray
if %pray.time > 600 then gosub do.pray

var creature.time $gametime
math creature.time subtract $last.creature
if %creature.time > 600 then gosub do.creature

var recite.time $gametime
math recite.time subtract $last.recite
if %recite.time > 600 then gosub do.recite

var badge.time $gametime
math badge.time subtract $last.badge
if %badge.time > 600 then gosub do.badge
goto mod.done

commune.check:
gosub verb commune sense
return

do.meraud:
var doing.commune meraud
gosub verb get incense from backpack
gosub verb drop incense
gosub verb get gladius from haversack
gosub verb get flint from backpack
gosub verb light incense with my flint
gosub verb put flint in my backpack
gosub verb put gladius in my haversack
gosub verb get incense
gosub verb wave incense at <charname>
gosub verb snuff incense
gosub verb put incense in my backpack
gosub verb get chalice
gosub verb sprinkle chalice on <charname>
if "$lefthand" = "holy water" then gosub verb put water in my vessel
gosub verb put chalice in my backpack
gosub verb commune meraud
gosub stand
return

do.eluned:
if "%no.commune" = "YES" then return
if "%eluned.commune" = "ON" then return
if "%meraud.commune" != "ON" then goto return.to.meraud
var doing.commune eluned
gosub verb get dirt
gosub verb get chal
gosub verb commune eluned
gosub verb stow chal
put #var last.eluned $gametime
put #save variables
gosub stand
return

do.tasmine:
if "%no.commune" = "YES" then return
if "%tasmine.commune" = "ON" then return
if "%meraud.commune" != "ON" then goto return.to.meraud
var doing.commune tasmine
gosub verb get chal

gosub verb sprinkle chal on <charname>

gosub verb put chal in my backpack
gosub verb commune tasmine
put #var last.tasmine $gametime
put #save variables
gosub stand
return

do.pray:
gosub verb pray damaris
put #var last.pray $gametime
put #save variables
gosub stand
return

do.creature:
eval deadcount count("$roomobjs","appears dead")
if %deadcount < 1 then return
if "%meraud.commune" != "ON" then goto return.to.meraud
put look
pause
gosub verb pray %crittername
pause
put #var last.creature $gametime
put #save variables
gosub stand
return

do.recite:
gosub verb recite Patron Damaris, with your love of night and vengence, bless my blade in battle as my devotion for you continues to expand.\;For I am your disciple, the Panther in spirit. Keep me vicious in battle so all enemies fall by my hands!\;Blind Justice Chadatru, wielder of sword and olive laurel, fill me with the righteousness that I strive to always attain.\;For I am your prophet, the lion in heart, keep me ever honorable as I continue forward on my hallowed campaign!\;Unwavering Truffenyi, merciful father of life, make my body pure so that sickness may never transpire in me.\;For I am your pupil, the ox in form and frame, grant me strength and power so that magic and sword stay mighty!\;Lone wolf Meraud, knowledgable and wise, grant me wisdom and knowledge beyond all average mortal beings.\;for I am your zealot, knowledge seeker in mind, fill me with a desire for knowledge that keeps me ever searching!
put #var last.recite $gametime
put #save variables
gosub stand
return


do.badge:
gosub verb remove badge
gosub verb pray badge
put #var last.badge $gametime
put #save variables
gosub verb wear badge
return

goto mod.done


verb:
setvariable verb $0
goto verb.a
verb.p:
pause 0.5
verb.a:
if $webbed = 1 then goto verb.p
if $stunned = 1 then goto verb.p
pause 0.1
put %verb
match verb.p your bindings make it impossible to hide
match verb.p type ahead
match verb.p ...wait
match verb.p still stunned
match verb.p you don't feel like fighting
match verb.p can't do that while entangled in a web
matchre verb.d (determine anything about this creature|mutter blasphemies to yourself|already dead|mutter incoherently to yourself while preparing)
matchre verb.d (You raise your arms skyward|mutter a foul-sounding phrase to yourself|trace a curving sigil|that is already in your inventory)
matchre verb.d (determine anything about this creature|mutter blasphemies to yourself|already dead|mutter incoherently to yourself while preparing)
matchre verb.d (wailing of lost souls accompanies|has already been arranged|blue frost crackles up your arms|you can't arrange|Your heart skips a beat)
matchre verb.d (newfound fluidity of your mind|orange flames blaze between your fingertips|You deftly|You strap|You stuff|With calm movements)
matchre verb.d (You attach|You remove|You can also|Smiling slyly|not ready|You clench your hands|You hold out your arms to either side as|You fade in)
matchre verb.d (You whisper the final word of your spell so that none may notice your effort|too cluttered|Stalk what|You clap|You speak|Arrange what)
matchre verb.d (With rigid movements|You close yours eyes|With tense movements|You let your concentration|You make a holy gesture|cannot be skinned)
matchre verb.d (You find yourself unable to hunt|could not find what|You clap your hands|You easily strap|That area is not bleeding|You take a step back)
matchre verb.d (could not find what|You strain, but cannot focus your mind|You attempt to relax your mind|You get|You put|STOW HELP|You push)
matchre verb.d (think pushing that would have any effect|You move|You're already using the Sight|You have not recovered from your previous use)
matchre verb.d (careful focus, you adjust your eyes to see in shadow as they|You close your eyes|You're not ready to do that again)
matchre verb.d (was just recently mined by someone else|Roundtime|area has already been tended to|work carefully at tending your wound)
matchre verb.d (The spell pattern collapses|You are unable to control|not damaged enough to warrant repair|cannot figure out how to do that)
matchre verb.d (You're not ready to do that|Drink what|What were you referring|You eat|You drink|You stand|Your analysis has revealed no additional resources)
matchre verb.d (You look around, but can't see any place to hide yourself|stalking|following|already hidden|You pick up|You cannot|You gesture)
matchre verb.d (You trace a hasty sigil in the air|is now set at|You detach|You snuff|You sling|You begin chanting|You bend|You are already)
matchre verb.d (Quietly touching|You recite| turns up fruitless|You pour|You sprinkle|already stand|You grind|You feel warmth|already empty|You recall)
matchre verb.d (You struggle|You open|You raise|You reach for its center and forge a magical link to it|You trace an angular sigil|cannot produce|You drop)
matchre verb.d (already been skinned|before you arrange|inherently stealthy endeavor|try being out of sight|cannot muster enough energy to vocalize)
matchre verb.d (cannot collect anything|Setting your|You trace a geometric sigil|don't have a spell prepared|already preparing|already fully prepared)
matchre verb.d (preparing a spell|harnessing any mana|You aren't preparing|You slip|no matter how you arrange it|There isn't any more room)
matchre verb.d (With meditative movements|You quickly flick|You wave|You lift your|You take off|You briefly twist|But that isn't)
matchre verb.d (That area is not bleeding|You take a step back|could not find what|You strain, but cannot focus your mind|You attempt to relax your mind|You get|You put|STOW HELP|You push|think pushing that would have any effect|You move|You're already using the Sight|You have not recovered from your previous use|careful focus, you adjust your eyes to see in shadow as they|You close your eyes, drawing all your thoughts inward|You're not ready to do that again|was just recently mined by someone else|Roundtime|area has already been tended to|work carefully at tending your wound|The spell pattern collapses|You are unable to control|not damaged enough to warrant repair|cannot figure out how to do that|You're not ready to do that|Drink what|What were you referring|You eat|You drink|You stand|Your analysis has revealed no additional resources|You look around, but can't see any place to hide yourself|already hidden|You pick up|You cannot do that while|You gesture|You trace a hasty sigil in the air|is now set at|You detach|You snuff|You drop|You sprinkle|You wave some)
matchre verb.d (You lift|But the altar|You drop 5|You are eager|You are not a vess|The clerk counts|Your dance|Your actions|You begin|You stand|You bend|Quietly touching|You bow your head|ready to do that|You take off|You are already holding|You push the|You dial the device|You toss the water into|You get|You put|You pick up|Roundtime|This process can make an item more durable|thin coat of clay to the metal and then place|Roundtime|STOW HELP|completely undamaged and does not need repair|cannot figure out how to do that|not damaged enough to warrant repair|bundle them with your logbook and then give|you just received a work order|You turn your book|You notate|You hand|You slide|You place|You have no idea how to craft|Perhaps try doing that to some refined metal|The book is already turned|What were you referring|You take a step back|could not find|An attendant arrives, takes your deed|already turned to|You attach|You remove)
matchwait
verb.d:
return

change.state:
if "%doing.commune" = "tasmine" then var tasmine.commune ON
if "%doing.commune" = "tasmine" then return

if "%doing.commune" = "eluned" then var eluned.commune ON
gosub verb put dirt in my backpack
gosub verb put chal in my backpack
return


stand:
if $standing = 1 then return
gosub verb stand
pause 0.1
goto stand

mod.done:
if "$righthand" = "chalice" then gosub verb stow my chal
if "%tempstow" != "none" then gosub verb get my %tempstow
if "$righthand" = "chalice" then gosub verb stow my chal
pause
put #parse SCRIPT DONE
put #parse SCRIPT DONE 