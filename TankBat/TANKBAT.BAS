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
Rem --- Tank 1 Setup : X,Y = Coords, H=Heading (0-7)
TANK1.X = 5
TANK1.Y = 100
TANK1.H = 2
Rem Assign Sprite to Direction of tank. subscript = Dir, Assignment = Sprite #
Rem 0=N, 1=NE, 2=E, 3=SE, 4=S, 5=SW, 6=W, 7=NW, 8=HIT, 9=KILL
Dim TANK1.S(9)
 TANK1.S(0) = 1
 TANK1.S(1) = 2


Rem --- Tank 2 Setup : X,Y = Coords, H=Heading (0-7)
TANK2.X = 220
TANK2.Y = 100
TANK2.H = 6
Rem Assign Sprite to Direction of tank. subscript = Dir, Assignment = Sprite #
Rem 0=N, 1=NE, 2=E, 3=SE, 4=S, 5=SW, 6=W, 7=NW, 8=HIT, 9=KILL
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
Loop Until TERM = 1

Pause 5000

Rem --- Tank Rotation: [1,2], [Left, Right]
Rem     0=N, 1=NE, 2=E, 3=SE, 4=S, 5=SW, 6=W, 7=NW
Sub TurnTank(Num,Dir$)

 If Num = 1 Then
  Sprite OFF Int(TANK1.H)
  If Dir$ = "Left" Then
   If TANK1.H <= 0 Then
     TANK1.H = 7
   Else
     TANK1.H = TANK1.H - 1
   EndIf
  ElseIf Dir$ = "Right" Then
   If TANK1.H >= 7 Then
     TANK1.H = 0
   Else
     TANK1.H = TANK1.H + 1
   EndIf
  EndIf
  Sprite ON TANK1.S(Int(TANK1.H)), TANK1.X, TANK1.Y
 ElseIf Num = 2 Then
  Sprite OFF Int(TANK2.H)
  If Dir$ = "Left" Then
   If TANK2.H <= 0 Then
     TANK2.H = 7
   Else
     TANK2.H = TANK2.H - 1
   EndIf
  ElseIf Dir$ = "Right" Then
   If TANK2.H >= 7 Then
     TANK2.H = 0
   Else
     TANK2.H = TANK2.H + 1
   EndIf
  EndIf
  Sprite ON TANK2.S(Int(TANK2.H)), TANK2.X, TANK2.Y
 EndIf

End Sub

Rem -- Move Tank: [1,2], [Forward, Reverse]
Sub MoveTank(Num,Dir$)

End Sub
Mode 3
