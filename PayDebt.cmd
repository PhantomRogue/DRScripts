## Pay Debt
## Written by Czidvar
## v0.6

	debuglevel 10

## Variables ##################################
	var debtCopper 0
	var debtBronze 0
	var debtSilver 0
	var debtGold 0
	var debtPlatinum 0
	var returnTo $roomid

## Provincial Check ###########################
	if ($zoneid = 1) then var Province Zoluren
	if ($zoneid = 42) then var Province Therengia
	
	
## Actions ####################################
	action var debtCopper $1 when \,?\b(\d+)\b copper\,? (Kronars|Lirums|Dokoras) to the (Principality|Province|Domain|Collection) of %Province
	action var debtBronze $1 when \b(\d+)\b bronze\,? .* (Kronars|Lirums|Dokoras) to the (Principality|Province|Domain|Collection) of %Province
	action var debtSilver $1 when \b(\d+)\b silver\,? .* (Kronars|Lirums|Dokoras) to the (Principality|Province|Domain|Collection) of %Province
	action var debtGold $1 when \b(\d+)\b gold\,? .* (Kronars|Lirums|Dokoras) to the (Principality|Province|Domain|Collection) of %Province
	action var debtPlatinum $1 when \b(\d+)\b platinum\,? .* (Kronars|Lirums|Dokoras) to the (Principality|Province|Domain|Collection) of %Province
	
	send wealth
	pause 1
	if (%debtPlatinum = 0 && %debtGold = 0 && %debtSilver = 0 && %debtBronze = 0 && %debtCopper = 0) then
	{
		put #parse DEBT PAID
		exit
	}
	if contains("1|42", "$zoneid") then
	{
		put #goto teller
		waitfor YOU HAVE ARRIVED
		if (%debtCopper > 0) then
		{
			send withdraw %debtCopper Copper
			waitforre ^The clerk counts out
		}
		if (%debtBronze > 0) then
		{
			send withdraw %debtBronze Bronze
			waitforre ^The clerk counts out
		}
		if (%debtSilver > 0) then
		{
			send withdraw %debtSilver Silver
			waitforre ^The clerk counts out
		}
		if (%debtGold > 0) then
		{
			send withdraw %debtGold Gold
			waitforre ^The clerk counts out
		}
		if (%debtPlatinum > 0) then
		{
			send withdraw %debtPlatinum Platinum
			waitforre ^The clerk counts out
		}
		put #goto debt 
		waitfor YOU HAVE ARRIVED
		gosub PAY
		put #goto %returnTo
		waitfor YOU HAVE ARRIVED
		put #parse DEBT PAID
		exit
	}
	
PAY:
	if (%debtPlatinum = 0 && %debtGold = 0 && %debtSilver = 0 && %debtBronze = 0 && %debtCopper > 0) then send pay %debtCopper
	if (%debtPlatinum = 0 && %debtGold = 0 && %debtSilver = 0 && %debtBronze > 0) then send pay %debtBronze%debtCopper
	if (%debtPlatinum = 0 && %debtGold = 0 && %debtSilver > 0) then send pay %debtSilver%debtBronze%debtCopper
	if (%debtPlatinum = 0 && %debtGold > 0) then send pay %debtGold%debtSilver%debtBronze%debtCopper
	if (%debtPlatinum > 0) then send pay %debtPlatinum%debtGold%debtSilver%debtBronze%debtCopper
	waitforre your debt is now settled\.|\"Your debt is now clear\, 
	return