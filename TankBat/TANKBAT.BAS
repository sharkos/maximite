Rem
Rem Tank Battle - Maximite Edition
Rem (C)opyright 2013, Chris Tusa / Leafscale, Inc.
Rem see TXT file for instructions and license
Rem
Rem *** THIS PROGRAM IS INCOMPLETE ***

Cls
Mode 4
Line (2,15)-(238,15), 4
Line (2,200)-(238,200), 4
Line (2,15)-(2,200), 4
Line (238,15)-(238,200), 4
Print @(0,0)CLR$(Yellow,Red)+" Tank Battle           Maximite Edition "
Print @(0,204)CLR$(White,Red)+"                                        "
Print @(0,204)CLR$(White,Red)+"Left: 000                     Right: 000"
Sprite Load "TANKBAT.SPR"

Init:
Rem Left Tank Coordinates
LTX = 5
LTY = 100

Rem Right Tank Coordinates
RTX = 220
RTY = 100

Sprite ON 1, LTX, LTY
Sprite ON 2, RTX, RTY

Pause 5000



