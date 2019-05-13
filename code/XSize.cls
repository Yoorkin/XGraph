VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "XSize"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Private h As Long, W As Long
Public Event Change()

Friend Sub Create(Height As Long, Width As Long)
    h = Height: W = Width
End Sub

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
Public Function Clone() As XSize
    Set Clone = New XSize
    Clone.Create h, W
End Function
