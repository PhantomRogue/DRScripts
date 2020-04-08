##########################commodity comparison script#########################


gosub load.actions
gosub set.variables
pause 5

room.check:
put look
match xing [Traders' Guild, The Pit]
match arthe [Swotting Hall, Trader's Center]
matchwait

xing:
setvariable curloc crossing
setvariable crossing.check yes
goto read.board

arthe:
setvariable curloc arthe
setvariable arthe.check yes
goto read.board

 
read.board:
put read board
pause 1
put read board
pause 1
goto set.commods

set.commods:
gosub %curloc.diamond
gosub %curloc.gold
gosub %curloc.ore
gosub %curloc.amber
gosub %curloc.cinnamon
gosub %curloc.oranges
gosub %curloc.slate
gosub %curloc.lead
gosub %curloc.bronze
gosub %curloc.cotton
gosub %curloc.velvet
gosub %curloc.oil
gosub %curloc.salt
gosub %curloc.dye
gosub %curloc.wheat
gosub %curloc.corn
gosub %curloc.berries
gosub %curloc.pearls
gosub %curloc.silver
gosub %curloc.charcoal
gosub %curloc.saffron
gosub %curloc.papyrus
gosub %curloc.limes
gosub %curloc.brass
gosub %curloc.copper
gosub %curloc.silk
gosub %curloc.wool
gosub %curloc.lace
gosub %curloc.myrrh
gosub %curloc.indigo
gosub %curloc.barley
gosub %curloc.oats
gosub %curloc.acanth
gosub %curloc.apples

location.check:
if "%crossing.check" = "no" then goto crossing.move
if "%arthe.check" = "no" then goto arthe.move
goto calc.time

calc.time:

diamond.eval:
pause 1
evalmath max.final.diamond max(%arthe.diamond, %crossing.diamond)
evalmath min.final.diamond min(%arthe.diamond, %crossing.diamond)
if "%max.final.diamond" = "%arthe.diamond" then setvariable diamond.max.location arthe
if "%max.final.diamond" = "%crossing.diamond" then setvariable diamond.max.location crossing
if "%min.final.diamond" = "%arthe.diamond" then setvariable diamond.min.location arthe
if "%min.final.diamond" = "%crossing.diamond" then setvariable diamond.min.location crossing
if "%diamond.max.location" = "crossing" then evalmath diamond.difference (%crossing.diamond-%arthe.diamond)
if "%diamond.max.location" = "arthe" then evalmath diamond.difference (%arthe.diamond-%crossing.diamond)
evalmath current.diamond.difference (%max.final.diamond - %min.final.diamond)
put #echo >Commodity Diamonds 
put #echo >Commodity CURRENT HIGH: %max.final.diamond in %diamond.max.location %diamond.Units
put #echo >Commodity CURRENT LOW: %min.final.diamond in %diamond.min.location 
put #echo >Commodity HIGHEST EVER: $highest.diamond.ever
put #echo >Commodity lOWEST EVER: $lowest.diamond.ever
put #echo >Commodity CURRENT DIFFERENCE: %current.diamond.difference
put #echo >Commodity BIGGEST DIFFERENCE: $biggest.diamond.difference
put #echo >Commodity
if math(%min.final.diamond < $lowest.diamond.ever) then put #var lowest.diamond.ever %min.final.diamond
if math(%max.final.diamond > $highest.diamond.ever) then put #var highest.diamond.ever %max.final.diamond
if math($biggest.diamond.difference > %current.diamond.difference) then put #var biggest.diamond.difference %current.diamond.difference

gold.eval:
pause 1
evalmath max.final.gold max(%arthe.gold, %crossing.gold)
evalmath min.final.gold min(%arthe.gold, %crossing.gold)
if "%max.final.gold" = "%arthe.gold" then setvariable gold.max.location arthe
if "%max.final.gold" = "%crossing.gold" then setvariable gold.max.location crossing
if "%min.final.gold" = "%arthe.gold" then setvariable gold.min.location arthe
if "%min.final.gold" = "%crossing.gold" then setvariable gold.min.location crossing
if "%gold.max.location" = "crossing" then evalmath gold.difference (%crossing.gold-%arthe.gold)
if "%gold.max.location" = "arthe" then evalmath gold.difference (%arthe.gold-%crossing.gold)
evalmath current.gold.difference (%max.final.gold - %min.final.gold)
put #echo >Commodity G old 
put #echo >Commodity CURRENT HIGH: %max.final.gold in %gold.max.location 
put #echo >Commodity CURRENT LOW: %min.final.gold in %gold.min.location 
put #echo >Commodity HIGHEST EVER: $highest.gold.ever
put #echo >Commodity lOWEST EVER: $lowest.gold.ever
put #echo >Commodity CURRENT DIFFERENCE: %current.gold.difference
put #echo >Commodity BIGGEST DIFFERENCE: $biggest.gold.difference
put #echo >Commodity
if math(%min.final.gold < $lowest.gold.ever) then put #var lowest.gold.ever %min.final.gold
if math(%max.final.gold > $highest.gold.ever) then put #var highest.gold.ever %max.final.gold
if math($biggest.gold.difference > %current.gold.difference) then put #var biggest.gold.difference %current.gold.difference


ore.eval:
pause 1
evalmath max.final.ore max(%arthe.ore, %crossing.ore)
evalmath min.final.ore min(%arthe.ore, %crossing.ore)
if "%max.final.ore" = "%arthe.ore" then setvariable ore.max.location arthe
if "%max.final.ore" = "%crossing.ore" then setvariable ore.max.location crossing
if "%min.final.ore" = "%arthe.ore" then setvariable ore.min.location arthe
if "%min.final.ore" = "%crossing.ore" then setvariable ore.min.location crossing
if "%ore.max.location" = "crossing" then evalmath ore.difference (%crossing.ore-%arthe.ore)
if "%ore.max.location" = "arthe" then evalmath ore.difference (%arthe.ore-%crossing.ore)
evalmath current.ore.difference (%max.final.ore - %min.final.ore)
put #echo >Commodity Iron Ore 
put #echo >Commodity CURRENT HIGH: %max.final.ore in %ore.max.location 
put #echo >Commodity CURRENT LOW: %min.final.ore in %ore.min.location 
put #echo >Commodity HIGHEST EVER: $highest.ore.ever
put #echo >Commodity lOWEST EVER: $lowest.ore.ever
put #echo >Commodity CURRENT DIFFERENCE: %current.ore.difference
put #echo >Commodity BIGGEST DIFFERENCE: $biggest.ore.difference
put #echo >Commodity
if math(%min.final.ore < $lowest.ore.ever) then put #var lowest.ore.ever %min.final.ore
if math(%max.final.ore > $highest.ore.ever) then put #var highest.ore.ever %max.final.ore
if math($biggest.ore.difference > %current.ore.difference) then put #var biggest.ore.difference %current.ore.difference

amber.eval:
pause 1
evalmath max.final.amber max(%arthe.amber, %crossing.amber)
evalmath min.final.amber min(%arthe.amber, %crossing.amber)
if "%max.final.amber" = "%arthe.amber" then setvariable amber.max.location arthe
if "%max.final.amber" = "%crossing.amber" then setvariable amber.max.location crossing
if "%min.final.amber" = "%arthe.amber" then setvariable amber.min.location arthe
if "%min.final.amber" = "%crossing.amber" then setvariable amber.min.location crossing
if "%amber.max.location" = "crossing" then evalmath amber.difference (%crossing.amber-%arthe.amber)
if "%amber.max.location" = "arthe" then evalmath amber.difference (%arthe.amber-%crossing.amber)
evalmath current.amber.difference (%max.final.amber - %min.final.amber)
put #echo >Commodity Amber 
put #echo >Commodity CURRENT HIGH: %max.final.amber in %amber.max.location 
put #echo >Commodity CURRENT LOW: %min.final.amber in %amber.min.location 
put #echo >Commodity HIGHEST EVER: $highest.amber.ever
put #echo >Commodity lOWEST EVER: $lowest.amber.ever
put #echo >Commodity CURRENT DIFFERENCE: %current.amber.difference
put #echo >Commodity BIGGEST DIFFERENCE: $biggest.amber.difference
put #echo >Commodity
if math(%min.final.amber < $lowest.amber.ever) then put #var lowest.amber.ever %min.final.amber
if math(%max.final.amber > $highest.amber.ever) then put #var highest.amber.ever %max.final.amber
if math($biggest.amber.difference > %current.amber.difference) then put #var biggest.amber.difference %current.amber.difference

cinnamon.eval:
pause 1
evalmath max.final.cinnamon max(%arthe.cinnamon, %crossing.cinnamon)
evalmath min.final.cinnamon min(%arthe.cinnamon, %crossing.cinnamon)
if "%max.final.cinnamon" = "%arthe.cinnamon" then setvariable cinnamon.max.location arthe
if "%max.final.cinnamon" = "%crossing.cinnamon" then setvariable cinnamon.max.location crossing
if "%min.final.cinnamon" = "%arthe.cinnamon" then setvariable cinnamon.min.location arthe
if "%min.final.cinnamon" = "%crossing.cinnamon" then setvariable cinnamon.min.location crossing
if "%cinnamon.max.location" = "crossing" then evalmath cinnamon.difference (%crossing.cinnamon-%arthe.cinnamon)
if "%cinnamon.max.location" = "arthe" then evalmath cinnamon.difference (%arthe.cinnamon-%crossing.cinnamon)
evalmath current.cinnamon.difference (%max.final.cinnamon - %min.final.cinnamon)
put #echo >Commodity Cinnamon 
put #echo >Commodity CURRENT HIGH: %max.final.cinnamon in %cinnamon.max.location 
put #echo >Commodity CURRENT LOW: %min.final.cinnamon in %cinnamon.min.location 
put #echo >Commodity HIGHEST EVER: $highest.cinnamon.ever
put #echo >Commodity lOWEST EVER: $lowest.cinnamon.ever
put #echo >Commodity CURRENT DIFFERENCE: %current.cinnamon.difference
put #echo >Commodity BIGGEST DIFFERENCE: $biggest.cinnamon.difference
put #echo >Commodity
if math(%min.final.cinnamon < $lowest.cinnamon.ever) then put #var lowest.cinnamon.ever %min.final.cinnamon
if math(%max.final.cinnamon > $highest.cinnamon.ever) then put #var highest.cinnamon.ever %max.final.cinnamon
if math($biggest.cinnamon.difference > %current.cinnamon.difference) then put #var biggest.cinnamon.difference %current.cinnamon.difference


oranges.eval:
pause 1
evalmath max.final.oranges max(%arthe.oranges, %crossing.oranges)
evalmath min.final.oranges min(%arthe.oranges, %crossing.oranges)
if "%max.final.oranges" = "%arthe.oranges" then setvariable oranges.max.location arthe
if "%max.final.oranges" = "%crossing.oranges" then setvariable oranges.max.location crossing
if "%min.final.oranges" = "%arthe.oranges" then setvariable oranges.min.location arthe
if "%min.final.oranges" = "%crossing.oranges" then setvariable oranges.min.location crossing
if "%oranges.max.location" = "crossing" then evalmath oranges.difference (%crossing.oranges-%arthe.oranges)
if "%oranges.max.location" = "arthe" then evalmath oranges.difference (%arthe.oranges-%crossing.oranges)
evalmath current.oranges.difference (%max.final.oranges - %min.final.oranges)
put #echo >Commodity Oranges 
put #echo >Commodity CURRENT HIGH: %max.final.oranges in %oranges.max.location 
put #echo >Commodity CURRENT LOW: %min.final.oranges in %oranges.min.location 
put #echo >Commodity HIGHEST EVER: $highest.oranges.ever
put #echo >Commodity lOWEST EVER: $lowest.oranges.ever
put #echo >Commodity CURRENT DIFFERENCE: %current.oranges.difference
put #echo >Commodity BIGGEST DIFFERENCE: $biggest.oranges.difference
put #echo >Commodity
if math(%min.final.oranges < $lowest.oranges.ever) then put #var lowest.oranges.ever %min.final.oranges
if math(%max.final.oranges > $highest.oranges.ever) then put #var highest.oranges.ever %max.final.oranges
if math($biggest.oranges.difference > %current.oranges.difference) then put #var biggest.oranges.difference %current.oranges.difference

slate.eval:
pause 1
evalmath max.final.slate max(%arthe.slate, %crossing.slate)
evalmath min.final.slate min(%arthe.slate, %crossing.slate)
if "%max.final.slate" = "%arthe.slate" then setvariable slate.max.location arthe
if "%max.final.slate" = "%crossing.slate" then setvariable slate.max.location crossing
if "%min.final.slate" = "%arthe.slate" then setvariable slate.min.location arthe
if "%min.final.slate" = "%crossing.slate" then setvariable slate.min.location crossing
if "%slate.max.location" = "crossing" then evalmath slate.difference (%crossing.slate-%arthe.slate)
if "%slate.max.location" = "arthe" then evalmath slate.difference (%arthe.slate-%crossing.slate)
evalmath current.slate.difference (%max.final.slate - %min.final.slate)
put #echo >Commodity Slate 
put #echo >Commodity CURRENT HIGH: %max.final.slate in %slate.max.location 
put #echo >Commodity CURRENT LOW: %min.final.slate in %slate.min.location 
put #echo >Commodity HIGHEST EVER: $highest.slate.ever
put #echo >Commodity lOWEST EVER: $lowest.slate.ever
put #echo >Commodity CURRENT DIFFERENCE: %current.slate.difference
put #echo >Commodity BIGGEST DIFFERENCE: $biggest.slate.difference
put #echo >Commodity
if math(%min.final.slate < $lowest.slate.ever) then put #var lowest.slate.ever %min.final.slate
if math(%max.final.slate > $highest.slate.ever) then put #var highest.slate.ever %max.final.slate
if math($biggest.slate.difference > %current.slate.difference) then put #var biggest.slate.difference %current.slate.difference

lead.eval:
pause 1
evalmath max.final.lead max(%arthe.lead, %crossing.lead)
evalmath min.final.lead min(%arthe.lead, %crossing.lead)
if "%max.final.lead" = "%arthe.lead" then setvariable lead.max.location arthe
if "%max.final.lead" = "%crossing.lead" then setvariable lead.max.location crossing
if "%min.final.lead" = "%arthe.lead" then setvariable lead.min.location arthe
if "%min.final.lead" = "%crossing.lead" then setvariable lead.min.location crossing
if "%lead.max.location" = "crossing" then evalmath lead.difference (%crossing.lead-%arthe.lead)
if "%lead.max.location" = "arthe" then evalmath lead.difference (%arthe.lead-%crossing.lead)
evalmath current.lead.difference (%max.final.lead - %min.final.lead)
put #echo >Commodity Lead 
put #echo >Commodity CURRENT HIGH: %max.final.lead in %lead.max.location 
put #echo >Commodity CURRENT LOW: %min.final.lead in %lead.min.location 
put #echo >Commodity HIGHEST EVER: $highest.lead.ever
put #echo >Commodity lOWEST EVER: $lowest.lead.ever
put #echo >Commodity CURRENT DIFFERENCE: %current.lead.difference
put #echo >Commodity BIGGEST DIFFERENCE: $biggest.lead.difference
put #echo >Commodity
if math(%min.final.lead < $lowest.lead.ever) then put #var lowest.lead.ever %min.final.lead
if math(%max.final.lead > $highest.lead.ever) then put #var highest.lead.ever %max.final.lead
if math($biggest.lead.difference > %current.lead.difference) then put #var biggest.lead.difference %current.lead.difference

bronze.eval:
pause 1
evalmath max.final.bronze max(%arthe.bronze, %crossing.bronze)
evalmath min.final.bronze min(%arthe.bronze, %crossing.bronze)
if "%max.final.bronze" = "%arthe.bronze" then setvariable bronze.max.location arthe
if "%max.final.bronze" = "%crossing.bronze" then setvariable bronze.max.location crossing
if "%min.final.bronze" = "%arthe.bronze" then setvariable bronze.min.location arthe
if "%min.final.bronze" = "%crossing.bronze" then setvariable bronze.min.location crossing
if "%bronze.max.location" = "crossing" then evalmath bronze.difference (%crossing.bronze-%arthe.bronze)
if "%bronze.max.location" = "arthe" then evalmath bronze.difference (%arthe.bronze-%crossing.bronze)
evalmath current.bronze.difference (%max.final.bronze - %min.final.bronze)
put #echo >Commodity Bronze 
put #echo >Commodity CURRENT HIGH: %max.final.bronze in %bronze.max.location 
put #echo >Commodity CURRENT LOW: %min.final.bronze in %bronze.min.location 
put #echo >Commodity HIGHEST EVER: $highest.bronze.ever
put #echo >Commodity lOWEST EVER: $lowest.bronze.ever
put #echo >Commodity CURRENT DIFFERENCE: %current.bronze.difference
put #echo >Commodity BIGGEST DIFFERENCE: $biggest.bronze.difference
put #echo >Commodity
if math(%min.final.bronze < $lowest.bronze.ever) then put #var lowest.bronze.ever %min.final.bronze
if math(%max.final.bronze > $highest.bronze.ever) then put #var highest.bronze.ever %max.final.bronze
if math($biggest.bronze.difference > %current.bronze.difference) then put #var biggest.bronze.difference %current.bronze.difference

cotton.eval:
pause 1

velvet.eval:
pause 1
evalmath max.final.velvet max(%arthe.velvet, %crossing.velvet)
evalmath min.final.velvet min(%arthe.velvet, %crossing.velvet)
if "%max.final.velvet" = "%arthe.velvet" then setvariable velvet.max.location arthe
if "%max.final.velvet" = "%crossing.velvet" then setvariable velvet.max.location crossing
if "%min.final.velvet" = "%arthe.velvet" then setvariable velvet.min.location arthe
if "%min.final.velvet" = "%crossing.velvet" then setvariable velvet.min.location crossing
if "%velvet.max.location" = "crossing" then evalmath velvet.difference (%crossing.velvet-%arthe.velvet)
if "%velvet.max.location" = "arthe" then evalmath velvet.difference (%arthe.velvet-%crossing.velvet)
evalmath current.velvet.difference (%max.final.velvet - %min.final.velvet)
put #echo >Commodity Velvet 
put #echo >Commodity CURRENT HIGH: %max.final.velvet in %velvet.max.location 
put #echo >Commodity CURRENT LOW: %min.final.velvet in %velvet.min.location 
put #echo >Commodity HIGHEST EVER: $highest.velvet.ever
put #echo >Commodity lOWEST EVER: $lowest.velvet.ever
put #echo >Commodity CURRENT DIFFERENCE: %current.velvet.difference
put #echo >Commodity BIGGEST DIFFERENCE: $biggest.velvet.difference
put #echo >Commodity
if math(%min.final.velvet < $lowest.velvet.ever) then put #var lowest.velvet.ever %min.final.velvet
if math(%max.final.velvet > $highest.velvet.ever) then put #var highest.velvet.ever %max.final.velvet
if math($biggest.velvet.difference > %current.velvet.difference) then put #var biggest.velvet.difference %current.velvet.difference

oil.eval:
pause 1
evalmath max.final.oil max(%arthe.oil, %crossing.oil)
evalmath min.final.oil min(%arthe.oil, %crossing.oil)
if "%max.final.oil" = "%arthe.oil" then setvariable oil.max.location arthe
if "%max.final.oil" = "%crossing.oil" then setvariable oil.max.location crossing
if "%min.final.oil" = "%arthe.oil" then setvariable oil.min.location arthe
if "%min.final.oil" = "%crossing.oil" then setvariable oil.min.location crossing
if "%oil.max.location" = "crossing" then evalmath oil.difference (%crossing.oil-%arthe.oil)
if "%oil.max.location" = "arthe" then evalmath oil.difference (%arthe.oil-%crossing.oil)
evalmath current.oil.difference (%max.final.oil - %min.final.oil)
put #echo >Commodity Deobar Oil 
put #echo >Commodity CURRENT HIGH: %max.final.oil in %oil.max.location 
put #echo >Commodity CURRENT LOW: %min.final.oil in %oil.min.location 
put #echo >Commodity HIGHEST EVER: $highest.oil.ever
put #echo >Commodity lOWEST EVER: $lowest.oil.ever
put #echo >Commodity CURRENT DIFFERENCE: %current.oil.difference
put #echo >Commodity BIGGEST DIFFERENCE: $biggest.oil.difference
put #echo >Commodity
if math(%min.final.oil < $lowest.oil.ever) then put #var lowest.oil.ever %min.final.oil
if math(%max.final.oil > $highest.oil.ever) then put #var highest.oil.ever %max.final.oil
if math($biggest.oil.difference > %current.oil.difference) then put #var biggest.oil.difference %current.oil.difference

salt.eval:
pause 1
evalmath max.final.salt max(%arthe.salt, %crossing.salt)
evalmath min.final.salt min(%arthe.salt, %crossing.salt)
if "%max.final.salt" = "%arthe.salt" then setvariable salt.max.location arthe
if "%max.final.salt" = "%crossing.salt" then setvariable salt.max.location crossing
if "%min.final.salt" = "%arthe.salt" then setvariable salt.min.location arthe
if "%min.final.salt" = "%crossing.salt" then setvariable salt.min.location crossing
if "%salt.max.location" = "crossing" then evalmath salt.difference (%crossing.salt-%arthe.salt)
if "%salt.max.location" = "arthe" then evalmath salt.difference (%arthe.salt-%crossing.salt)
evalmath current.salt.difference (%max.final.salt - %min.final.salt)
put #echo >Commodity Salt 
put #echo >Commodity CURRENT HIGH: %max.final.salt in %salt.max.location 
put #echo >Commodity CURRENT LOW: %min.final.salt in %salt.min.location 
put #echo >Commodity HIGHEST EVER: $highest.salt.ever
put #echo >Commodity lOWEST EVER: $lowest.salt.ever
put #echo >Commodity CURRENT DIFFERENCE: %current.salt.difference
put #echo >Commodity BIGGEST DIFFERENCE: $biggest.salt.difference
put #echo >Commodity
if math(%min.final.salt < $lowest.salt.ever) then put #var lowest.salt.ever %min.final.salt
if math(%max.final.salt > $highest.salt.ever) then put #var highest.salt.ever %max.final.salt
if math($biggest.salt.difference > %current.salt.difference) then put #var biggest.salt.difference %current.salt.difference

dye.eval:
pause 1
evalmath max.final.dye max(%arthe.dye, %crossing.dye)
evalmath min.final.dye min(%arthe.dye, %crossing.dye)
if "%max.final.dye" = "%arthe.dye" then setvariable dye.max.location arthe
if "%max.final.dye" = "%crossing.dye" then setvariable dye.max.location crossing
if "%min.final.dye" = "%arthe.dye" then setvariable dye.min.location arthe
if "%min.final.dye" = "%crossing.dye" then setvariable dye.min.location crossing
if "%dye.max.location" = "crossing" then evalmath dye.difference (%crossing.dye-%arthe.dye)
if "%dye.max.location" = "arthe" then evalmath dye.difference (%arthe.dye-%crossing.dye)
evalmath current.dye.difference (%max.final.dye - %min.final.dye)
put #echo >Commodity P urple Dye 
put #echo >Commodity CURRENT HIGH: %max.final.dye in %dye.max.location 
put #echo >Commodity CURRENT LOW: %min.final.dye in %dye.min.location 
put #echo >Commodity HIGHEST EVER: $highest.dye.ever
put #echo >Commodity lOWEST EVER: $lowest.dye.ever
put #echo >Commodity CURRENT DIFFERENCE: %current.dye.difference
put #echo >Commodity BIGGEST DIFFERENCE: $biggest.dye.difference
put #echo >Commodity
if math(%min.final.dye < $lowest.dye.ever) then put #var lowest.dye.ever %min.final.dye
if math(%max.final.dye > $highest.dye.ever) then put #var highest.dye.ever %max.final.dye
if math($biggest.dye.difference > %current.dye.difference) then put #var biggest.dye.difference %current.dye.difference

wheat.eval:
pause 1
evalmath max.final.wheat max(%arthe.wheat, %crossing.wheat)
evalmath min.final.wheat min(%arthe.wheat, %crossing.wheat)
if "%max.final.wheat" = "%arthe.wheat" then setvariable wheat.max.location arthe
if "%max.final.wheat" = "%crossing.wheat" then setvariable wheat.max.location crossing
if "%min.final.wheat" = "%arthe.wheat" then setvariable wheat.min.location arthe
if "%min.final.wheat" = "%crossing.wheat" then setvariable wheat.min.location crossing
if "%wheat.max.location" = "crossing" then evalmath wheat.difference (%crossing.wheat-%arthe.wheat)
if "%wheat.max.location" = "arthe" then evalmath wheat.difference (%arthe.wheat-%crossing.wheat)
evalmath current.wheat.difference (%max.final.wheat - %min.final.wheat)
put #echo >Commodity W heat 
put #echo >Commodity CURRENT HIGH: %max.final.wheat in %wheat.max.location 
put #echo >Commodity CURRENT LOW: %min.final.wheat in %wheat.min.location 
put #echo >Commodity HIGHEST EVER: $highest.wheat.ever
put #echo >Commodity lOWEST EVER: $lowest.wheat.ever
put #echo >Commodity CURRENT DIFFERENCE: %current.wheat.difference
put #echo >Commodity BIGGEST DIFFERENCE: $biggest.wheat.difference
put #echo >Commodity
if math(%min.final.wheat < $lowest.wheat.ever) then put #var lowest.wheat.ever %min.final.wheat
if math(%max.final.wheat > $highest.wheat.ever) then put #var highest.wheat.ever %max.final.wheat
if math($biggest.wheat.difference > %current.wheat.difference) then put #var biggest.wheat.difference %current.wheat.difference

corn.eval:
pause 1
evalmath max.final.corn max(%arthe.corn, %crossing.corn)
evalmath min.final.corn min(%arthe.corn, %crossing.corn)
if "%max.final.corn" = "%arthe.corn" then setvariable corn.max.location arthe
if "%max.final.corn" = "%crossing.corn" then setvariable corn.max.location crossing
if "%min.final.corn" = "%arthe.corn" then setvariable corn.min.location arthe
if "%min.final.corn" = "%crossing.corn" then setvariable corn.min.location crossing
if "%corn.max.location" = "crossing" then evalmath corn.difference (%crossing.corn-%arthe.corn)
if "%corn.max.location" = "arthe" then evalmath corn.difference (%arthe.corn-%crossing.corn)
evalmath current.corn.difference (%max.final.corn - %min.final.corn)
put #echo >Commodity Corn 
put #echo >Commodity CURRENT HIGH: %max.final.corn in %corn.max.location 
put #echo >Commodity CURRENT LOW: %min.final.corn in %corn.min.location 
put #echo >Commodity HIGHEST EVER: $highest.corn.ever
put #echo >Commodity lOWEST EVER: $lowest.corn.ever
put #echo >Commodity CURRENT DIFFERENCE: %current.corn.difference
put #echo >Commodity BIGGEST DIFFERENCE: $biggest.corn.difference
put #echo >Commodity
if math(%min.final.corn < $lowest.corn.ever) then put #var lowest.corn.ever %min.final.corn
if math(%max.final.corn > $highest.corn.ever) then put #var highest.corn.ever %max.final.corn
if math($biggest.corn.difference > %current.corn.difference) then put #var biggest.corn.difference %current.corn.difference

berries.eval:
pause 1
evalmath max.final.berries max(%arthe.berries, %crossing.berries)
evalmath min.final.berries min(%arthe.berries, %crossing.berries)
if "%max.final.berries" = "%arthe.berries" then setvariable berries.max.location arthe
if "%max.final.berries" = "%crossing.berries" then setvariable berries.max.location crossing
if "%min.final.berries" = "%arthe.berries" then setvariable berries.min.location arthe
if "%min.final.berries" = "%crossing.berries" then setvariable berries.min.location crossing
if "%berries.max.location" = "crossing" then evalmath berries.difference (%crossing.berries-%arthe.berries)
if "%berries.max.location" = "arthe" then evalmath berries.difference (%arthe.berries-%crossing.berries)
evalmath current.berries.difference (%max.final.berries - %min.final.berries)
put #echo >Commodity Berries 
put #echo >Commodity CURRENT HIGH: %max.final.berries in %berries.max.location 
put #echo >Commodity CURRENT LOW: %min.final.berries in %berries.min.location 
put #echo >Commodity HIGHEST EVER: $highest.berries.ever
put #echo >Commodity lOWEST EVER: $lowest.berries.ever
put #echo >Commodity CURRENT DIFFERENCE: %current.berries.difference
put #echo >Commodity BIGGEST DIFFERENCE: $biggest.berries.difference
put #echo >Commodity
if math(%min.final.berries < $lowest.berries.ever) then put #var lowest.berries.ever %min.final.berries
if math(%max.final.berries > $highest.berries.ever) then put #var highest.berries.ever %max.final.berries
if math($biggest.berries.difference > %current.berries.difference) then put #var biggest.berries.difference %current.berries.difference


pearls.eval:
pause 1
evalmath max.final.pearls max(%arthe.pearls, %crossing.pearls)
evalmath min.final.pearls min(%arthe.pearls, %crossing.pearls)
if "%max.final.pearls" = "%arthe.pearls" then setvariable pearls.max.location arthe
if "%max.final.pearls" = "%crossing.pearls" then setvariable pearls.max.location crossing
if "%min.final.pearls" = "%arthe.pearls" then setvariable pearls.min.location arthe
if "%min.final.pearls" = "%crossing.pearls" then setvariable pearls.min.location crossing
if "%pearls.max.location" = "crossing" then evalmath pearls.difference (%crossing.pearls-%arthe.pearls)
if "%pearls.max.location" = "arthe" then evalmath pearls.difference (%arthe.pearls-%crossing.pearls)
evalmath current.pearls.difference (%max.final.pearls - %min.final.pearls)
put #echo >Commodity Pearls 
put #echo >Commodity CURRENT HIGH: %max.final.pearls in %pearls.max.location 
put #echo >Commodity CURRENT LOW: %min.final.pearls in %pearls.min.location 
put #echo >Commodity HIGHEST EVER: $highest.pearls.ever
put #echo >Commodity lOWEST EVER: $lowest.pearls.ever
put #echo >Commodity CURRENT DIFFERENCE: %current.pearls.difference
put #echo >Commodity BIGGEST DIFFERENCE: $biggest.pearls.difference
put #echo >Commodity
if math(%min.final.pearls < $lowest.pearls.ever) then put #var lowest.pearls.ever %min.final.pearls
if math(%max.final.pearls > $highest.pearls.ever) then put #var highest.pearls.ever %max.final.pearls
if math($biggest.pearls.difference > %current.pearls.difference) then put #var biggest.pearls.difference %current.pearls.difference

silver.eval:
pause 1
evalmath max.final.silver max(%arthe.silver, %crossing.silver)
evalmath min.final.silver min(%arthe.silver, %crossing.silver)
if "%max.final.silver" = "%arthe.silver" then setvariable silver.max.location arthe
if "%max.final.silver" = "%crossing.silver" then setvariable silver.max.location crossing
if "%min.final.silver" = "%arthe.silver" then setvariable silver.min.location arthe
if "%min.final.silver" = "%crossing.silver" then setvariable silver.min.location crossing
if "%silver.max.location" = "crossing" then evalmath silver.difference (%crossing.silver-%arthe.silver)
if "%silver.max.location" = "arthe" then evalmath silver.difference (%arthe.silver-%crossing.silver)
evalmath current.silver.difference (%max.final.silver - %min.final.silver)
put #echo >Commodity S ilver 
put #echo >Commodity CURRENT HIGH: %max.final.silver in %silver.max.location 
put #echo >Commodity CURRENT LOW: %min.final.silver in %silver.min.location 
put #echo >Commodity HIGHEST EVER: $highest.silver.ever
put #echo >Commodity lOWEST EVER: $lowest.silver.ever
put #echo >Commodity CURRENT DIFFERENCE: %current.silver.difference
put #echo >Commodity BIGGEST DIFFERENCE: $biggest.silver.difference
put #echo >Commodity
if math(%min.final.silver < $lowest.silver.ever) then put #var lowest.silver.ever %min.final.silver
if math(%max.final.silver > $highest.silver.ever) then put #var highest.silver.ever %max.final.silver
if math($biggest.silver.difference > %current.silver.difference) then put #var biggest.silver.difference %current.silver.difference
if math(%max.final.silver > $highest.silver.ever) then put #var highest.silver.ever %max.final.silver

charcoal.eval:
pause 1
evalmath max.final.charcoal max(%arthe.charcoal, %crossing.charcoal)
evalmath min.final.charcoal min(%arthe.charcoal, %crossing.charcoal)
if "%max.final.charcoal" = "%arthe.charcoal" then setvariable charcoal.max.location arthe
if "%max.final.charcoal" = "%crossing.charcoal" then setvariable charcoal.max.location crossing
if "%min.final.charcoal" = "%arthe.charcoal" then setvariable charcoal.min.location arthe
if "%min.final.charcoal" = "%crossing.charcoal" then setvariable charcoal.min.location crossing
if "%charcoal.max.location" = "crossing" then evalmath charcoal.difference (%crossing.charcoal-%arthe.charcoal)
if "%charcoal.max.location" = "arthe" then evalmath charcoal.difference (%arthe.charcoal-%crossing.charcoal)
evalmath current.charcoal.difference (%max.final.charcoal - %min.final.charcoal)
put #echo >Commodity Charcoal 
put #echo >Commodity CURRENT HIGH: %max.final.charcoal in %charcoal.max.location 
put #echo >Commodity CURRENT LOW: %min.final.charcoal in %charcoal.min.location 
put #echo >Commodity HIGHEST EVER: $highest.charcoal.ever
put #echo >Commodity lOWEST EVER: $lowest.charcoal.ever
put #echo >Commodity CURRENT DIFFERENCE: %current.charcoal.difference
put #echo >Commodity BIGGEST DIFFERENCE: $biggest.charcoal.difference
put #echo >Commodity
if math(%min.final.charcoal < $lowest.charcoal.ever) then put #var lowest.charcoal.ever %min.final.charcoal
if math(%max.final.charcoal > $highest.charcoal.ever) then put #var highest.charcoal.ever %max.final.charcoal
if math($biggest.charcoal.difference > %current.charcoal.difference) then put #var biggest.charcoal.difference %current.charcoal.difference

saffron.eval:
pause 1
evalmath max.final.saffron max(%arthe.saffron, %crossing.saffron)
evalmath min.final.saffron min(%arthe.saffron, %crossing.saffron)
if "%max.final.saffron" = "%arthe.saffron" then setvariable saffron.max.location arthe
if "%max.final.saffron" = "%crossing.saffron" then setvariable saffron.max.location crossing
if "%min.final.saffron" = "%arthe.saffron" then setvariable saffron.min.location arthe
if "%min.final.saffron" = "%crossing.saffron" then setvariable saffron.min.location crossing
if "%saffron.max.location" = "crossing" then evalmath saffron.difference (%crossing.saffron-%arthe.saffron)
if "%saffron.max.location" = "arthe" then evalmath saffron.difference (%arthe.saffron-%crossing.saffron)
evalmath current.saffron.difference (%max.final.saffron - %min.final.saffron)
put #echo >Commodity Saffron 
put #echo >Commodity CURRENT HIGH: %max.final.saffron in %saffron.max.location 
put #echo >Commodity CURRENT LOW: %min.final.saffron in %saffron.min.location 
put #echo >Commodity HIGHEST EVER: $highest.saffron.ever
put #echo >Commodity lOWEST EVER: $lowest.saffron.ever
put #echo >Commodity CURRENT DIFFERENCE: %current.saffron.difference
put #echo >Commodity BIGGEST DIFFERENCE: $biggest.saffron.difference
put #echo >Commodity
if math(%min.final.saffron < $lowest.saffron.ever) then put #var lowest.saffron.ever %min.final.saffron
if math(%max.final.saffron > $highest.saffron.ever) then put #var highest.saffron.ever %max.final.saffron
if math($biggest.saffron.difference > %current.saffron.difference) then put #var biggest.saffron.difference %current.saffron.difference

papyrus.eval:
pause 1
evalmath max.final.papyrus max(%arthe.papyrus, %crossing.papyrus)
evalmath min.final.papyrus min(%arthe.papyrus, %crossing.papyrus)
if "%max.final.papyrus" = "%arthe.papyrus" then setvariable papyrus.max.location arthe
if "%max.final.papyrus" = "%crossing.papyrus" then setvariable papyrus.max.location crossing
if "%min.final.papyrus" = "%arthe.papyrus" then setvariable papyrus.min.location arthe
if "%min.final.papyrus" = "%crossing.papyrus" then setvariable papyrus.min.location crossing
if "%papyrus.max.location" = "crossing" then evalmath papyrus.difference (%crossing.papyrus-%arthe.papyrus)
if "%papyrus.max.location" = "arthe" then evalmath papyrus.difference (%arthe.papyrus-%crossing.papyrus)
evalmath current.papyrus.difference (%max.final.papyrus - %min.final.papyrus)
put #echo >Commodity Papyrus 
put #echo >Commodity CURRENT HIGH: %max.final.papyrus in %papyrus.max.location 
put #echo >Commodity CURRENT LOW: %min.final.papyrus in %papyrus.min.location 
put #echo >Commodity HIGHEST EVER: $highest.papyrus.ever
put #echo >Commodity lOWEST EVER: $lowest.papyrus.ever
put #echo >Commodity CURRENT DIFFERENCE: %current.papyrus.difference
put #echo >Commodity BIGGEST DIFFERENCE: $biggest.papyrus.difference
put #echo >Commodity
if math(%min.final.papyrus < $lowest.papyrus.ever) then put #var lowest.papyrus.ever %min.final.papyrus
if math(%max.final.papyrus > $highest.papyrus.ever) then put #var highest.papyrus.ever %max.final.papyrus
if math($biggest.papyrus.difference > %current.papyrus.difference) then put #var biggest.papyrus.difference %current.papyrus.difference

limes.eval:
pause 1
evalmath max.final.limes max(%arthe.limes, %crossing.limes)
evalmath min.final.limes min(%arthe.limes, %crossing.limes)
if "%max.final.limes" = "%arthe.limes" then setvariable limes.max.location arthe
if "%max.final.limes" = "%crossing.limes" then setvariable limes.max.location crossing
if "%min.final.limes" = "%arthe.limes" then setvariable limes.min.location arthe
if "%min.final.limes" = "%crossing.limes" then setvariable limes.min.location crossing
if "%limes.max.location" = "crossing" then evalmath limes.difference (%crossing.limes-%arthe.limes)
if "%limes.max.location" = "arthe" then evalmath limes.difference (%arthe.limes-%crossing.limes)
evalmath current.limes.difference (%max.final.limes - %min.final.limes)
put #echo >Commodity Limes 
put #echo >Commodity CURRENT HIGH: %max.final.limes in %limes.max.location 
put #echo >Commodity CURRENT LOW: %min.final.limes in %limes.min.location 
put #echo >Commodity HIGHEST EVER: $highest.limes.ever
put #echo >Commodity lOWEST EVER: $lowest.limes.ever
put #echo >Commodity CURRENT DIFFERENCE: %current.limes.difference
put #echo >Commodity BIGGEST DIFFERENCE: $biggest.limes.difference
put #echo >Commodity
if math(%min.final.limes < $lowest.limes.ever) then put #var lowest.limes.ever %min.final.limes
if math(%max.final.limes > $highest.limes.ever) then put #var highest.limes.ever %max.final.limes
if math($biggest.limes.difference > %current.limes.difference) then put #var biggest.limes.difference %current.limes.difference

brass.eval:
pause 1
evalmath max.final.brass max(%arthe.brass, %crossing.brass)
evalmath min.final.brass min(%arthe.brass, %crossing.brass)
if "%max.final.brass" = "%arthe.brass" then setvariable brass.max.location arthe
if "%max.final.brass" = "%crossing.brass" then setvariable brass.max.location crossing
if "%min.final.brass" = "%arthe.brass" then setvariable brass.min.location arthe
if "%min.final.brass" = "%crossing.brass" then setvariable brass.min.location crossing
if "%brass.max.location" = "crossing" then evalmath brass.difference (%crossing.brass-%arthe.brass)
if "%brass.max.location" = "arthe" then evalmath brass.difference (%arthe.brass-%crossing.brass)
evalmath current.brass.difference (%max.final.brass - %min.final.brass)
put #echo >Commodity Brass 
put #echo >Commodity CURRENT HIGH: %max.final.brass in %brass.max.location 
put #echo >Commodity CURRENT LOW: %min.final.brass in %brass.min.location 
put #echo >Commodity HIGHEST EVER: $highest.brass.ever
put #echo >Commodity lOWEST EVER: $lowest.brass.ever
put #echo >Commodity CURRENT DIFFERENCE: %current.brass.difference
put #echo >Commodity BIGGEST DIFFERENCE: $biggest.brass.difference
put #echo >Commodity
if math(%min.final.brass < $lowest.brass.ever) then put #var lowest.brass.ever %min.final.brass
if math(%max.final.brass > $highest.brass.ever) then put #var highest.brass.ever %max.final.brass
if math($biggest.brass.difference > %current.brass.difference) then put #var biggest.brass.difference %current.brass.difference

copper.eval:
pause 1
evalmath max.final.copper max(%arthe.copper, %crossing.copper)
evalmath min.final.copper min(%arthe.copper, %crossing.copper)
if "%max.final.copper" = "%arthe.copper" then setvariable copper.max.location arthe
if "%max.final.copper" = "%crossing.copper" then setvariable copper.max.location crossing
if "%min.final.copper" = "%arthe.copper" then setvariable copper.min.location arthe
if "%min.final.copper" = "%crossing.copper" then setvariable copper.min.location crossing
if "%copper.max.location" = "crossing" then evalmath copper.difference (%crossing.copper-%arthe.copper)
if "%copper.max.location" = "arthe" then evalmath copper.difference (%arthe.copper-%crossing.copper)
evalmath current.copper.difference (%max.final.copper - %min.final.copper)
put #echo >Commodity Copper 
put #echo >Commodity CURRENT HIGH: %max.final.copper in %copper.max.location 
put #echo >Commodity CURRENT LOW: %min.final.copper in %copper.min.location 
put #echo >Commodity HIGHEST EVER: $highest.copper.ever
put #echo >Commodity lOWEST EVER: $lowest.copper.ever
put #echo >Commodity CURRENT DIFFERENCE: %current.copper.difference
put #echo >Commodity BIGGEST DIFFERENCE: $biggest.copper.difference
put #echo >Commodity
if math(%min.final.copper < $lowest.copper.ever) then put #var lowest.copper.ever %min.final.copper
if math(%max.final.copper > $highest.copper.ever) then put #var highest.copper.ever %max.final.copper
if math($biggest.copper.difference > %current.copper.difference) then put #var biggest.copper.difference %current.copper.difference

silk.eval:
pause 1
evalmath max.final.silk max(%arthe.silk, %crossing.silk)
evalmath min.final.silk min(%arthe.silk, %crossing.silk)
if "%max.final.silk" = "%arthe.silk" then setvariable silk.max.location arthe
if "%max.final.silk" = "%crossing.silk" then setvariable silk.max.location crossing
if "%min.final.silk" = "%arthe.silk" then setvariable silk.min.location arthe
if "%min.final.silk" = "%crossing.silk" then setvariable silk.min.location crossing
if "%silk.max.location" = "crossing" then evalmath silk.difference (%crossing.silk-%arthe.silk)
if "%silk.max.location" = "arthe" then evalmath silk.difference (%arthe.silk-%crossing.silk)
evalmath current.silk.difference (%max.final.silk - %min.final.silk)
put #echo >Commodity Silk 
put #echo >Commodity CURRENT HIGH: %max.final.silk in %silk.max.location 
put #echo >Commodity CURRENT LOW: %min.final.silk in %silk.min.location 
put #echo >Commodity HIGHEST EVER: $highest.silk.ever
put #echo >Commodity lOWEST EVER: $lowest.silk.ever
put #echo >Commodity CURRENT DIFFERENCE: %current.silk.difference
put #echo >Commodity BIGGEST DIFFERENCE: $biggest.silk.difference
put #echo >Commodity
if math(%min.final.silk < $lowest.silk.ever) then put #var lowest.silk.ever %min.final.silk
if math(%max.final.silk > $highest.silk.ever) then put #var highest.silk.ever %max.final.silk
if math($biggest.silk.difference > %current.silk.difference) then put #var biggest.silk.difference %current.silk.difference


wool.eval:
pause 1
evalmath max.final.wool max(%arthe.wool, %crossing.wool)
evalmath min.final.wool min(%arthe.wool, %crossing.wool)
if "%max.final.wool" = "%arthe.wool" then setvariable wool.max.location arthe
if "%max.final.wool" = "%crossing.wool" then setvariable wool.max.location crossing
if "%min.final.wool" = "%arthe.wool" then setvariable wool.min.location arthe
if "%min.final.wool" = "%crossing.wool" then setvariable wool.min.location crossing
if "%wool.max.location" = "crossing" then evalmath wool.difference (%crossing.wool-%arthe.wool)
if "%wool.max.location" = "arthe" then evalmath wool.difference (%arthe.wool-%crossing.wool)
evalmath current.wool.difference (%max.final.wool - %min.final.wool)
put #echo >Commodity Wool 
put #echo >Commodity CURRENT HIGH: %max.final.wool in %wool.max.location 
put #echo >Commodity CURRENT LOW: %min.final.wool in %wool.min.location 
put #echo >Commodity HIGHEST EVER: $highest.wool.ever
put #echo >Commodity lOWEST EVER: $lowest.wool.ever
put #echo >Commodity CURRENT DIFFERENCE: %current.wool.difference
put #echo >Commodity BIGGEST DIFFERENCE: $biggest.wool.difference
put #echo >Commodity
if math(%min.final.wool < $lowest.wool.ever) then put #var lowest.wool.ever %min.final.wool
if math(%max.final.wool > $highest.wool.ever) then put #var highest.wool.ever %max.final.wool
if math($biggest.wool.difference > %current.wool.difference) then put #var biggest.wool.difference %current.wool.difference

lace.eval:
pause 1
evalmath max.final.lace max(%arthe.lace, %crossing.lace)
evalmath min.final.lace min(%arthe.lace, %crossing.lace)
if "%max.final.lace" = "%arthe.lace" then setvariable lace.max.location arthe
if "%max.final.lace" = "%crossing.lace" then setvariable lace.max.location crossing
if "%min.final.lace" = "%arthe.lace" then setvariable lace.min.location arthe
if "%min.final.lace" = "%crossing.lace" then setvariable lace.min.location crossing
if "%lace.max.location" = "crossing" then evalmath lace.difference (%crossing.lace-%arthe.lace)
if "%lace.max.location" = "arthe" then evalmath lace.difference (%arthe.lace-%crossing.lace)
evalmath current.lace.difference (%max.final.lace - %min.final.lace)
put #echo >Commodity Lace 
put #echo >Commodity CURRENT HIGH: %max.final.lace in %lace.max.location 
put #echo >Commodity CURRENT LOW: %min.final.lace in %lace.min.location 
put #echo >Commodity HIGHEST EVER: $highest.lace.ever
put #echo >Commodity lOWEST EVER: $lowest.lace.ever
put #echo >Commodity CURRENT DIFFERENCE: %current.lace.difference
put #echo >Commodity BIGGEST DIFFERENCE: $biggest.lace.difference
put #echo >Commodity
if math(%min.final.lace < $lowest.lace.ever) then put #var lowest.lace.ever %min.final.lace
if math(%max.final.lace > $highest.lace.ever) then put #var highest.lace.ever %max.final.lace
if math($biggest.lace.difference > %current.lace.difference) then put #var biggest.lace.difference %current.lace.difference

myrrh.eval:
pause 1
evalmath max.final.myrrh max(%arthe.myrrh, %crossing.myrrh)
evalmath min.final.myrrh min(%arthe.myrrh, %crossing.myrrh)
if "%max.final.myrrh" = "%arthe.myrrh" then setvariable myrrh.max.location arthe
if "%max.final.myrrh" = "%crossing.myrrh" then setvariable myrrh.max.location crossing
if "%min.final.myrrh" = "%arthe.myrrh" then setvariable myrrh.min.location arthe
if "%min.final.myrrh" = "%crossing.myrrh" then setvariable myrrh.min.location crossing
if "%myrrh.max.location" = "crossing" then evalmath myrrh.difference (%crossing.myrrh-%arthe.myrrh)
if "%myrrh.max.location" = "arthe" then evalmath myrrh.difference (%arthe.myrrh-%crossing.myrrh)
evalmath current.myrrh.difference (%max.final.myrrh - %min.final.myrrh)
put #echo >Commodity Myrrh 
put #echo >Commodity CURRENT HIGH: %max.final.myrrh in %myrrh.max.location 
put #echo >Commodity CURRENT LOW: %min.final.myrrh in %myrrh.min.location 
put #echo >Commodity HIGHEST EVER: $highest.myrrh.ever
put #echo >Commodity lOWEST EVER: $lowest.myrrh.ever
put #echo >Commodity CURRENT DIFFERENCE: %current.myrrh.difference
put #echo >Commodity BIGGEST DIFFERENCE: $biggest.myrrh.difference
put #echo >Commodity
if math(%min.final.myrrh < $lowest.myrrh.ever) then put #var lowest.myrrh.ever %min.final.myrrh
if math(%max.final.myrrh > $highest.myrrh.ever) then put #var highest.myrrh.ever %max.final.myrrh
if math($biggest.myrrh.difference > %current.myrrh.difference) then put #var biggest.myrrh.difference %current.myrrh.difference

indigo.eval:
pause 1
evalmath max.final.indigo max(%arthe.indigo, %crossing.indigo)
evalmath min.final.indigo min(%arthe.indigo, %crossing.indigo)
if "%max.final.indigo" = "%arthe.indigo" then setvariable indigo.max.location arthe
if "%max.final.indigo" = "%crossing.indigo" then setvariable indigo.max.location crossing
if "%min.final.indigo" = "%arthe.indigo" then setvariable indigo.min.location arthe
if "%min.final.indigo" = "%crossing.indigo" then setvariable indigo.min.location crossing
if "%indigo.max.location" = "crossing" then evalmath indigo.difference (%crossing.indigo-%arthe.indigo)
if "%indigo.max.location" = "arthe" then evalmath indigo.difference (%arthe.indigo-%crossing.indigo)
evalmath current.indigo.difference (%max.final.indigo - %min.final.indigo)
put #echo >Commodity I ndigo 
put #echo >Commodity CURRENT HIGH: %max.final.indigo in %indigo.max.location 
put #echo >Commodity CURRENT LOW: %min.final.indigo in %indigo.min.location 
put #echo >Commodity HIGHEST EVER: $highest.indigo.ever
put #echo >Commodity lOWEST EVER: $lowest.indigo.ever
put #echo >Commodity CURRENT DIFFERENCE: %current.indigo.difference
put #echo >Commodity BIGGEST DIFFERENCE: $biggest.indigo.difference
put #echo >Commodity
if math(%min.final.indigo < $lowest.indigo.ever) then put #var lowest.indigo.ever %min.final.indigo
if math(%max.final.indigo > $highest.indigo.ever) then put #var highest.indigo.ever %max.final.indigo
if math($biggest.indigo.difference > %current.indigo.difference) then put #var biggest.indigo.difference %current.indigo.difference

barley.eval:
pause 1
evalmath max.final.barley max(%arthe.barley, %crossing.barley)
evalmath min.final.barley min(%arthe.barley, %crossing.barley)
if "%max.final.barley" = "%arthe.barley" then setvariable barley.max.location arthe
if "%max.final.barley" = "%crossing.barley" then setvariable barley.max.location crossing
if "%min.final.barley" = "%arthe.barley" then setvariable barley.min.location arthe
if "%min.final.barley" = "%crossing.barley" then setvariable barley.min.location crossing
if "%barley.max.location" = "crossing" then evalmath barley.difference (%crossing.barley-%arthe.barley)
if "%barley.max.location" = "arthe" then evalmath barley.difference (%arthe.barley-%crossing.barley)
evalmath current.barley.difference (%max.final.barley - %min.final.barley)
put #echo >Commodity Barley 
put #echo >Commodity CURRENT HIGH: %max.final.barley in %barley.max.location 
put #echo >Commodity CURRENT LOW: %min.final.barley in %barley.min.location 
put #echo >Commodity HIGHEST EVER: $highest.barley.ever
put #echo >Commodity lOWEST EVER: $lowest.barley.ever
put #echo >Commodity CURRENT DIFFERENCE: %current.barley.difference
put #echo >Commodity BIGGEST DIFFERENCE: $biggest.barley.difference
put #echo >Commodity
if math(%min.final.barley < $lowest.barley.ever) then put #var lowest.barley.ever %min.final.barley
if math(%max.final.barley > $highest.barley.ever) then put #var highest.barley.ever %max.final.barley
if math($biggest.barley.difference > %current.barley.difference) then put #var biggest.barley.difference %current.barley.difference

oats.eval:
pause 1
evalmath max.final.oats max(%arthe.oats, %crossing.oats)
evalmath min.final.oats min(%arthe.oats, %crossing.oats)
if "%max.final.oats" = "%arthe.oats" then setvariable oats.max.location arthe
if "%max.final.oats" = "%crossing.oats" then setvariable oats.max.location crossing
if "%min.final.oats" = "%arthe.oats" then setvariable oats.min.location arthe
if "%min.final.oats" = "%crossing.oats" then setvariable oats.min.location crossing
if "%oats.max.location" = "crossing" then evalmath oats.difference (%crossing.oats-%arthe.oats)
if "%oats.max.location" = "arthe" then evalmath oats.difference (%arthe.oats-%crossing.oats)
evalmath current.oats.difference (%max.final.oats - %min.final.oats)
put #echo >Commodity Oats 
put #echo >Commodity CURRENT HIGH: %max.final.oats in %oats.max.location 
put #echo >Commodity CURRENT LOW: %min.final.oats in %oats.min.location 
put #echo >Commodity HIGHEST EVER: $highest.oats.ever
put #echo >Commodity lOWEST EVER: $lowest.oats.ever
put #echo >Commodity CURRENT DIFFERENCE: %current.oats.difference
put #echo >Commodity BIGGEST DIFFERENCE: $biggest.oats.difference
put #echo >Commodity
if math(%min.final.oats < $lowest.oats.ever) then put #var lowest.oats.ever %min.final.oats
if math(%max.final.oats > $highest.oats.ever) then put #var highest.oats.ever %max.final.oats
if math($biggest.oats.difference > %current.oats.difference) then put #var biggest.oats.difference %current.oats.difference

acanth.eval:
pause 1
evalmath max.final.acanth max(%arthe.acanth, %crossing.acanth)
evalmath min.final.acanth min(%arthe.acanth, %crossing.acanth)
if "%max.final.acanth" = "%arthe.acanth" then setvariable acanth.max.location arthe
if "%max.final.acanth" = "%crossing.acanth" then setvariable acanth.max.location crossing
if "%min.final.acanth" = "%arthe.acanth" then setvariable acanth.min.location arthe
if "%min.final.acanth" = "%crossing.acanth" then setvariable acanth.min.location crossing
if "%acanth.max.location" = "crossing" then evalmath acanth.difference (%crossing.acanth-%arthe.acanth)
if "%acanth.max.location" = "arthe" then evalmath acanth.difference (%arthe.acanth-%crossing.acanth)
evalmath current.acanth.difference (%max.final.acanth - %min.final.acanth)
put #echo >Commodity Acanth 
put #echo >Commodity CURRENT HIGH: %max.final.acanth in %acanth.max.location 
put #echo >Commodity CURRENT LOW: %min.final.acanth in %acanth.min.location 
put #echo >Commodity HIGHEST EVER: $highest.acanth.ever
put #echo >Commodity lOWEST EVER: $lowest.acanth.ever
put #echo >Commodity CURRENT DIFFERENCE: %current.acanth.difference
put #echo >Commodity BIGGEST DIFFERENCE: $biggest.acanth.difference
put #echo >Commodity
if math(%min.final.acanth < $lowest.acanth.ever) then put #var lowest.acanth.ever %min.final.acanth
if math(%max.final.acanth > $highest.acanth.ever) then put #var highest.acanth.ever %max.final.acanth
if math($biggest.acanth.difference > %current.acanth.difference) then put #var biggest.acanth.difference %current.acanth.difference

apples.eval:
pause 1
evalmath max.final.apples max(%arthe.apples, %crossing.apples)
evalmath min.final.apples min(%arthe.apples, %crossing.apples)
if "%max.final.apples" = "%arthe.apples" then setvariable apples.max.location arthe
if "%max.final.apples" = "%crossing.apples" then setvariable apples.max.location crossing
if "%min.final.apples" = "%arthe.apples" then setvariable apples.min.location arthe
if "%min.final.apples" = "%crossing.apples" then setvariable apples.min.location crossing
if "%apples.max.location" = "crossing" then evalmath apples.difference (%crossing.apples-%arthe.apples)
if "%apples.max.location" = "arthe" then evalmath apples.difference (%arthe.apples-%crossing.apples)
evalmath current.apples.difference (%max.final.apples - %min.final.apples)
put #echo >Commodity Apples 
put #echo >Commodity CURRENT HIGH: %max.final.apples in %apples.max.location 
put #echo >Commodity CURRENT LOW: %min.final.apples in %apples.min.location 
put #echo >Commodity HIGHEST EVER: $highest.apples.ever
put #echo >Commodity lOWEST EVER: $lowest.apples.ever
put #echo >Commodity CURRENT DIFFERENCE: %current.apples.difference
put #echo >Commodity BIGGEST DIFFERENCE: $biggest.apples.difference
put #echo >Commodity
if math(%min.final.apples < $lowest.apples.ever) then put #var lowest.apples.ever %min.final.apples
if math(%max.final.apples > $highest.apples.ever) then put #var highest.apples.ever %max.final.apples
if math($biggest.apples.difference > %current.apples.difference) then put #var biggest.apples.difference %current.apples.difference
goto done


arthe.diamond:
setvariable arthe.diamond %diamond
setvariable arthe.diamond.Units %diamond.Units
return

arthe.gold:
setvariable arthe.gold %gold
setvariable arthe.gold.Units %gold.Units
return

arthe.ore:
setvariable arthe.ore %ore
setvariable arthe.ore.Units %ore.Units
return

arthe.amber:
setvariable arthe.amber %amber
setvariable arthe.amber.Units %amber.Units
return

arthe.cinnamon:
setvariable arthe.cinnamon %cinnamon
setvariable arthe.cinnamon.Units %cinnamon.Units
return

arthe.oranges:
setvariable arthe.oranges %oranges
setvariable arthe.oranges.Units %oranges.Units
return

arthe.slate:
setvariable arthe.slate %slate
setvariable arthe.slate.Units %slate.Units
return

arthe.lead:
setvariable arthe.lead %lead
setvariable arthe.lead.Units %lead.Units
return

arthe.bronze:
setvariable arthe.bronze %bronze
setvariable arthe.bronze.Units %bronze.Units
return

arthe.cotton:
setvariable arthe.cotton %cotton
setvariable arthe.cotton.Units %cotton.Units
return

arthe.velvet:
setvariable arthe.velvet %velvet
setvariable arthe.velvet.Units %velvet.Units
return

arthe.oil:
setvariable arthe.oil %oil
setvariable arthe.oil.Units %oil.Units
return

arthe.salt:
setvariable arthe.salt %salt
setvariable arthe.salt.Units %salt.Units
return

arthe.dye:
setvariable arthe.dye %dye
setvariable arthe.dye.Units %dye.Units
return

arthe.wheat:
setvariable arthe.wheat %wheat
setvariable arthe.wheat.Units %wheat.Units
return

arthe.corn:
setvariable arthe.corn %corn
setvariable arthe.corn.Units %corn.Units
return

arthe.berries:
setvariable arthe.berries %berries
setvariable arthe.berries.Units %berries.Units
return

arthe.pearls:
setvariable arthe.pearls %pearls
setvariable arthe.pearls.Units %pearls.Units
return

arthe.silver:
setvariable arthe.silver %silver
setvariable arthe.silver.Units %silver.Units
return

arthe.charcoal:
setvariable arthe.charcoal %charcoal
setvariable arthe.charcoal.Units %charcoal.Units
return

arthe.saffron:
setvariable arthe.saffron %saffron
setvariable arthe.saffron.Units %saffron.Units
return

arthe.papyrus:
setvariable arthe.papyrus %papyrus
setvariable arthe.papyrus.Units %papyrus.Units
return

arthe.limes:
setvariable arthe.limes %limes
setvariable arthe.limes.Units %limes.Units
return

arthe.brass:
setvariable arthe.brass %brass 
setvariable arthe.brass.Units %brass.Units
return

arthe.copper:
setvariable arthe.copper %copper
setvariable arthe.copper.Units %copper.Units
return

arthe.silk:
setvariable arthe.silk %silk
setvariable arthe.silk.Units %silk.Units
return

arthe.wool:
setvariable arthe.wool %wool
setvariable arthe.wool.Units %wool.Units
return

arthe.lace:
setvariable arthe.lace %lace
setvariable arthe.lace.Units %lace.Units
return

arthe.myrrh:
setvariable arthe.myrrh %myrrh
setvariable arthe.myrrh.Units %myrrh.Units
return

arthe.indigo:
setvariable arthe.indigo %indigo
setvariable arthe.indigo.Units %indigo.Units
return

arthe.barley:
setvariable arthe.barley %barley
setvariable arthe.barley.Units %barley.Units
return

arthe.oats:
setvariable arthe.oats %oats
setvariable arthe.oats.Units %oats.Units
return

arthe.acanth:
setvariable arthe.acanth %acanth
setvariable arthe.acanth.Units %acanth.Units
return

arthe.apples:
setvariable arthe.apples %apples
setvariable arthe.apples.Units %apples.Units
setvariable arthe.check yes
return




crossing.diamond:
setvariable crossing.diamond %diamond
setvariable crossing.diamond.Units %diamond.Units
return

crossing.gold:
setvariable crossing.gold %gold
setvariable crossing.gold.Units %gold.Units
return

crossing.ore:
setvariable crossing.ore %ore
setvariable crossing.ore.Units %ore.Units
return

crossing.amber:
setvariable crossing.amber %amber
setvariable crossing.amber.Units %amber.Units
return

crossing.cinnamon:
setvariable crossing.cinnamon %cinnamon
setvariable crossing.cinnamon.Units %cinnamon.Units
return

crossing.oranges:
setvariable crossing.oranges %oranges
setvariable crossing.oranges.Units %oranges.Units
return

crossing.slate:
setvariable crossing.slate %slate
setvariable crossing.slate.Units %slate.Units
return

crossing.lead:
setvariable crossing.lead %lead
setvariable crossing.lead.Units %lead.Units
return

crossing.bronze:
setvariable crossing.bronze %bronze
setvariable crossing.bronze.Units %bronze.Units
return

crossing.cotton:
setvariable crossing.cotton %cotton
setvariable crossing.cotton.Units %cotton.Units
return

crossing.velvet:
setvariable crossing.velvet %velvet
setvariable crossing.velvet.Units %velvet.Units
return

crossing.oil:
setvariable crossing.oil %oil
setvariable crossing.oil.Units %oil.Units
return

crossing.salt:
setvariable crossing.salt %salt
setvariable crossing.salt.Units %salt.Units
return

crossing.dye:
setvariable crossing.dye %dye
setvariable crossing.dye.Units %dye.Units
return

crossing.wheat:
setvariable crossing.wheat %wheat
setvariable crossing.wheat.Units %wheat.Units
return

crossing.corn:
setvariable crossing.corn %corn
setvariable crossing.corn.Units %corn.Units
return

crossing.berries:
setvariable crossing.berries %berries
setvariable crossing.berries.Units %berries.Units
return

crossing.pearls:
setvariable crossing.pearls %pearls
setvariable crossing.pearls.Units %pearls.Units
return

crossing.silver:
setvariable crossing.silver %silver
setvariable crossing.silver.Units %silver.Units
return

crossing.charcoal:
setvariable crossing.charcoal %charcoal
setvariable crossing.charcoal.Units %charcoal.Units
return

crossing.saffron:
setvariable crossing.saffron %saffron
setvariable crossing.saffron.Units %saffron.Units
return

crossing.papyrus:
setvariable crossing.papyrus %papyrus
setvariable crossing.papyrus.Units %papyrus.Units
return

crossing.limes:
setvariable crossing.limes %limes
setvariable crossing.limes.Units %limes.Units
return

crossing.brass:
setvariable crossing.brass %brass 
setvariable crossing.brass.Units %brass.Units
return

crossing.copper:
setvariable crossing.copper %copper
setvariable crossing.copper.Units %copper.Units
return

crossing.silk:
setvariable crossing.silk %silk
setvariable crossing.silk.Units %silk.Units
return

crossing.wool:
setvariable crossing.wool %wool
setvariable crossing.wool.Units %wool.Units
return

crossing.lace:
setvariable crossing.lace %lace
setvariable crossing.lace.Units %lace.Units
return

crossing.myrrh:
setvariable crossing.myrrh %myrrh
setvariable crossing.myrrh.Units %myrrh.Units
return

crossing.indigo:
setvariable crossing.indigo %indigo
setvariable crossing.indigo.Units %indigo.Units
return

crossing.barley:
setvariable crossing.barley %barley
setvariable crossing.barley.Units %barley.Units
return

crossing.oats:
setvariable crossing.oats %oats
setvariable crossing.oats.Units %oats.Units
return

crossing.acanth:
setvariable crossing.acanth %acanth
setvariable crossing.acanth.Units %acanth.Units
return

crossing.apples:
setvariable crossing.apples %apples
setvariable crossing.apples.Units %apples.Units
setvariable crossing.check yes
return

crossing.move:
move e
move go door
move out
move e
move s
move s
move s
move s
move go gate
move u
move u
move w
move s
move s
move se
move sw
move s
move s
move se
move se
move s
move sw
move sw
move s
move s
move s
move go gate
move w
move w
move w
move s
move s
move w
move s
move w
move w
move w
move w
move w
move w
move go brid
move w
move s
move s
move s
move s
move s
move s
move go door
move s
goto room.check

arthe.move:
move n
move out
move n
move n
move n
move n
move n
move n
move e
move e
move e
move e
move e
move e
move e
move e
move n
move e
move n
move n
move e
move e
move e
move go gate
move n
move n
move n
move ne
move ne
move n
move nw
move nw
move n
move n
move ne
move nw
move n
move n
move e
move d
move d
move go gate
move n
move n
move n
move n
move w
move go door
move go door
goto room.check 

load.actions:
action (CommActions) setvariable commloc crossing when  The Crossing Trader Guild Commodity Pit Board
action (CommActions) setvariable commloc arthe when  The Arthe Dale Trader Guild Commodity Pit Board
action (CommActions) setvariable commloc leth when  The Leth Deriel Trader Guild Commodity Pit Board

action (CommActions) setvariable diamond $1 when Diamonds[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable gold $1 when Gold[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable ore $1 when Iron ore[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable amber $1 when Amber[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable cinnamon $1 when Cinnamon[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable oranges $1 when Oranges[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable slate $1 when Slate[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable lead $1 when Lead[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable bronze $1 when Bronze[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable cotton $1 when Cotton[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable velvet $1 when Velvet[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable oil $1 when Deobar oil[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable salt $1 when Salt[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable dye $1 when Purple dye[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable wheat $1 when Wheat[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable corn $1 when Corn[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable berries $1 when Taffelberries[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable pearls $1 when Pearls[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable silver $1 when Silver[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable charcoal $1 when Charcoal[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable saffron $1 when Saffron[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable papyrus $1 when Papyrus[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable limes $1 when Limes[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable brass $1 when Brass[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable copper $1 when Copper[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable silk $1 when Silk[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable wool $1 when Wool[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable lace $1 when Lace[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable myrrh $1 when Myrrh[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable indigo $1 when Indigo[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable barley $1 when Barley[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable oats $1 when Oats[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable acanth $1 when Acanth[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable apples $1 when Apples[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)

action (CommActions) setvariable diamond.Units $2 when Diamonds[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable gold.Units $2 when Gold[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable ore.Units $2 when Iron ore[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable amber.Units $2 when Amber[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable cinnamon.Units $2 when Cinnamon[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable oranges.Units $2 when Oranges[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable slate.Units $2 when Slate[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable lead.Units $2 when Lead[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable bronze.Units $2 when Bronze[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable cotton.Units $2 when Cotton[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable velvet.Units $2 when Velvet[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable oil.Units $2 when Deobar oil[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable salt.Units $2 when Salt[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable dye.Units $2 when Purple dye[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable wheat.Units $2 when Wheat[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable corn.Units $2 when Corn[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable berries.Units $2 when Taffelberries[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable pearls.Units $2 when Pearls[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable silver.Units $2 when Silver[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable charcoal.Units $2 when Charcoal[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable saffron.Units $2 when Saffron[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable papyrus.Units $2 when Papyrus[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable limes.Units $2 when Limes[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable brass.Units $2 when Brass[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable copper.Units $2 when Copper[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable silk.Units $2 when Silk[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable wool.Units $2 when Wool[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable lace.Units $2 when Lace[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable myrrh.Units $2 when Myrrh[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable indigo.Units $2 when Indigo[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable barley.Units $2 when Barley[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable oats.Units $2 when Oats[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable acanth.Units $2 when Acanth[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) setvariable apples.Units $2 when Apples[ ]{1,15}([0-9]{0,5})[ ]{1,15}(Nearly Out|Surplus|Good Stores|Going Fast)
action (CommActions) on
return

set.variables:
setvariable arthe.check no
setvariable crossing.check no
return

cleaning.up:
goto done

done:

