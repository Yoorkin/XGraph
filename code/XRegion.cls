VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "XRegion"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Private Declare Function GdipCreateRegion Lib "gdiplus" (Region As Long) As GpStatus
Private Declare Function GdipCreateRegionRect _
               Lib "gdiplus" (Rect As RECTF, _
                              Region As Long) As GpStatus
Private Declare Function GdipCreateRegionRectI _
               Lib "gdiplus" (Rect As RECTL, _
                              Region As Long) As GpStatus
Private Declare Function GdipCreateRegionPath _
               Lib "gdiplus" (ByVal Path As Long, _
                              Region As Long) As GpStatus
Private Declare Function GdipCreateRegionRgnData _
               Lib "gdiplus" (regionData As Any, _
                              ByVal Size As Long, _
                              Region As Long) As GpStatus
Private Declare Function GdipCreateRegionHrgn _
               Lib "gdiplus" (ByVal hRgn As Long, _
                              Region As Long) As GpStatus
Private Declare Function GdipCloneRegion _
               Lib "gdiplus" (ByVal Region As Long, _
                              cloneRegion As Long) As GpStatus
Private Declare Function GdipDeleteRegion Lib "gdiplus" (ByVal Region As Long) As GpStatus
Private Declare Function GdipCombineRegionRect _
               Lib "gdiplus" (ByVal Region As Long, _
                              Rect As RECTF, _
                              ByVal CombineMd As CombineMode) As GpStatus
Private Declare Function GdipCombineRegionRectI _
               Lib "gdiplus" (ByVal Region As Long, _
                              Rect As RECTL, _
                              ByVal CombineMd As CombineMode) As GpStatus
Private Declare Function GdipCombineRegionPath _
               Lib "gdiplus" (ByVal Region As Long, _
                              ByVal Path As Long, _
                              ByVal CombineMd As CombineMode) As GpStatus
Private Declare Function GdipCombineRegionRegion _
               Lib "gdiplus" (ByVal Region As Long, _
                              ByVal region2 As Long, _
                              ByVal CombineMd As CombineMode) As GpStatus

Private h As Long
Private NotFirstClip As Boolean

Implements IDispose

Public Property Get Handle() As Long
    Handle = h
End Property
Friend Property Let Handle(Value As Long)
    h = Value
End Property

Friend Sub Create()
    XGraphModule.InitGdip
    GdipCreateRegion h
End Sub

Public Sub CombineBounds(Bounds As XBounds, CombineMd As CombineMode)
    If NotFirstClip = False Then
      CombineMd = CombineModeIntersect
      NotFirstClip = True
    End If
    Dim R As RECTF
    R.Left = Bounds.Left
    R.Right = Bounds.Width
    R.Top = Bounds.Top
    R.Bottom = Bounds.Height
    GdipCombineRegionRect h, R, CombineMd
End Sub

Public Sub CombinePath(Path As XPath, CombineMd As CombineMode)
    If NotFirstClip = False Then
      CombineMd = CombineModeIntersect
      NotFirstClip = True
    End If
    GdipCombineRegionPath h, Path.Handle, CombineMd
End Sub

Public Sub CombineRegion(Region As XRegion, CombineMd As CombineMode)
    If NotFirstClip = False Then
      CombineMd = CombineModeIntersect
      NotFirstClip = True
    End If
    GdipCombineRegionRegion h, Region.Handle, CombineMd
End Sub

Public Function Clone() As XRegion
    Set Clone = New XRegion
    Dim ch As Long
    GdipCloneRegion h, ch
    Clone.Handle = ch
End Function

Private Sub Class_Terminate()
    IDispose_Dispose
End Sub

Private Sub IDispose_Dispose()
    GdipDeleteRegion h
    XGraphModule.TerminateGdip
End Sub
