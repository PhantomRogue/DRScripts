ECHO *********************************
ECHO 1 is place to get keyblanks
ECHO
ECHO 2 is location to put FINISHED MASTERS
ECHO
ECHO 3 is location to put unfinished ( MASTER ) locks.
ECHO [ones to carve into GM's later] They are masters with carves left.
ECHO
ECHO 4 is location to put unfinished ( PRO or SUPERIOR ) locks.
ECHO Must be having a nightmare or no bonus.
ECHO
ECHO NOTE: Recomended cookies 1 & 2. Remove armor, wounds and burden.
ECHO
ECHO *********************************
put wield my carving knife
pause 2
TOP:
put Health
pause 1
put Encumbrance
pause 1
put Inv Armor
pause 1
CARVE:
put get my keyblank
Match Carvelock1 You get a
Match Carvelock1 You need a free hand to pick that up
Match Finish2 I could not find what you were referring to
Matchwait
CARVELOCK1:
put carve my key with my knife
Match Carvelock2 you find yourself holding a crude
Match Carvelock2 you find yourself holding a rough
Match Carvelock2 you find yourself holding a stout
Match Carvelock2 you find yourself holding a common
Match Carvelock2 you find yourself holding a slim
Match Carvelock2 you find yourself holding a quality
Match Carvelock2 you find yourself holding a high quality
Match Carvelock2 you find yourself holding a superior
Match Carvelock2 you find yourself holding a professional
Match Carvelock2 I could not find what you were referring to.
Match Carvelock2 You need to be holding the keyblank.
Match End1 you find yourself holding a master's
Match End2 you put the final touches on your work, and proudly glance down at a master's
Match End3 you put the final touches on your work, and proudly glance down at a professional
Match End3 you put the final touches on your ework, and proudly glance down at a superior
match End2 grandmaster
Match Broken snaps like a twig.
Match Carvelock1 Wait
Matchwait
CARVELOCK2:
put carve my lock with my knife
Match Carvelock2 feel fairly satisfied with your performance.
Match Carvelock2 you find yourself holding a 
match End1 With careful trimming and smoothing, you put the final touches on your work
Match End1 It would be better to find a creature to carve or specify which tool you want to carve with.
Match Broken snap
Match Carvelock2 Wait
Matchwait
BROKEN:
pause 2
GOTO Carve
END1:
pause 1
put stow lockp
wait
GOTO Finish
END2:
pause 1
put stow lockp
GOTO Finish
END3:
pause 1
put stow lockp
GOTO Finish
FINISH:
pause 1
pause 1
GOTO Carve
FINISH2:
pause 1
put exp
waitfor Overall state of mind
put look
pause 1
ECHO ************************************
ECHO ************************************
ECHO *** ALL OUT OF KEYBLANKS ***
ECHO ************************************
ECHO ************************************
Put sheath
FINISHED:
Put Clean vakr
pause 2
exit
