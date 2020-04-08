
echo *****Initializing Actions*****
##
#External Wound Actions
##
action var ExtHead 1 when ^You have.+((minor abrasions|tiny scratches) (to|on|across|along) the head|cuts and bruises about the head|some moderately deep cuts about the head|some deep slashes and cuts about the head|a cracked skull with deep slashes|a crushed skull with horrendous wounds|a pulpy stump for a head)
action var ExtNeck 1 when ^You have.+((minor abrasions|tiny scratches) (to|on|across|along) the neck|cuts and bruises about the neck|deep cuts across the neck|deep slashes across the neck|gaping holes in the neck|a shattered neck with gaping wounds|a completely useless neck with nearly all flCFMe and bone torn away)
action var ExtChest 1 when ^You have.+((minor abrasions|tiny scratches) (to|on|across|along) the chest|cuts and bruises about the chest area|deep cuts across the chest area|deep slashes across the chest area|gaping holes in the chest area|a shattered chest area with gaping wounds|a completely destroyed chest with nearly all flCFMe and bone torn away revealing a gaping hole)
action var ExtAbdomen 1 when ^You have.+((minor abrasions|tiny scratches) (to|on|across|along) the abdomen|cuts and bruises about the abdomen|deep cuts across the abdomen|deep slashes across the abdomen|gaping holes in the abdomen|an abdomen deeply gouged with gaping wounds|a completely destroyed abdomen with nearly all flCFMe and bone torn away revealing a gaping hole)
action var ExtBack 1 when ^You have.+((minor abrasions|tiny scratches) (to|on|across|along) the back|cuts and bruises about the back|deep cuts across the back|deep slashes across the back|gaping holes in the back|a shattered back with gaping wounds|a completely destroyed back with nearly all flCFMe and bone torn away revealing a gaping hole)
action var ExtRightArm 1 when ^You have.+((minor abrasions|tiny scratches) (to|on|across|along) the right arm|cuts and bruises about the right arm|deep cuts across the right arm|deep slashes across the right arm|a broken right arm with gaping holes|a shattered right arm with gaping wounds|an ugly stump for a right arm)
action var ExtLeftArm 1 when ^You have.+((minor abrasions|tiny scratches) (to|on|across|along) the left arm|cuts and bruises about the left arm|deep cuts across the left arm|deep slashes across the left arm|a broken left arm with gaping holes|a shattered left arm with gaping wounds|an ugly stump for a left arm)
action var ExtRightLeg 1 when ^You have.+((minor abrasions|tiny scratches) (to|on|across|along) the right leg|cuts and bruises about the right leg|deep cuts across the right leg|deep slashes across the right leg|a broken right leg with gaping holes|a shattered right leg with gaping wounds|an ugly stump for a right leg)
action var ExtLeftLeg 1 when ^You have.+((minor abrasions|tiny scratches) (to|on|across|along) the left leg|cuts and bruises about the left leg|deep cuts across the left leg|deep slashes across the left leg|a broken left leg with gaping holes|a shattered left leg with gaping wounds|an ugly stump for a left leg)
action var ExtRightHand 1 when ^You have.+((minor abrasions|tiny scratches) (to|on|across|along) the right hand|cuts and bruises about the right hand|deep cuts across the right hand|deep slashes across the right hand|a broken right hand with gaping holes|a shattered right hand with gaping wounds|an ugly stump for a right hand)
action var ExtLeftHand 1 when ^You have.+((minor abrasions|tiny scratches) (to|on|across|along) the left hand|cuts and bruises about the left hand|deep cuts across the left hand|deep slashes across the left hand|a broken left hand with gaping holes|a shattered left hand with gaping wounds|an ugly stump for a left hand)
action var ExtRightEye 1 when ^You have.+((minor abrasions|tiny scratches) (to|on|across|along) the right eye|a black and blue right eye|a bruised and swollen right eye|a bruised, swollen and bleeding right eye|a bruised, swollen and slashed right eye|a bruised, swollen and shattered right eye|a pulpy cavity for an right eye)
action var ExtLeftEye 1 when ^You have.+((minor abrasions|tiny scratches) (to|on|across|along) the left eye|a black and blue left eye|a bruised and swollen left eye|a bruised, swollen and bleeding left eye|a bruised, swollen and slashed left eye|a bruised, swollen and shattered left eye|a pulpy cavity for an left eye)
action var ExtSkin 1 when ^You have.+((minor abrasions|tiny scratches) (to|on|across|along) the skin|a small skin rash|a large skin rash|a body rash|a painful, enflamed body rash|boils and sores around the skin|open and bleeding sores all over the skin)

##
#External Scar Actions
##
action var ExtScarHead 1 when ^You have.+((a few nearly invisible scars|tiny scars) (to|on|across|along) the head|minor scars about the head|severe scarring about the head|severe scarring and ugly gashes about the head|missing chunks out of the head|a mangled and malformed head|a stump for a head)
action var ExtScarNeck 1 when ^You have.+((a few nearly invisible scars|tiny scars) (to|on|across|along) the neck|minor scarring along the neck|severe scarring along the neck|severe scarring and ugly gashes about the neck|severe scarring and chunks of flCFMe missing from the neck|a severely scarred, mangled and malformed neck|an ugly flCFMe stump for a neck with little left to support the head)
action var ExtScarChest 1 when ^You have.+((a few nearly invisible scars|tiny scars) (to|on|across|along) the chest|minor scarring along the chest area|severe scarring along the chest area|severe scarring and ugly gashes about the chest area|severe scarring and chunks of flCFMe missing from the chest area|a severely scarred, mangled and malformed chest area|a mostly non-existent chest filled with ugly chunks of scarred flCFMe)
action var ExtScarAbdomen 1 when ^You have.+((a few nearly invisible scars|tiny scars) (to|on|across|along) the abdomen|minor scarring along the abdomen|severe scarring along the abdomen|severe scarring and ugly gashes about the abdomen|severe scarring and chunks of flCFMe missing from the abdomen|a severely scarred, mangled and malformed abdomen|a mostly non-existent abdomen filled with ugly chunks of scarred flCFMe)
action var ExtScarBack 1 when ^You have.+((a few nearly invisible scars|tiny scars) (to|on|across|along) the back|minor scarring along the back|severe scarring along the back|severe scarring and ugly gashes about the back|severe scarring and chunks of flCFMe missing from the back|a severely scarred, mangled and malformed back|a mostly non-existent back filled with ugly chunks of scarred flCFMe and rearranged bone)
action var ExtScarRightArm 1 when ^You have.+((a few nearly invisible scars|tiny scars) (to|on|across|along) the right arm|minor scarring along the right arm|severe scarring along the right arm|severe scarring and ugly gashes about the right arm|severe scarring and chunks of flCFMe missing from the right arm|a severely scarred, mangled and malformed right arm|an ugly flCFMe stump for a right arm)
action var ExtScarLeftArm 1 when ^You have.+((a few nearly invisible scars|tiny scars) (to|on|across|along) the left arm|minor scarring along the left arm|severe scarring along the left arm|severe scarring and ugly gashes about the left arm|severe scarring and chunks of flCFMe missing from the left arm|a severely scarred, mangled and malformed left arm|an ugly flCFMe stump for a left arm)
action var ExtScarRightLeg 1 when ^You have.+((a few nearly invisible scars|tiny scars) (to|on|across|along) the right leg|minor scarring along the right leg|severe scarring along the right leg|severe scarring and ugly gashes about the right leg|severe scarring and chunks of flCFMe missing from the right leg|a severely scarred, mangled and malformed right leg|an ugly flCFMe stump for a right leg)
action var ExtScarLeftLeg 1 when ^You have.+((a few nearly invisible scars|tiny scars) (to|on|across|along) the left leg|minor scarring along the left leg|severe scarring along the left leg|severe scarring and ugly gashes about the left leg|severe scarring and chunks of flCFMe missing from the left leg|a severely scarred, mangled and malformed left leg|an ugly flCFMe stump for a left leg)
action var ExtScarRightHand 1 when ^You have.+((a few nearly invisible scars|tiny scars) (to|on|across|along) the right hand|minor scarring along the right hand|severe scarring along the right hand|severe scarring and ugly gashes about the right hand|severe scarring and chunks of flCFMe missing from the right hand|a severely scarred, mangled and malformed right hand|an ugly flCFMe stump for a right hand)
action var ExtScarLeftHand 1 when ^You have.+((a few nearly invisible scars|tiny scars) (to|on|across|along) the left hand|minor scarring along the left hand|severe scarring along the left hand|severe scarring and ugly gashes about the left hand|severe scarring and chunks of flCFMe missing from the left hand|a severely scarred, mangled and malformed left hand|an ugly flCFMe stump for a left hand)
action var ExtScarRightEye 1 when ^You have.+((a few nearly invisible scars|tiny scars) (to|on|across|along) the right eye|minor scarring across the right eye|severe scarring across the right eye|deeply scarred gashes across the right eye|a punctured and shriveled right eye|a painfully mangled and malformed right eye in a shattered right eye socket|an empty right eye socket overgrown with bits of odd shaped flCFMe)
action var ExtScarLeftEye 1 when ^You have.+((a few nearly invisible scars|tiny scars) (to|on|across|along) the left eye|minor scarring across the left eye|severe scarring across the left eye|deeply scarred gashes across the left eye|a punctured and shriveled left eye|a painfully mangled and malformed left eye in a shattered left eye socket|an empty left eye socket overgrown with bits of odd shaped flCFMe)
action var ExtScarSkin 1 when ^You have.+((a few nearly invisible scars|tiny scars) (to|on|across|along) the skin|loss of skin tone|minor skin discoloration|severe skin discoloration|some shriveled and oddly folded skin|severely stiff and shriveled skin that seems to be peeling off the body|severe skin loss exposing bone and internal organs)


##
#Internal Wound Actions
##
action var IntHead 1 when ^You have.+(slightly tender (to|on|across|along) the head|a bruised head|a deeply bruised head|a badly bruised and swollen head|major swelling and bruising around the head|a ghastly bloated head with bleeding from the ears|a grotesquely bloated head with bleeding from the eyes and ears)
action var IntNeck 1 when ^You have.+(slightly tender (to|on|across|along) the neck|minor swelling and bruising around the neck|a severely swollen and deeply bruised neck|a severely swollen and deeply bruised neck with odd protrusions under the skin|a severely swollen and deeply bruised neck with bones protruding out from the skin|a severely swollen and shattered neck which appears useless to hold up the head)
action var IntChest 1 when ^You have.+(slightly tender (to|on|across|along) the chest|minor swelling and bruising in the chest area|a severely swollen and bruised chest area|a severely swollen and deeply bruised chest area with odd protrusions under the skin|a severely swollen and deeply bruised chest area with ribs protruding out from the skin|a severely swollen chest area with a shattered rib cage)
action var IntAbdomen 1 when ^You have.+(slightly tender (to|on|across|along) the abdomen|minor swelling and bruising in the abdomen|a severely swollen and bruised abdomen|a severely bloated and discolored abdomen with strange round lumps under the skin|a severely bloated and discolored abdomen which appears oddly rearranged)
action var IntBack 1 when ^You have.+(slightly tender (to|on|across|along) the back|minor swelling and bruising in the back|a severely swollen and bruised back|a severely swollen and deeply bruised back with odd protrusions under the skin|a severely swollen and deeply bruised back with ribs or vertebrae protruding out from the skin|a severely swollen back with a shattered spinal cord)
action var IntRightArm 1 when ^You have.+(slightly tender (to|on|across|along) the right arm|minor swelling and bruising around the right arm|a severely swollen and deeply bruised right arm|a severely swollen and deeply bruised right arm with bones protruding out from the skin|a severely swollen and shattered right arm which appears completely useless)
action var IntLeftArm 1 when ^You have.+(slightly tender (to|on|across|along) the left arm|minor swelling and bruising around the left arm|a severely swollen and deeply bruised left arm|a severely swollen and deeply bruised left arm with bones protruding out from the skin|a severely swollen and shattered left arm which appears completely useless)
action var IntRightLeg 1 when ^You have.+(slightly tender (to|on|across|along) the right leg|minor swelling and bruising around the right leg|a severely swollen and deeply bruised right leg|a severely swollen and deeply bruised right leg with bones protruding out from the skin|a severely swollen and shattered right leg which appears completely useless)
action var IntLeftLeg 1 when ^You have.+(slightly tender (to|on|across|along) the left leg|minor swelling and bruising around the left leg|a severely swollen and deeply bruised left leg|a severely swollen and deeply bruised left leg with bones protruding out from the skin|a severely swollen and shattered left leg which appears completely useless)
action var IntRightHand 1 when ^You have.+(slightly tender (to|on|across|along) the right hand|minor swelling and bruising around the right hand|a severely swollen and deeply bruised right hand|a severely swollen and deeply bruised right hand with bones protruding out from the skin|a severely swollen and shattered right hand which appears completely useless)
action var IntLeftHand 1 when ^You have.+(slightly tender (to|on|across|along) the left hand|minor swelling and bruising around the left hand|a severely swollen and deeply bruised left hand|a severely swollen and deeply bruised left hand with bones protruding out from the skin|a severely swollen and shattered left hand which appears completely useless)
action var IntRightEye 1 when ^You have.+(slightly tender (to|on|across|along) the right eye|some minor swelling and bruising around the right eye|a severely swollen and bruised right eye|a severely swollen, bruised and crossed right eye|a severely swollen, bruised and cloudy right eye|a severely swollen, bruised and blind right eye)
action var IntLeftEye 1 when ^You have.+(slightly tender (to|on|across|along) the left eye|some minor swelling and bruising around the left eye|a severely swollen and bruised left eye|a severely swollen, bruised and crossed left eye|a severely swollen, bruised and cloudy left eye|a severely swollen, bruised and blind left eye)
action var IntNerves 1 when ^You have.+(slightly tender (to|on|across|along) the nerves|some minor twitching|some severe twitching|difficulty controlling actions|partial paralysis of the entire body|severe paralysis of the entire body|complete paralysis of the entire body)

##
#Internal Scar Actions
##
action var IntScarHead 1 when ^You have.+(minor internal scarring (to|on|across|along) the head| twitch on the forehead|a confused look with sporadic twitching of the forehead|a blank stare)
action var IntScarNeck 1 when ^You have.+(minor internal scarring (to|on|across|along) the neck| twitching in the neck|a constant twitching in the neck|a partially paralyzed neck|a severely paralyzed neck|a completely paralyzed neck)
action var IntScarChest 1 when ^You have.+(minor internal scarring (to|on|across|along) the chest| twitching in the chest area|a constant twitching in the chest area|a constant twitching in the chest area and difficulty breathing|a painful chest area and difficulty getting a breath without pain|a severely painful chest area with significant problems breathing|an extremely painful chest while gasping for breath in short shallow bursts)
action var IntScarAbdomen 1 when ^You have.+(minor internal scarring (to|on|across|along) the abdomen| twitching in the abdomen|a constant twitching in the abdomen|a somCFMeat emaciated look| emaciated look|a severely yellow pallor and a look of starvation|a death pallor and extreme loss of weight)
action var IntScarBack 1 when ^You have.+(minor internal scarring (to|on|across|along) the back| twitching in the back|a constant twitching in the back|a constant twitching in the back and difficulty moving in general|a painful back and difficulty moving without pain|a severely painful back with significant problems moving|an extremely painful and bizarrely twisted back making it nearly impossible to move)
action var IntScarRightArm 1 when ^You have.+(minor internal scarring (to|on|across|along) the right arm| twitching in the right arm|a constant twitching in the right arm|a partially paralyzed right arm|a severely paralyzed right arm|a completely paralyzed right arm)
action var IntScarLeftArm 1 when ^You have.+(minor internal scarring (to|on|across|along) the left arm| twitching in the left arm|a constant twitching in the left arm|a partially paralyzed left arm|a severely paralyzed left arm|a completely paralyzed left arm)
action var IntScarRightLeg 1 when ^You have.+(minor internal scarring (to|on|across|along) the right leg| twitching in the right leg|a constant twitching in the right leg|a partially paralyzed right leg|a severely paralyzed right leg|a completely paralyzed right leg)
action var IntScarLeftLeg 1 when ^You have.+(minor internal scarring (to|on|across|along) the left leg| twitching in the left leg|a constant twitching in the left leg|a partially paralyzed left leg|a severely paralyzed left leg|a completely paralyzed left leg)
action var IntScarRightHand 1 when ^You have.+(minor internal scarring (to|on|across|along) the right hand| twitching in the right hand|a constant twitching in the right hand|a partially paralyzed right hand|a severely paralyzed right hand|a completely paralyzed right hand)
action var IntScarLeftHand 1 when ^You have.+(minor internal scarring (to|on|across|along) the left hand| twitching in the left hand|a constant twitching in the left hand|a partially paralyzed left hand|a severely paralyzed left hand|a completely paralyzed left hand)
action var IntScarRightEye 1 when ^You have.+(minor internal scarring (to|on|across|along) the right eye| twitching in the right eye|a constant twitching in the right eye|a clouded right eye|a completely clouded right eye|a blind right eye)
action var IntScarLeftEye 1 when ^You have.+(minor internal scarring (to|on|across|along) the left eye| twitching in the left eye|a constant twitching in the left eye|a clouded left eye|a completely clouded left eye|a blind left eye)
action var IntScarNerves 1 when ^You have.+(minor internal scarring (to|on|across|along) (the|your) nerves|slight numbness in (the|your) fingers and toes|slight numbness in (the|your) arms and legs|numbness in (the|your) fingers and toes|numbness in (the|your) arms and legs|general numbness all over|general numbness all over and have difficulty thinking)
pause 5
echo ***** Done Initializing Actions*****    
goto end.of.file

healSelf:
    gosub resetVars
    gosub checkHealth
return

##
# Heal External wounds
##
checkHealth:
    put health
    pause .5
    if %ExtHead=1 then gosub CFMe head
    elseif %IntScarNerves=1 then gosub CFMe skin
    elseif %IntNerves=1 then gosub CFMe skin            
    elseif %ExtNeck=1 then gosub CFMe neck
    elseif %ExtChest=1 then gosub CFMe chest
    elseif %ExtAbdomen=1 then gosub CFMe abdomen
    elseif %ExtBack=1 then gosub CFMe back
    elseif %ExtRightArm=1 then gosub CFMe right arm
    elseif %ExtLeftArm=1 then gosub CFMe left arm
    elseif %ExtRightLeg=1 then gosub CFMe right leg
    elseif %ExtLeftLeg=1 then gosub CFMe left leg
    elseif %ExtRightHand=1 then gosub CFMe right hand
    elseif %ExtLeftHand=1 then gosub CFMe left hand
    elseif %ExtRightEye=1 then gosub CFMe right eye
    elseif %ExtLeftEye=1 then gosub CFMe left eye
    elseif %ExtSkin=1 then gosub CFMe skin
##
# Heal External Scars
##
    elseif %ExtScarHead=1 then gosub CFMe head
    elseif %ExtScarNeck=1 then gosub CFMe neck
    elseif %ExtScarChest=1 then gosub CFMe chest
    elseif %ExtScarAbdomen=1 then gosub CFMe abdomen
    elseif %ExtScarBack=1 then gosub CFMe back
    elseif %ExtScarRightArm=1 then gosub CFMe right arm
    elseif %ExtScarLeftArm=1 then gosub CFMe left arm
    elseif %ExtScarRightLeg=1 then gosub CFMe right leg
    elseif %ExtScarLeftLeg=1 then gosub CFMe left leg
    elseif %ExtScarRightHand=1 then gosub CFMe right hand
    elseif %ExtScarLeftHand=1 then gosub CFMe left hand
    elseif %ExtScarRightEye=1 then gosub CFMe right eye
    elseif %ExtScarLeftEye=1 then gosub CFMe left eye
    elseif %ExtScarSkin=1 then gosub CFMe skin
### Heal Internal Wounds
##
    elseif %IntHead=1 then gosub CFMe head            
    elseif %IntNeck=1 then gosub CFMe neck            
    elseif %IntChest=1 then gosub CFMe chest          
    elseif %IntAbdomen=1 then gosub CFMe abdomen      
    elseif %IntBack=1 then gosub CFMe back            
    elseif %IntRightArm=1 then gosub CFMe right arm  
    elseif %IntLeftArm=1 then gosub CFMe left arm    
    elseif %IntRightLeg=1 then gosub CFMe right leg  
    elseif %IntLeftLeg=1 then gosub CFMe left leg    
    elseif %IntRightHand=1 then gosub CFMe right hand
    elseif %IntLeftHand=1 then gosub CFMe left hand  
    elseif %IntRightEye=1 then gosub CFMe right eye  
    elseif %IntLeftEye=1 then gosub CFMe left eye    
##
# Heal Internal Scars
##
    elseif %IntScarHead=1 then gosub CFMe head            
    elseif %IntScarNeck=1 then gosub CFMe neck            
    elseif %IntScarChest=1 then gosub CFMe chest          
    elseif %IntScarAbdomen=1 then gosub CFMe abdomen      
    elseif %IntScarBack=1 then gosub CFMe back            
    elseif %IntScarRightArm=1 then gosub CFMe right arm  
    elseif %IntScarLeftArm=1 then gosub CFMe left arm    
    elseif %IntScarRightLeg=1 then gosub CFMe right leg  
    elseif %IntScarLeftLeg=1 then gosub CFMe left leg    
    elseif %IntScarRightHand=1 then gosub CFMe right hand
    elseif %IntScarLeftHand=1 then gosub CFMe left hand  
    elseif %IntScarRightEye=1 then gosub CFMe right eye  
    elseif %IntScarLeftEye=1 then gosub CFMe left eye    
    
    return

##
# CFMe Sub
# Prepare and cast CFMe on the supplied body part.
##
CFMe:
    var body_part $1 $2
    echo *****Healing External Wounds on the %body_part*****
    
    var allhealed 0
    if $mana < 40 then return
    put rel
    put prepare cf
    put perf cons on %Mob
    waitforre ^You feel fully prepared to cast your spell\.$
    put cast %body_part
    pause 1
    gosub resetVars
    return

##
# REsetVars sub
# Resets all the body part variables after a pass through
# the main loop
##    
resetVars:
    echo *****Resetting Variables*****
    var allhealed 1
    var ExtHead 0
  var ExtNeck 0
  var ExtChest 0
  var ExtAbdomen 0
  var ExtBack 0
  var ExtRightArm 0
  var ExtLeftArm 0
  var ExtRightLeg 0
  var ExtLeftLeg 0
  var ExtRightHand 0
  var ExtLeftHand 0
  var ExtRightEye 0
  var ExtLeftEye 0
  var ExtSkin 0  
  var ExtScarHead 0
  var ExtScarNeck 0
  var ExtScarChest 0
  var ExtScarAbdomen 0
  var ExtScarBack 0
  var ExtScarRightArm 0
  var ExtScarLeftArm 0
  var ExtScarRightLeg 0
  var ExtScarLeftLeg 0
  var ExtScarRightHand 0
  var ExtScarLeftHand 0
  var ExtScarRightEye 0
  var ExtScarLeftEye 0
  var ExtScarSkin 0  
  var IntHead 0
  var IntNeck 0
  var IntChest 0
  var IntAbdomen 0
  var IntBack 0
  var IntRightArm 0
  var IntLeftArm 0
  var IntRightLeg 0
  var IntLeftLeg 0
  var IntRightHand 0
  var IntLeftHand 0
  var IntRightEye 0
  var IntLeftEye 0
  var IntNerves 0  
  var IntScarHead 0
  var IntScarNeck 0
  var IntScarChest 0
  var IntScarAbdomen 0
  var IntScarBack 0
  var IntScarRightArm 0
  var IntScarLeftArm 0
  var IntScarRightLeg 0
  var IntScarLeftLeg 0
  var IntScarRightHand 0
  var IntScarLeftHand 0
  var IntScarRightEye 0
  var IntScarLeftEye 0
  var IntScarNerves 0
  echo *****Done Resetting Variables*****
  return

end.of.file: