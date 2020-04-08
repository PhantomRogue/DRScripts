action put %lastcommand when ^...wait
action put %lastcommand when type ahead

Swim:
move sw
pAuSe 
move ne
pAuSe
goto cHeCkExP

cHeCkExP:
if $Athletics.LearningRate > 30 then exit
goto Swim