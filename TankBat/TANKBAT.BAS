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
TANKSPACER = 2
Rem --- Tank 1 Setup : X,Y = Coords, H=Heading (0-7)
TANK1.X = 5
TANK1.Y = 100
TANK1.H = 2
Rem Assign Sprite to Direction of tank. subscript = Dir, Assignment = Sprite #
Rem 0=N, 1=NE, 2=E, 3=SE, 4=S, 5=SW, 6=W, 7=NW,
Rem 8=HIT-1, 9=HIT-2, 10=HIT-3, 11=HIT-4, 12=KILL, 13=SHELL-1, 14=SHELL-2
Dim TANK1.S(15)
 TANK1.S(0) = 3
 TANK1.S(1) = 2
 TANK1.S(2) = 1
 TANK1.S(3) = 8
 TANK1.S(4) = 7
 TANK1.S(5) = 6
 TANK1.S(6) = 5
 TANK1.S(7) = 4
 TANK1.S(8) = 9
 TANK1.S(9) = 10
 TANK1.S(10) = 11
 TANK1.S(11) = 12
 TANK1.S(12) = 13
 TANK1.S(13) = 27
 TANK1.S(14) = 28

Rem --- Tank 2 Setup : X,Y = Coords, H=Heading (0-7)
TANK2.X = 220
TANK2.Y = 100
TANK2.H = 6
Rem Assign Sprite to Direction of tank. subscript = Dir, Assignment = Sprite #
Rem 0=N, 1=NE, 2=E, 3=SE, 4=S, 5=SW, 6=W, 7=NW, 8=HIT-1, 9=HIT-2, 10=HIT-3, 11=HIT-4, 12=KILL
Dim TANK2.S(15)
 TANK2.S(0) = 16
 TANK2.S(1) = 15
 TANK2.S(2) = 14
 TANK2.S(3) = 21
 TANK2.S(4) = 20
 TANK2.S(5) = 19
 TANK2.S(6) = 18
 TANK2.S(7) = 17
 TANK2.S(8) = 22
 TANK2.S(9) = 23
 TANK2.S(10) = 24
 TANK2.S(11) = 25
 TANK2.S(12) = 26
 TANK2.S(13) = 29
 TANK2.S(14) = 30


Sprite ON TANK1.S(Int(TANK1.H)), TANK1.X, TANK1.Y
Sprite ON TANK2.S(Int(TANK2.H)), TANK2.X, TANK2.Y

TERM = 0
Do
Rem K = KeyDown
 K = Asc(Inkey$)
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
   Rem --- 'a' Key
   If K = 97 Then
     TurnTank(2, "Left")
   EndIf
   Rem --- 'd' Key
   If K = 100 Then
     TurnTank(2, "Right")
   EndIf
   Rem --- 'w' Key
   If K = 119 Then
     MoveTank(2, "Forward")
   EndIf
   Rem --- 's' Key
   If K = 115 Then
     MoveTank(2, "Reverse")
   EndIf


Loop Until TERM = 1

Pause 5000

Rem --- Tank Rotation: [1,2], [Left, Right]
Rem     0=N, 1=NE, 2=E, 3=SE, 4=S, 5=SW, 6=W, 7=NW
Sub TurnTank(Num,Dir$)

 If Num = 1 Then
  Sprite OFF TANK1.S(Int(TANK1.H))
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
  Sprite OFF TANK2.S(Int(TANK2.H))
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
Rem     0=N, 1=NE, 2=E, 3=SE, 4=S, 5=SW, 6=W, 7=NW
Sub MoveTank(Num,Dir$)
 If Num = 1 Then
   If Dir$ = "Forward" Then
     If TANK1.H = 0 Then
       TANK1.Y = TANK1.Y - TANKSPACER
     ElseIf TANK1.H = 1 Then
       TANK1.X = TANK1.X + TANKSPACER
       TANK1.Y = TANK1.Y - TANKSPACER
     ElseIf TANK1.H = 2 Then
       TANK1.X = TANK1.X + TANKSPACER
     ElseIf TANK1.H = 3 Then
       TANK1.X = TANK1.X + TANKSPACER
       TANK1.Y = TANK1.Y + TANKSPACER
     ElseIf TANK1.H = 4 Then
       TANK1.Y = TANK1.Y + TANKSPACER
     ElseIf TANK1.H = 5 Then
       TANK1.X = TANK1.X - TANKSPACER
       TANK1.Y = TANK1.Y + TANKSPACER
     ElseIf TANK1.H = 6 Then
       TANK1.X = TANK1.X - TANKSPACER
     ElseIf TANK1.H = 7 Then
       TANK1.X = TANK1.X - TANKSPACER
       TANK1.Y = TANK1.Y - TANKSPACER
     EndIf
   ElseIf Dir$ = "Reverse" Then
     If TANK1.H = 0 Then
       TANK1.Y = TANK1.Y + TANKSPACER
     ElseIf TANK1.H = 1 Then
       TANK1.X = TANK1.X - TANKSPACER
       TANK1.Y = TANK1.Y + TANKSPACER
     ElseIf TANK1.H = 2 Then
       TANK1.X = TANK1.X - TANKSPACER
     ElseIf TANK1.H = 3 Then
       TANK1.X = TANK1.X - TANKSPACER
       TANK1.Y = TANK1.Y - TANKSPACER
     ElseIf TANK1.H = 4 Then
       TANK1.Y = TANK1.Y - TANKSPACER
     ElseIf TANK1.H = 5 Then
       TANK1.X = TANK1.X + TANKSPACER
       TANK1.Y = TANK1.Y - TANKSPACER
     ElseIf TANK1.H = 6 Then
       TANK1.X = TANK1.X + TANKSPACER
     ElseIf TANK1.H = 7 Then
       TANK1.X = TANK1.X + TANKSPACER
       TANK1.Y = TANK1.Y + TANKSPACER
     EndIf
   EndIf
   Rem --- Test to make sure tank does not move out of bounds:
   If TANK1.X > 224 Then TANK1.X = TANK1.X - TANKSPACER
   If TANK1.X < 1 Then TANK1.X = TANK1.X + TANKSPACER
   If TANK1.Y > 186 Then TANK1.Y = TANK1.Y - TANKSPACER
   If TANK1.Y < 15 Then TANK1.Y = TANK1.Y + TANKSPACER


   Sprite MOVE TANK1.S(Int(TANK1.H)), TANK1.X, TANK1.Y
 ElseIf Num = 2 Then
 EndIf
End Sub
Mode 3


