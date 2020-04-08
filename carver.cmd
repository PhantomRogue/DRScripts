echo **************************************
echo *** Craft version 2.0
echo *** Created by Danoryiel Shadowsboon
echo *** version date 1/14/2012
echo *** 
echo *** This script is intended to cover
echo *** a wide range of crafting skills
echo *** and is currently incomplete.
echo *** Assistance in creating this
echo *** script is welcomed and encouraged.
echo ***
echo *** please send any suggestions or
echo *** improvements for this script to
echo *** danoryiel@yahoo.com and I will
echo *** do my best to incorporate them
echo *** in order to cover all crafting
echo *** disciplines.
echo ***
echo ***************************************




put read logbook
match NOWORK is not currently tracking
match SMALLBLOCK small stone block
match THINSLAB thin stone slab
match STONEBAND a stone band
match LARGEBLOCK large stone block
match THICKSLAB thick stone slab
match S_POLE short stone pole
match L_POLE long stone pole
match S_BASIN shallow stone basin
match S_ROD stout stone stirring rod
match G_ROD grooved stone stirring rod
match N_ROD notched stone stirring rod
match F_ROD forked stone stirring rod
match C_KNIFE stone carving knife
match BLUDGEON stone bludgeon
match MATTOCK stone mattock
match MAUL stone maul
match FLAIL stone flail
match BRACELET stone bracelet
match ANKLET stone anklet
match PIN stone pin
match C_PIN stone cloak pin
match HAIRPIN stone hairpin
match TAILBAND stone tailband
match DIADEM stone diadem
match CIRCLET stone circlet
match NECKLACE stone necklace
match A_BELT articulated stone belt
match CROWN stone crown
match HUMAN a Human image
match KALDAR a Kaldar image
match ELF an Elf image
match ANKLEBAND a cloth ankleband
match FINGERGLOVE some cloth fingerless gloves
match C_ARMBAND a cloth armband
match A_SOCKS some cloth ankle socks
match SOCK some cloth socks
match C_BELT a cloth belt
match HEADBAND a cloth headband
match ELBOWGLOVE some elbow-length gloves
match PLEATGLOVE some pleated cloth gloves
match KNEESOCK some cloth knee socks
match H_ROBES some hooded cloth robes
match CAPE a cloth cape
match H_CLOAK hooded cloth cloak
match TUNIC formal cloth tunic
match TABARD cloth tabard
match SS_TUNIC short-sleeved tunic
match D_SHIRT cloth dress shirt
match GOWN cloth gown
match FL_DRESS floor-length cloth dress
match D_PANTS some cloth dress pants
match DH_CLOAK deeply-hooded cloak
match SHAMANROBE cloth shaman's robe
match FLOWINGROBE some flowing cloth robes
match MAGEROBE cloth mage's robe
match CARRYALL cloth carryall
match KNAPSACK cloth knapsack
match BACKPACK cloth backpack
matchwait

NOWORK:
echo ***                                            ***
echo ***  You do not have a Work Order at this time ***
echo ***  Please ask your local trainer for work    ***
echo ***  and try again.                            ***
exit

STONEBAND:
put stow logb
put get carv book
put turn book to chapt 4
put turn book to page 1
goto MAIN



SMALLBLOCK:
put stow logb
put get carv book
put turn book to chapt 1
put turn book to page 1
goto MAIN

THINSLAB:
put stow logb
put get carv book
put turn book to chapt 1
put turn book to page 2
goto MAIN

LARGEBLOCK:
put stow logb
put get carv book
put turn book to chapt 1
put turn book to page 3
goto MAIN

THICKSLAB:
put stow logb
put get carv book
put turn book to chapt 1
put turn book to page 4
goto MAIN

S_POLE:
put stow logb
put get carv book
put turn book to chapt 1
put turn book to page 5
goto MAIN

L_POLE:
put stow logb
put get carv book
put turn book to chapt 1
put turn book to page 6
goto MAIN

S_BASIN:
put stow logb
put get carv book
put turn book to chapt 1
put turn book to page 7
goto MAIN

S_ROD:
put stow logb
put get carv book
put turn book to chapt 1
put turn book to page 8
goto MAIN

G_ROD:
put stow logb
put get carv book
put turn book to chapter 1
put turn book to page 13
goto MAIN

N_ROD:
put stow logb
put get carv book
put turn book to chapter 1
put turn book to page 14
goto MAIN

F_ROD:
put stow logb
put get carv book
put turn book to chapter 1
put turn book to page 15
goto MAIN

C_KNIFE:
put stow logb
put get carv book
put turn book to chapt 3
put turn book to page 3
goto MAIN

BLUDGEON:
put stow logb
put get carv book
put turn book to chapt 3
put turn book to page 4
goto MAIN

MATTOCK:
put stow logb
put get carv book
put turn book to chapter 3
put turn book to page 17
goto MAIN

MAUL:
put stow logb
put get carv book
put turn book to chapter 3
put turn book to page 16
goto MAIN

FLAIL:
put stow logb
put get carv book
put turn book to chapt 3
put turn book to page 18
goto MAIN

BRACELET:
put stow logb
put get carv book
put turn book to chapt 4
put turn book to page 4
goto MAIN

ANKLET:
put stow logb
put get carv book
put turn book to chapt 4
put turn book to page 5
goto MAIN

PIN:
put stow logb
put get carv book
put turn book to chapt 4
put turn book to page 6
goto MAIN

C_PIN:
put stow logb
put get carv book
put turn book to chapt 4
put turn book to page 7
goto MAIN

HAIRPIN:
put stow logb
put get carv book
put turn book to chapt 4
put turn book to page 8
goto MAIN

TAILBAND:
put stow logb
put get carv book
put turn book to chapt 4
put turn book to page 9
goto MAIN

DIADEM:
put stow logb
put get carv book
put turn book to chapter 4
put turn book to page 23
goto MAIN

CIRCLET:
put stow logb
put get carv book
put turn book to chapter 4
put turn book to page 24
goto MAIN

NECKLACE:
put stow logb
put get carv book
put turn book to chapter 4
put turn book to page 25
goto MAIN

A_BELT:
put stow logb
put get carv book
put turn book to chapt 4
put turn book to page 26
goto MAIN

CROWN:
put stow logb
put get carv book
put turn book to chapt 4
put turn book to page 27
goto MAIN

HUMAN:
put stow logb
put get carv book
put turn book to chapt 5
put turn book to page 1
goto MAIN

KALDAR:
put stow logb
put get carv book
put turn book to chapt 5
put turn book to page 2
goto MAIN

ELF:
put stow logb
put get carv book
put turn book to chapt 5
put turn book to page 3
goto MAIN

ANKLEBAND:
put stow logb
put get tailor book
put turn book to chapt 2
put turn book to page 1
goto MAIN2

FINGERGLOVE:
put stow logb
put get tailor book
put turn book to chapt 2
put turn book to page 2
goto MAIN2

C_ARMBAND:
put stow logb
put get tailor book
put turn book to chapt 2
put turn book to page 3
goto MAIN2

A_SOCKS:
put stow logb
put get tailor book
put turn book to chapt 2
put turn book to page 4
goto MAIN2

SOCK:
put stow logb
put get tailor book
put turn book to chapt 2
put turn book to page 5
goto MAIN2

C_BELT:
put stow logb
put get tailor book
put turn book to chapt 2
put turn book to page 6
goto MAIN2

HEADBAND:
put stow logb
put get tailor book
put turn book to chapt 2
put turn book to page 7
goto MAIN2

ELBOWGLOVE:
put stow logb
put get tailor book
put turn book to chapt 2
put turn book to page 8
goto MAIN2

PLEATGLOVE:
put stow logb
put get tailor book
put turn book to chapt 2
put turn book to page 9
goto MAIN2

KNEESOCK:
put stow logb
put get tailor book
put turn book to chapt 2
put turn book to page 10
goto MAIN2

H_ROBES:
put stow logb
put get tailor book
put turn book to chapt 2
put turn book to page 42
goto MAIN2

CAPE:
put stow logb
put get tailor book
put turn book to chapt 2
put turn book to page 43
goto MAIN2

H_CLOAK:
put stow logb
put get tailor book
put turn book to chapt 2
put turn book to page 44
goto MAIN2

TABARD:
put stow logb
put get tailor book
put turn book to chapt 2
put turn book to page 45
goto MAIN2

TUNIC:
put stow logb
put get tailor book
put turn book to chapt 2
put turn book to page 46
goto MAIN2

SS_TUNIC:
put stow logb
put get tailor book
put turn book to chapt 2
put turn book to page 47
goto MAIN2

D_SHIRT:
put stow logb
put get tailor book
put turn book to chapt 2
put turn book to page 48
goto MAIN2

GOWN:
put stow logb
put get tailor book
put turn book to chapt 2
put turn book to page 49
goto MAIN2

FL_DRESS:
put stow logb
put get tailor book
put turn book to chapt 2
put turn book to page 50
goto MAIN2

D_PANTS:
put stow logb
put get tailor book
put turn book to chapt 2
put turn book to page 51
goto MAIN2

DH_CLOAK:
put stow logb
put get tailor book
put turn book to chapt 2
put turn book to page 52
goto MAIN2

SHAMANROBE:
put stow logb
put get tailor book
put turn book to chapt 2
put turn book to page 53
goto MAIN2

FLOWINGROBE:
put stow logb
put get tailor book
put turn book to chapt 2
put turn book to page 54
goto MAIN2

MAGEROBE:
put stow logb
put get tailor book
put turn book to chapt 2
put turn book to page 55
goto MAIN2

CARRYALL:
put stow logb
put get tailor book
put turn book to chapt 3
put turn book to page 13
goto MAIN2

KNAPSACK:
put stow logb
put get tailor book
put turn book to chapt 3
put turn book to page 14
goto MAIN2

BACKPACK:
put stow logb
put get tailor book
put turn book to chapt 3
put turn book to page 15
goto MAIN2

MAIN:
pause 2
echo -------------------------------
echo =  You have made %c %2 's
echo =
echo -------------------------------
put get my deed
put tap my deed
pause 2
put get %1
pause 2
put get book
put study book
waitfor Roundtime
pause 2
put stow book
put get chisels
put carve my %1 with chis
match riff jagged edges
match rasp uneven
match rasp no longer level
match polish discol
match carve Roundtime
matchwait

carve:
put stow
put get chis
#put hum %3
put carve %2 with chis
match stow You cannot figure
match assemble [Ingredients
match riff jagged edges
match rasp uneven
match rasp no longer level
match polish discol
match carve Roundtime
match carve ...w
matchwait

riff:
put stow chis
put get riff
put rub %2 with riff
match riff ...w
match assemble [Ingredients
match stow Applying the final
match carve Roundtime
matchwait

rasp:
put stow chis
put get rasp
put scrape %2 with rasp
match rasp ...w
match assemble [Ingredients
match stow Applying the final
match carve Roundtime
matchwait


polish:
put stow chis
put get polish
put apply polish to %2
match polish ...w
match assemble [Ingredients
match stow Applying the final
match carve Roundtime
matchwait

assemble:
put stow right
put get chis
put carve %2 with chis
match cord cord to continue
match pole pole to continue
match cord pole is not required
match pole cord is not required
match assemble ...w
matchwait

cord:
put stow right
put get cord in my bag
put assemble %2 with my cord
put analyze %2
match carve further carving
match carve You do not see anything
match rasp rasp
match riff riffler
match polish polish
match pole cord is not required
matchwait

pole:
put stow right
put get pole in my bag
put assemble %2 with my pole
put analyze %2
match carve further carving
match carve You do not see anything
match rasp rasp
match riff riffler
match polish polish
match cord pole is not required
matchwait

stow:
put analyze %2
waitfor Roundtime
pause 1
put stow %2
put stow right
counter add 1
goto MAIN

exit:
end

MAIN2:
if %c < %3 then goto exit
echo -------------------------------
echo =  You have made %c %2 's
echo =
echo -------------------------------
put stow l
put stow r
put get my %1
put swap
put get tailor book
put study tailor book
waitfor Roundtime
pause 2
put stow tailor book
put get scissors
put cut my %1 with scissors
match slickstone a quick ironing
match slickstone a deep crease develops
match pins Two layers of the fabric won't cooperate
match sew Roundtime
match sew ...w
matchwait

sew:
put stow
put get needle
#put hum %3
put push %2 with needle
match rethread The needles need to have thread
match stow2 You cannot figure
match slickstone a quick ironing
match slickstone a deep crease develops
match pins Two layers of the fabric won't cooperate
match pins The fabric keeps folding back
match yardstick from some remeasuring
match sew Roundtime
match sew ...w
match stow2 Applying the final touches
matchwait

slickstone:
put stow needle
put get slickstone
put rub %2 with slickstone
match stow2 Applying the final touches
match sew Roundtime
matchwait

pins:
put stow needle
put get pins
put poke %2 with pins
match stow2 Applying the final touches
match sew Roundtime
matchwait

yardstick:
put stow needle
put get yardstick
put measure %2 with yardstick
waitfor Roundtime
pause 2
put stow yardstick
put get scissors
put cut %2 with scissors
match stow2 Applying the final touches
match sew Roundtime
matchwait

rethread:
put stow %2
put get thread in my bag
put put thread on needle
put get %2 in my bag
goto sew

stow2:
put analyze %2
waitfor Roundtime
pause 1
put stow %2
put stow right
counter add 1
goto MAIN2