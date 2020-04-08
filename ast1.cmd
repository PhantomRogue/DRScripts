astro.actions:
pause 2
action setvariable circle $1 when Circle: (\d+)
action setvariable season $2 when (It's|It is) currently (\S+)
action setvariable time day when sunrise|dawn|morning|noon|afternoon|midday
action setvariable time night when dusk|night|midnight|late night|sunset|evening

astro.begin:
action remove You strain
action remove You have to strain
action remove You strain, but
put info
pause .5
put time
pause .5
put exp
pause 0.5
if %time = day then goto day.set
if %time = night then goto season.check
#if $PG = off then gosub PG
if $CV = off then gosub CV

season.check:
echo %time
echo %season
echo %circle
if %season = spring then goto spring.set
if %season = summer then goto summer.set
if %season = fall then goto fall.set
if %season = winter then goto winter.set

spring.set:
setvariable obs1 xibar
setvariable obs2 yavash
setvariable obs3 kat
setvariable obs4 heart
if %circle >= 2 then setvariable obs5 wolf
else setvariable obs5 none
if %cirlce >= 4 then setvariable obs6 raven
else setvariable obs6 none
if %circle >= 5 then setvariable obs7 unicorn
else setvariable obs7 none
if %circle >= 8 then setvariable obs8 cobra
else setvariable obs8 none
if %circle >= 11 then setvariable obs9 wren
else setvariable obs9 none
goto astro

summer.set:
setvariable obs1 xibar
setvariable obs2 yavash
setvariable obs3 kat
setvariable obs4 heart
if %circle >= 2 then setvariable obs5 wolf
else setvariable obs5 none
if %circle >= 4 then setvariable obs6 raven
else setvariable obs6 none
if %circle >= 6 then setvariable obs7 boar
else setvariable obs7 none
if %circle >= 9 then setvariable obs8 ox
else setvariable obs8 none
if %circle >= 20 then setvariable obs9 king snake
else setvariable obs9 none
goto astro

fall.set:
setvariable obs1 xibar
setvariable obs2 yavash
setvariable obs3 kat
setvariable obs4 heart
if %circle >= 2 then setvariable obs5 wolf
else setvariable obs5 none
if %circle >= 3 then setvariable obs6 lion
else setvariable obs6 none
if %circle >= 4 then setvariable obs7 raven
else setvariable obs7 none
if %circle >= 7 then setvariable obs8 panther
else setvariable obs8 none
if %circle >= 9 then setvariable obs9 ox
else setvariable obs9 none
goto astro

winter.set:
setvariable obs1 xibar
setvariable obs2 yavash
setvariable obs3 kat
setvariable obs4 heart
if %circle >= 2 then setvariable obs5 wolf
else setvariable obs5 none
if %circle >= 4 then setvariable obs6 raven
else setvariable obs6 none
if %circle >= 5 then setvariable obs7 unicorn
else setvariable obs7 none
if %circle >= 14 then setvariable obs8 dolphin
else setvariable obs8 none
if %circle >= 22 then setvariable obs8 albatross
else setvariable obs9 none
setvariable obs9 none
goto astro

day.set:
setvariable obs1 sun
setvariable obs2 xibar
setvariable obs3 yavash
setvariable obs4 kat
setvariable obs5 none
setvariable obs6 none
setvariable obs7 none
setvariable obs8 none
setvariable obs9 none
goto astro

astro:
counter set 1
obs1:
gosub exp astro
if %locked = yes then goto toreading
gosub obs %obs1
pause 0.5
pause 0.5
obs2:
gosub exp astro
if %locked = yes then goto toreading
gosub obs %obs2
pause 0.5
pause 0.5
obs3:
gosub exp astro
if %locked = yes then goto toreading
if %obs3 = none then goto pred.done
gosub obs %obs3
pause 0.5
pause 0.5
obs4:
gosub exp astro
if %locked = yes then goto toreading
if %obs4 = none then goto pred.done
gosub obs %obs4
pause 0.5
pause 0.5
obs5:
gosub exp astro
if %locked = yes then goto toreading
if %obs5 = none then goto pred.done
gosub obs %obs5
pause 0.5
pause 0.5
obs6:
gosub exp astro
if %locked = yes then goto toreading
if %obs6 = none then goto pred.done
gosub obs %obs6
pause 0.5
pause 0.5
obs7:
gosub exp astro
if %locked = yes then goto toreading
if %obs7 = none then goto pred.done
gosub obs %obs7
pause 0.5
pause 0.5
obs8:
gosub exp astro
if %locked = yes then goto toreading
if %obs8 = none then goto pred.done
gosub obs %obs8
pause 0.5
pause 0.5
obs9:
gosub exp astro
if %locked = yes then goto toreading
if %obs9 = none then goto pred.done
gosub obs %obs9
pause 0.5
pause 0.5

pred.done:
put predict weather
pause 0.5
pause 0.5
put #script abort

obs:
setvariable obs $1
obs.ready:
match need.pg Clouds obscure the sky
match predict You learned something useful 
match obs.ready You see nothing regarding the future
match predict Although you don't gain a complete view of the future
match return You are unable to make use of this latest observation
match return is foiled by the daylight
match return fruitless
match return I could not find what you are referring to
put obs %obs
matchwait 2
goto obs.ready

need.pg:
gosub PG
goto obs.ready

predict:
counter add 1
if %obs = sun then put predict future $charactername offense
if %obs = kat then put predict future $charactername defense
if %obs = xibar then put predict future $charactername lore
if %obs = yavash then put predict future $charactername magic
if %obs = heart then put predict future $charactername lore
if %obs = wolf then put predict future $charactername lore
if %obs = lion then put predict future $charactername defense
if %obs = raven then put predict future $charactername survival
if %obs = unicorn then put predict future $charactername survival
if %obs = boar then put predict future $charactername offense
if %obs = panther then put predict future $charactername
if %obs = cobra then put predict future $charactername lore
if %obs = ox then put predict future $charactername survival
if %obs = scorpion then put predict future $charactername defense
if %obs = wren then put predict future $charactername magic
if %obs = cat then put predict future $charactername survival
if %obs = ram then put predict future $charactername lore
if %obs = dolphin then put predict future $charactername lore
if %obs = nightingale then put predict future $charactername defense
if %obs = shardstar then put predict future $charactername
if %obs = wolverine then put predict future $charactername offense
if %obs = centaur then put predict future $charactername offense
if %obs = magpie then put predict future $charactername defense
waitforre (After a few moments, the mists of time begin to part|The future, however, remains a dark mystery to you|Suddenly your mind receives a numbing jolt)
if %stunned = yes then goto stunned
goto astro.magic

stunned:
timer clear
timer start
pause 40
put stand
setvariable stunned no
goto astro.md

astro.magic:
gosub exp astro
if %locked = yes then goto toreading
timer clear
timer start
astro.md:
if %t > 180 then return
gosub exp magi
if %locked = yes then goto astro.juggle
put hold my arm
pause 0.5
put prep shad 1
pause 0.5
matchre astro.focus You harness
matchre astro.switch You strain, but
put charge my arm 7
matchwait


astro.focus:
put foc my arm
pause 0.5
pause 0.5
pause 0.5
pause 0.5
put cast
pause 0.5
put wear my arm
goto astro.md

astro.wait:
if %t > 180 then return
pause 5
goto astro.wait

astro.switch:
put wear arm
pause 0.5
goto astro.juggle

astro.juggle:
if %t > 180 then return
gosub exp percep
if %locked = yes then goto astro.wait
put get my %jugglie
pause 0.5
put juggle my %jugglie
pause 0.5
pause 0.5
put stow my %jugglie
goto astro.juggle

PG:
put prep PG 15
waitfor fully prepared
put cast
pause 0.5
return

CV:
put prep CV 10
waitfor fully prepared
put cast
pause 0.5
return


Exp:
Action setvariable locked yes when % mind lock|% dazed|% bewilder
Action setvariable locked perplexed when % perplex
setvariable Exp skill $0
setvariable locked no
Exp1:
matchre Exp1 ...wait|type ahead|You don't seem to be able to move to do that
matchre ExpSleep mind: (murky|very murky|dense|very dense|thick|very thick|frozen|very frozen|stagnant|very stagnant)
matchre ExpAwake mind: clear
matchre return mind: fluid
put exp %Exp
matchwait

ExpSleep:
if "%mindstate" = "awake" then gosub put sleep
echo
echo ******************
echo Clearing your mind
echo ******************
echo
pause 30
goto Exp1

ExpAwake:
if "%mindstate" = "sleep" then gosub put awake
return

return:
return