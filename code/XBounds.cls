VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "XBounds"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Implements XLoaction
Private L As Long, T As Long, h As Long, W As Long
Public Event Change()

Friend Sub Create(Left As Long, Top As Long, Height As Long, Width As Long)
    L = Left: T = Top: h = Height: W = Width
End Sub

Public Property Get Left() As Long
    Left = L
End Property
Public Property Let Left(Value As Long)
    L = Value
    RaiseEvent Change
End Property
Public Property Get Top() As Long
    Top = T
End Property
Public Property Let Top(Value As Long)
    T = Value
    RaiseEvent Change
End Property
Public Property Get Height() As Long
    Height = h
End Property
Public Property Let Height(Value As Long)
    h = Value
    RaiseEvent Change
End Property
Public Property Get Width() As Long
    Width = W
End Property
Public Property Let Width(Value As Long)
    W = Value
    RaiseEvent Change
End Property
Public Property Get Bottom() As Long
    Bottom = T + h
End Property
Public Property Get Right() As Long
    Right = L + W
End Property

Private Function XLoaction_GetType() As Long
    XLoaction_GetType = LoactionType.LoactionBounds
End Function

