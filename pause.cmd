#pause
action goto exit.temp when ^Death Cry
action goto exit.temp when ^GHOST
action goto exit.temp when $health < 30


start:
 put exp
 pause 60
 goto start


exit.temp:
 put exit
