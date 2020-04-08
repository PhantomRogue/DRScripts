action var target $1;var recalc.target 1 when are facing (?:a|an)(.*) (?:\(\d\)\s) 

ASSESS:
	matchre SET_ASSESS are facing (?:a|an)(.*) (?:\(\d\)\s) 
	matchre SET_ASSESS are behind (?:a|an)(.*) (?:\(\d\)\s) 
	matchre SET_ASSESS are flanking (?:a|an)(.*) (?:\(\d\)\s) 
	put assess
	matchwait 15

SET_ASSESS:
	echo $1
	echo $2
	echo %target
	echo %recalc.target