start:
	if ("$righthandnoun" <> "") then gosub stow right
	if ("$lefthandnoun" <> "") then gosub stow left
	put get my mortar
	Waitfor You get

new_mat:
	put get %1 %2
	match place_mat You get
	match place_mat You pick up
	match done What are you
	match done What were you
	matchwait

place_mat:
	put put my %1 %2 in my mortar
	waitfor You put
	put get my pestle
	waitfor You get
	put crush my %1 %2 with pestle
	waitfor Roundtime

crush:
	
	put crush my %1 %2 with pestle
	match crush Roundtime
	match new You pound away with little effect.
	match new It would work better if the
	match new Crush what?
	matchwait 

new:
	put put my pestle in my tool
	waitfor You put
	put get my %1 from my mortar
	put put my %1 in my brass pouch
	waitfor You put
		goto new_mat
done:
	exit

STOW:
	var Stow $0
STOW.2:
	pause .2
	matchre STOW.2 ^\.\.\.wait|^Sorry
	matchre RETURN ^You put (a|an|some|your|the)|Stow what\?
	send stow %Stow
	matchwait 2
		goto STOW.2

RETURN:
	return