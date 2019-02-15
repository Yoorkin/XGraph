VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "XPen"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Private Declare Function GdipCreatePen1 _
               Lib "gdiplus" (ByVal Color As Long, _
                              ByVal Width As Single, _
                              ByVal unit As GpUnit, _
                              Pen As Long) As GpStatus
Private Declare Function GdipDeletePen Lib "gdiplus" (ByVal Pen As Long) As GpStatus

Private Declare Function GdipSetPenWidth _
               Lib "gdiplus" (ByVal Pen As Long, _
                              ByVal Width As Single) As GpStatus
Private Declare Function GdipGetPenWidth _
               Lib "gdiplus" (ByVal Pen As Long, _
                              Width As Single) As GpStatus
Private Declare Function GdipSetPenMode _
               Lib "gdiplus" (ByVal Pen As Long, _
                              ByVal penMode As PenAlignment) As GpStatus
Private Declare Function GdipGetPenMode _
               Lib "gdiplus" (ByVal Pen As Long, _
                              penMode As PenAlignment) As GpStatus
Private Declare Function GdipClonePen _
               Lib "gdiplus" (ByVal Pen As Long, _
                              clonepen As Long) As GpStatus
Private Declare Function GdipSetPenColor _
               Lib "gdiplus" (ByVal Pen As Long, _
                              ByVal argb As Long) As GpStatus

Implements XTool
Implements IDispose

Private h As Long
Private WithEvents c As XColor
Attribute c.VB_VarHelpID = -1
Public Event Change()

Friend Sub Create(Color As XColor, Width As Single, Alignment As PenAlignment)
    XGraphModule.InitGdip
    GdipCreatePen1 Color.Code, Width, UnitPixel, h
    GdipSetPenMode h, Alignment
    Set c = Color
End Sub

Private Sub c_Change()
    GdipSetPenColor h, c.Code
    RaiseEvent Change
End Sub

Private Property Get XTool_Handle() As Long
    XTool_Handle = h
End Property

Public Property Get Handle() As Long
    Handle = h
End Property
Friend Property Let Handle(Value As Long)
    h = Value
End Property
 
Public Property Let Width(Value As Single)
    GdipSetPenWidth h, Value
    RaiseEvent Change
End Property
Public Property Get Width() As Single
    GdipGetPenWidth h, Width
End Property

Public Property Get Color() As XColor
    Set Color = c
End Property
Public Property Set Color(Value As XColor)
    Set c = Color
    RaiseEvent Change
End Property

Public Property Let Alignment(Value As PenAlignment)
    GdipSetPenMode h, Value
    RaiseEvent Change
End Property
Public Property Get Alignment() As PenAlignment
    GdipGetPenMode h, Alignment
End Property

Public Function Clone() As XPen
    Set Clone = New XPen
    Dim ch As Long
    GdipClonePen h, ch
    Clone.Handle = ch
End Function

Private Sub Class_Terminate()
    IDispose_Dispose
End Sub

Private Sub IDispose_Dispose()
    GdipDeletePen h
End Sub
