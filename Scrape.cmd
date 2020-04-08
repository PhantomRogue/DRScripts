## 8-31-2014
## Hervean
## scrape crap. In bulk. Yeah buddy.
## debug 10

var done.storage wa sa
var scraper scraper
var raw.storage bundle
var to.scrape bone

action put #queue clear;put #send 1 $lastcommand when ^Sorry,|^\.\.\.wait
action goto do.solution when look as clean as you can make them\.$
action goto do.exit when ^What were

do.fetch:
gosub get.scraper
send get %to.scrape from my %raw.storage
waitforre ^You get|^You carefully
goto do.scrape

do.solution:
send stow
waitforre You put
send get solution
waitforre You get
send pour solution on %to.scrape
waitforre ^Roundtime
goto do.done

get.scraper:
send stow
waitforre ^You put|^Stow what
send get my scraper
waitforre ^You get
return

do.scrape:
send scrape %to.scrape with my %scraper
waitforre ^Roundtime
goto do.scrape

do.done:
send put my %to.scrape in my %done.storage
waitforre ^You put|^Stow what|^You carefully
goto do.fetch

do.exit:
echo Seem to be done?
exit
