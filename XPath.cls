VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "XPath"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Private Declare Function GdipCreatePath _
               Lib "gdiplus" (ByVal brushmode As Fillmode, _
                              Path As Long) As GpStatus
Private Declare Function GdipAddPathLine _
               Lib "gdiplus" (ByVal Path As Long, _
                              ByVal x1 As Single, _
                              ByVal y1 As Single, _
                              ByVal x2 As Single, _
                              ByVal y2 As Single) As GpStatus
Private Declare Function GdipAddPathLine2 _
               Lib "gdiplus" (ByVal Path As Long, _
                              Points As POINTF, _
                              ByVal Count As Long) As GpStatus
Private Declare Function GdipAddPathLine2_ _
               Lib "gdiplus" _
               Alias "GdipAddPathLine2" _
                             (ByVal Path As Long, _
                              Points As Any, _
                              ByVal Count As Long) As GpStatus
Private Declare Function GdipAddPathArc _
               Lib "gdiplus" (ByVal Path As Long, _
                              ByVal X As Single, _
                              ByVal Y As Single, _
                              ByVal Width As Single, _
                              ByVal Height As Single, _
                              ByVal StartAngle As Single, _
                              ByVal SweepAngle As Single) As GpStatus
Private Declare Function GdipAddPathBezier _
               Lib "gdiplus" (ByVal Path As Long, _
                              ByVal x1 As Single, _
                              ByVal y1 As Single, _
                              ByVal x2 As Single, _
                              ByVal y2 As Single, _
                              ByVal x3 As Single, _
                              ByVal y3 As Single, _
                              ByVal x4 As Single, _
                              ByVal y4 As Single) As GpStatus
Private Declare Function GdipAddPathBeziers _
               Lib "gdiplus" (ByVal Path As Long, _
                              Points As POINTF, _
                              ByVal Count As Long) As GpStatus
Private Declare Function GdipAddPathCurve _
               Lib "gdiplus" (ByVal Path As Long, _
                              Points As POINTF, _
                              ByVal Count As Long) As GpStatus
Private Declare Function GdipAddPathCurve2 _
               Lib "gdiplus" (ByVal Path As Long, _
                              Points As POINTF, _
                              ByVal Count As Long, _
                              ByVal Tension As Single) As GpStatus
Private Declare Function GdipAddPathCurve3 _
               Lib "gdiplus" (ByVal Path As Long, _
                              Points As POINTF, _
                              ByVal Count As Long, _
                              ByVal Offset As Long, _
                              ByVal numberOfSegments As Long, _
                              ByVal Tension As Single) As GpStatus
Private Declare Function GdipAddPathClosedCurve _
               Lib "gdiplus" (ByVal Path As Long, _
                              Points As POINTF, _
                              ByVal Count As Long) As GpStatus
Private Declare Function GdipAddPathClosedCurve2 _
               Lib "gdiplus" (ByVal Path As Long, _
                              Points As POINTF, _
                              ByVal Count As Long, _
                              ByVal Tension As Single) As GpStatus
Private Declare Function GdipAddPathBeziers_ _
               Lib "gdiplus" _
               Alias "GdipAddPathBeziers" _
                             (ByVal Path As Long, _
                              Points As Any, _
                              ByVal Count As Long) As GpStatus
Private Declare Function GdipAddPathCurve_ _
               Lib "gdiplus" _
               Alias "GdipAddPathCurve" _
                             (ByVal Path As Long, _
                              Points As Any, _
                              ByVal Count As Long) As GpStatus
Private Declare Function GdipAddPathCurve2_ _
               Lib "gdiplus" _
               Alias "GdipAddPathCurve2" _
                             (ByVal Path As Long, _
                              Points As Any, _
                              ByVal Count As Long, _
                              ByVal Tension As Single) As GpStatus
Private Declare Function GdipAddPathCurve3_ _
               Lib "gdiplus" _
               Alias "GdipAddPathCurve3" _
                             (ByVal Path As Long, _
                              Points As Any, _
                              ByVal Count As Long, _
                              ByVal Offset As Long, _
                              ByVal numberOfSegments As Long, _
                              ByVal Tension As Single) As GpStatus
Private Declare Function GdipAddPathClosedCurve_ _
               Lib "gdiplus" _
               Alias "GdipAddPathClosedCurve" _
                             (ByVal Path As Long, _
                              Points As Any, _
                              ByVal Count As Long) As GpStatus
Private Declare Function GdipAddPathClosedCurve2_ _
               Lib "gdiplus" _
               Alias "GdipAddPathClosedCurve2" _
                             (ByVal Path As Long, _
                              Points As Any, _
                              ByVal Count As Long, _
                              ByVal Tension As Single) As GpStatus
Private Declare Function GdipAddPathRectangle _
               Lib "gdiplus" (ByVal Path As Long, _
                              ByVal X As Single, _
                              ByVal Y As Single, _
                              ByVal Width As Single, _
                              ByVal Height As Single) As GpStatus
Private Declare Function GdipAddPathRectangles _
               Lib "gdiplus" (ByVal Path As Long, _
                              Rect As RECTF, _
                              ByVal Count As Long) As GpStatus
Private Declare Function GdipAddPathEllipse _
               Lib "gdiplus" (ByVal Path As Long, _
                              ByVal X As Single, _
                              ByVal Y As Single, _
                              ByVal Width As Single, _
                              ByVal Height As Single) As GpStatus
Private Declare Function GdipAddPathPie _
               Lib "gdiplus" (ByVal Path As Long, _
                              ByVal X As Single, _
                              ByVal Y As Single, _
                              ByVal Width As Single, _
                              ByVal Height As Single, _
                              ByVal StartAngle As Single, _
                              ByVal SweepAngle As Single) As GpStatus
Private Declare Function GdipAddPathPolygon _
               Lib "gdiplus" (ByVal Path As Long, _
                              Points As POINTF, _
                              ByVal Count As Long) As GpStatus
Private Declare Function GdipAddPathPolygon_ _
               Lib "gdiplus" _
               Alias "GdipAddPathPolygon" _
                             (ByVal Path As Long, _
                              Points As Any, _
                              ByVal Count As Long) As GpStatus
Private Declare Function GdipAddPathPath _
               Lib "gdiplus" (ByVal Path As Long, _
                              ByVal addingPath As Long, _
                              ByVal bConnect As Long) As GpStatus
Private Declare Function GdipAddPathString _
               Lib "gdiplus" (ByVal Path As Long, _
                              ByVal Str As Long, _
                              ByVal length As Long, _
                              ByVal family As Long, _
                              ByVal Style As FontStyle, _
                              ByVal emSize As Single, _
                              layoutRect As RECTF, _
                              ByVal StringFormat As Long) As GpStatus
Private Declare Function GdipAddPathStringI _
               Lib "gdiplus" (ByVal Path As Long, _
                              ByVal Str As Long, _
                              ByVal length As Long, _
                              ByVal family As Long, _
                              ByVal Style As FontStyle, _
                              ByVal emSize As Single, _
                              layoutRect As RECTL, _
                              ByVal StringFormat As Long) As GpStatus
Private Declare Function GdipAddPathLineI _
               Lib "gdiplus" (ByVal Path As Long, _
                              ByVal x1 As Long, _
                              ByVal y1 As Long, _
                              ByVal x2 As Long, _
                              ByVal y2 As Long) As GpStatus
Private Declare Function GdipAddPathLine2I _
               Lib "gdiplus" (ByVal Path As Long, _
                              Points As POINTL, _
                              ByVal Count As Long) As GpStatus
Private Declare Function GdipAddPathLine2I_ _
               Lib "gdiplus" _
               Alias "GdipAddPathLine2I" _
                             (ByVal Path As Long, _
                              Points As Any, _
                              ByVal Count As Long) As GpStatus
Private Declare Function GdipAddPathArcI _
               Lib "gdiplus" (ByVal Path As Long, _
                              ByVal X As Long, _
                              ByVal Y As Long, _
                              ByVal Width As Long, _
                              ByVal Height As Long, _
                              ByVal StartAngle As Single, _
                              ByVal SweepAngle As Single) As GpStatus
Private Declare Function GdipAddPathBezierI _
               Lib "gdiplus" (ByVal Path As Long, _
                              ByVal x1 As Long, _
                              ByVal y1 As Long, _
                              ByVal x2 As Long, _
                              ByVal y2 As Long, _
                              ByVal x3 As Long, _
                              ByVal y3 As Long, _
                              ByVal x4 As Long, _
                              ByVal y4 As Long) As GpStatus
Private Declare Function GdipAddPathBeziersI _
               Lib "gdiplus" (ByVal Path As Long, _
                              Points As POINTL, _
                              ByVal Count As Long) As GpStatus
Private Declare Function GdipAddPathCurveI _
               Lib "gdiplus" (ByVal Path As Long, _
                              Points As POINTL, _
                              ByVal Count As Long) As GpStatus
Private Declare Function GdipAddPathCurve2I _
               Lib "gdiplus" (ByVal Path As Long, _
                              Points As POINTL, _
                              ByVal Count As Long, _
                              ByVal Tension As Long) As GpStatus
Private Declare Function GdipAddPathCurve3I _
               Lib "gdiplus" (ByVal Path As Long, _
                              Points As POINTL, _
                              ByVal Count As Long, _
                              ByVal Offset As Long, _
                              ByVal numberOfSegments As Long, _
                              ByVal Tension As Single) As GpStatus
Private Declare Function GdipAddPathClosedCurveI _
               Lib "gdiplus" (ByVal Path As Long, _
                              Points As POINTL, _
                              ByVal Count As Long) As GpStatus
Private Declare Function GdipAddPathClosedCurve2I _
               Lib "gdiplus" (ByVal Path As Long, _
                              Points As POINTL, _
                              ByVal Count As Long, _
                              ByVal Tension As Single) As GpStatus
Private Declare Function GdipAddPathBeziersI_ _
               Lib "gdiplus" _
               Alias "GdipAddPathBeziersI" _
                             (ByVal Path As Long, _
                              Points As Any, _
                              ByVal Count As Long) As GpStatus
Private Declare Function GdipAddPathCurveI_ _
               Lib "gdiplus" _
               Alias "GdipAddPathCurveI" _
                             (ByVal Path As Long, _
                              Points As Any, _
                              ByVal Count As Long) As GpStatus
Private Declare Function GdipAddPathCurve2I_ _
               Lib "gdiplus" _
               Alias "GdipAddPathCurve2I" _
                             (ByVal Path As Long, _
                              Points As Any, _
                              ByVal Count As Long, _
                              ByVal Tension As Long) As GpStatus
Private Declare Function GdipAddPathCurve3I_ _
               Lib "gdiplus" _
               Alias "GdipAddPathCurve3I" _
                             (ByVal Path As Long, _
                              Points As Any, _
                              ByVal Count As Long, _
                              ByVal Offset As Long, _
                              ByVal numberOfSegments As Long, _
                              ByVal Tension As Single) As GpStatus
Private Declare Function GdipAddPathClosedCurveI_ _
               Lib "gdiplus" _
               Alias "GdipAddPathClosedCurveI" _
                             (ByVal Path As Long, _
                              Points As Any, _
                              ByVal Count As Long) As GpStatus
Private Declare Function GdipAddPathClosedCurve2I_ _
               Lib "gdiplus" _
               Alias "GdipAddPathClosedCurve2I" _
                             (ByVal Path As Long, _
                              Points As Any, _
                              ByVal Count As Long, _
                              ByVal Tension As Single) As GpStatus
Private Declare Function GdipAddPathRectangleI _
               Lib "gdiplus" (ByVal Path As Long, _
                              ByVal X As Long, _
                              ByVal Y As Long, _
                              ByVal Width As Long, _
                              ByVal Height As Long) As GpStatus
Private Declare Function GdipAddPathRectanglesI _
               Lib "gdiplus" (ByVal Path As Long, _
                              rects As RECTL, _
                              ByVal Count As Long) As GpStatus
Private Declare Function GdipAddPathEllipseI _
               Lib "gdiplus" (ByVal Path As Long, _
                              ByVal X As Long, _
                              ByVal Y As Long, _
                              ByVal Width As Long, _
                              ByVal Height As Long) As GpStatus
Private Declare Function GdipAddPathPieI _
               Lib "gdiplus" (ByVal Path As Long, _
                              ByVal X As Long, _
                              ByVal Y As Long, _
                              ByVal Width As Long, _
                              ByVal Height As Long, _
                              ByVal StartAngle As Single, _
                              ByVal SweepAngle As Single) As GpStatus
Private Declare Function GdipAddPathPolygonI _
               Lib "gdiplus" (ByVal Path As Long, _
                              Points As POINTL, _
                              ByVal Count As Long) As GpStatus
Private Declare Function GdipAddPathPolygonI_ _
               Lib "gdiplus" _
               Alias "GdipAddPathPolygonI" _
                             (ByVal Path As Long, _
                              Points As Any, _
                              ByVal Count As Long) As GpStatus

Private Declare Function GdipStartPathFigure Lib "gdiplus" (ByVal Path As Long) As GpStatus
Private Declare Function GdipClosePathFigure Lib "gdiplus" (ByVal Path As Long) As GpStatus
Private Declare Function GdipDeletePath Lib "gdiplus" (ByVal Path As Long) As GpStatus
Private Declare Function GdipResetPath Lib "gdiplus" (ByVal Path As Long) As GpStatus
Private Declare Function GdipGetPathWorldBoundsI _
               Lib "gdiplus" (ByVal Path As Long, _
                              Bounds As RECTL, _
                              ByVal Matrix As Long, _
                              ByVal Pen As Long) As GpStatus
Private Declare Function GdipClonePath _
               Lib "gdiplus" (ByVal Path As Long, _
                              clonePath As Long) As GpStatus





Implements IDispose

Private h As Long

Public Property Get Handle() As Long
    Handle = h
End Property
Friend Property Let Handle(Value As Long)
    h = Value
End Property
 
Friend Sub Create(Fillmd As Fillmode)
    XGraphModule.InitGdip
    GdipCreatePath Fillmd, h
End Sub

Public Sub AddRectangle(Bounds As XBounds)
GdipAddPathRectangle h, Bounds.Left, Bounds.Top, Bounds.Width, Bounds.Height
End Sub

Public Sub AddEllipse(Bounds As XBounds)
GdipAddPathEllipse h, Bounds.Left, Bounds.Top, Bounds.Width, Bounds.Height
End Sub

Public Sub AddLine(Point1 As XPoint, Point2 As XPoint)
GdipAddPathLine h, Point1.X, Point1.Y, Point2.X, Point2.Y
End Sub

Public Sub AddArc(Bounds As XBounds, StartAngle As Single, SweepAngle As Single)
GdipAddPathArc h, Bounds.Left, Bounds.Top, Bounds.Width, Bounds.Height, StartAngle, SweepAngle
End Sub

Public Sub AddPie(Bounds As XBounds, StartAngle As Single, SweepAngle As Single)
GdipAddPathPie h, Bounds.Left, Bounds.Top, Bounds.Width, Bounds.Height, StartAngle, SweepAngle
End Sub

Public Sub AddRoundRectangle(Bounds As XBounds, Corner As XThickness)
   Dim Path As Long
   GdipCreatePath FillModeAlternate, Path
   With Bounds
   If Corner.Left <> 0 Then GdipAddPathArc Path, .Left, .Top, Corner.Left * 2, Corner.Left * 2, 180, 90
   GdipAddPathLine Path, .Left + Corner.Left, .Top, .Left + .Width - Corner.Top, .Top
   If Corner.Top <> 0 Then GdipAddPathArc Path, .Left + .Width - Corner.Top * 2, .Top, Corner.Top * 2, Corner.Top * 2, 270, 90
   GdipAddPathLine Path, .Left + .Width, .Top + Corner.Top, .Left + .Width, .Top + .Height - Corner.Right
   If Corner.Right <> 0 Then GdipAddPathArc Path, .Left + .Width - Corner.Right * 2, .Top + .Height - Corner.Right * 2, Corner.Right * 2, Corner.Right * 2, 0, 90
   GdipAddPathLine Path, .Left + .Width - Corner.Right, .Top + .Height, .Left + Corner.Bottom, .Top + .Height
   If Corner.Bottom <> 0 Then GdipAddPathArc Path, .Left, .Top + .Height - Corner.Bottom * 2, Corner.Bottom * 2, Corner.Bottom * 2, 90, 90
   GdipClosePathFigure Path '±ÕºÏÂ·¾¶
   GdipAddPathPath h, Path, 0
   GdipDeletePath Path
   End With
End Sub

Public Sub AddPolygon(ParamArray Points() As Variant)
Dim mPos() As POINTF, i
ReDim mPos(UBound(Points))
For i = 0 To UBound(Points)
  mPos(i).Y = Points(i).X
  mPos(i).X = Points(i).Y
Next
GdipAddPathPolygon h, mPos(0), UBound(mPos) + 1
End Sub

Public Sub AddCurve(ParamArray Points() As Variant)
Dim mPos() As POINTF, i
ReDim mPos(UBound(Points))
For i = 0 To UBound(Points)
  mPos(i).Y = Points(i).X
  mPos(i).X = Points(i).Y
Next
GdipAddPathCurve h, mPos(0), UBound(mPos) + 1
End Sub

Public Sub AddString(Bounds As XBounds, Context As String, Font As XFont)
Dim R As RECTF
R.Left = Bounds.Left
R.Top = Bounds.Top
R.Bottom = Bounds.Height
R.Right = Bounds.Width
GdipAddPathString h, StrPtr(Context), -1, Font.FontFam, Font.Style, Font.Size, R, Font.Strformat
End Sub


Public Sub AddBezier(Point1 As XPoint, Point2 As XPoint, Point3 As XPoint, Point4 As XPoint)
GdipAddPathBezier h, Point1.X, Point1.Y, Point2.X, Point2.Y, Point3.X, Point3.Y, Point4.X, Point4.Y
End Sub

Public Sub AddPath(Path As XPath)
GdipAddPathPath h, Path.Handle, 0
End Sub

Public Sub StartFigure()
GdipStartPathFigure h
End Sub
Public Sub CloseFigure()
GdipClosePathFigure h
End Sub
Public Sub Reset()
GdipResetPath h
End Sub

Public Function Clone() As XPath
    Set Clone = New XPath
    Dim ch As Long
    GdipClonePath h, ch
    Clone.Handle = ch
End Function

Public Function Size() As XSize
    Dim B As RECTL
    GdipGetPathWorldBoundsI h, B, 0, 0
    Set Size = New XSize
    Size.Create B.Bottom, B.Right
End Function

Private Sub IDispose_Dispose()
    GdipDeletePath h
    XGraphModule.TerminateGdip
End Sub

Private Sub Class_Terminate()
    IDispose_Dispose
End Sub


