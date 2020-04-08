#Arthe Trainer

INTRO:
	Echo *****************************************************************
	Echo **                ~Created by Scorpañaise~                     **
	Echo **        ~Script made for use with or without timer~          **
	Echo **                                                             **
	Echo **                 Usage: .Arthetrain                          **
	Echo *****************************************************************
	Goto Start

Start:
	Put Look
	Match PoolSW Tiny brown pondskippers hop along the cool clear water
	Match PoolSE Creamy white water lilies float lazily
	Match PoolNE2 Clear water fills this natural swimming hole - cool and
	Match PoolNW A flowering crabtree grows beside the pond
	Match Green1 A giant oak tree stands erect here, its massive branches
	Match Treehouse1 a play area for any of the
	Match Tree2 An open doorway behind you leads back into the treehouse.
	Matchwait


PoolSW:
	Save PoolSW
	Put Swim East
	Match PoolSE Roundtime
	Match Pause_For_System ...wait
	match quitnow ghost
	Matchwait

PoolSE:
	Save PoolSE
	Put Swim North
	Match PoolNE2 Roundtime
	Match Pause_For_System ...wait 
	match quitnow ghost
	Matchwait

PoolNE2:
	Save PoolNE2
	Put climb embank
	Match ClimbingTimerPoolNE2 All this climbing back and forth is getting
	Match Green1 A giant oak tree stands erect here, 
	Match PoolNE2Pause back and forth is getting a bit tiresome
	Match Pause_For_System ...wait 
	match quitnow ghost
	Matchwait

ClimbingTimerPoolNE2:
	Pause 10
	Goto PoolNE2

PoolNE2Pause:
	Pause 10
	Goto PoolNE2

PoolNE1:
	Save PoolNE1
	Put swim west
	Match PoolNW Roundtime
	Match Pause_For_System ...wait 
	match quitnow ghost
	Matchwait

PoolNE1FromTree:
	Put exp swim
	match PoolNE2.5 % mind lock
	match PoolNE1 EXP HELP
	match ExpSwim1 ...wait
	match ExpSwim1 Sorry, you may only type ahead 
	match quitnow ghost
	Matchwait
	
PoolNE2.5:
	Pause 10
	Goto PoolNE2


PoolNW:
	Save PoolNW
	Put Swim south
	Match PoolSW Roundtime
	Match Pause_For_System ...wait
	match quitnow ghost
	Matchwait

Green1:
	Goto ExpClimb
	
Green2:
	Put stand
	pause
	Put climb tree
	Match GreenClimbPause back and forth is getting a bit tiresome
	Match Green2 You make your way up the tree.
	Match Green2 unharmed but feel foolish.
	Match Green2 Struck by vertigo
	Match Green2 but the steepness
	Match Green2 but reach a point where your footing
	match GreenClimbPause You are too tired to climb that
	Match Treehouse1 This wooden house has been constructed
	match quitnow ghost
	Matchwait

GreenClimbPause:
	Pause 10
	Goto Green2

ExpClimb:
	Put skill Climb
	match EXPSwim1 % mind lock
	match Green2 EXP HELP
	match ExpClimb ...wait
	match ExpClimb Sorry, you may only type ahead 
	match quitnow ghost
	matchwait 

ExpSwim1:
	Pause 1
	Put skill Swim
	match GreenPause % mind lock
	match GreenDive EXP HELP
	Match GreenDive Overall state of
	match ExpSwim1 ...wait
	match ExpSwim1 Sorry, you may only type ahead 
	match quitnow ghost
	Matchwait

GreenDive:
	Pause 1
	Put Dive Hole
	Goto PoolNE1

GreenPause:
	Pause 15
	Goto Green1

Treehouse1:
	Pause 1
	Put go ramp
	Goto Tree2

Tree2:
	Pause 1
	Put Dive hole
	Goto PoolNE1FromTree

Pause_For_System:
Pause 1
Goto %s

quitnow:
	put quit