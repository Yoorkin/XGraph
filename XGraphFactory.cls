VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "XGraphFactory"
Attribute VB_GlobalNameSpace = True
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit

'Public Function Graphics() As XGraphics
'
'End Function

Public Enum LoactionType
 LoactionBounds = 1
 LoactionMarign = 2
End Enum

Public Function LoactionToBounds(Loaction As XLoaction) As XBounds
    Set LoactionToBounds = Loaction
End Function
Public Function LoactionToMarign(Loaction As XLoaction) As XThickness
    Set LoactionToMarign = Loaction
End Function

Public Function GraphicsFromHdc(Hdc As Long) As XGraphics
    Set GraphicsFromHdc = New XGraphics
    GraphicsFromHdc.CreateFromHdc Hdc
End Function

Public Function GraphicsFromHwnd(hwnd As Long) As XGraphics
    Set GraphicsFromHwnd = New XGraphics
    GraphicsFromHwnd.CreateFromHWND hwnd
End Function

Public Function BufferedBitmap(Width As Long, Height As Long) As XBufferedBitmap
    Set BufferedBitmap = New XBufferedBitmap
    BufferedBitmap.Create Width, Height
End Function

Public Function Fonts(Name As String, Size As Single, Style As FontStyle, Optional Alignment As StringAlignment = StringAlignment.StringAlignmentNear) As XFont
    Set Fonts = New XFont
    Fonts.Create Name, Size, Style, Alignment
End Function

Public Function Bounds(Left As Long, Top As Long, Height As Long, Width As Long) As XBounds
    Set Bounds = New XBounds
    Bounds.Create Left, Top, Height, Width
End Function

Public Function Size(Height As Long, Width As Long) As XSize
    Set Size = New XSize
    Size.Create Height, Width
End Function

Public Function Corner(TopLeft As Long, TopRight As Long, BottomRight As Long, BottomLeft As Long) As XThickness
    Set Corner = New XThickness
    Corner.Create TopLeft, TopRight, BottomRight, BottomLeft
End Function

Public Function Pos(X As Long, Y As Long) As XPoint
    Set Pos = New XPoint
    Pos.Create X, Y
End Function


Public Function Thickness(Left As Long, Top As Long, Right As Long, Bottom As Long) As XThickness
    Set Thickness = New XThickness
    Thickness.Create Left, Top, Bottom, Right
End Function

'Public Function Point(X As Long, Y As Long) As XPoint
'    Set Point = New XPoint
'    Point.Create X, Y
'End Function

'Public Function Color(Red As Byte, Green As Byte, Blue As Byte, Optional Alpha As Byte = 255) As XColor
'    Set Color = New XColor
'    Color.Create Red, Green, Blue, Alpha
'End Function

Public Function RGBA(Red As Byte, Green As Byte, Blue As Byte, Optional Alpha As Byte = 255) As XColor
    Set RGBA = New XColor
    RGBA.Create Red, Green, Blue, Alpha
End Function

Public Function Pen(Color As XColor, Optional Width As Single = 1, Optional Alignment As PenAlignment = 1) As XPen
    Set Pen = New XPen
    Pen.Create Color, Width, Alignment
End Function

Public Function SolidBrush(Color As XColor) As XSolidBrush
    Set SolidBrush = New XSolidBrush
    SolidBrush.Create Color
End Function

Public Function TextureBrush(Bitmap As XBitmap, Wrapmd As WrapMode) As XTextureBrush
    Set TextureBrush = New XTextureBrush
    TextureBrush.Create Bitmap, Wrapmd
End Function

Public Function Region() As XRegion
    Set Region = New XRegion
    Region.Create
End Function

Public Function Path(Fillmd As Fillmode) As XPath
    Set Path = New XPath
    Path.Create Fillmd
End Function

'º”‘ÿÕº∆¨
Public Function Bitmap(ByVal Width As Long, ByVal Height As Long) As XBitmap
    Set Bitmap = New XBitmap
    Bitmap.Create Width, Height
End Function

Public Function BitmapFromFile(ByVal Filename As String) As XBitmap
    Set BitmapFromFile = New XBitmap
    BitmapFromFile.CreateFromFile Filename
End Function

Public Function BitmapFromGraphics(Graphics As XGraphics, Width As Long, Height As Long) As XBitmap
    Set BitmapFromGraphics = New XBitmap
    BitmapFromGraphics.CreateFromGraphics Graphics, Width, Height
End Function

Public Function BitmapFromRes(ByVal FileIndex As Long) As XBitmap
    Set BitmapFromRes = New XBitmap
    BitmapFromRes.CreateFromRes FileIndex
End Function



