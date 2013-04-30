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
Rem --- Tank 1 Setup
TANK1.X = 5
TANK1.Y = 100
Rem Assign Sprite to Direction of tank. subscript = Dir, Assignment = Sprite #
Rem 0=N, 1=NW, 2=W, 3=SW, 4=S, 5=SE, 6=E, 7=NE, 8=HIT, 9=KILL
Dim TANK1.S(9)
 TANK1.S(0) = 1
 TANK1.S(1) = 2

Rem --- Tank 2 Setup
TANK2.X = 220
TANK2.Y = 100
Rem Assign Sprite to Direction of tank. subscript = Dir, Assignment = Sprite #
Rem 0=N, 1=NW, 2=W, 3=SW, 4=S, 5=SE, 6=E, 7=NE, 8=HIT, 9=KILL
Dim TANK2.S(9)
 TANK2.S(0) = 3
 TANK2.S(1) = 4

Sprite ON 1, TANK1.X, TANK1.Y
Sprite ON 2, TANK2.X, TANK2.Y

TERM = 0
Do
 K = KeyDown
   Rem --- Left Arrow
   If K = 130 Then
     TurnTank(1,"Left")
   EndIf
   Rem --- Right Arrow
   If K = 131 Then
     TurnTank(1,"Right")
   EndIf
   Rem --- Up Arrow
   If K = 128 Then
     MoveTank(1,"Forward")
   EndIf
   Rem --- Down Arrow
   If K = 129 Then
     MoveTank(1,"Reverse")
   EndIf
Loop Until TERM$ = 1

Pause 5000

Rem --- Tank Rotation: [1,2], [Left, Right]
Sub TurnTank(Num,Dir$)
End Sub
Rem -- Move Tank: [1,2], [Forward, Reverse]
Sub MoveTank(Num,Dir$)
Mode 3
