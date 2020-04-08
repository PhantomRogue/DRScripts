action var contents $1 when ^You are wearing (.*)\.  
1:
put inv
waitforre HELP

eval contents replace("%contents", ", ", "|")  
eval contents replace("%contents", " and ", "|")  
var contents |%contents|
eval total count("%contents", "|")  

Loop:  
     eval item element("%contents", 1)  
     eval number count("%contents", "|%item")  
     var count 0
     gosub RemoveLoop 	
     action setvariable item $1 when ^@a .* (\S+)$
     action setvariable item $1 when ^@some .* (\S+)$
     put #parse @%item
	counter set %count
     gosub sellgem
     if %contents != "|" then goto Loop  
     goto 1
      
RemoveLoop:
     eval number count("%contents", "|%item|")
     eval contents replace("%contents", "|%item|", "|")
     eval contents replace("%contents", "||" "|")
     evalmath count %count + %number
     if !contains("%contents", "|%item|") then return
     goto RemoveLoop

sellgem:
counter subtract 1
put app %item careful
pause 10
return

trash:
if %c = 0 then return
goto sellgem