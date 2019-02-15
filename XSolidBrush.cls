VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "XSolidBrush"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Private Declare Function GdipCreateSolidFill _
               Lib "gdiplus" (ByVal argb As Long, _
                              Brush As Long) As GpStatus
Private Declare Function GdipDeleteBrush Lib "gdiplus" (ByVal Brush As Long) As GpStatus
Private Declare Function GdipCloneBrush Lib "gdiplus" (ByVal Brush As Long, cloneBrush As Long) As GpStatus
Private Declare Function GdipSetSolidFillColor Lib "gdiplus" (ByVal Brush As Long, ByVal argb As Long) As GpStatus

Implements XTool
Implements XBrush
Implements IDispose

Private h As Long
Private WithEvents c As XColor
Attribute c.VB_VarHelpID = -1
Public Event Change()

Friend Sub Create(Color As XColor)
    XGraphModule.InitGdip
    GdipCreateSolidFill Color.Code, h
    Set c = Color
End Sub

Public Property Get Color() As XColor
    Set Color = c
End Property
Public Property Set Color(Value As XColor)
    Set c = Color
    RaiseEvent Change
End Property

Private Sub c_Change()
    GdipSetSolidFillColor h, c.Code
    RaiseEvent Change
End Sub

Private Property Get XBrush_Handle() As Variant
    XBrush_Handle = h
End Property

Private Property Get XTool_Handle() As Long
    XTool_Handle = h
End Property

Friend Property Let Handle(Value As Long)
    h = Value
End Property
 

Public Function Clone() As XSolidBrush
    Set Clone = New XSolidBrush
    Dim ch As Long
    GdipCloneBrush h, ch
    Clone.Handle = ch
End Function

Private Sub IDispose_Dispose()
    GdipDeleteBrush h
    XGraphModule.TerminateGdip
End Sub

Private Sub Class_Terminate()
    IDispose_Dispose
End Sub
