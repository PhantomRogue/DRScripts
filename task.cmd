#TaskEngine
#Have your book turned to the page of the item you want.
#  Then do .task NumberOfItems ItemName

var total %1
var current 0

echo %total

start:
if %current < %total then
{
	put get my stack	
	put get my carving book
	send study my book
	pause 10
	send put my book in my loots
	pause .5
	send .carve %2
	waitforre ^CARVING DONE
	math current add 1
	put put %2 in backp
	pause .5
	goto start
}