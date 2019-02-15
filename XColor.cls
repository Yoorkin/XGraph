VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "XColor"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Private c As Long
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (Destination As Any, source As Any, Optional ByVal length As Long = 4)
Public Event Change()

Friend Sub Create(R As Byte, G As Byte, B As Byte, A As Byte)
    CopyMemory ByVal VarPtr(c) + 3, A, 1
    CopyMemory ByVal VarPtr(c) + 2, R, 1
    CopyMemory ByVal VarPtr(c) + 1, G, 1
    CopyMemory ByVal VarPtr(c), B, 1
End Sub
Friend Sub CreateFromCode(Code As Long)
    c = Code
End Sub
Friend Sub CreateWithAlpha(Code As Long, Alpha As Long)
    CopyMemory ByVal VarPtr(Code) + 3, Alpha, 1
    c = Code
End Sub

Public Property Get Code() As Long
Attribute Code.VB_UserMemId = 0
    Code = c
End Property
Public Property Let Code(Value As Long)
    c = Value
    RaiseEvent Change
End Property

Public Property Get Alpha() As Byte
    CopyMemory Alpha, ByVal VarPtr(c) + 3, 1
End Property
Public Property Let Alpha(Value As Byte)
    CopyMemory ByVal VarPtr(c) + 3, Value, 1
    RaiseEvent Change
End Property
Public Property Get Red() As Byte
    CopyMemory Red, ByVal VarPtr(c) + 2, 1
End Property
Public Property Let Red(Value As Byte)
    CopyMemory ByVal VarPtr(c) + 2, Value, 1
    RaiseEvent Change
End Property
Public Property Get Green() As Byte
    CopyMemory Green, ByVal VarPtr(c) + 1, 1
End Property
Public Property Let Green(Value As Byte)
    CopyMemory ByVal VarPtr(c) + 1, Value, 1
    RaiseEvent Change
End Property
Public Property Get Blue() As Byte
    CopyMemory Blue, ByVal VarPtr(c), 1
End Property
Public Property Let Blue(Value As Byte)
    CopyMemory ByVal VarPtr(c), Value, 1
    RaiseEvent Change
End Property
