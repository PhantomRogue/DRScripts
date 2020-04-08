#Tracking

track:
pause 3
put track %1
pause
move up

pause .5
put trac
match track2 Racing heedlessly through
match track2 Realizing you have lost the trail
match track2 Exhilarated by the cool
match track2 Employing the keen observation
match track2 Unable to find signs
match track2 You are unable to find the signs
match track with you
match exp As your journey ends
matchwait

track2:
pause .5
put track
match track2 Racing heedlessly through
match track2 Realizing you have lost the trail
match track2 Exhilarated by the cool
match track2 Employing the keen observation
match track2 Unable to find signs
match track2 You are unable to find the signs
match track with you
match move But you are not tracking
match exp As your journey ends
matchwait

move:
move down
goto track

exp:
if $Scouting.LearningRate < 30 then goto track 

hide:
pause 5
put hide
pause 15
put hide

match stop you melt
match stop You blend in with
match hide Your attempt to hide fails
match stop But you're already hidden
matchwait

stop:
echo ***********all done*************
pause 50
put exp scouting

match track % clear
match track % thoughtful
match track % learning
match track % concentrating
match track % muddled
match track % very muddled
match track % pondering
match track % perplexing
match track % perplexed
match stop % bewildering
match stop % bewildered
match stop % dazed
match stop % mind lock
matchwait
