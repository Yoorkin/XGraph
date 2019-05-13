VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "XTextureBrush"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Private Declare Function GdipCreateTexture _
               Lib "gdiplus" (ByVal Image As Long, _
                              ByVal Wrapmd As WrapMode, _
                              Texture As Long) As GpStatus
Private Declare Function GdipDeleteBrush Lib "gdiplus" (ByVal Brush As Long) As GpStatus


Implements XTool
Implements XBrush
Implements IDispose

Private h As Long
Private T As XBitmap
Private W As WrapMode

Friend Sub Create(Bitmap As XBitmap, Wrapmd As WrapMode)
    GdipCreateTexture Bitmap.Handle, Wrapmd, h
    Set T = Bitmap
    W = Wrapmd
End Sub

Public Property Get Texture() As XBitmap
    Set Texture = T
End Property

Private Property Get XBrush_Handle() As Variant
    XBrush_Handle = h
End Property

Private Property Get XTool_Handle() As Long
    XTool_Handle = h
End Property

Private Sub IDispose_Dispose()
    GdipDeleteBrush h
    XGraphModule.TerminateGdip
End Sub

Public Function Clone() As XTextureBrush
    Set Clone = New XTextureBrush
    Clone.Create T, W
End Function

Private Sub Class_Terminate()
    IDispose_Dispose
End Sub
