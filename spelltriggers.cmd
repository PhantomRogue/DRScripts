## NOTE If you see ## before the PUT command, the trigger is unfinished.  It needs the ending and/or beginning messaging
##Paladin spells are pretty much done.  Other guilds not so much.  Each spell should be set up as follows:

##THE VARIABLES SHOULD BE IN ALL CAPITALS.  COUR NOT Cour

##Trigger to turn spell on.  Note it has the spell messaging, AND the messaging you see when using
##POWER perception.  If it is not seeable via POWER command you can leave that part out.
##put #trigger {^You feel your courage bolstered|^You sense the Courage spell upon you,} {#var COUR ON}

##Trigger to turn spell off.  This is all messaging that you get when the spell goes away.
##put #trigger {^You falter for a moment as your extra courage slips away} {#var COUR OFF} 

##Trigger to turn all spells that end at death off
##put #trigger {^Your death cry echoes in your brain as it quickly dawns on you that you have just died} {#var AS OFF;#var CLAR OFF;#var COUR OFF;#var CRC OFF;#var DA OFF;#var DIG OFF;#var HES OFF;#var HOW OFF;#var MO OFF;#var RW OFF;#var SP OFF;#var SR OFF;#var EASE OFF;#var MAF OFF;#var RUE OFF;#var BW OFF}

##Trigger to turn all spells OFF that are viewable by POWER preception when you get the first line of the power command
##This is to help make sure if a spell drops and the main trigger misses it somehow, every time you POWER
##it makes sure all your spells are up.
##put #trigger {^You reach out with your} {#var AS OFF;#var CLAR OFF OFF;#var COUR OFF;#var CRC OFF;#var DIG OFF;#var HES OFF;#var HOW OFF;#var MO OFF;#var RW OFF;#var SP OFF;#var SR;#var EASE OFF;#var MAF OFF;#var HOJ OFF}



1start:
## Analogous Spells
put #trigger {^\s+Closing the (StormFront|Wizard) front end does NOT necessarily|^Your death cry echoes in your brain|Connection closed|Last login|^You feel a weight settle over you, and realize the magic that has been easing your burden has faded\.$} {#var EASE OFF} {buff}
put #trigger {^You sense the Ease Burden spell (upon|surrounding) you, which|^Pale yellow sparks flicker around your torso\.\s+Your possessions suddenly feel lighter and easier to carry\.$} {#var EASE ON} {buff}
put #trigger {^\s+Closing the (StormFront|Wizard) front end does NOT necessarily|^Your death cry echoes in your brain|Connection closed|Last login|^Your eyes briefly darken\.\s+When you regain sight, the graphs and sigils previously impressed upon your vision have disappeared\.$} {#var GAF OFF} {buff}
put #trigger {^You sense the Gauge Flow spell (upon|surrounding) you, which|^A distracting flurry of .+ momentarily blinds you\.\s+As your eyes adjust, you notice local fluctuations in mana are being represented by .+ graphs and sigils in the corners of your sight\.$} {#var GAF ON} {buff}
put #trigger {^\s+Closing the (StormFront|Wizard) front end does NOT necessarily|^Your death cry echoes in your brain|Connection closed|Last login|^You sense your invisible ward give away, leaving you more vulnerable\.$} {#var LW OFF} {buff}
put #trigger {^You sense the Lay Ward spell (upon|surrounding) you, which|^An? .+ mist briefly appears around your arms and spreads imperceptibly around you to form your ward\.$} {#var LW ON} {buff}
put #trigger {^\s+Closing the (StormFront|Wizard) front end does NOT necessarily|^Your death cry echoes in your brain|Connection closed|Last login|^The air around you shimmers with a weak yellow light that quickly disperses\.$} {#var MAF OFF} {buff}
put #trigger {^You sense the Manifest Force spell (upon|surrounding) you, which|^The air around you shimmers with an? .+ yellow .+\.\s+The scintillating light writhes and twists, abruptly coalescing into a translucent field before blinking out of sight\.$} {#var MAF ON} {buff}
#put #var EASE OFF
put #var MAF OFF
put info

match commoner Guild: Commoner
match Trader Guild: Trader
match Cleric Guild: Cleric
match empath Guild: Empath
match moonmage Guild: Moon Mage
match paladin Guild: Paladin
match ranger Guild: Ranger
match warmage Guild: Warrior Mage
match Thief Guild: Thief
match bard Guild: Bard
match Barbarian Guild: Barbar
match Necromancer Guild: Necromancer
matchwait

commoner:
put #var Guild Commoner
goto doneST

Trader:
put #var Guild Trader
goto doneST

Thief:
put #var Guild Thief
put #trigger {You feel your muscles relax as you settle into a less threatening demeanor} {#var PROW OFF}
put #trigger {Remembering the mantra of mind over matter, you let your dedicated focus seep into your muscles|You're already using the Prowess meditation} {#var PROW ON}
put #trigger {Purging yourself of all distractions and extraneous thoughts, you allow your mind and body to become one, becoming preternaturally aware of threats around you and the best ways to defend yourself|You're already using the Elusion meditation.} {#var ELUS ON}
put #trigger {You are no longer able to keep your thoughts free from distraction, and your heightened ability to avoid attacks and fight unarmed ceases} {#var ELUS OFF}
put #trigger {Taking a deep breath, you focus on making your mind and body one, your mental discipline trained on quickly noticing, analyzing, and dodging approaching threats|You're already using the Avoidance meditation.} {#var AVOID ON}
put #trigger {Your concentration runs out, and your rapid analysis of incoming threats ceases} {#var AVOID OFF}
put #var PROW OFF
put #var ELUS OFF
goto doneST

Barbarian:
put #var Guild Barbarian
put #trigger {Scanning the distance, you acutely focus on distant targets waiting the full wrath you intend to deliver.  With a shriek you begin to flex your hands in preparation of unleashing a distant mortal blow upon your enemies} {#var EAGLE ON}
put #trigger {^\s+Closing the (StormFront|Wizard) front end does NOT necessarily|^Your death cry echoes in your brain|Connection closed|Last login|You feel your inner fire cool as you finish practicing the Form of the Eagle} {#var EAGLE OFF}
put #trigger {You slowly center yourself, your mind growing quiet as a quickly building rage surges through your body, your limbs quaking with its boundless strength.  A terrible roar of fury and bloodlust rips from your throat as the Form of the Dragon consumes you, only a thread of control fighting back the descent into a berserker's madness.} {#var DRAGON ON}
put #trigger {^\s+Closing the (StormFront|Wizard) front end does NOT necessarily|^Your death cry echoes in your brain|Connection closed|Last login|You feel your inner fire cool as you finish practicing the Form of the Dragon} {#var DRAGON OFF}
put #var DRAGON OFF
put #var EAGLE OFF
goto doneST


Cleric:
put #var Guild Cleric
put #trigger {^\s+Closing the (StormFront|Wizard) front end does NOT necessarily|^Your death cry echoes in your brain|Connection closed|Last login|^You feel the divinity seep from your bones as the previous blessing of Aldauth wanes\.$} {#var BENE OFF} {buff}
put #trigger {^You sense the Benediction spell (upon|surrounding) you, which|^You make a holy gesture and intone reverently, \"Aldauth, hear my plea!\"$|^You suddenly feel more limber, your reflexes charged with a faint energy\.$|^Suddenly your muscles flood with energy, singing with a faint vigor\.$|^A surge of faint energy tingles through every nerve in your body, leaving you feeling more dexterous\.$} {#var BENE ON} {buff}
put #trigger {^\s+Closing the (StormFront|Wizard) front end does NOT necessarily|^Your death cry echoes in your brain|Connection closed|Last login|^The field of silver-blue light dissipates from around you\.\s+The sense of calm focus leaves you, and your joints feel strangely stiffer than before\.$} {#var MAPP OFF} {buff}
put #trigger {^You sense the Major Physical Protection spell (upon|surrounding) you, which|^A bright silver nimbus roars up around you as streaks of steel-blue light descend in a convex field\.$|^A sense of calm focus takes hold as the luminous pattern washes over you\.\s+You feel slightly more able to avoid attacks with your energized joints\.$} {#var MAPP ON} {buff}
put #trigger {^\s+Closing the (StormFront|Wizard) front end does NOT necessarily|^Your death cry echoes in your brain|Connection closed|Last login|^The soft silver glow fades from around you\.$} {#var MPP OFF} {buff}
put #trigger {^You sense the Minor Physical Protection spell (upon|surrounding) you, which|^You are bathed in a soft silver glow for a moment\.$} {#var MPP ON} {buff}
put #trigger {^\s+Closing the (StormFront|Wizard) front end does NOT necessarily|^Your death cry echoes in your brain|Connection closed|Last login|^The soft white glow fades from around you\.$} {#var PFE OFF} {buff}
put #trigger {^You sense the Protection from Evil spell (upon|surrounding) you, which|^You are bathed in a soft white glow for a moment\.$} {#var PFE ON} {buff}
goto doneST

empath:
put #var Guild Empath
put #trigger {^Life energy floods through your veins, burning without consuming|^You sense the Aesandry Darlaeth spell upon you} {#var AD ON}
put #trigger {^Aesandry Darlaeth loses cohesion} {#var AD OFF}
put #trigger {^Your body tenses with a burning, stressful ache|^You sense the Aggressive Stance spell upon you} {#var AGS ON}
put #trigger {^You sense the Aggressive Stance spell fade away} {#var AGS OFF}
put #trigger {^Pride and confidence in your empathic abilities fills you from within|^You sense the Gift of Life spell upon you} {#var GOL ON}
put #trigger {^You no longer feel the beneficial effects of the Gift of Life spell} {#var GOL OFF}
put #trigger {^Tapering ribbons of soft yellow extend across the area|^You sense the Innocence spell upon you} {#var INNOC ON}
put #trigger {^The lingering effects of your Innocence spell fade away} {#var INNOC OFF}
put #trigger {^Soft waves of a gentle, warm peach color flicker around you|^A surge of renewed strength runs through you|^You sense the Refresh spell upon you} {#var REF ON}
put #trigger {^You feel the surge of energy within you ebb away} {#var REF OFF}
put #trigger {^A translucent sphere forms around you and shudders like a soap bubble|^The translucent sphere already around you shudders and flickers with newly added invigoration|^You sense the Sphere of Protection spell upon you} {#var SOP ON}
put #trigger {^The translucent sphere around you suddenly pops like a soap bubble} {#var SOP OFF}
put #trigger {^A newfound fluidity of your mind imparts you with enhanced awareness of every nerve in your body|^You sense a (superficial|moderate|deep-seated|supreme) Tranquility upon you} {#var TRANQ ON}
put #trigger {^The fluidity of your mind expires} {#var TRANQ OFF}
put #trigger {^With a warrior's calm, a pure white alfar avenger steps in} {#var GS ON}
put #trigger {^A pure white alfar avenger squints and gazes at the ceiling,|^With a sad look, a pure white alfar avenger nods to you and trots off} {#var GS OFF}
put #trigger {^Your death cry echoes in your brain as it quickly dawns on you that you have just died} {#var EASE OFF;#var MAF OFF;#var AD OFF;#var AGS OFF;#var GOL OFF;#var INNOC OFF;#var REF OFF;#var SOP OFF;#var TRANQ OFF}
put #trigger {^You reach out with your} {#var AD OFF;#var AGS OFF;#var GOL OFF;#var INNOC OFF;#var REF OFF;#var SOP OFF;#var TRANQ OFF}
put #var AD OFF
put #var AGS OFF
put #var GOL OFF
put #var INNOC OFF
put #var REF OFF
put #var SOP OFF
put #var TRANQ OFF
put #var GS
goto doneST

moonmage:
put #var Guild MM
put #trigger {^\s+Closing the (StormFront|Wizard) front end does NOT necessarily|^Your death cry echoes in your brain|Connection closed|Last login|^Your color vision returns to normal, causing the auras you see to dim and vanish\.$} {#var AUS OFF} {buff}
put #trigger {^You sense the Aura Sight spell (upon|surrounding) you, which|^Your color vision blossoms with new depth\.\s+The vibrant hues resolve into unintelligible auras that dance around everything you see\.$} {#var AUS ON} {buff}
put #trigger {^\s+Closing the (StormFront|Wizard) front end does NOT necessarily|^Your death cry echoes in your brain|Connection closed|Last login|^You feel less aware of your environment\.$} {#var CV OFF} {buff}
put #trigger {^You sense the Clear Vision spell (upon|surrounding) you, which|^You feel more aware of your environment\.$} {#var CV ON} {buff}
put #trigger {^\s+Closing the (StormFront|Wizard) front end does NOT necessarily|^Your death cry echoes in your brain|Connection closed|Last login|^The world around you returns to its mundane appearance\.$} {#var PG OFF} {buff}
put #trigger {^You sense the Piercing Gaze spell (upon|surrounding) you, which|^The center of your vision loses its color\.\s+Adjusting your sight, you notice that objects you focus on become grey and gain a murky transparency\.$} {#var PG ON} {buff}
put #trigger {^\s+Closing the (StormFront|Wizard) front end does NOT necessarily|^Your death cry echoes in your brain|Connection closed|Last login|^You no longer feel as strong a connection to the web of fate\.$} {#var SEER OFF} {buff}
put #trigger {^You sense the Seer's Sense spell (upon|surrounding) you, which|^You feel oddly in tune with the web of fate\.$} {#var SEER ON} {buff}
put #trigger {^\s+Closing the (StormFront|Wizard) front end does NOT necessarily|^Your death cry echoes in your brain|Connection closed|Last login|^You notice the shadows about you lightening, making it harder to conceal yourself\.$} {#var SHADOWS OFF} {buff}
put #trigger {^You sense the Shadows spell (upon|surrounding) you, which|^There is a subtle change in the lighting around you\.\s+You should find it easier to skulk in the shadows now\.$} {#var SHADOWS ON} {buff}
put #trigger {^\s+Closing the (StormFront|Wizard) front end does NOT necessarily|^Your death cry echoes in your brain|Connection closed|Last login|^Your tactile sense returns to normal\.$} {#var TS OFF} {buff}
put #trigger {^You sense the Tenebrous Sense spell (upon|surrounding) you, which|^Your tactile sense stretches out and intertwines with the shadows around you\.\s+You feel mass and movement brush against the shadows like a tingling against your skin\.$} {#var TS ON} {buff}

goto doneST

paladin:
put #var Guild Paladin
put #trigger {^\s+Closing the (StormFront|Wizard) front end does NOT necessarily|^Your death cry echoes in your brain|Connection closed|Last login|^The dull orange glow fades from you\.$} {#var AS OFF} {buff}
put #trigger {^You sense the Anti-Stun spell (upon|surrounding) you, which|^A dull orange glow settles around you\.$} {#var AS ON} {buff}
put #trigger {^\s+Closing the (StormFront|Wizard) front end does NOT necessarily|^Your death cry echoes in your brain|Connection closed|Last login|^You sense the invisible magic guarding you fade\.$} {#var AA OFF} {buff}
put #trigger {^You sense the Aspirant's Aegis spell (upon|surrounding) you, which|^A comforting opalescent glow momentarily illuminates you before sinking into your \S+\.$} {#var AA ON} {buff}
put #trigger {^\s+Closing the (StormFront|Wizard) front end does NOT necessarily|^Your death cry echoes in your brain|Connection closed|Last login|^The ghostly banner fades out of sight\.$} {#var BOT OFF} {buff}
put #trigger {^You sense the Banner of Truce spell matrix in the area\.$|^A ghostly white banner fades into view overhead\.$} {#var BOT ON} {buff}
put #trigger {^\s+Closing the (StormFront|Wizard) front end does NOT necessarily|^Your death cry echoes in your brain|Connection closed|Last login|^Your previous bond with an? .+ breaks\.$} {#var BA OFF} {buff}
put #trigger {^You sense that there is a bond between you and an? .+, which|^Tendrils of translucent white writhe around your .+\.$|^You sense a new bond forged between you and your .+\.$} {#var BA ON} {buff}
put #trigger {^\s+Closing the (StormFront|Wizard) front end does NOT necessarily|^Your death cry echoes in your brain|Connection closed|Last login|^You seem to lose the clarity of your mind\.$} {#var CLARITY OFF} {buff}
put #trigger {^You sense the Clarity spell (upon|surrounding) you, which|^You feel your holy inclinations strengthen your senses, allowing a clearer perspective on the world\.$} {#var CLARITY ON} {buff}
put #trigger {^\s+Closing the (StormFront|Wizard) front end does NOT necessarily|^Your death cry echoes in your brain|Connection closed|Last login|^You falter for a moment as your extra courage slips away\.$} {#var COURAGE OFF} {buff}
put #trigger {^You sense the Courage spell (upon|surrounding) you, which|^You feel your courage bolstered by your faith and determination\.$} {#var COURAGE ON} {buff}
put #trigger {^\s+Closing the (StormFront|Wizard) front end does NOT necessarily|^Your death cry echoes in your brain|Connection closed|Last login|^You feel your resolve in the face of superior numbers weaken as the blessings of Crusader's Challenge fade\.$} {#var CRC OFF} {buff}
put #trigger {^You sense the Crusader's Challenge spell (upon|surrounding) you, which|^A faint silvery aura glistens around you, bolstering your confidence in the face of superior numbers\.$} {#var CRC ON} {buff}
put #trigger {^\s+Closing the (StormFront|Wizard) front end does NOT necessarily|^Your death cry echoes in your brain|Connection closed|Last login|^Your .+ returns? to its normal condition\.$} {#var DA OFF} {buff}
put #trigger {^You sense the Divine Armor spell (upon|surrounding) you, which|^Your .+ feels?.+more substantial\.$} {#var DA ON} {buff}
put #trigger {^\s+Closing the (StormFront|Wizard) front end does NOT necessarily|^Your death cry echoes in your brain|Connection closed|Last login|^Your profound inspiration wanes and expires as thin, wispy lines of light alternately appear and disappear near your head\.$} {#var DIG OFF} {buff}
put #trigger {^You sense the Divine Guidance spell (upon|surrounding) you, which|^Brilliant, hair-like threads of light form a wispy crown around your head, bringing with them an epiphany of thought and knowledge\.$} {#var DIG ON} {buff}
put #trigger {^\s+Closing the (StormFront|Wizard) front end does NOT necessarily|^Your death cry echoes in your brain|Connection closed|Last login|^Your zeal for justice wanes as you realize the divine guidance of Chadatru has faded\.$} {#var HOJ OFF} {buff}
put #trigger {^You sense the Hands of Justice spell (upon|surrounding) you, which|^Your hands glow briefly with a pristine white light as you feel your dedication to the pursuit of justice strengthened!$} {#var HOJ ON} {buff}
put #trigger {^\s+Closing the (StormFront|Wizard) front end does NOT necessarily|^Your death cry echoes in your brain|Connection closed|Last login|^Your extra strength deserts you as the glistening net unravels from your body\.$} {#var HES OFF} {buff}
put #trigger {^You sense the Heroic Strength spell (upon|surrounding) you, which|^A glistening net of coiling tendrils interlaces itself across your muscles, outlining each vein and contour with sparkles of white light\.$} {#var HES ON} {buff}
put #trigger {^\s+Closing the (StormFront|Wizard) front end does NOT necessarily|^Your death cry echoes in your brain|Connection closed|Last login|^The holy golden radiance of your soul subsides, retreating into your body\.$} {#var HOW OFF} {buff}
put #trigger {^You sense the Holy Warrior spell (upon|surrounding) you, which|^You clap your hands once in an august gesture of piety\.$} {#var HOW ON} {buff}
put #trigger {^\s+Closing the (StormFront|Wizard) front end does NOT necessarily|^Your death cry echoes in your brain|Connection closed|Last login|^You falter for a moment as your inner faculties return to normal\.$} {#var MO OFF} {buff}
put #trigger {^You sense the Marshal Order spell (upon|surrounding) you, which|^You sense a righteous awakening, leaving you \S+ more in tune with your body, mind and spirit\.$} {#var MO ON} {buff}
put #trigger {^\s+Closing the (StormFront|Wizard) front end does NOT necessarily|^Your death cry echoes in your brain|Connection closed|Last login|^You feel your righteous rage dissipate\.$} {#var RW OFF} {buff}
put #trigger {^You sense the Righteous Wrath spell (upon|surrounding) you, which|^Your blood begins to boil and with a mighty shout you allow the rage within to flow outward for all to see\.$} {#var RW ON} {buff}
put #trigger {^\s+Closing the (StormFront|Wizard) front end does NOT necessarily|^Your death cry echoes in your brain|Connection closed|Last login|^You sense the Rutilor's Edge spell fade away\.$} {#var RUE OFF} {buff}
put #trigger {^You sense the Rutilor's Edge spell (upon|surrounding) you, which|^A soft silver glow envelops your .+ and is slowly absorbed into it\.$} {#var RUE ON} {buff}
put #trigger {^\s+Closing the (StormFront|Wizard) front end does NOT necessarily|^Your death cry echoes in your brain|Connection closed|Last login|^Your sense of protection leaves you\.$} {#var SR OFF} {buff}
put #trigger {^You sense the Sentinel's Resolve spell (upon|surrounding) you, which|^You sense an? \S+ wave of righteousness lend its protection to you} {#var SR ON} {buff}
put #trigger {^\s+Closing the (StormFront|Wizard) front end does NOT necessarily|^Your death cry echoes in your brain|Connection closed|Last login|^The power of the Soldier's Prayer slips away from you, fused elements of its pattern falling away like brittle metal\.$} {#var SP OFF} {buff}
put #trigger {^You sense the Soldier's Prayer spell (upon|surrounding) you, which|^You weave a simple barrier out of invisible strands of Holy energy and then focus inward\.\s+Spiritual heat surges from your refined soul, tempering the pattern\.$} {#var SP ON} {buff}
put #trigger {^\s+Closing the (StormFront|Wizard) front end does NOT necessarily|^Your death cry echoes in your brain|Connection closed|Last login|^Truffenyi's Rally ends, leaving behind a momentary sensation of something stuck in your throat\.$} {#var TR OFF} {buff}
put #trigger {^You sense the Truffenyi's Rally spell (upon|surrounding) you, which|^You speak a few words of righteousness in Truffenyi's name\.$} {#var TR ON} {buff}

goto doneST

ranger:
put #var Guild Ranger
##put #trigger {} {#var AF ON}
##put #trigger {} {#var AF OFF}
##put #trigger {} {#var BES ON}
##put #trigger {} {#var BES OFF}
put #trigger {You blend smoothly into your surroundings, making yourself unseen} {#var BLEND ON}
put #trigger {You fade into view for all to see} {#var BLEND OFF}
##put #trigger {A gentle breeze swirls about you briefly before fading away, leaving you cloaked in a faint emerald glow} {#var BOON ON}
##put #trigger {} {#var BOON OFF}
put #trigger {Cool waves of force shiver down your legs and through your arms, coursing through your body like some force of nature} {#var CAIS ON}
put #trigger {With a shiver, you feel a power drain from your life and your limbs\. You feel less confident about your swimming abilities} {#var CAIS OFF}
put #trigger {(You feel a bit lighter on your feet|You feel as quick as a hunting cat|You feel as if you could outrun a prize racehorse)} {#var CS ON}
put #trigger {You feel your agility and reflexes return to normal} {#var CS OFF}
##put #trigger {Your hand clenches seeking a weapon to wield or a bond to break} {#var COTC ON}
##put #trigger {} {#var COTC OFF}
put #trigger {You reach with both your hands and your senses for the wisdom of the earth} {#var EM ON}
put #trigger {You feel the Earth Meld spell dissipate completely} {#var EM OFF}
put #trigger {A sound like a soft murmuring fills your ears and a warm feeling spreads through your hands} {#var HOL ON}
put #trigger {You feel less confident about your skinning abilities} {#var HOL OFF}
put #trigger {The sounds of the world around you grow quiet and distant as you feel yourself fade into the protection of nature's canopy} {#var NC ON}
put #trigger {The protection of nature's canopy retreats from you} {#var NC OFF}
put #trigger {(A translucent sphere forms around you and shudders like a soap bubble|The translucent sphere already around you shudders and flickers with newly added invigoration)} {#var SOP ON}
put #trigger {The translucent sphere around you suddenly pops like a soap bubble} {#var SOP OFF}
put #trigger {Dark stripes form upon your (.+), rippling with feral power} {#var SOTT ON}
put #trigger {You feel your heightened reflexes and stalking prowess slip back to normal} {#var SOTT OFF}
put #trigger {Your fingertips swell and grow slightly sticky as your knees suddenly gain a newfound flexibility} {#var SPC ON}
put #trigger {Your fingertips and knees return to their normal state as your ability to climb wanes} {#var SPC OFF}
put #trigger {As a growing (.+) sense washes over you, pale glowing lines appear before your eyes, delineating the ever-shifting currents of the wind} {#var STW ON}
put #trigger {The glowing lines fade away along with the See the Wind spell} {#var STW OFF}
put #trigger {Almost immediately, hundreds of bugs explode from their hiding places, heeding your magical summons} {#var SWARM ON}
put #trigger {The insect swarm ceases to bother} {#var SWARM OFF}
put #trigger {The overwhelming sense of unity with your hidden brothers and sisters sharpens your intuition over animals} {#var WOTP ON}
put #trigger {With a slight jolt, you suddenly feel disconnected from the pack} {#var WOTP OFF}
put #trigger {(Your sense of smell sharpens to a new level|Your sense of smell sharpens to a potent new level)} {#var WS ON}
put #trigger {Your sense of smell returns to normal} {#var WS OFF}
put #trigger {Your death cry echoes in your brain as it quickly dawns on you that you have just died} {#var EASE OFF;#var MAF OFF;#var BLEND OFF;#var CAIS OFF;#var CS OFF;#var EM OFF;#var HOL OFF;#var NC OFF;#var SOP OFF;#var SOTT OFF;#var SPC OFF;#var STW OFF;#var SWARM OFF;#var WOTP OFF;#var WS OFF}
##put #var AF OFF
##put #var BES OFF
put #var BLEND OFF
##put #var BOON OFF
put #var CAIS OFF
put #var CS OFF
##put #var COTC OFF
put #var EM OFF
put #var HOL OFF
put #var NC OFF
put #var SOP OFF
put #var SOTT OFF
put #var SPC OFF
put #var STW OFF
put #var SWARM OFF
put #var WOTP OFF
put #var WS OFF
goto doneST

warmage:
put #trigger {^\s+Closing the (StormFront|Wizard) front end does NOT necessarily|^Your death cry echoes in your brain|Connection closed|Last login|^The Earth energy flows from your body, returning to its rightful place in the ground beneath your feet\.$} {#var AEG OFF} {buff}
put #trigger {^You sense the Aegis of Granite spell (upon|surrounding) you, which|^You draw forth a pulse of dusky green Earth energy and channel it into your body\.\s+As the transformation takes hold, so does a sensation of solidity\.$} {#var AEG ON} {buff}
put #trigger {^\s+Closing the (StormFront|Wizard) front end does NOT necessarily|^Your death cry echoes in your brain|Connection closed|Last login|^The shimmering ethereal shield fades from around you\.$} {#var ES OFF}
put #trigger {^You sense the Ethereal Shield spell (upon|surrounding) you, which|^A shimmering ethereal shield surrounds you\.$|^The ethereal shield surrounding you shimmers slightly\.$} {#var ES ON} 
put #trigger {^\s+Closing the (StormFront|Wizard) front end does NOT necessarily|^Your death cry echoes in your brain|Connection closed|Last login|^Your body is no longer imbued with Fire\.} {#var MOF OFF} {buff}
put #trigger {^You sense the Mantle of Flame spell (upon|surrounding) you, which|^A crackling mantle of blazing orange-yellow flames surrounds you, sinking into and melding with your body as the transformation takes hold\.\s+You feel swifter\.$} {#var MOF ON} {buff}
put #trigger {^\s+Closing the (StormFront|Wizard) front end does NOT necessarily|^Your death cry echoes in your brain|Connection closed|Last login|^The grid of thin lines slides away from your thoughts\.$} {#var SUBSTRATUM OFF} {buff}
put #trigger {^You sense the Substratum spell (upon|surrounding) you, which|^Focusing on the aethereal plane you draw out thin lines forming a grid that surrounds you at arms length\.\s+The lines quickly fade from sight, but you still feel very aware of their position\.$} {#var SUBSTRATUM ON} {buff}
put #trigger {^\s+Closing the (StormFront|Wizard) front end does NOT necessarily|^Your death cry echoes in your brain|Connection closed|Last login|^You feel less steady, and realize that your} {#var SUF OFF} 
put #trigger {^You sense the Sure Footing spell (upon|surrounding) you, which|^You feel steadier\.$} {#var SUF ON} 
put #trigger {^\s+Closing the (StormFront|Wizard) front end does NOT necessarily|^Your death cry echoes in your brain|Connection closed|Last login|^You feel the winds surrounding you disperse\.$} {#var SW OFF} {buff}
put #trigger {^You sense the Swirling Winds spell (upon|surrounding) you, which|^You harness the currents of air and channel them around yourself\.\s+They mold to your body, allowing you to dodge more easily\.$} {#var SW ON} {buff}
put #trigger {^\s+Closing the (StormFront|Wizard) front end does NOT necessarily|^Your death cry echoes in your brain|Connection closed|Last login|^The shifting winds blowing from behind you die down\.$} {#var TW OFF} {buff}
put #trigger {^You sense the Tailwind spell (upon|surrounding) you, which|^The wind begins to shift until it blows gently from behind your back\.$|^The wind blowing from behind you falters for a moment, then picks up again\.$} {#var TW ON} {buff}
put #trigger {^\s+Closing the (StormFront|Wizard) front end does NOT necessarily|^Your death cry echoes in your brain|Connection closed|Last login|^The veil of ice suddenly shatters and melts from around you\.$} {#var VOI OFF} {buff}
put #trigger {^You sense the Veil of Ice spell (upon|surrounding) you, which|^A veil of ice forms around you\.$} {#var VOI ON} {buff}
put #trigger {^\s+Closing the (StormFront|Wizard) front end does NOT necessarily|^Your death cry echoes in your brain|Connection closed|Last login|^The cushioning currents of wind about you rapidly disperse\.$} {#var YS OFF} {buff}
put #trigger {^You sense the Y'ntrel Sechra spell helping you maneuver|^A stiff breeze surrounds you, molding itself to your body and cushioning you against the weight of your armor\.$|^You refresh the currents of air buffering your armor\.$} {#var YS ON} {buff}
put #var AB OFF
put #var AC OFF
put #var SUBSTRATUM OFF
put #var ES OFF
put #var FOI OFF
put #var MOF OFF
put #var ROS OFF
put #var SUF OFF
put #var SW OFF
put #var TW OFF
put #var VOI OFF
#ut #var YS OFF
put #var ZE OFF
goto doneST


bard:
put #var Guild Bard
put #trigger {^Closing the (WIZARD|STORMFRONT) front end|^Your death cry echoes in your brain|Connection closed|Last login|^The rhythmic thrum flowing through your body lingers with a fading warmth like the last rays of the setting sun\.$} {#var DRUM OFF} 
put #trigger {^You sense the Drums of the Snake spell (upon|surrounding) you, which|^You feel yourself swaying to an internal beat that hums with the natural rhythm of nature itself\.$} {#var DRUM ON} 
put #trigger {^Closing the (WIZARD|STORMFRONT) front end|^Your death cry echoes in your brain|Connection closed|Last login|^You feel Eillie's Cry dissipate, leaving you before it could be expressed\.$} {#var ECRY OFF} 
put #trigger {^You sense the Eillie's Cry spell (upon|surrounding) you, which|^The spell leaves you oddly moved, as though a sublime utterance is within your grasp, yet not easily expressed\.$} {#var ECRY ON} 
put #trigger {^Closing the (WIZARD|STORMFRONT) front end|^Your death cry echoes in your brain|Connection closed|Last login|^The power welling up from deep within your soul burns out, your focus vanishing along with your improved combat prowess\.$} {#var HARMONY OFF} 
put #trigger {^You sense the Harmony spell (upon|surrounding) you, which|^With a power that seems to come from deep within yourself, staccato notes rip fiercely through the air\.$} {#var HARMONY ON} 
put #trigger {^Closing the (WIZARD|STORMFRONT) front end|^Your death cry echoes in your brain|Connection closed|Last login|^The delusive tones surrounding you fade away\.$} {#var MIS OFF} 
put #trigger {^You sense the Misdirection spell (upon|surrounding) you, which|^A soft, rapid melody builds inside your mind as you create a call and response form around it\.$} {#var MIS ON} 
put #trigger {^Closing the (WIZARD|STORMFRONT) front end|^Your death cry echoes in your brain|Connection closed|Last login|^Slowly, the determination burning within you ebbs, the fierce pounding of your heart gradually subsiding\.$} {#var NAME OFF} 
put #trigger {^The air around you reverberates with an?.+manifestation of the Naming of Tears spell|^As the pattern grips you, you are filled with resolve to stand fast and strong against all that assails you\.$} {#var NAME ON} 
put #trigger {^Closing the (WIZARD|STORMFRONT) front end|^Your death cry echoes in your brain|Connection closed|Last login|^The pulsing fervor of Rage of the Clans fades from your body and your pulse returns to normal\.$} {#var RAGE OFF} 
put #trigger {^You sense the Rage of the Clans spell (upon|surrounding) you, which|^Your blood rises as images of ferocious battles play across your mind\.  You feel the fervor of combat grip you\.$} {#var RAGE ON} 
put #trigger {^Closing the (WIZARD|STORMFRONT) front end|^Your death cry echoes in your brain|Connection closed|Last login|^You feel the fearlessness endowed by Redeemer's Pride ebb away\.$} {#var REPR OFF} 
put #trigger {^You feel an?.+manifestation of Redeemer's Pride upon you|^You feel indomitable as Redeemer's Pride takes hold of you, bolstering you with unshakeable confidence\.$} {#var REPR ON} 
put #trigger {^Closing the (WIZARD|STORMFRONT) front end|^Your death cry echoes in your brain|Connection closed|Last login|^You let your voice fade even as the pace of Faenella's Grace slows} {#var FAE OFF} 
put #trigger {^You release an accompaniment of elemental air into your cadence, as you allow the rhythms to fade into the sounds around you.$} {#var FAE ON} 
goto doneST

Necromancer:
put #var Guild Necromancer
put #trigger {^\s+Closing the (StormFront|Wizard) front end does NOT necessarily|^Your death cry echoes in your brain|Connection closed|Last login|^A brief urge to sick up fills your stomach as your face abruptly resumes its normal shape, color returning to the skin as the mutation fails\.$} {#var IVM OFF} {buff}
put #trigger {^You sense the Ivory Mask spell (upon|surrounding) you, which|^Color leeches from the skin on your face as you feel the bone structure underneath shift to accomodate changes on the inside of your skull\.\s+Crippling pain and nausea give way to euphoria as your mutation takes hold and the aetheric structure of the plane becomes visible in a blood haze\.$} {#var IVM ON} {buff}
put #trigger {^\s+Closing the (StormFront|Wizard) front end does NOT necessarily|^Your death cry echoes in your brain|Connection closed|Last login|^The cysts in your eye pop one after another, deflated of their wondrous magic\.$} {#var KS OFF} {buff}
put #trigger {^You sense the Kura-Silma spell (upon|surrounding) you, which|^Your eye feels swollen and heavy as an infinitesimal eddy of mutation twists inside, sowing it with many delicate cyst-buds\.$} {#var KS ON} {buff}
put #trigger {^\s+Closing the (StormFront|Wizard) front end does NOT necessarily|^Your death cry echoes in your brain|Connection closed|Last login|^You sense the obfuscating field around you vanish\.$} {#var OBFUSCATION OFF} {buff}
put #trigger {^You sense the Obfuscation spell (upon|surrounding) you, which|^You project around yourself a field that suggests total normalcy to any who view you, drawing some measure of attention away from you and making it easier to conceal yourself\.$} {#var OBFUSCATION ON} {buff}
put #trigger {^\s+Closing the (StormFront|Wizard) front end does NOT necessarily|^Your death cry echoes in your brain|Connection closed|Last login|^An unpleasant sensation jolts through your body as your mutation fades, leaving you feeling briefly weakened as well as slower\.$} {#var PHP OFF} {buff}
put #trigger {^You sense the Philosopher's Preservation spell (upon|surrounding) you, which|^Swirls of reddish-black energy erupt forth from all over your body, settling into your nervous system\.\s+There is the briefest flash of intense pain before the spell improves your mortal reflexes into something beyond that of a normal} {#var PHP ON} {buff}
put #trigger {"Tiny streams of viridian and copper leap from your outstretched hand, coalescing around} {#var DEVOUR ON}

goto doneST

doneST:
put #trigger save
goto asdasdasdasd