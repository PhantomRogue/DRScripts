include afktriggers.cmd
include base.cmd
var do.quit 0
var do.loop 0
var camb cambrinth armband
var camb_amt 20
if contains("%1","noastro") then setvar noastro 1
if contains("%1","quit") then setvar do.quit 1
if contains("%1","loop") then setvar do.loop 1
setvar powlist xibar|yavash|katamba|psy|moonl|trans
setvar pow.curr 0
var i 0
var foc 0
var pow.t 0
var spell.list sod
var spell.i 0
var spell.total 0


if $charactername = Litrel then {
var do.loop 1
var spell.list psy
var spell.i 0
var spell.total 0
var camb cambrinth armband
var camb_amt 15
}


if $charactername = Litrel then {
var spell.list sod|ease|seer
var spell.i 0
var spell.total 2
}
if $charactername = Ryoukai then {
put get cambrinth orb
pause
var camb cambrinth orb
var camb_amt 35
}
if $charactername = Thyatir then var camb_amt 10

if $charactername = Mhara then
{
var do.loop 1
 var spell.list psy
 var camb silver ring
var camb_amt 4
put remove my %camb
pause
}
if $charactername = Nirisa then
{
 var spell.list psy
 var camb cambrinth owl
var camb_amt 10
put get my %camb
}
timer start
var astro.t 0

action var predactive 0 when detect no active predictions

main:
	if $mana < 80 then gosub main.pause
	gosub prep %spell.list(%spell.i) 5
	math spell.i add 1
	if %spell.i > %spell.total then var spell.i 0
	gosub charge my %camb %camb_amt
	gosub foc my %camb
	if %pow.t < %t then
	{
		gosub pow %powlist(%i)
		math i add 1
		if %i > 5 then var i 0
		evalmath pow.t 30 + %t
	}
	gosub cast



	if %astro.t < %t then
	{

		gosub main.astro
		evalmath astro.t %t + 80
	}
if $Primary_Magic.LearningRate > 30 then goto move_on
goto main




main.pause:
	pause 2
	if $mana < 99 then goto main.pause
return

main.astro:
	if %noastro = 1 then return
	var predactive 1
	if $monstercount > 1 then
	{
		gosub ret
		gosub ret
	}
	gosub predict ana $charactername
	pause
	if %predactive = 0 then gosub main.obs
return

main.obs:
	if $moonKatamba then
	{
		var object katamba
		var skillset defense
	}
	if $moonXibar then
	{
		var object xibar
		var skillset lore
	}
	if $moonYavash then
	{
		var object yavash
		var skillset survival
	}
	var object magpie
	var skillset survival
	if $Time.isDay then
	{
		var object sun
		var skillset survival
	}
	gosub prep pg
	pause 3
	gosub cast
	if $monstercount > 1 then
	{
		gosub ret
		gosub ret
	}
	gosub observe %object
	gosub predict future $charactername %skillset
return

move_on:
put yes
if %do.quit = 1 then put quit
if %do.loop = 1 then goto main
exit	