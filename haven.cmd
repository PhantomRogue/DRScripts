#Haven guild

1st.goto:
move s
move s
move sw
move w
move w
move w
move w
move w
move w
move n

1st.search:
put search
matchre 1st.search.pause (.wait|type ahead)
match 1st.knock Success!
matchwait

1st.search.pause:
pause 1
goto 1st.search

1st.knock:
put knock door
matchre 1st.knock.pause (.wait|type ahead)
match 1st.whisper You knock softly against
matchwait

1st.knock.pause:
pause 1
goto 1st.knock

1st.whisper:
put whisper movothortu
matchre 1st.whisper.pause (.wait|type ahead)
match 1st.find The door opens just wide
matchwait

1st.whisper.pause:
pause 1
goto 1st.whisper

1st.find:
pause
move climb stair
pause
move ne
move go corn
match 1st.done thief Crow
match 1st.out Obvious
matchwait

1st.out:
move out
move sw
move cli stair
move go door
move n
move n
move n
move se
move se
move se

2nd.search:
put search
matchre 2nd.search.pause (.wait|type ahead)
match 2nd.knock Success!
matchwait

2nd.search.pause:
pause 1
goto 2nd.search

2nd.knock:
put knock door
matchre 2nd.knock.pause (.wait|type ahead)
match 2nd.whisper You knock softly against
matchwait

2nd.knock.pause:
pause 1
goto 2nd.knock

2nd.whisper:
put whisper movothortu
matchre 2nd.whisper.pause (.wait|type ahead)
match 2nd.look The door opens just wide
matchwait

2nd.look:
pause
put look floor
matchre 2nd.look.pause (.wait|type ahead)
match 2nd.find Close examination
matchwait

2nd.look.pause:
pause 1
goto 2nd.look

2nd.find:
move go door
move go corn
match 2nd.done thief Crow
match 2nd.out Obvious
matchwait

2nd.out:
move out
move cli door
move out
move se
move se
move s

3rd.search:
put search
matchre 3rd.search.pause (.wait|type ahead)
match 3rd.knock Success!
matchwait

3rd.search.pause:
pause 1
goto 3rd.search

3rd.knock:
put knock door
matchre 3rd.knock.pause (.wait|type ahead)
match 3rd.whisper You knock softly against
matchwait

3rd.knock.pause:
pause 1
goto 3rd.knock

3rd.whisper:
put whisper movothortu
matchre 3rd.whisper.pause (.wait|type ahead)
match 3rd.look The door opens just wide
matchwait

3rd.look:
put search shadow
matchre 3rd.look.pause (.wait|type ahead)
match 3rd.find you find an opening
matchwait

3rd.look.pause:
pause 1
goto 3rd.look

3rd.find:
move go open
move go corn
match 3rd.done thief Crow
match 3rd.out Obvious
matchwait

3rd.out:
move out
move out
move go door
move n
move e
move ne

4th.look:
put look door
matchre 4th.look.pause (.wait|type ahead)
match 4th.gofoot A narrow footpath
matchwait

4th.look.pause:
pause 1
goto 4th.look

4th.gofoot:
move go foot
matchre 4th.gofoot.pause (.wait|type ahead)
match 4th.search Obvious
matchwait

4th.gofoot.pause:
pause 1
goto 4th.gofoot

4th.search:
put search
matchre 4th.search.pause (.wait|type ahead)
match 4th.knock Success!
matchwait

4th.search.pause:
pause 1
goto 4th.search

4th.knock:
put knock gra
matchre 4th.knock.pause (.wait|type ahead)
match 4th.whisper You knock softly against
matchwait

4th.knock.pause:
pause 1
goto 4th.knock

4th.whisper:
put whisper movothortu
matchre 4th.whisper.pause (.wait|type ahead)
match 4th.find The door opens just wide
matchwait

4th.find:
move go door
move ne
move go nook
match 4th.done thief Crow
match 4th.out Obvious
matchwait

4th.out:
move out
move sw
move go door
move go gra
move out
move e
move s
move s
move w

5th.search:
put search
matchre 5th.search.pause (.wait|type ahead)
match 5th.knock Success!
matchwait

5th.search.pause:
pause 1
goto 5th.search

5th.knock:
put knock door
matchre 5th.knock.pause (.wait|type ahead)
match 5th.whisper You knock softly against
matchwait

5th.knock.pause:
pause 1
goto 5th.knock

5th.whisper:
put whisper movothortu
matchre 5th.whisper.pause (.wait|type ahead)
match 5th.find The door opens just wide
matchwait

5th.find:
move n
move go corn
match 5th.done thief Crow
match 5th.out Obvious
matchwait

5th.out:
move out
move s
move go door
move w
move se
move se
move ne
move ne
move ne
move ne
move ne
move go all
move s
move s
move go rec

6th.search:
put search
matchre 6th.search.pause (.wait|type ahead)
match 6th.knock Success!
matchwait

6th.search.pause:
pause 1
goto 6th.search

6th.knock:
put knock door
matchre 6th.knock.pause (.wait|type ahead)
match 6th.whisper You knock softly against
matchwait

6th.knock.pause:
pause 1
goto 6th.knock

6th.whisper:
put whisper movothortu
matchre 6th.whisper.pause (.wait|type ahead)
match 6th.find The door opens just wide
matchwait

6th.find:
move go arch
move climb stair
pause
move go corn
match 6th.done thief Crow
match 6th.out Obvious
matchwait

6th.out:
move out
move climb stair
move go arch
move go door
move go open
move n
move n
move out
move sw
move sw
move sw
move sw
move n
move n
exit

1st.done:
echo *** type plzcont to get out ***
waitfor plzcont
move out
move sw
move climb stair
move go door
goto find.bank

2nd.done:
echo *** type plzcont to get out ***
waitfor plzcont
move out
move climb door
move out
goto find.bank

3rd.done:
echo *** type plzcont to get out ***
waitfor plzcont
move out
move out
move go door
goto find.bank

4th.done:
echo *** type plzcont to get out ***
waitfor plzcont
move out
move sw
move go door
move go gra
move out
goto find.bank

5th.done:
echo *** type plzcont to get out ***
waitfor plzcont
move out
move s
move go door
goto find.bank

6th.done:
echo *** type plzcont to get out ***
waitfor plzcont
goto 6th.out

find.bank:
put dir bank 1
match find.Bank.Pause .wait
match find.Bank.Pause type ahead
match find.Bank.Pause still stunned
match find.mw Directions towards the Bank of Riverhaven: West.
match find.mnw Directions towards the Bank of Riverhaven: Northwest.
match find.mn Directions towards the Bank of Riverhaven: North.
match find.mne Directions towards the Bank of Riverhaven: Northeast.
match find.me Directions towards the Bank of Riverhaven: East.
match find.mse Directions towards the Bank of Riverhaven: Southeast.
match find.ms Directions towards the Bank of Riverhaven: South.
match find.msw Directions towards the Bank of Riverhaven: Southwest.
match find.gobank Directions towards the Bank of Riverhaven: GO bank.
matchwait

find.Bank.Pause:
pause 1
goto find.Bank

find.mw:
move w
goto find.Bank

find.mnw:
move nw
goto find.Bank

find.mn:
move n
goto find.Bank

find.mne:
move ne
goto find.Bank

find.me:
move e
goto find.Bank

find.mse:
move se
goto find.Bank

find.ms:
move s
goto find.Bank

find.msw:
move sw
goto find.Bank

find.gobank:
put dir stop
exit