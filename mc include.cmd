#MasterCraft - by the player of Jaervin Ividen
# A crafting script suite...
#v 0.1.6
#
# Script Usage: .mastercraft								--to only do one work order
#				.mastercraft <no. of orders>				--to perform more than one
#				.mastercraft <no. of orders> <difficulty>	--to quickly change your order difficulty because of new skill range (not added yet)
#
# 	Welcome to the include file!
#
#	This is where you set up your character's crafting profile. Since there are many different crafts and some people like to do orders from many,
#	the personal variables are set by which type of society you're in so you don't have to edit them so often. Each character can have its own
#	crafting profile, so you may change these variables to your own personal liking for each character you use this script with.
#	
#	Here's a breakdown of each variable:																		Used In:
#	forging.storage		--Container for forging (tools, deeds, spare parts, etc.) 								pound, grind
#	outfitting.storage	--Container for outfitting equipment (tools, deeds, spare parts, etc.)					sew, knit
#	engineering.storage	--Container for engineering equipment (tools, deeds, spare parts, etc.)					carve
#	remnant.storage		--Container for putting failed items, materials too small to make stuff with.			mastercraft
#	work.material		--The stocked material type for orders. Be specific (ie. bronze-alloy, gargoyle-hide.)	mastercraft
#
#	These variables must be set -to the letter-. Yes, this means they are case-sensitive:
#	auto.repair		--"on" or "off" ONLY. Set if you want to repair your own metal tools (must have techs.)		mastercraft
#	reclaim.metal	--"on" or "off" ONLY. Set if you have flux and wish to reclaim failed items.				mastercraft
#	deed.order		--"on" or "off" ONLY. Set if your products are heavy(ie. armor, stone furniture.)			mastercraft
#	MC.Mark			--"on" or "off" ONLY. Set if you have a maker's mark you wish to use.						mastercraft, pound, grind, sew, carve, knit
#	discipline		--"weapon", "armor", "blacksmith", "tailor", "carving" ONLY.								mastercraft
#	work.difficulty	--"easy", "challenging", "hard" ONLY. Used for asking for work orders.						mastercraft
#	order.pref		--"cloth", "leather", "knitted", "stone", "bone" ONLY. Determines the orders you keep.		mastercraft
#
#
#	Be sure to complete your character's crafting profile before running any of the included scripts. There are some things scripting
#	cannot do for you, such as make personal decisions.
#	
#	Each script can be run completely standalone from Mastercraft if you want to create multiple items or just individual orders. Using them
#	as such will require you to be responsible for your own material management and quality control.
#
# Happy Crafting!

debug 10

gosub location.vars
gosub check.location
goto $charactername


###########################################################################
### Character Profiles. Please edit these for your character(s). 
###########################################################################

Jaervin:
#the default settings
	 var forging.storage rucksack
	 var outfitting.storage satchel
	 var engineering.storage canvas sack 
	 var remnant.storage haversack
	 put #var MC.Mark off
	 var auto.repair off
	 goto set_done

Boklin:
	 var forging.storage backp
	 var outfitting.storage backp
	 var engineering.storage lootsack 
	 var remnant.storage backp
	 put #var MC.Mark off
	 var auto.repair off
	 goto set_done

	 
Vakroth:
#the default settings
	 var main.storage loots
	 var forging.storage loots
	 var outfitting.storage valise
	 var engineering.storage lootsack 
	 var remnant.storage backp
	 put #var MC.Mark off
	 var auto.repair on
	 goto set_done

	 
Yosto:
	 var forging.storage rucksack
	 var outfitting.storage satchel
	 var engineering.storage canvas sack 
	 var remnant.storage haversack
	 put #var MC.Mark off
	 var auto.repair off
	 goto set_done

	 
	 
Hintoc:
#the default settings
	 var forging.storage backp
	 var outfitting.storage valise
	 var engineering.storage lootsack 
	 var remnant.storage bag
	 put #var MC.Mark off
	 var auto.repair off
	 goto set_done

	 	 
Doz:
#the default settings
	 var forging.storage valise
	 var outfitting.storage valise
	 var engineering.storage belt 
	 var remnant.storage loots
	 put #var MC.Mark off
	 var auto.repair on
	 goto set_done

	 
Spac:
#the default settings
	 var forging.storage case
	 var outfitting.storage valise
	 var engineering.storage belt 
	 var remnant.storage sack
	 put #var MC.Mark off
	 var auto.repair off
	 goto set_done

	 
	 
set_done:
#Forging settings
if "%society.type" = "Forging" then
	{
	 var discipline weapon
	 var work.difficulty challenging
	 var work.material bronze
	 var order.pref
	 var main.storage %forging.storage
	 put #var MC.Mark off
	 var deed.order no
	}
#Outfitting settings
if "%society.type" = "Outfitting" then
	{
	 var discipline tailor
	 var work.difficulty challenging
	 var work.material burlap
	 var order.pref cloth
	 var main.storage %outfitting.storage
	 put #var MC.Mark off
	 var deed.order no
	}
#Engineering settings
if "%society.type" = "Engineering" then
	{
	 var discipline carving
	 var work.difficulty challenging
	 var work.material deer
	 var order.pref bone
	 var main.storage %engineering.storage
	 put #var MC.Mark off
	 var deed.order no
	}
goto end



####################################################################################################
### End of Character Profiles. The following is necessary for location settings and script operation. 
####################################################################################################


location.vars:
	#Haven Forging
	 var HF.room.list 442|441|443|405|404|398|402|403|409|408|399|406|407|400|410|411|401
	 var HF.master.room 398|399|400|401
	 var HF.work.room 405|409|403|407|411
	 var HF.grind.room %HF.work.room 
	#Haven Outfitting
	 var HO.room.list 448|450|449|451|458|459|455|452|453|454|456|457|460
	 var HO.master.room 448|449|450|451|452|453|454
	 var HO.work.room 458|459|460|455|456|457
	 var HO.wheel.room 458|459|460
	 var HO.loom.room 455|456|457
	#Haven Engineering
	 var HE.room.list 461|462|463|464|465|466|467|468|469
	 var HE.master.room 462|461|463|464|465|466
	 var HE.work.room 467|468|469|464|462
    #Crossing Forging
     var CF.room.list 875|913|914|915|916|917|918|919|920|921|922|923|6
     var CF.master.room 875|913|914|915|916|917|918|919|920|921|922|923
     var CF.work.room 921|922|923|6
     var CF.grind.room 919|918
	#Crossing Outfitting
	 var CO.room.list 910|911|915|916|912|913|914|873|917|918|919|920|921|933|934|935
	 var CO.master.room 910|911|915|916|912|913|914|873
	 var CO.work.room 917|918
	 var CO.wheel.room 919|920|921
	 var CO.loom.room 933|934|935
	#Crossing Engineering
     var CE.room.list 860|884|939|940|941|942|943|944
     var CE.master.room 860|884|940|941|942|943|944|939
     var CE.work.room 8|9|10
	#Lava Forge
	 var LvF.room.list 774|777|776|775|778|782|779|784|780|786|781|783|785
	 var LvF.master.room 775|778|782|779|784|780|786
	 var LvF.work.room 781|783|785
	 var LvF.grind.room 782|786|784
	#Leth Premie Forge
	 var LPF.room.list 248|238|239|240|241|242|243|244|245|246|247|253|252|251|250|249|237
	 var LPF.master.room 248|238|239|240|241|242|243|244|245|246|247|253|252
	 var LPF.work.room 251|250|249
	 var LPF.grind.room 252|253|247
	#Ratha Forging
	 var RF.room.list 818|819|820|821|822|823|824|825|826|827|828|829|830|831|832
	 var RF.master.room 819|820|821|822|823|824|825|826|827|828|829|830|831|832
	 var RF.work.room 830|831|832
	 var RF.grind.room 821|822|823
	#Shard Forging
	 var SF.room.list 644|661|645|648|648|649|650|651|652|653|654|655|656|657|658|659|660|646
	 var SF.master.room 644|645|649|650|653|654|655|658|646|661
	 var SF.work.room 648|652|657|660
	 var SF.grind.room %SF.work.room
	#Hibarnhivdar Forging
	 var HibF.room.list 407|408|416|417|418|419|409|410|411|412|413|414|415
 	 var HibF.master.room 407|408|416|417|418|419|409|410|411|412|413|414|415
	 var HibF.work.room 416|417|418|419
	 var HibF.grind.room 418|419
	 
	#Mer'Kresh Forging
	 var MKF.room.list 334|335|336|337|338|339|340|341|342|343|344|345|346|347|348
 	 var MKF.master.room 334|335|336|337|338
	 var MKF.work.room 344|345|346|347|348
	 var MKF.grind.room %MKF.work.room
	
	 var Master.Found 0
	 action instant var Master.Found 1 when ^Heavily muscled for an Elf, Fereldrin|^Yalda is a plump Dwarf|^Standing at an imposing height, the Gor'Tog surveys |^Serric is a muscular Human|^Juln is a muscular Dwarf|^Hagim is slight Gnome man|^Paarupensteen is a balding plump Halfling|^Milline is a tall Elothean woman|^Talia is a honey-brown haired Human|^This well-muscled Elf stands taller than 
	 return

check.location:
	var society none
	if "$zoneid" = "30" && matchre("%HF.room.list", "\b$roomid\b") then var society Haven.Forging
	if "$zoneid" = "30" && matchre("%HO.room.list", "\b$roomid\b") then var society Haven.Outfitting
	if "$zoneid" = "30" && matchre("%HE.room.list", "\b$roomid\b") then var society Haven.Engineering
	if "$zoneid" = "1" && matchre("%CF.room.list", "\b$roomid\b") then var society Crossing.Forging
	if "$zoneid" = "1" && matchre("%CO.room.list", "\b$roomid\b") then var society Crossing.Outfitting
	if "$zoneid" = "1" && matchre("%CE.room.list", "\b$roomid\b") then var society Crossing.Engineering
	if "$zoneid" = "90" && matchre("%RF.room.list", "\b$roomid\b") then var society Ratha.Forging
	if "$zoneid" = "67" && matchre("%SF.room.list", "\b$roomid\b") then var society Shard.Forging
	if "$zoneid" = "116" && matchre("%HibF.room.list", "\b$roomid\b") then var society Hib.Forging
	if "$zoneid" = "107" && matchre("%MKF.room.list", "\b$roomid\b") then var society MerKresh.Forging
	if "$zoneid" = "7" && matchre("%LvF.room.list", "\b$roomid\b") then var society Lava.Forge
	if "$zoneid" = "61" && matchre("%LPF.room.list", "\b$roomid\b") then var society Leth.Premie.Forge
	pause 1
	gosub %society
return

Haven.Forging:
var master Fereldrin
var master.room %HF.master.room
var grind.room %HF.grind.room
var work.room %HF.work.room
var deed.room 442
var material.room 400
var part.room 399
var tool.room 399
var society.type Forging
return

Haven.Outfitting:
var master Hagim
var master.room %HO.master.room
var work.room %HO.work.room
var supply.room 450
var part.room 450
#order parts
var tool.room 451
var society.type Outfitting
return

Haven.Engineering:
var master Paarupensteen
var master.room %HE.master.room
var work.room %HE.work.room
var supply.room 465
var material.room 466
var part.room 466
var tool.room 465
var society.type Engineering
return

Crossing.Forging:
var master Yalda
var master.room %CF.master.room
var grind.room %CF.grind.room
var work.room %CF.work.room
var deed.room 920
var supply.room 920
var part.room 917
var tool.room 917
var society.type Forging
return

Crossing.Outfitting:
var master Milline
var master.room %CO.master.room
var work.room %CO.work.room
var supply.room 914
var part.room 914
#order parts
var tool.room 913
var society.type Outfitting
return


Crossing.Engineering:
var master Talia
var master.room %CE.master.room
var work.room %CE.work.room
var supply.room 4
var part.room 4
var tool.room 2
var society.type Engineering
return

Lava.Forge:
var master None
var master.room %LvF.master.room
var grind.room %LvF.grind.room
var work.room %LvF.work.room
var deed.room 775
var supply.room 775
var part.room 777
var tool.room 777
var society.type Forging
return

Leth.Premie.Forge:
var master None
var master.room %LPF.master.room
var grind.room %LPF.grind.room
var work.room %LPF.work.room
var deed.room 248
var supply.room 248
var part.room 248
var tool.room 238
var society.type Forging
return

Ratha.Forging:
var master Grimbly
var master.room %RF.master.room
var grind.room %RF.grind.room
var work.room %RF.work.room
var deed.room 829
var supply.room 829
var part.room 819
var tool.room 819
var society.type Forging
return

Shard.Forging:
var master Serric
var master.room %SF.master.room
var grind.room %SF.grind.room
var work.room %SF.work.room
var deed.room 661
var supply.room 658
var part.room 653
var tool.room 653
var society.type Forging
return

Hib.Forging:
var master Juln
var master.room %HibF.master.room
var grind.room %HibF.grind.room
var work.room %HibF.work.room
var deed.room 415
var supply.room 415
var part.room 413
var tool.room 413
var society.type Forging
return

MerKresh.Forging:
var master Kapric
var master.room %MKF.master.room
var grind.room %MKF.grind.room
var work.room %MKF.work.room
var deed.room 336
var supply.room 336
var part.room 337
var tool.room 337
var society.type Forging
return

none:
return


find.room:
	 var find.room $0
	 if ((contains("%find.room", "$roomid")) && ("$roomplayers" = "")) then return
	 var temp 0
	 eval temp.max count("%find.room","|")
find.room2:
	 gosub automove %find.room(%temp)
 	 if ((contains("%find.room", "$roomid")) && ("$roomplayers" = "")) then
		{
		unvar temp
		unvar temp.max
		return
		}
	 math temp add 1
	 if %temp > %temp.max then gosub find.room.wait
	 gosub find.room2
	return
	
find.room.wait:
	 var temp 0
	 gosub automove %tool.room
	 echo *** All workrooms occupied, waiting 90 seconds before trying again...
	 pause 90
	 return

find.master:
	 gosub check.location
	 var Master.Found 0
	 var temp 0
	 eval temp.max count("%master.room","|")
	 pause 1
	 send look %master
	 pause 1
	 if %Master.Found = 1 then
	 {
	 unvar temp
	 unvar temp.max
	 return
	 }
find.master2:
	 pause 1
	 gosub automove %master.room(%temp)
	 send look %master
	 pause 1
	 if %Master.Found = 1 then
		{
		unvar temp
		unvar temp.max
		return
		}
	 math temp add 1
	 if %temp > %temp.max then
	{
	 echo %master not found in any room specified. Check your master room list for this society!
	 exit
	}
	gosub find.master2
	return

automove:
	 if $roomid = 0 then return
	 var toroom $1
automovecont:
	 match automovecont2 Bonk! You smash your nose.
	 match return YOU HAVE ARRIVED
	 match automovecont1 YOU HAVE FAILED
	 put #goto %toroom
	 matchwait

automovecont1:
	 pause
	 put look
	 pause
	goto automovecont

automovecont2:
	 pause
	 if contains("$scriptlist", "automapper") then send #script abort automapper
	 pause
	 return

mark:
	if $MC.Mark = "off" then return
	if $MC.Mark = "on" then
	{
	 send get my stamp
	 waitforre ^You get
	 send mark $MC.order.noun with my stamp
	 waitforre ^Roundtime
	 send stow my stamp
	 waitforre ^You put
	 return
	}
	return

end:
