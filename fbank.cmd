put #goto exchange
waitfor ARRIVE
put exc all kro to dok
put exc all lir to dok
put #goto teller
waitfor ARRIVE
put bal
pause 1
put dep all
put bal
pause 1
put #goto portal
waitfor ARRIVE
put #parse BANKINGDONG