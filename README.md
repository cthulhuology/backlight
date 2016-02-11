backlight
---------

This is a utility I wrote to control the brightness of my screen on my laptop. 
My laptop is running a i915 as it's primary graphics processor, and if you 
want to use it you may need to edit and rebuild.

To build using SwiftForth:

	sf brightness.f
	sudo chown root:root brightness
	sudo chmod u+s brightness

If you want to use xbindkeys to map them to your keyboard fn keys

	cp xbindkeysrc ~/.xbindkeysrc
	
and add 
	
	xbindkeys

to your .xsessionrc or .xinitrc.

*NB: This has only been tested on a Razer Blade 14" (2015) running SteamOS brewmaster.*

