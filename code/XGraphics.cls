VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "XGraphics"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Private Declare Function GdipDrawImageRectRectI Lib "gdiplus" (ByVal Graphics As Long, ByVal Image As Long, ByVal dstX As Long, ByVal dstY As Long, ByVal dstWidth As Long, ByVal dstHeight As Long, ByVal srcx As Long, ByVal srcy As Long, ByVal srcwidth As Long, ByVal srcheight As Long, ByVal srcUnit As GpUnit, Optional ByVal imageAttributes As Long = 0, Optional ByVal callback As Long = 0, Optional ByVal callbackData As Long = 0) As GpStatus

Private Declare Function GdipCreateFromHDC _
               Lib "gdiplus" (ByVal Hdc As Long, _
                              Graphics As Long) As GpStatus
Private Declare Function GdipCreateFromHWND _
               Lib "gdiplus" (ByVal hwnd As Long, _
                              Graphics As Long) As GpStatus
Private Declare Function GdipGetImageGraphicsContext _
               Lib "gdiplus" (ByVal Image As Long, _
                              Graphics As Long) As GpStatus
Private Declare Function GdipDeleteGraphics _
               Lib "gdiplus" (ByVal Graphics As Long) As GpStatus

Private Declare Function GdipGraphicsClear _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal lColor As Long) As GpStatus

Private Declare Function GdipSetCompositingMode _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal CompositingMd As CompositingMode) As GpStatus
Private Declare Function GdipGetCompositingMode _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              CompositingMd As CompositingMode) As GpStatus
Private Declare Function GdipSetSmoothingMode _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal SmoothingMd As SmoothingMode) As GpStatus
Private Declare Function GdipGetSmoothingMode _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              SmoothingMd As SmoothingMode) As GpStatus
Private Declare Function GdipSetTextRenderingHint _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Mode As TextRenderingHint) As GpStatus
Private Declare Function GdipGetTextRenderingHint _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              Mode As TextRenderingHint) As GpStatus
Private Declare Function GdipSetInterpolationMode _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal interpolation As InterpolationMode) As GpStatus
Private Declare Function GdipGetInterpolationMode _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              interpolation As InterpolationMode) As GpStatus
Private Declare Function GdipSetWorldTransform _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Matrix As Long) As GpStatus
Private Declare Function GdipResetWorldTransform _
               Lib "gdiplus" (ByVal Graphics As Long) As GpStatus
Private Declare Function GdipMultiplyWorldTransform _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Matrix As Long, _
                              ByVal Order As MatrixOrder) As GpStatus
Private Declare Function GdipTranslateWorldTransform _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal dx As Single, _
                              ByVal dy As Single, _
                              ByVal Order As MatrixOrder) As GpStatus
Private Declare Function GdipScaleWorldTransform _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Sx As Single, _
                              ByVal Sy As Single, _
                              ByVal Order As MatrixOrder) As GpStatus
Private Declare Function GdipRotateWorldTransform _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Angle As Single, _
                              ByVal Order As MatrixOrder) As GpStatus
Private Declare Function GdipGetWorldTransform _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Matrix As Long) As GpStatus
Private Declare Function GdipSetClipGraphics _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal srcgraphics As Long, _
                              ByVal CombineMd As CombineMode) As GpStatus
Private Declare Function GdipSetClipRect _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal X As Single, _
                              ByVal Y As Single, _
                              ByVal Width As Single, _
                              ByVal Height As Single, _
                              ByVal CombineMd As CombineMode) As GpStatus
Private Declare Function GdipSetClipRectI _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal X As Long, _
                              ByVal Y As Long, _
                              ByVal Width As Long, _
                              ByVal Height As Long, _
                              ByVal CombineMd As CombineMode) As GpStatus
Private Declare Function GdipSetClipPath _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Path As Long, _
                              ByVal CombineMd As CombineMode) As GpStatus
Private Declare Function GdipSetClipRegion _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Region As Long, _
                              ByVal CombineMd As CombineMode) As GpStatus
'==================================================

Private Declare Function GdipDrawLine _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Pen As Long, _
                              ByVal x1 As Single, _
                              ByVal y1 As Single, _
                              ByVal x2 As Single, _
                              ByVal y2 As Single) As GpStatus
Private Declare Function GdipDrawLineI _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Pen As Long, _
                              ByVal x1 As Long, _
                              ByVal y1 As Long, _
                              ByVal x2 As Long, _
                              ByVal y2 As Long) As GpStatus
Private Declare Function GdipDrawLines _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Pen As Long, _
                              Points As POINTF, _
                              ByVal Count As Long) As GpStatus
Private Declare Function GdipDrawLinesI _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Pen As Long, _
                              Points As POINTL, _
                              ByVal Count As Long) As GpStatus
Private Declare Function GdipDrawLines_ _
               Lib "gdiplus" _
               Alias "GdipDrawLines" _
                             (ByVal Graphics As Long, _
                              ByVal Pen As Long, _
                              Points As Any, _
                              ByVal Count As Long) As GpStatus
Private Declare Function GdipDrawLinesI_ _
               Lib "gdiplus" _
               Alias "GdipDrawLinesI" _
                             (ByVal Graphics As Long, _
                              ByVal Pen As Long, _
                              Points As Any, _
                              ByVal Count As Long) As GpStatus
'==================================================

Private Declare Function GdipDrawArc _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Pen As Long, _
                              ByVal X As Single, _
                              ByVal Y As Single, _
                              ByVal Width As Single, _
                              ByVal Height As Single, _
                              ByVal StartAngle As Single, _
                              ByVal SweepAngle As Single) As GpStatus
Private Declare Function GdipDrawArcI _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Pen As Long, _
                              ByVal X As Long, _
                              ByVal Y As Long, _
                              ByVal Width As Long, _
                              ByVal Height As Long, _
                              ByVal StartAngle As Single, _
                              ByVal SweepAngle As Single) As GpStatus

'==================================================

Private Declare Function GdipDrawBezier _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Pen As Long, _
                              ByVal x1 As Single, _
                              ByVal y1 As Single, _
                              ByVal x2 As Single, _
                              ByVal y2 As Single, _
                              ByVal x3 As Single, _
                              ByVal y3 As Single, _
                              ByVal x4 As Single, _
                              ByVal y4 As Single) As GpStatus
Private Declare Function GdipDrawBezierI _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Pen As Long, _
                              ByVal x1 As Long, _
                              ByVal y1 As Long, _
                              ByVal x2 As Long, _
                              ByVal y2 As Long, _
                              ByVal x3 As Long, _
                              ByVal y3 As Long, _
                              ByVal x4 As Long, _
                              ByVal y4 As Long) As GpStatus
Private Declare Function GdipDrawBeziers _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Pen As Long, _
                              Points As POINTF, _
                              ByVal Count As Long) As GpStatus
Private Declare Function GdipDrawBeziersI _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Pen As Long, _
                              Points As POINTL, _
                              ByVal Count As Long) As GpStatus
Private Declare Function GdipDrawBeziers_ _
               Lib "gdiplus" _
               Alias "GdipDrawBeziers" _
                             (ByVal Graphics As Long, _
                              ByVal Pen As Long, _
                              Points As Any, _
                              ByVal Count As Long) As GpStatus
Private Declare Function GdipDrawBeziersI_ _
               Lib "gdiplus" _
               Alias "GdipDrawBeziersI" _
                             (ByVal Graphics As Long, _
                              ByVal Pen As Long, _
                              Points As Any, _
                              ByVal Count As Long) As GpStatus
'==================================================

Private Declare Function GdipDrawRectangle _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Pen As Long, _
                              ByVal X As Single, _
                              ByVal Y As Single, _
                              ByVal Width As Single, _
                              ByVal Height As Single) As GpStatus
Private Declare Function GdipDrawRectangleI _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Pen As Long, _
                              ByVal X As Long, _
                              ByVal Y As Long, _
                              ByVal Width As Long, _
                              ByVal Height As Long) As GpStatus
Private Declare Function GdipDrawRectangles _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Pen As Long, _
                              rects As RECTF, _
                              ByVal Count As Long) As GpStatus
Private Declare Function GdipDrawRectanglesI _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Pen As Long, _
                              rects As RECTL, _
                              ByVal Count As Long) As GpStatus

Private Declare Function GdipFillRectangle _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Brush As Long, _
                              ByVal X As Single, _
                              ByVal Y As Single, _
                              ByVal Width As Single, _
                              ByVal Height As Single) As GpStatus
Private Declare Function GdipFillRectangleI _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Brush As Long, _
                              ByVal X As Long, _
                              ByVal Y As Long, _
                              ByVal Width As Long, _
                              ByVal Height As Long) As GpStatus
Private Declare Function GdipFillRectangles _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Brush As Long, _
                              rects As RECTF, _
                              ByVal Count As Long) As GpStatus
Private Declare Function GdipFillRectanglesI _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Brush As Long, _
                              rects As RECTL, _
                              ByVal Count As Long) As GpStatus

'==================================================

Private Declare Function GdipDrawEllipse _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Pen As Long, _
                              ByVal X As Single, _
                              ByVal Y As Single, _
                              ByVal Width As Single, _
                              ByVal Height As Single) As GpStatus
Private Declare Function GdipDrawEllipseI _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Pen As Long, _
                              ByVal X As Long, _
                              ByVal Y As Long, _
                              ByVal Width As Long, _
                              ByVal Height As Long) As GpStatus

Private Declare Function GdipFillEllipse _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Brush As Long, _
                              ByVal X As Single, _
                              ByVal Y As Single, _
                              ByVal Width As Single, _
                              ByVal Height As Single) As GpStatus
Private Declare Function GdipFillEllipseI _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Brush As Long, _
                              ByVal X As Long, _
                              ByVal Y As Long, _
                              ByVal Width As Long, _
                              ByVal Height As Long) As GpStatus

'==================================================

Private Declare Function GdipDrawPie _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Pen As Long, _
                              ByVal X As Single, _
                              ByVal Y As Single, _
                              ByVal Width As Single, _
                              ByVal Height As Single, _
                              ByVal StartAngle As Single, _
                              ByVal SweepAngle As Single) As GpStatus
Private Declare Function GdipDrawPieI _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Pen As Long, _
                              ByVal X As Long, _
                              ByVal Y As Long, _
                              ByVal Width As Long, _
                              ByVal Height As Long, _
                              ByVal StartAngle As Single, _
                              ByVal SweepAngle As Single) As GpStatus

Private Declare Function GdipFillPie _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Brush As Long, _
                              ByVal X As Single, _
                              ByVal Y As Single, _
                              ByVal Width As Single, _
                              ByVal Height As Single, _
                              ByVal StartAngle As Single, _
                              ByVal SweepAngle As Single) As GpStatus
Private Declare Function GdipFillPieI _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Brush As Long, _
                              ByVal X As Long, _
                              ByVal Y As Long, _
                              ByVal Width As Long, _
                              ByVal Height As Long, _
                              ByVal StartAngle As Single, _
                              ByVal SweepAngle As Single) As GpStatus

'==================================================

Private Declare Function GdipDrawPolygon _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Pen As Long, _
                              Points As POINTF, _
                              ByVal Count As Long) As GpStatus
Private Declare Function GdipDrawPolygonI _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Pen As Long, _
                              Points As POINTL, _
                              ByVal Count As Long) As GpStatus

Private Declare Function GdipFillPolygon _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Brush As Long, _
                              Points As POINTF, _
                              ByVal Count As Long, _
                              ByVal Fillmd As Fillmode) As GpStatus
Private Declare Function GdipFillPolygonI _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Brush As Long, _
                              Points As POINTL, _
                              ByVal Count As Long, _
                              ByVal Fillmd As Fillmode) As GpStatus
Private Declare Function GdipFillPolygon2 _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Brush As Long, _
                              Points As POINTF, _
                              ByVal Count As Long) As GpStatus
Private Declare Function GdipFillPolygon2I _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Brush As Long, _
                              Points As POINTL, _
                              ByVal Count As Long) As GpStatus
Private Declare Function GdipDrawPolygon_ _
               Lib "gdiplus" _
               Alias "GdipDrawPolygon" _
                             (ByVal Graphics As Long, _
                              ByVal Pen As Long, _
                              Points As Any, _
                              ByVal Count As Long) As GpStatus
Private Declare Function GdipDrawPolygonI_ _
               Lib "gdiplus" _
               Alias "GdipDrawPolygonI" _
                             (ByVal Graphics As Long, _
                              ByVal Pen As Long, _
                              Points As Any, _
                              ByVal Count As Long) As GpStatus

Private Declare Function GdipFillPolygon_ _
               Lib "gdiplus" _
               Alias "GdipFillPolygon" _
                             (ByVal Graphics As Long, _
                              ByVal Brush As Long, _
                              Points As Any, _
                              ByVal Count As Long, _
                              ByVal Fillmd As Fillmode) As GpStatus
Private Declare Function GdipFillPolygonI_ _
               Lib "gdiplus" _
               Alias "GdipFillPolygonI" _
                             (ByVal Graphics As Long, _
                              ByVal Brush As Long, _
                              Points As Any, _
                              ByVal Count As Long, _
                              ByVal Fillmd As Fillmode) As GpStatus
Private Declare Function GdipFillPolygon2_ _
               Lib "gdiplus" _
               Alias "GdipFillPolygon2" _
                             (ByVal Graphics As Long, _
                              ByVal Brush As Long, _
                              Points As Any, _
                              ByVal Count As Long) As GpStatus
Private Declare Function GdipFillPolygon2I_ _
               Lib "gdiplus" _
               Alias "GdipFillPolygon2I" _
                             (ByVal Graphics As Long, _
                              ByVal Brush As Long, _
                              Points As Any, _
                              ByVal Count As Long) As GpStatus

'==================================================

Private Declare Function GdipDrawPath _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Pen As Long, _
                              ByVal Path As Long) As GpStatus

Private Declare Function GdipFillPath _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Brush As Long, _
                              ByVal Path As Long) As GpStatus

'==================================================

Private Declare Function GdipDrawCurve _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Pen As Long, _
                              Points As POINTF, _
                              ByVal Count As Long) As GpStatus
Private Declare Function GdipDrawCurveI _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Pen As Long, _
                              Points As POINTL, _
                              ByVal Count As Long) As GpStatus
Private Declare Function GdipDrawCurve2 _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Pen As Long, _
                              Points As POINTF, _
                              ByVal Count As Long, _
                              ByVal Tension As Single) As GpStatus
Private Declare Function GdipDrawCurve2I _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Pen As Long, _
                              Points As POINTL, _
                              ByVal Count As Long, _
                              ByVal Tension As Single) As GpStatus
Private Declare Function GdipDrawCurve3 _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Pen As Long, _
                              Points As POINTF, _
                              ByVal Count As Long, _
                              ByVal Offset As Long, _
                              ByVal numberOfSegments As Long, _
                              ByVal Tension As Single) As GpStatus
Private Declare Function GdipDrawCurve3I _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Pen As Long, _
                              Points As POINTL, _
                              ByVal Count As Long, _
                              ByVal Offset As Long, _
                              ByVal numberOfSegments As Long, _
                              ByVal Tension As Single) As GpStatus

Private Declare Function GdipDrawClosedCurve _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Pen As Long, _
                              Points As POINTF, _
                              ByVal Count As Long) As GpStatus
Private Declare Function GdipDrawClosedCurveI _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Pen As Long, _
                              Points As POINTL, _
                              ByVal Count As Long) As GpStatus
Private Declare Function GdipDrawClosedCurve2 _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Pen As Long, _
                              Points As POINTF, _
                              ByVal Count As Long, _
                              ByVal Tension As Single) As GpStatus
Private Declare Function GdipDrawClosedCurve2I _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Pen As Long, _
                              Points As POINTL, _
                              ByVal Count As Long, _
                              ByVal Tension As Single) As GpStatus

Private Declare Function GdipFillClosedCurve _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Brush As Long, _
                              Points As POINTF, _
                              ByVal Count As Long) As GpStatus
Private Declare Function GdipFillClosedCurveI _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Brush As Long, _
                              Points As POINTL, _
                              ByVal Count As Long) As GpStatus
Private Declare Function GdipFillClosedCurve2 _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Brush As Long, _
                              Points As POINTF, _
                              ByVal Count As Long, _
                              ByVal Tension As Single, _
                              ByVal Fillmd As Fillmode) As GpStatus
Private Declare Function GdipFillClosedCurve2I _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Brush As Long, _
                              Points As POINTL, _
                              ByVal Count As Long, _
                              ByVal Tension As Single, _
                              ByVal Fillmd As Fillmode) As GpStatus

Private Declare Function GdipDrawCurve_ _
               Lib "gdiplus" _
               Alias "GdipDrawCurve" _
                             (ByVal Graphics As Long, _
                              ByVal Pen As Long, _
                              Points As Any, _
                              ByVal Count As Long) As GpStatus
Private Declare Function GdipDrawCurveI_ _
               Lib "gdiplus" _
               Alias "GdipDrawCurveI" _
                             (ByVal Graphics As Long, _
                              ByVal Pen As Long, _
                              Points As Any, _
                              ByVal Count As Long) As GpStatus
Private Declare Function GdipDrawCurve2_ _
               Lib "gdiplus" _
               Alias "GdipDrawCurve2" _
                             (ByVal Graphics As Long, _
                              ByVal Pen As Long, _
                              Points As Any, _
                              ByVal Count As Long, _
                              ByVal Tension As Single) As GpStatus
Private Declare Function GdipDrawCurve2I_ _
               Lib "gdiplus" _
               Alias "GdipDrawCurve2I" _
                             (ByVal Graphics As Long, _
                              ByVal Pen As Long, _
                              Points As Any, _
                              ByVal Count As Long, _
                              ByVal Tension As Single) As GpStatus
Private Declare Function GdipDrawCurve3_ _
               Lib "gdiplus" _
               Alias "GdipDrawCurve3" _
                             (ByVal Graphics As Long, _
                              ByVal Pen As Long, _
                              Points As Any, _
                              ByVal Count As Long, _
                              ByVal Offset As Long, _
                              ByVal numberOfSegments As Long, _
                              ByVal Tension As Single) As GpStatus
Private Declare Function GdipDrawCurve3I_ _
               Lib "gdiplus" _
               Alias "GdipDrawCurve3I" _
                             (ByVal Graphics As Long, _
                              ByVal Pen As Long, _
                              Points As Any, _
                              ByVal Count As Long, _
                              ByVal Offset As Long, _
                              ByVal numberOfSegments As Long, _
                              ByVal Tension As Single) As GpStatus

Private Declare Function GdipDrawClosedCurve_ _
               Lib "gdiplus" _
               Alias "GdipDrawClosedCurve" _
                             (ByVal Graphics As Long, _
                              ByVal Pen As Long, _
                              Points As Any, _
                              ByVal Count As Long) As GpStatus
Private Declare Function GdipDrawClosedCurveI_ _
               Lib "gdiplus" _
               Alias "GdipDrawClosedCurveI" _
                             (ByVal Graphics As Long, _
                              ByVal Pen As Long, _
                              Points As Any, _
                              ByVal Count As Long) As GpStatus
Private Declare Function GdipDrawClosedCurve2_ _
               Lib "gdiplus" _
               Alias "GdipDrawClosedCurve2" _
                             (ByVal Graphics As Long, _
                              ByVal Pen As Long, _
                              Points As Any, _
                              ByVal Count As Long, _
                              ByVal Tension As Single) As GpStatus
Private Declare Function GdipDrawClosedCurve2I_ _
               Lib "gdiplus" _
               Alias "GdipDrawClosedCurve2I" _
                             (ByVal Graphics As Long, _
                              ByVal Pen As Long, _
                              Points As Any, _
                              ByVal Count As Long, _
                              ByVal Tension As Single) As GpStatus

Private Declare Function GdipFillClosedCurve_ _
               Lib "gdiplus" _
               Alias "GdipFillClosedCurve" _
                             (ByVal Graphics As Long, _
                              ByVal Brush As Long, _
                              Points As Any, _
                              ByVal Count As Long) As GpStatus
Private Declare Function GdipFillClosedCurveI_ _
               Lib "gdiplus" _
               Alias "GdipFillClosedCurveI" _
                             (ByVal Graphics As Long, _
                              ByVal Brush As Long, _
                              Points As Any, _
                              ByVal Count As Long) As GpStatus
Private Declare Function GdipFillClosedCurve2_ _
               Lib "gdiplus" _
               Alias "GdipFillClosedCurve2" _
                             (ByVal Graphics As Long, _
                              ByVal Brush As Long, _
                              Points As Any, _
                              ByVal Count As Long, _
                              ByVal Tension As Single, _
                              ByVal Fillmd As Fillmode) As GpStatus
Private Declare Function GdipFillClosedCurve2I_ _
               Lib "gdiplus" _
               Alias "GdipFillClosedCurve2I" _
                             (ByVal Graphics As Long, _
                              ByVal Brush As Long, _
                              Points As Any, _
                              ByVal Count As Long, _
                              ByVal Tension As Single, _
                              ByVal Fillmd As Fillmode) As GpStatus


'==================================================

Private Declare Function GdipFillRegion _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Brush As Long, _
                              ByVal Region As Long) As GpStatus

'==================================================

Private Declare Function GdipDrawImage _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Image As Long, _
                              ByVal X As Single, _
                              ByVal Y As Single) As GpStatus
Private Declare Function GdipDrawImageI _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Image As Long, _
                              ByVal X As Long, _
                              ByVal Y As Long) As GpStatus

Private Declare Function GdipDrawImageRect _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Image As Long, _
                              ByVal X As Single, _
                              ByVal Y As Single, _
                              ByVal Width As Single, _
                              ByVal Height As Single) As GpStatus
Private Declare Function GdipDrawImageRectI _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Image As Long, _
                              ByVal X As Long, _
                              ByVal Y As Long, _
                              ByVal Width As Long, _
                              ByVal Height As Long) As GpStatus
Private Declare Function GdipDrawImagePoints _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Image As Long, _
                              dstpoints As POINTF, _
                              ByVal Count As Long) As GpStatus
Private Declare Function GdipDrawImagePointsI _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Image As Long, _
                              dstpoints As POINTL, _
                              ByVal Count As Long) As GpStatus
Private Declare Function GdipDrawImagePoints_ _
               Lib "gdiplus" _
               Alias "GdipDrawImagePoints" _
                             (ByVal Graphics As Long, _
                              ByVal Image As Long, _
                              dstpoints As Any, _
                              ByVal Count As Long) As GpStatus
Private Declare Function GdipDrawImagePointsI_ _
               Lib "gdiplus" _
               Alias "GdipDrawImagePointsI" _
                             (ByVal Graphics As Long, _
                              ByVal Image As Long, _
                              dstpoints As Any, _
                              ByVal Count As Long) As GpStatus
Private Declare Function GdipDrawImagePointRect _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Image As Long, _
                              ByVal X As Single, _
                              ByVal Y As Single, _
                              ByVal srcx As Single, _
                              ByVal srcy As Single, _
                              ByVal srcwidth As Single, _
                              ByVal srcheight As Single, _
                              ByVal srcUnit As GpUnit) As GpStatus
Private Declare Function GdipDrawImagePointRectI _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Image As Long, _
                              ByVal X As Long, _
                              ByVal Y As Long, _
                              ByVal srcx As Long, _
                              ByVal srcy As Long, _
                              ByVal srcwidth As Long, _
                              ByVal srcheight As Long, _
                              ByVal srcUnit As GpUnit) As GpStatus
Private Declare Function GdipDrawImagePointsRect _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Image As Long, _
                              Points As POINTF, _
                              ByVal Count As Long, _
                              ByVal srcx As Single, _
                              ByVal srcy As Single, _
                              ByVal srcwidth As Single, _
                              ByVal srcheight As Single, _
                              ByVal srcUnit As GpUnit, _
                              Optional ByVal imageAttributes As Long = 0, _
                              Optional ByVal callback As Long = 0, _
                              Optional ByVal callbackData As Long = 0) As GpStatus
Private Declare Function GdipDrawImagePointsRectI _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Image As Long, _
                              Points As POINTL, _
                              ByVal Count As Long, _
                              ByVal srcx As Long, _
                              ByVal srcy As Long, _
                              ByVal srcwidth As Long, _
                              ByVal srcheight As Long, _
                              ByVal srcUnit As GpUnit, _
                              Optional ByVal imageAttributes As Long = 0, _
                              Optional ByVal callback As Long = 0, _
                              Optional ByVal callbackData As Long = 0) As GpStatus
Private Declare Function GdipDrawImagePointsRect_ _
               Lib "gdiplus" _
               Alias "GdipDrawImagePointsRect" _
                             (ByVal Graphics As Long, _
                              ByVal Image As Long, _
                              Points As Any, _
                              ByVal Count As Long, _
                              ByVal srcx As Single, _
                              ByVal srcy As Single, _
                              ByVal srcwidth As Single, _
                              ByVal srcheight As Single, _
                              ByVal srcUnit As GpUnit, _
                              Optional ByVal imageAttributes As Long = 0, _
                              Optional ByVal callback As Long = 0, _
                              Optional ByVal callbackData As Long = 0) As GpStatus
Private Declare Function GdipDrawImagePointsRectI_ _
               Lib "gdiplus" _
               Alias "GdipDrawImagePointsRectI" _
                             (ByVal Graphics As Long, _
                              ByVal Image As Long, _
                              Points As Any, _
                              ByVal Count As Long, _
                              ByVal srcx As Long, _
                              ByVal srcy As Long, _
                              ByVal srcwidth As Long, _
                              ByVal srcheight As Long, _
                              ByVal srcUnit As GpUnit, _
                              Optional ByVal imageAttributes As Long = 0, _
                              Optional ByVal callback As Long = 0, _
                              Optional ByVal callbackData As Long = 0) As GpStatus
Private Declare Function GdipDrawString _
               Lib "gdiplus" (ByVal Graphics As Long, _
                              ByVal Str As Long, _
                              ByVal length As Long, _
                              ByVal thefont As Long, _
                              layoutRect As RECTF, _
                              ByVal StringFormat As Long, _
                              ByVal Brush As Long) As GpStatus
Private Declare Function GdipResetClip Lib "gdiplus" (ByVal Graphics As Long) As GpStatus

'======RoundRectangle===============================================================
Private Declare Function GdipCreatePath _
               Lib "gdiplus" (ByVal brushmode As Fillmode, _
                              Path As Long) As GpStatus
 Private Declare Function GdipAddPathLine _
               Lib "gdiplus" (ByVal Path As Long, _
                              ByVal x1 As Single, _
                              ByVal y1 As Single, _
                              ByVal x2 As Single, _
                              ByVal y2 As Single) As GpStatus
Private Declare Function GdipClosePathFigure Lib "gdiplus" (ByVal Path As Long) As GpStatus
Private Declare Function GdipDeletePath Lib "gdiplus" (ByVal Path As Long) As GpStatus
Private Declare Function GdipAddPathArc _
               Lib "gdiplus" (ByVal Path As Long, _
                              ByVal X As Single, _
                              ByVal Y As Single, _
                              ByVal Width As Single, _
                              ByVal Height As Single, _
                              ByVal StartAngle As Single, _
                              ByVal SweepAngle As Single) As GpStatus
'====================================================================================


Implements IDispose



Private h As Long
Private mSmoothingMode As SmoothingMode
Private mTextRenderingHint As TextRenderingHint
Private mCompositingMode As CompositingMode
Private mInterMode As InterpolationMode

Public Property Get Handle() As Long
    Handle = h
End Property

'Friend Sub Create(Window As XUIWindow)
'    XUI.XInitGdiplus
'    GdipCreateFromHDC Window.windowdc, h
'End Sub
Friend Sub CreateFormBitmap(Bitmap As XBitmap)
    XGraphModule.InitGdip
    GdipGetImageGraphicsContext Bitmap.Handle, h
End Sub
Friend Sub CreateFromBufferedBitmap(Bitmap As XBufferedBitmap)
    XGraphModule.InitGdip
    GdipCreateFromHDC Bitmap.Handle, h
End Sub
Friend Sub CreateFromHdc(Hdc As Long)
    XGraphModule.InitGdip
    GdipCreateFromHDC Hdc, h
End Sub
Friend Sub CreateFromHWND(ByVal hwnd As Long)
    XGraphModule.InitGdip
    GdipCreateFromHWND hwnd, h
End Sub


'===清除
Public Sub Clear(Optional Color As XColor)
     If Color Is Nothing Then
       GdipGraphicsClear h, &HFFFFFFFF
     Else
       GdipGraphicsClear h, Color.Code
     End If
End Sub

'===绘制圆
Public Sub DrawEllipse(Tool As XTool, Bounds As XBounds)
With Bounds
If IsBrush(Tool) Then
  GdipFillEllipseI Handle, Tool.Handle, .Left, .Top, .Width, .Height
Else
  GdipDrawEllipseI Handle, Tool.Handle, .Left, .Top, .Width, .Height
End If
End With
End Sub

'===多边形
Public Sub DrawPolygon(Tool As XTool, Fillmode As Fillmode, ParamArray Points() As Variant)
Dim mPos() As POINTF, i
ReDim mPos(UBound(Points))
For i = 0 To UBound(Points)
  mPos(i).Y = Points(i).X
  mPos(i).X = Points(i).Y
Next
If IsBrush(Tool) Then
 GdipFillPolygon Handle, Tool.Handle, mPos(0), UBound(mPos) + 1, Fillmode
Else
 GdipDrawPolygon Handle, Tool.Handle, mPos(0), UBound(mPos) + 1
End If
End Sub

'===绘制线
Public Sub DrawLine(Pen As XPen, Point1 As XPoint, Point2 As XPoint)
  GdipDrawLineI Handle, Pen.Handle, Point1.X, Point1.Y, Point2.X, Point2.Y
End Sub

'===绘制贝塞尔曲线
Public Sub DrawBezier(Pen As XPen, Point1 As XPoint, Point2 As XPoint, Point3 As XPoint, Point4 As XPoint)
     GdipDrawBezier Handle, Pen.Handle, Point1.X, Point1.Y, Point2.X, Point2.Y, Point3.X, Point3.Y, Point4.X, Point4.Y
End Sub

'===基样条曲线
Public Sub DrawCurve(Tool As XTool, Tension As Single, Fillmode As Fillmode, ParamArray Points() As Variant)
Dim mPos() As POINTF, i
ReDim mPos(UBound(Points))
For i = 0 To UBound(Points)
  mPos(i).Y = Points(i).Y
  mPos(i).X = Points(i).X
Next
If IsBrush(Tool) Then
   GdipFillClosedCurve2 Handle, Tool.Handle, mPos(0), UBound(mPos) + 1, Tension, Fillmode
Else
   GdipDrawCurve2 Handle, Tool.Handle, mPos(0), UBound(mPos) + 1, Tension
End If
End Sub

'===绘制弧
Public Sub DrawArc(Pen As XPen, Bounds As XBounds, ByVal StartAngle As Single, ByVal SweepAngle As Single)
With Bounds
  GdipDrawArc Handle, Pen.Handle, .Left, .Top, .Width, .Height, StartAngle, SweepAngle
End With
End Sub

'===绘制扇形
Public Sub DrawPie(Tool As XTool, Bounds As XBounds, StartAngle As Single, SweepAngle As Single)
With Bounds
If IsBrush(Tool) Then
  GdipFillPie Handle, Tool.Handle, .Left, .Top, .Width, .Height, StartAngle, SweepAngle
Else
  GdipDrawPie Handle, Tool.Handle, .Left, .Top, .Width, .Height, StartAngle, SweepAngle
End If
End With
End Sub

Public Sub DrawPath(Tool As XTool, Path As XPath)
If IsBrush(Tool) Then
  GdipFillPath Handle, Tool.Handle, Path.Handle
Else
  GdipDrawPath Handle, Tool.Handle, Path.Handle
End If
End Sub

'===绘制矩形
Public Sub DrawRectangle(Tool As XTool, Bounds As XBounds)
With Bounds
If IsBrush(Tool) Then
  GdipFillRectangleI Handle, Tool.Handle, .Left, .Top, .Width, .Height
Else
  GdipDrawRectangleI Handle, Tool.Handle, .Left, .Top, .Width, .Height
End If
End With
End Sub

Public Sub DrawBitmap(Bitmap As XBitmap, Point As XPoint)
    GdipDrawImage h, Bitmap.Handle, Point.X, Point.Y
End Sub

Public Sub DrawBitmapStretch(Bitmap As XBitmap, Bounds As XBounds) '拉伸并绘制图片
    GdipDrawImageRect h, Bitmap.Handle, Bounds.Left, Bounds.Top, Bounds.Width, Bounds.Height
End Sub
Public Sub DrawBitmapClip(Bitmap As XBitmap, Target As XBounds, source As XBounds)
    GdipDrawImageRectRectI h, Bitmap.Handle, Target.Left, Target.Top, Target.Width, Target.Height, source.Left, source.Top, source.Width, source.Height, UnitPixel
End Sub

'Public Sub DrawBitmap(Bitmap As XBitmap, Point As XPoint, Optional Angle As Long = 0)
'With Point
'Dim ImgW As Long, ImgH As Long
'ImgW = Image.Width
'ImgH = Image.Height
'
'    If Angle = 0 Then
'        GdipDrawImageRect Handle, Image.Handle, .Left, .Top, ImgW, ImgH
'    Else
'        GdipRotateWorldTransform Handle, Angle, MatrixOrderAppend
'        GdipTranslateWorldTransform Handle, .X + ImgW \ 2, .Y + ImgH \ 2, MatrixOrderAppend
'        GdipDrawImageRect Handle, Image.Handle, -ImgW \ 2, -ImgH \ 2, ImgW, ImgH
'        GdipTranslateWorldTransform Handle, -(.X + ImgW \ 2), -(.Y + ImgH \ 2), MatrixOrderAppend
'        GdipRotateWorldTransform Handle, -Angle, MatrixOrderAppend
'    End If
'
'End With
'End Sub
'
'Public Sub DrawImageRect(Image As XImage, Bounds As XBounds, Optional Angle As Long = 0)
'With Bounds
'Dim ImgW As Long, ImgH As Long
'ImgW = Image.Width
'ImgH = Image.Height
'If .Width <> 0 Then ImgW = .Width
'If .Height <> 0 Then ImgH = .Height
'
'    If Angle = 0 Then
'        GdipDrawImageRect Handle, Image.Handle, .Left, .Top, ImgW, ImgH
'    Else
'        GdipRotateWorldTransform Handle, Angle, MatrixOrderAppend
'        GdipTranslateWorldTransform Handle, .Left + ImgW \ 2, .Top + ImgH \ 2, MatrixOrderAppend
'        GdipDrawImageRect Handle, Image.Handle, -ImgW \ 2, -ImgH \ 2, ImgW, ImgH
'        GdipTranslateWorldTransform Handle, -(.Left + ImgW \ 2), -(.Top + ImgH \ 2), MatrixOrderAppend
'        GdipRotateWorldTransform Handle, -Angle, MatrixOrderAppend
'    End If
'
'End With
'End Sub

            
                     
                     
                     
                     
                     
'===圆角矩形
Public Sub DrawRoundRectangle(Tool As XTool, Bounds As XBounds, Corner As XThickness)
Dim Path As Long
With Bounds
   GdipCreatePath FillModeAlternate, Path
   If Corner.Left <> 0 Then GdipAddPathArc Path, .Left, .Top, Corner.Left * 2, Corner.Left * 2, 180, 90
   GdipAddPathLine Path, .Left + Corner.Left, .Top, .Left + .Width - Corner.Top, .Top
   If Corner.Top <> 0 Then GdipAddPathArc Path, .Left + .Width - Corner.Top * 2, .Top, Corner.Top * 2, Corner.Top * 2, 270, 90
   GdipAddPathLine Path, .Left + .Width, .Top + Corner.Top, .Left + .Width, .Top + .Height - Corner.Right
   If Corner.Right <> 0 Then GdipAddPathArc Path, .Left + .Width - Corner.Right * 2, .Top + .Height - Corner.Right * 2, Corner.Right * 2, Corner.Right * 2, 0, 90
   GdipAddPathLine Path, .Left + .Width - Corner.Right, .Top + .Height, .Left + Corner.Bottom, .Top + .Height
   If Corner.Bottom <> 0 Then GdipAddPathArc Path, .Left, .Top + .Height - Corner.Bottom * 2, Corner.Bottom * 2, Corner.Bottom * 2, 90, 90
   GdipClosePathFigure Path '闭合路径
   If IsBrush(Tool) Then
      GdipFillPath Handle, Tool.Handle, Path
   Else
      GdipDrawPath Handle, Tool.Handle, Path
   End If
   GdipDeletePath Path
End With
End Sub

'===绘制文字
Public Sub DrawText(Brush As XBrush, Context As String, Font As XFont, Bounds As XBounds)
    Dim mrect As RECTF
    With Bounds
    mrect.Left = Bounds.Left
    mrect.Top = Bounds.Top
    mrect.Bottom = Bounds.Bottom
    mrect.Right = Bounds.Right
    GdipDrawString Handle, StrPtr(Context), Len(Context), Font.Font, mrect, Font.Strformat, Brush.Handle
    End With
End Sub

'Public Sub TextEx(Tool As Object, Font As AmberFont, ByVal Str As String, ByVal Rect As String, _
'                             Optional FontSize As Single = -1, Optional PathFillMode As Fillmode)
'If FontSize = -1 Then FontSize = Font.Size
'Dim Path As Long, mrect As RECTL
'With mrect
'DevRect Rect, .Left, .Top, .Right, .Bottom
'GdipCreatePath PathFillMode, Path
'GdipAddPathStringI Path, StrPtr(Str), -1, Font.FontFam, Font.mStyle, FontSize, mrect, Font.Strformat
'GdipFillPath Graphics, Brush, Path
'GdipDrawPath Graphics, Pen, Path
'GdipDeletePath Path
'End With
'End Sub


'===属性===============================================


'插值
Public Property Let InterpolationMode(ByVal vData As InterpolationMode)
    mInterMode = vData
    GdipSetInterpolationMode Handle, vData
End Property
Public Property Get InterpolationMode() As InterpolationMode
    InterpolationMode = mInterMode
End Property


'抗锯齿
Public Property Let SmoothingMode(ByVal vData As SmoothingMode)
    mSmoothingMode = vData
    GdipSetSmoothingMode Handle, vData
End Property
Public Property Get SmoothingMode() As SmoothingMode
    SmoothingMode = mSmoothingMode
End Property


'调整混合模式
Public Property Let CompositingMode(ByVal vData As CompositingMode)
    mCompositingMode = vData
    GdipSetCompositingMode Handle, vData
End Property
Public Property Get CompositingMode() As CompositingMode
    CompositingMode = mCompositingMode
End Property


'字体抗锯齿
Public Property Let TextRenderingHint(ByVal vData As TextRenderingHint)
    mTextRenderingHint = vData
    GdipSetTextRenderingHint Handle, vData
End Property
Public Property Get TextRenderingHint() As TextRenderingHint
    TextRenderingHint = mTextRenderingHint
End Property


'===基本世界变换
Public Sub RotateWorld(Angle As Single, Order As MatrixOrder)
GdipRotateWorldTransform Handle, Angle, Order
End Sub
Public Sub TranslateWorld(X As Single, Y As Single, Order As MatrixOrder)
GdipTranslateWorldTransform Handle, X, Y, Order
End Sub
Public Sub ScaleWorld(X As Single, Y As Single, Order As MatrixOrder)
GdipScaleWorldTransform Handle, X, Y, Order
End Sub
Public Sub ResetWorld()
GdipResetWorldTransform Handle
End Sub
'Public Sub MatrixTransform(Matrix As Long)
'GdipSetWorldTransform GraphicsHwnd, Matrix
'End Sub


'===剪辑
Public Sub ClipByRectangle(Bounds As XBounds, CombineMode As CombineMode)
GdipSetClipRect Handle, Bounds.Left, Bounds.Top, Bounds.Width, Bounds.Height, CombineMode
End Sub
Public Sub ClipByPath(Path As XPath, CombineMode As CombineMode)
GdipSetClipPath Handle, Path.Handle, CombineMode
End Sub
Public Sub ClipByRegion(Region As XRegion, CombineMd As CombineMode)
GdipSetClipRegion Handle, Region.Handle, CombineMd
End Sub
Public Sub ClipReset()
GdipResetClip Handle
End Sub


Private Sub IDispose_Dispose()
    GdipDeleteGraphics Handle
    XGraphModule.TerminateGdip
End Sub

Private Sub Class_Terminate()
    IDispose_Dispose
End Sub
