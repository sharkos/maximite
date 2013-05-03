REM This program is used to validate the Joystick Breakout box
REM see article on http://christusa.wordpress.com
REM
SetPin 11, 2
SetPin 12, 2
SetPin 13, 2
SetPin 14, 2
SetPin 15, 2
L = 0
Cls
Print @(1,1)"Joystick Breakout Box - TEST"
Do
P11 = Pin(11)
P12 = Pin(12)
P13 = Pin(13)
P14 = Pin(14)
P15 = Pin(15)

Print @(1,10)"   UP pin11 = "+Str$(P11)
Print @(1,20)" DOWN pin12 = "+Str$(P12)
Print @(1,30)" LEFT pin13 = "+Str$(P13)
Print @(1,40)"RIGHT pin14 = "+Str$(P14)
Print @(1,50)" FIRE pin15 = "+Str$(P15)
Loop Until L = 1
