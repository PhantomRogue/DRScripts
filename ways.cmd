action goto invalidstart when ^Something here interferes with your efforts.

if_1 goto start
goto showdestionations

showdestionations:
        echo
        echo Valid destination points are: Dor, Tami, Tiv, Crossing, Leth, Haven, Throne, Theren, Shard, Taisgath, Aesry, Merk
        echo
        exit

invalidstart:
        echo
        echo Invalid start destination.
        echo
        put release all
        exit

start:
        if tolower("%1") = "hib" then gosub setdestination Dor'na'torna
        if tolower("%1") = "dor" then gosub setdestination Dor'na'torna
        if tolower("%1") = "tami" then gosub setdestination Tamigen
        if tolower("%1") = "tiv" then gosub setdestination Emalerje
        if tolower("%1") = "crossing" then gosub setdestination Rolagi
        if tolower("%1") = "musp" then gosub setdestination Tabelrem
        if tolower("%1") = "leth" then gosub setdestination Asharshpar'i
        if tolower("%1") = "haven" then gosub setdestination Taniendar
        if tolower("%1") = "throne" then gosub setdestination Mintais
        if tolower("%1") = "theren" then gosub setdestination Dinegavren
        if tolower("%1") = "shard" then gosub setdestination Marendin
        if tolower("%1") = "taisgath" then gosub setdestination Erekinzil
        if tolower("%1") = "aesry" then gosub setdestination Auilusi
        if tolower("%1") = "merk" then gosub setdestination Besoge
        if "%destinationset" = "1" then goto opengrazhir
        echo
        echo Unknown destination: %1
        echo
        exit
        goto showdestionations

setdestination:
        echo Destination: $0
        setvariable destination $0
        setvariable destinationset 1
        return

opengrazhir:
        put release all
        gosub prepare mg
        gosub harness 30
        pause 10
        gosub cast grazhir
        goto findcenter

findcenter:
        match findcenter ...wait
        match findcenter Sorry, you may only type ahead
        match findcenter.north You believe the center of the microcosm is to the north.
        match findcenter.northeast You believe the center of the microcosm is to the northeast.
        match findcenter.east You believe the center of the microcosm is to the east.
        match findcenter.southeast You believe the center of the microcosm is to the southeast.
        match findcenter.south You believe the center of the microcosm is to the south.
        match findcenter.southwest You believe the center of the microcosm is to the southwest.
        match findcenter.west You believe the center of the microcosm is to the west.
        match findcenter.northwest You believe the center of the microcosm is to the northwest.
        match incenter From this vantage point, you could try to make your way to any place in the microcosm
        put perc
        matchwait

findcenter.north:
        gosub findcenter.move north
        return
findcenter.northeast:
        gosub findcenter.move northeast
        return
findcenter.east:
        gosub findcenter.move east
        return
findcenter.southeast:
        gosub findcenter.move southeast
        return
findcenter.south:
        gosub findcenter.move south
        return
findcenter.southwest:
        gosub findcenter.move southwest
        return
findcenter.west:
        gosub findcenter.move west
        return
findcenter.northwest:
        gosub findcenter.move northwest
        return

findcenter.move:        
        match findcenter.move ...wait
        match findcenter.move Sorry, you may only type ahead
        match findcenter.retreat You are engaged to
        match incenter Astral Plane, Pillar
        match incenter Obvious exits: east, west, up, down
        match findcenter Obvious exits: none
        put $0
        matchwait

findcenter.retreat:
        put retreat
        put retreat
        wait
        pause 0.5
        goto findcenter.move

incenter:
        match incenter ...wait
        match incenter Sorry, you may only type ahead
        match incenter.move You reach out into the seemingly infinite strands of Lunar mana, but cannot find
        match findpiller From this vantage point, you could try to make your way
        match findpillar You move into the chaotic tides of energy
        match findpillar You reach out into the seemingly infinite strands of Lunar mana and find a conduit
        match findpillar You cannot attempt to enter another conduit from this location.
        put focus %destination
        matchwait

incenter.move:
        move west
        goto incenter

findpillar:
        match findpillar ...wait
        match findpillar Sorry, you may only type ahead
        match findpillar.north You believe the end of the conduit lies north.
        match findpillar.northeast You believe the end of the conduit lies northeast.
        match findpillar.east You believe the end of the conduit lies east.
        match findpillar.southeast You believe the end of the conduit lies southeast.
        match findpillar.south You believe the end of the conduit lies south.
        match findpillar.southwest You believe the end of the conduit lies southwest.
        match findpillar.west You believe the end of the conduit lies west.
        match findpillar.northwest You believe the end of the conduit lies northwest.
        match foundexit You are already at the end of the conduit.
        match incenter From this vantage point, you could try to make your way to any place
        put perc
        matchwait

findpillar.north:
        gosub findpillar.move north
        return
findpillar.northeast:
        gosub findpillar.move northeast
        return
findpillar.east:
        gosub findpillar.move east
        return
findpillar.southeast:
        gosub findpillar.move southeast
        return
findpillar.south:
        gosub findpillar.move south
        return
findpillar.southwest:
        gosub findpillar.move southwest
        return
findpillar.west:
        gosub findpillar.move west
        return
findpillar.northwest:
        gosub findpillar.move northwest
        return

findpillar.move:        
        match findpillar.move ...wait
        match findpillar.move Sorry, you may only type ahead
        match findpillar.retreat You are engaged to
        match foundexit You also see the silvery-white shard
        match findpillar Obvious exits
        put $0
        matchwait

findpillar.retreat:
        put retreat
        put retreat
        wait
        pause 0.5
        goto findpillar.move

foundexit:
        gosub prepare mg
        put focus %destination
        wait
        pause
        put cast %destination
        put release mana
        echo *** You are now at %0 ***
        put #parse YOU HAVE ARRIVED

        put #play alert
        put #flash
        exit

# ---

prepare:
        match prepare ...wait
        match prepare Sorry, you may only type ahead
        match prepare.release You are already preparing
        match prepare.done You direct your attention toward the heavens
        match prepare.done You lick the tip of your finger and trace a sigil in the air
        match prepare.done You raise your arms skyward, chanting
        match prepare.done Your eyes darken to black as a starless
        match prepare.done You close your eyes and breathe deeply
        match prepare.done Tiny tendrils of lightning jolt between your hands
		match prepare.done You raise your hands skyward, chanting 
        match prepare.done You raise one hand before you
        put prepare $0
        matchwait

prepare.release:
        match prepare.release ...wait
        match prepare.release Sorry, you may only type ahead
        match prepare You let your concentration lapse
        match prepare You aren't preparing a spell.
        put release spell
        matchwait

prepare.done:
        return

# ---

harness:
        match harness ...wait
        match harness Sorry, you may only type ahead
        match return You have to strain to harness
        match return You strain, but cannot harness that much power.
        match return You tap into the mana
        match return Roundtime
        match harness.error You can also use MANA to see your harness
        put harness $0
        matchwait
harness.error:
        echo ---------------------------
        echo Error in: harness $0
        echo ---------------------------
        return

# ---

cast:
        match cast ...wait
        match cast Sorry, you may only type ahead
        match cast.done You don't have a spell prepared!
        match cast.done You gesture
        match cast.done Small globes of blue and orange
        match cast.done With a wave of your hand
        match cast.done You reach with both your hands
        match cast.done I could not find what you were
        put cast $0
        matchwait
cast.done:
        pause
        return

# ---

retreat:
        put retreat
        put retreat
        wait
        pause 0.5
        return

# ---

move:
        setvariable temp $0
        goto move.real
move.real:
        matchre move.real ^\.\.\.wait
        matchre move.real ^Sorry, you may only type ahead
        matchre move.failed ^You can't go there
        matchre move.retreat ^You are engaged to
        matchre return ^I could not find what you were referring to\.
        matchre return ^It's pitch dark
        matchre return ^Obvious
        put %temp
        matchwait
move.retreat:
        put retreat
        put retreat
        wait
        goto move.real
move.failed:
        echo *** MOVE FAILED *** ABORTING SCRIPT ***
        exit

# ---

return:
        return