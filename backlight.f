
empty

0 value max-brightness
0 value current-brightness

: max-brightness-file
	s" /sys/class/backlight/intel_backlight/max_brightness" R/O open-file
	if ." failed to open max_brightness " bye then ;

: read-max-brightness
	0.
	pad 80 max-brightness-file read-file 
	if ." read from max_brightness failed " bye then 
	1 - pad swap >number 3drop to max-brightness ;

: current-brightness-file
	s" /sys/class/backlight/intel_backlight/brightness" R/O open-file
	if ." failed to open brightness" bye then ;

: read-current-brightness
	0.
	pad 80 current-brightness-file read-file
	if ." read from current brightness failed " bye then
	1 - pad swap >number 3drop to current-brightness ;

: step max-brightness 10 / ;

: up current-brightness step + max-brightness min ;
: down current-brightness step - 0 max ;


: set-brightness-file
	s" /sys/class/backlight/intel_backlight/brightness" W/O open-file
	if ." failed to open brightness for writing" bye then ;
	

: set-brightness
	0 <# #s #> set-brightness-file write-file
	if ." failed to set brightness " then ;

: action 1 argv ;

: go
	read-max-brightness
	read-current-brightness 
	action s" up" compare 0= if up set-brightness bye then
	action s" down" compare 0= if down set-brightness  bye then
	." unknown action: " action type cr
	." usage: brightness [up|down]" cr
;

' go 'main !
program brightness
bye
