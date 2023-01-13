## Raven's Court
## Written by Czidvar

## Actions ##
   action put #IF {$Vocals.LearningRate > 33} {#echo Vocals maxed!} {#put hum $Song} when You finish humming
   if "$Vocals.LearningRate" > "33" then
   {
      echo Vocals maxed!
   }
   else
   {
      put HUM quiet
   }
   pause 1

   put #goto 72
   waitfor YOU HAVE ARRIVED
   gosub MOVE go building
   gosub STUDY raven
   gosub MOVE e
   gosub MOVE climb step
   gosub STUDY mermaid
   gosub MOVE climb step
   gosub MOVE w
   gosub MOVE ne
   gosub MOVE go door
   gosub MOVE nw
#   matchre MEMBER
   matchre NOT.MEMBER \"You\'re not on our guest list\,
   put knock knocker
   matchwait 15
MEMBER:
   gosub MOVE n
   gosub MOVE n
   gosub MOVE go adder door
   gosub STUDY painting
   gosub MOVE go door
   gosub MOVE s
   gosub MOVE s
   gosub MOVE go door
   gosub MOVE se
   gosub MOVE go doors
   gosub MOVE sw
   goto CONTINUE
NOT.MEMBER:
   gosub MOVE se
   gosub MOVE go door
   gosub MOVE sw
CONTINUE:
   gosub MOVE n
   gosub MOVE climb step
   gosub MOVE climb stair
   gosub MOVE s
   gosub STUDY sculpture
   gosub STUDY painting
   gosub STUDY carving
   gosub STUDY statue
   gosub STUDY second painting
   gosub MOVE w
   gosub STUDY painting
   gosub STUDY triptych
   gosub STUDY statue
   gosub STUDY figurine
   gosub STUDY second painting
   gosub MOVE s
   gosub STUDY cylinder
   gosub STUDY sculpture
   gosub STUDY statue
   gosub STUDY painting
   gosub STUDY second painting
   gosub MOVE s
   gosub STUDY sphere
   gosub STUDY panel
   gosub STUDY painting
   gosub STUDY canvas
   gosub STUDY statue
   gosub MOVE e
   gosub STUDY painting
   gosub STUDY diorama
   gosub STUDY figure
   gosub STUDY statue
   gosub STUDY second painting
LEAVE.COURT:
   pause .2
   pause .2
   put #goto 72
   waitfor YOU HAVE ARRIVED
   goto DONE

MOVE:
   var Dir $0
MOVE2:
   matchre MOVE2 ^\.\.\.wait|^Sorry
   matchre MOVE.WAIT ^You are too tired
   matchre RETURN ^Obvious
   put %Dir
   matchwait
   
MOVE.WAIT:
   pause 1
   if $stamina >= 10 then goto MOVE2
   goto MOVE.WAIT

STUDY:
   var Study $0
STUDY2:
   pause .2
   if $Scholarship.LearningRate > 30 then goto LEAVE.COURT
   matchre STUDY2 ^\.\.\.wait|^Sorry
   matchre RETURN ^Roundtime
   put study %Study
   matchwait

RETURN:
   return

DONE:
   put stop
   put #parse RAVENDONE
   exit