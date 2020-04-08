#Moonmage Training Setup Menu

#debug 10

##Guild Verification
GuildCheck:
		action (guild) var guild $1 when Guild: (\w+|\w+\s+\w+)$
		action (guild) on
		send info
		waitfor Debt
		action (guild) off
		if !(%guild = Moon Mage) then 
			{
			echo You're not a Moon Mage. You can't use this script.
			exit
			}
	
Setup:
		if matchre("$scriptlist", "mm_train.cmd") then put #script pause mm_train
		if !def("MM_IS_SETUP") then
				{
				echo This is your first time running the Moon Mage Training script.
				echo All training sections are set to ON by default.
				echo Toggle for the Time Tracker Plugin and Prediction Interpretor are OFF by Default.
				echo These may be toggled ON under the Astrology menu.
				echo To toggle a section OFF, click the menu for the section then click the 'Train' link.
				echo Please set values for variables in all sections.
				put #var MM_TRAIN_MAGIC ON
				put #var MM_TRAIN_ASTROLOGY ON
				put #var MM_TRAIN_MECH ON
				put #var MM_TRAIN_FORAGE ON
				put #var MM_TRAIN_JUGGLE ON
				put #var MM_PREDICT_INTERPRET OFF
				put #var MM_USE_HARNESS ON
				put #var MM_USE_CAMBRINTH ON
				put #var MM_TT_PLUGIN OFF
				
				##Moonmage Triggers for Moon states.
				put #trigger {^Katamba is a.+moon and is not visible\.} {#var moonKatamba Down;#parse @Update Moons}
				put #trigger {^Katamba is nowhere to be seen\.} {#var moonKatamba Down;#parse @Update Moons}
				put #trigger {^Katamba sets, slowly dropping below the horizon\.} {#var moonKatamba Down;#parse @Update Moons}
				put #trigger {^Katamba slowly rises above the horizon\.} {#var moonKatamba Up;#parse @Update Moons}
				put #trigger {^Set within the black disc of the.+is the image} {#var moonKatamba Up;#parse @Update Moons}
				put #trigger {^Set within the black disc of the.+is the outline} {#var moonKatamba Down;#parse @Update Moons}
				put #trigger {^Set within the blue disc of the.+is the image} {#var moonXibar Up;#parse @Update Moons}
				put #trigger {^Set within the blue disc of the.+is the outline} {#var moonXibar Down;#parse @Update Moons}
				put #trigger {^Set within the red disc of the.+is the image} {#var moonYavash Up;#parse @Update Moons}
				put #trigger {^Set within the red disc of the.+is the outline} {#var moonYavash Down;#parse @Update Moons}
				put #trigger {^Xibar is a.+moon and is not visible\.} {#var moonXibar Down;#parse @Update Moons}
				put #trigger {^Xibar is nowhere to be seen\.} {#var moonXibar Down;#parse @Update Moons}
				put #trigger {^Xibar sets, slowly dropping below the horizon\.} {#var moonXibar Down;#parse @Update Moons}
				put #trigger {^Xibar slowly rises above the horizon\.} {#var moonXibar Up;#parse @Update Moons}
				put #trigger {^Yavash is a.+moon and is not visible\.} {#var moonYavash Down;#parse @Update Moons}
				put #trigger {^Yavash is nowhere to be seen\.} {#var moonYavash Down;#parse @Update Moons}
				put #trigger {^Yavash sets, slowly dropping below the horizon\.} {#var moonYavash Down;#parse @Update Moons}
				put #trigger {^Yavash slowly rises above the horizon\.} {#var moonYavash Up;#parse @Update Moons}
				put #trigger {^You're certain that Katamba is} {#var moonKatamba Up;#parse @Update Moons}
				put #trigger {^You're certain that Xibar is} {#var moonXibar Up;#parse @Update Moons}
				put #trigger {^You're certain that Yavash is} {#var moonYavash Up;#parse @Update Moons}
				put #trigger {by a miniature luminescent version of the moon Katamba\.} {#var moonKatamba Up;#var moonYavash Down;#var moonXibar Down;#parse @Update Moons}
				put #trigger {by a miniature luminescent version of the moon Xibar\.} {#var moonXibar Up;#var moonKatamba Down;#var moonYavash Down;#parse @Update Moons}
				put #trigger {by a miniature luminescent version of the moon Yavash\.} {#var moonYavash Up;#var moonKatamba Down;#var moonXibar Down;#parse @Update Moons}
				put #trigger {by three miniature luminescent versions of the moons Katamba, xibar, and Yavash\.} {#var moonKatamba Up;#var moonYavash Up;#var moonXibar Up;#parse @Update Moons}
				put #trigger {by three miniature luminescent versions of the moons Katamba, Yavash, and Xibar\.} {#var moonKatamba Up;#var moonYavash Up;#var moonXibar Up;#parse @Update Moons}
				put #trigger {by three miniature luminescent versions of the moons Xibar, Katamba, and Yavash\.} {#var moonKatamba Up;#var moonYavash Up;#var moonXibar Up;#parse @Update Moons}
				put #trigger {by three miniature luminescent versions of the moons Xibar, Yavash, and Katamba\.} {#var moonKatamba Up;#var moonYavash Up;#var moonXibar Up;#parse @Update Moons}
				put #trigger {by three miniature luminescent versions of the moons Yavash, Katamba, and Xibar\.} {#var moonKatamba Up;#var moonYavash Up;#var moonXibar Up;#parse @Update Moons}
				put #trigger {by three miniature luminescent versions of the moons Yavash, Xibar, and Katamba\.} {#var moonKatamba Up;#var moonYavash Up;#var moonXibar Up;#parse @Update Moons}
				put #trigger {by three translucent spheres that seem to drift about without purpose or reason\.} {#var moonKatamba Down;#var moonYavash Down;#var moonXibar Down;#parse @Update Moons}
				put #trigger {by two miniature luminescent versions of the moons Katamba and Xibar\.} {#var moonXibar Up;#var moonKatamba Up;#var moonYavash Down;#parse @Update Moons}
				put #trigger {by two miniature luminescent versions of the moons Katamba and Yavash\.} {#var moonYavash Up;#var moonKatamba Up;#var moonXibar Down;#parse @Update Moons}
				put #trigger {by two miniature luminescent versions of the moons Xibar and Katamba\.} {#var moonXibar Up;#var moonKatamba Up;#var moonYavash Down;#parse @Update Moons}
				put #trigger {by two miniature luminescent versions of the moons Xibar and Yavash\.} {#var moonXibar Up;#var moonYavash Up;#var moonKatamba Down;#parse @Update Moons}
				put #trigger {by two miniature luminescent versions of the moons Yavash and Katamba\.} {#var moonYavash Up;#var moonKatamba Up;#var moonXibar Down;#parse @Update Moons}
				put #trigger {by two miniature luminescent versions of the moons Yavash and Xibar\.} {#var moonXibar Up;#var moonYavash Up;#var moonKatamba Down;#parse @Update Moons}
				}
		var MAIN Magic|Astrology|Extra|Done
		var ASTROLOGY Train Astrology|CV Prep|PG Prep|Divination Tool|Deal Times|TT Plugin|Predict Interpret|Wait Mode|Wait Script|Back
		var MAGIC Train Magic|Warding Spell|Warding Prep|Augmentation Spell|Augmentation Prep|Utility Spell|Utility Prep|Harness|Use Harness|Cambrinth|Charge|Use Cambrinth|Back
		var EXTRA Train Mech|Mech Material|Train Forage|Collect Item|Train Juggle|Jugglie|Back
		var TOGGLES TRAIN|PREDICT|USE|PLUGIN
		var MENU_WINDOW Moonmage Training Menu
		var CV_PREP_DESC This is the mana amount to prepare the Clear Vision Spell during the Astrology section.
		var PG_PREP_DESC This is the mana amount to prepare the Piercing Gaze Spell during the Astrology section.
		var DIVINATION_TOOL_DESC This is the method used to make predicitons. The standard form is 'visions'.
		var DEAL_TIMES_DESC This is how many cards to deal from your Tokka Deck for predicitons. Must be between 3 and 6.
		var TT_PLUGIN_DESC This toggles the script to utilize the Time and Moon Tracker plugin. Leave this to OFF if you do not have this plugin.
		var PREDICT_INTERPRET_DESC This toggles the optional Prediction Interpreter code ON or OFF. To utilize this, you must have the file downloaded and set to be included in the Includes section of the script.
		var WAIT_MODE_DESC This sets an option to perform other various tasks during the cooldown on observations. The current options are: juggle (practices with juggling), sigil (studies sigils in sigilbooks- Must have a book with sigils scribed!) and script (must set the 'Wait Script' variable!).
		var WAIT_SCRIPT_DESC This is the name (note the filename ONLY) of the script to run during the observation cooldown.
		var WARDING_SPELL_DESC This spell will be used to train Warding. Possible spells are: Psychic Shield [psy], Cage of Light [col]
		var WARDING_PREP_DESC This is the mana amount to prepare the Warding Spell during the Magic section.
		var AUGMENTATION_SPELL_DESC This spell will be used to train Augmentation. Possible spells are: Clear Vision [cv], Piercing Gaze [pg], Aura Sight [aus], Tenebrous Sense [ts], Shadows, Seer's Sense [seer]
		var AUGMENTATION_PREP_DESC This is the mana amount to prepare the Augmentation Spell during the Magic section.
		var UTILITY_SPELL_DESC This spell will be used to train Utility. Possible spells are: Refractive Field [rf], Steps of Vaun [sov], Shadowing, Shadow Servant [ss], Contingency, Seer's Sense [seer]
		var UTILITY_PREP_DESC This is the mana amount to prepare the Utility Spell during the Magic section.
		var HARNESS_DESC This is the mana amount to harness before casting spells during the Magic section.
		var USE_HARNESS_DESC This toggles whether or not to utilize harnessed mana during the Magic section.
		var CAMBRINTH_DESC This is the noun of the cambrinth item you wish to use during the Magic section.
		var CHARGE_DESC This is the amount of mana to charge your cambrith item with during the Magic section.
		var USE_CAMBRINTH_DESC This toggles whether or not to utilize cambrinth during the Magic section.
		var TRAIN_MECH_DESC This toggles whether or not to train Mechanical Lore while other experience drains.
		var MECH_MATERIAL_DESC This is the material utilize for braiding during Mechanical Lore training, ie.: grass, vines, etc.
		var TRAIN_FORAGE_DESC This toggles whether to train Outdoorsmanship through collecting while other experience drains.
		var COLLECT_ITEM_DESC This is the material collected during Outdoorsmanship training. ie.: rock, branch, vine, etc.
		var TRAIN_JUGGLE_DESC This toggles whether to train Perception through juggline while other experience drains.
		var JUGGLIE_DESC This is the noun of the juggle item you wish to use to train Perception.
		put #var selection MAIN
		
		pause 1
		echo
		echo ################
		put #echo cyan All typed user input MUST be preceeded by tilde (~) character.
		echo ################

MenuDisplay:
		var last.selection $selection
		counter set 0
		pause 0.3
		gosub Menu.Build "%$selection" "selection" "continue.script" "" "%MENU_WINDOW"
		waitforre continue.script
		put #var selection {#eval toupper("$selection")}
		if $selection = BACK then
			{
			put #var selection MAIN
			goto MenuDisplay
			}
		if $selection = DONE then gosub CheckVars "%MAGIC|%ASTROLOGY|%EXTRA"
		if ($selection = MAGIC || $selection = ASTROLOGY || $selection = EXTRA) then goto MenuDisplay
		if $selection = DIVINATION TOOL then
			{
			send #echo ">%this.window" cyan Possible values for $selection are:
			send #echo ">%this.window" cyan prism, bowl, mirror, deck, bones, chart, visions
			}
		put #var selection {#eval replacere("$selection", " ", "_")}
		gosub GlobalSet "%$selection_DESC"
		
CheckVars:
		var SETTABLES $1
		eval SETTABLES toupper("%SETTABLES")
		eval SETTABLES replacere("%SETTABLES", " ", "_")
		eval SET_AMOUNT count("%SETTABLES", "|")
		var UNSET
	  if %c > %SET_AMOUNT then
	  	{
	  	if (count("%UNSET", "|") > 0) then
	  		{
	  		counter set 0
	  		eval UNSET replacere("%UNSET", "^|", "")
	  		eval UNSET_AMOUNT count("%UNSET", "|")
	  		eval UNSET replacere("%UNSET", "_", " ")
	  		put #echo cyan You are missing the following Globals. Please set them before continuing!
	  		goto Missing.Globals
	  		}
			put #var MM_IS_SETUP 1
			put #window remove "Moonmage Training Menu"
			put #echo cyan Script setup complete. Run default values with the command '.mm_train'
			put #echo cyan To run the setup again, run the command '.mm_train setup'
			if matchre("$scriptlist", "mm_train.cmd") then put #script resume mm_train
			exit
			}
			goto CheckGlobal

CheckGlobal:
		if !(def("MM_%SETTABLES(%c)") || (%SETTABLES(%c) = BACK)) then var UNSET %UNSET|%SETTABLES(%c)
		counter add 1
		if %c > %SET_AMOUNT then goto CheckVars
		goto CheckGlobal

Missing.Globals:
		put #echo lime %UNSET(%c)
		counter add 1
		if %c < %UNSET_AMOUNT then goto Missing.Globals
		put #var selection MAIN
		goto MenuDisplay
		
exit

Menu.Build:
##Menu Building Routine
##Function - Builds a numbered menu of options in link format that saves option information into a variable.
##pre - First parameter must be an array of the option names/values. Second parameter is the name of the
##	target global variable to store the result of the link click. Third parameyer is a string
##	that will be parsed to continue the script after the menu item has been selected. Fourth parameter
##	is a string or array of items that are exceptions to be excluded from the menu list. Fifth parameter is a
##	window name to echo output to (leave out to echo to Game window).
##post - Value of clicked link is stored in target global variable.

		action (input) var input $1;put #parse input.done when ~(.*)

		if !%c then
				{		
				var this.array $1
				var target.variable $2
				var script.trigger $3
				var exceptions $4
				if !($5 = "") then 
						{
						var this.window $5
						put #window add "%this.window"
						put #window open "%this.window"
						put #clear %this.window
						send #echo ">%this.window" cyan $selection Menu
						send #echo ">%this.window"
						}
				else var this.window Game
				var this.option 0
				eval array.length count("%this.array","|")
				}
		if %c > %array.length then
				{
				var this.option 0
				counter set 0
				return
				}
		var this.choice %this.array(%c)
		if matchre("%exceptions","%this.choice") then
				{
				counter add 1
				goto menu.build
				}
		counter add 1
		math this.option add 1
		send #link ">%this.window" "%this.option. - %this.choice" "#var %target.variable %this.choice;#parse %script.trigger"
		goto menu.build
		
GlobalSet:
		put #clear "%this.window"
		var extra_message $1
		action (input) on
		if matchre("$selection", "%TOGGLES") then goto TOGGLE
		if !(%extra_message = "") then put #echo ">%this.window" cyan %extra_message
		put #echo ">%this.window" cyan Enter value for $selection:
		waitforre input.done
		put #var MM_$selection %input
		action (input) off
		put #clear "%this.window"
		put #echo ">%this.window" cyan $selection has been set to: %input
		put #echo ">%this.window"
		send #link ">%this.window" "Click to continue..." "#parse %script.trigger"
		waitforre %script.trigger
		put #var selection %last.selection
		goto MenuDisplay
		
Toggle:
		if $MM_$selection = ON then var TOGGLE_TO OFF
		else var TOGGLE_TO ON
		action (input) on
		pause 0.3
		send #clear "%this.window"
		pause 0.3
		if !(%extra_message = "") then put #echo ">%this.window" cyan %extra_message
		send #echo ">%this.window" cyan Variable $selection is currently set to $MM_$selection.
		send #echo ">%this.window" cyan Do you want to change it to %TOGGLE_TO?
		send #echo ">%this.window"
		send #link ">%this.window" "Yes" "#clear >%this.window;#echo $selection has been set to %TOGGLE_TO;#var MM_$selection %TOGGLE_TO;#var selection %last.selection;#parse %script.trigger"
		send #link ">%this.window" "No" "#clear >%this.window;#echo No changes made, returning to menu.;#var selection %last.selection;#parse %script.trigger"
		waitforre %script.trigger
		put #clear "%this.window"
		send #link ">%this.window" "Click to continue..." "#parse %script.trigger" 
		waitforre %script.trigger
		goto MenuDisplay