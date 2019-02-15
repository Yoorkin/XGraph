VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "XThickness"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Implements XLoaction
Private L As Long, T As Long, B As Long, R As Long
Public Event Change()

Friend Sub Create(Left As Long, Top As Long, Bottom As Long, Right As Long)
    L = Left: T = Top: B = Bottom: R = Right
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
Public Property Get Bottom() As Long
    Bottom = B
End Property
Public Property Let Bottom(Value As Long)
    B = Value
    RaiseEvent Change
End Property
Public Property Get Right() As Long
    Right = R
End Property
Public Property Let Right(Value As Long)
    R = Value
    RaiseEvent Change
End Property
Public Function Clone() As XThickness
    Set Clone = New XThickness
    Clone.Create L, T, B, R
End Function

Private Function XLoaction_GetType() As Long
    XLoaction_GetType = LoactionType.LoactionMarign
End Function

