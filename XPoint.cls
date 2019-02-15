VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "XPoint"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Private px As Long, py As Long
Public Event Change()

Friend Sub Create(X As Long, Y As Long)
    px = X: py = Y
End Sub

Public Property Get X() As Long
    X = px
End Property
Public Property Let X(Value As Long)
    px = Value
    RaiseEvent Change
End Property
Public Property Get Y() As Long
    Y = py
End Property
Public Property Let Y(Value As Long)
    py = Value
    RaiseEvent Change
End Property
Public Function Clone() As XPoint
    Set Clone = New XPoint
    Clone.Create px, py
End Function

