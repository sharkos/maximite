Cls
Input "Name: ";N$
WaveChoice:
Input "Use [1] Sine Wave  [2] Cosine Wave : "; WaveType
Cls
If WaveType = 1 Then
 For A = 0 To 6.3 Step .2
  Y = Sin(A)
  Print Tab(15 * Y + 20); N$
 Next A
ElseIf WaveType = 2 Then
 For X = 1 To 5
 For A = 0 To 6.3 Step .2
  Y = Cos(A)
  Print Tab(15 * Y + 20); N$
 Next A
 Next X
Else
 GoTo WaveChoice
EndIf
 GoTo WaveChoice

