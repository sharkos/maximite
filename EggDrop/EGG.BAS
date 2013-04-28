Rem
Rem Egg Drop for Maximite Colour
Rem (C)opyright 2013, Chris Tusa <christusa@leafscale.com>
Rem Creative Commons Attribution-Non Commercial Share ALike 3.0 Unported
Rem

Cls
Mode 4
Line (0,15)-(240,15), 1
Line (0,200)-(240,200), 1
Print @(0,1)CLR$(Cyan,Blue)+" Egg Drop  (C)opyright 2012, Chris Tusa "
Print @(0,202)CLR$(Cyan,Blue)+"                                        "

Sprite Load "EGG.SPR"

Init:
 Randomize Timer
 Do While Inkey$ = ""
  Colour Int(Rnd(1) * 8),0
  Print @(50,100)"Press any key to start"
  Pause 50
 Loop
  Color 7,0
  Print @(50,100)"                      "

Rem Set Maximum Y for Egg Falling
 MAXY = 160
Rem Set Maximum X for Basket Moving
 MAXX = 240
Rem Basket Starting Area
 BSX = 120
 BSY = 180
Rem EGG Starting Area
 ESX = 0
 ESY = 20

Rem Maximum Number of eggs that can be dropped
 EGGS = 5
Rem Total number of eggs Dropped
 Counter = 0
Rem Current number of eggs collected
 Score = 0
Rem Current number of eggs broken
 Broken = -1
Rem Speed Setting
 Speed = 5
Rem Boolean for loop to determine if Egg was caught
 Caught = 0

Do While Broken < EGGS
 Print @(80,202) CLR$(Cyan,Blue)+"Score: "+Str$(Score)
 Print @(160,202) CLR$(Cyan,Blue)+"Speed: "+Str$(Speed)

 If Caught = 1 Then
   Score = Score + 1
   EggBasket
   Caught = 0
 ElseIf Caught = 0 Then
   Broken = Broken + 1
   Print @(1,202) CLR$(Cyan,Blue)+"Break: "+Str$(Broken)
   EggBreak
 EndIf
 ESY = 20
 ESX = Int(Rnd(1) * 180 + 1)
 Sprite ON 1, ESX, ESY, Black
 Sprite ON 2, BSX, BSY, Black

 DROP = 1
 Do
  If Collision(2,SPRITE) = &B0100 Then
   Caught = 1
   Speed = Speed + .2
  EndIf


  ESY = ESY + (.01 * SPEED)

  Sprite MOVE 1, ESX, ESY
  K = KeyDown
  If K = 130 Then
   BSX = BSX - 1
   If BSX > MaxX Then BSX = BSX - 1
   Sprite MOVE 2, BSX, BSY
  EndIf
  If K = 131 Then
   BSX = BSX + 1
   If BSX < 1 Then BSX = BSX + 1
   Sprite MOVE 2, BSX, BSY
  EndIf
  If K = 27 Then GoTo Abort

  If ESY >= (MAXY + 5) Then DROP = 0
 Loop Until DROP = 0

 Sprite OFF ALL
 Counter = Counter + 1
Loop

GoTo Init

Rem Egg Break Sound
Sub EggBreak
 For S = 200 To 9000 Step 100
  PWM S
  Pause 2
  PWM (S + 100)
  Pause 2
  PWM (S - 100)
 Next
 PWM STOP
End Sub

Rem Make Egg in Basket Sound
Sub EggBasket
  For S = 500 To 1500 Step 20
   PWM S
   Pause 1
   PWM (S - 25)
   Pause 1
  Next
  PWM STOP
End Sub

Abort:
Print "ABORTING!"
Clear
End



