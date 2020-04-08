###General Variables
Var Containerknife backpack
var Containershaper backpack
###Arrow specific variables
var Containerflights game
var Containerglue backpack
var Containershears backpack
var Containerarrowhead backpack
###Arrowhead specific variables
var poundtool scimitar
var Container%poundtool backpack

action instant goto restart when You fear


var ProductList (arrow|arro|arr|ar|arrowhead|arrowh|longbow|longb|long|shortbow|shortb|short)
var MaterialList (tusk|fang|tooth|pine|spruce|apple|alder|ash|birch|fir|cherry|hickory|cedar|ebony|elm|mahogany|maple|oak|rosewood|teak|walnut|willow|redwood|yew|mistwood|osage|bloodwood|silverwood|copperwood)
var ArrowheadList (broad|broad-barbed|silver|silver-tipped|serrated|serrated-bodkin|stone|stone-tipped|razor|razor-edged|razor-tipped|barbed|warhead|broad-tip|bishop|basilisk|hele'la|hele|elsralael|adder|angiswaerd|sabretooth|boar|tempest|shar|black shar|war bodkin|flint|ironwing)
var Consumables (glue|arrowhead|flights|tusk|fang|tooth)


if matchre(%0, "%MaterialList") then var Material $1
else var Material
if matchre(%0,"(\d+)") then math Counter set $1
else counter set 1
if matchre("%0", "%ProductList") then goto $1
echo
echo failed.
echo
exit

Arrow:
Arro:
Arr:
Ar:
var Product Arrow
if matchre("%0", "%ArrowheadList") then var Arrowhead $1
else var Arrowhead  
gosub Forage %Material stick
pause .5
put swap
gosub Take shaper
gosub Shape shaft
gosub Shape shaft
gosub Shape shaft
gosub Take knife
gosub Notch
gosub Notch
gosub Fletch
gosub Take flights
gosub Fletch
gosub Take glue
gosub Fletch
gosub Take shears
gosub Fletch
gosub Take %3 arrowhead
gosub Affix
pause .5
gosub CountCheck
exit

Arrowhead:
Arrowhea:
Arrowhe:
Arrowh:
var Product Arrowhead
action var ArrowheadDone YES when chipping off strategic bits until you create an arrowhead
gosub Take %poundtool
put take %Material
pause .5
gosub Pound
pause .5
put stow right
gosub CountCheck
exit


Longbow:
Longbo:
Longb:
Long:
Lon:
Lo:
var Product Longbow
gosub Forage %Material limb
pause .5
put swap
gosub Take shaper
gosub Shape longbow
gosub Take knife
gosub Shape longbow
gosub Take shaper
gosub Shape longbow
gosub Shape longbow
gosub Shape longbow
gosub Take knife
gosub Shape longbow
gosub Take shaper
gosub Shape longbow
gosub Shape longbow
gosub Take knife
gosub Shape longbow
gosub Shape longbow
pause .5
put stow right
gosub CountCheck
exit

Shortbow:
Shortbo:
Shortb:
Short:
shor:
sho:
Sh:
var Product Shortbow
gosub Forage %Material stick
pause .5
put swap
gosub Take shaper
gosub Shape "short bow"
gosub Take knife
gosub Shape bow
gosub Shape bow
gosub Take shaper
gosub Shape bow
gosub Shape bow
gosub Take knife
gosub Shape bow
gosub Take shaper
gosub Shape bow
gosub Shape bow
gosub Take knife
gosub Shape bow
gosub Shape bow
pause .5
put stow right
gosub CountCheck
exit




Forage_Pause:
pause
Forage:
match Forage_Pause ...wait
match Forage type ahead
match Forage Roundtime
match Return manage to find
match return absolute best 
put for $0
matchwait


Shape_Pause:
pause
Shape:
match Shape_Pause ...wait
match Shape type ahead
match Shape_Shaft Maybe you mean
match Return Roundtime
match Return shaft is already
match Broke snaps in your hands
if $lefthandnound = $1 then put shape $1
else put shape $1 from my $lefthandnoun
matchwait

Shape_Shaft:
put shape shaft
pause 0.5
RETURN


Notch_Pause:
pause
Notch:
match Notch_Pause ...wait
match Notch type ahead
match Broke The shaft begins to fall out of your hands 
match Return Roundtime
put notch my $lefthandnoun with my $righthandnoun
matchwait

Fletch_Pause:
pause
Fletch:
match Fletch_Pause ...wait
match Fletch type ahead
match Broke The shaft begins to fall out of your hands 
match Return Roundtime
put fletch my $lefthandnoun
matchwait

Affix_Pause:
pause
Affix:
match Affix_Pause ...wait
match Affix type ahead
match Return Roundtime
put affix my $righthandnoun
matchwait

Broke:
echo
echo Done gone broke it.
echo
put stow right
exit

Pound:
pause .5
if ArrowheadDone = YES then return
match Pound ...wait
match Pound type ahead
match Pound Roundtime
match Return I don't think so
put pound my $lefthandnoun into arrowhead
matchwait

Take_Pause:
pause
Take:
pause .5
if $righthand != Empty then put put my $righthandnoun in my %Container$righthandnoun
match Take_Pause ...wait
match Take type ahead
match Out What do you
match Return You get
if contains($0, arrowhead) then put take $0 from %Containerarrowhead
else put take $1 from %Container$1
matchwait

Out:
echo
if matchre($0, %Consumables) then echo Out of $0
else echo Could not locate your $0
exit

CountCheck:
pause .5
math Counter subtract 1
if %Counter = 0 then exit
echo
echo  %Counter more %Product left.
if $lefthandnoun = arrow || $lefthandnoun = arrowhead then put stow left
else put drop my $lefthandnoun
goto %Product


restart:
echo Fucked up the Arrow, restart
exit

Return:
return