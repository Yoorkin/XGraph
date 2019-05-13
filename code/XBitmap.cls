VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "XBitmap"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit

Implements XImage
Implements IDispose

Private h As Long
Private G As New XGraphics
Private Const GMEM_MOVEABLE As Long = &H2
Private Declare Function GlobalAlloc Lib "kernel32" (ByVal wFlags As Long, ByVal dwBytes As Long) As Long
Private Declare Function GlobalUnlock Lib "kernel32" (ByVal hMem As Long) As Long
Private Declare Function GlobalLock Lib "kernel32" (ByVal hMem As Long) As Long
Private Declare Function GlobalFree Lib "kernel32" (ByVal hMem As Long) As Long
Private Declare Sub RtlMoveMemory Lib "kernel32" (ByRef Destination As Any, ByRef source As Any, ByVal length As Long)
Private Declare Sub CreateStreamOnHGlobal Lib "ole32.dll" (ByVal hGlobal As Long, ByVal fDeleteOnRelease As Long, ByRef ppstm As Any)


Private Declare Function GdipCreateBitmapFromScan0 _
               Lib "gdiplus" (ByVal Width As Long, _
                              ByVal Height As Long, _
                              ByVal stride As Long, _
                              ByVal PixelFormat As GpPixelFormat, _
                              scan0 As Any, _
                              Bitmap As Long) As GpStatus
Private Declare Function GdipLoadImageFromFile _
               Lib "gdiplus" (ByVal Filename As Long, _
                              Image As Long) As GpStatus
Private Declare Function GdipCreateBitmapFromGraphics _
               Lib "gdiplus" (ByVal Width As Long, _
                              ByVal Height As Long, _
                              ByVal Graphics As Long, _
                              Bitmap As Long) As GpStatus
Private Declare Function GdipCreateBitmapFromStream _
               Lib "gdiplus" (ByVal stream As Any, _
                              Bitmap As Long) As GpStatus
Private Declare Function GdipDisposeImage Lib "gdiplus" (ByVal Image As Long) As GpStatus
Private Declare Function GdipLoadImageFromStream _
               Lib "gdiplus" (ByVal stream As Any, _
                              Image As Long) As GpStatus
Private Declare Function GdipGetImageBounds _
               Lib "gdiplus" (ByVal Image As Long, _
                              srcRect As RECTF, _
                              srcUnit As GpUnit) As GpStatus
Private Declare Function GdipCloneImage _
               Lib "gdiplus" (ByVal Image As Long, _
                              cloneImage As Long) As GpStatus
                              
                              
Friend Sub Create(Width As Long, Height As Long)
    GdipCreateBitmapFromScan0 Width, Height, 0, PixelFormat32bppARGB, ByVal 0, h
    G.CreateFormBitmap Me
End Sub
Friend Sub CreateFromFile(Filename As String)
    GdipLoadImageFromFile StrPtr(Filename), h
End Sub
Friend Sub CreateFromGraphics(Graphics As XGraphics, Width As Long, Height As Long)
    GdipCreateBitmapFromGraphics Width, Height, Graphics.Handle, h
End Sub
Friend Sub CreateFromRes(ByVal FileIndex As Long)
    Dim ResData() As Byte, IStream As Object, hMemObj As Long, pMem As Long
    ResData = LoadResData(FileIndex, "CUSTOM")
    hMemObj = GlobalAlloc(GMEM_MOVEABLE, UBound(ResData) + 1) '申请新内存获得句柄
    pMem = GlobalLock(hMemObj) '锁定内存块，返回内存块的指针
    If pMem = 0 Then Debug.Print "Global alloc failed!"
    RtlMoveMemory ByVal pMem, ResData(0), UBound(ResData) + 1 '复制源数据到新内存。
    GlobalUnlock hMemObj '解锁
    CreateStreamOnHGlobal ByVal hMemObj, False, IStream  '根据新内存句柄创建IStream
    GdipLoadImageFromStream IStream, h  '建立Image
    Set IStream = Nothing
    GlobalFree hMemObj  '释放新内存
End Sub

Public Property Get Handle() As Long
    Handle = h
End Property
Friend Property Let Handle(Value As Long)
    h = Value
End Property

Public Property Get Graphics() As XGraphics
    Set Graphics = G
End Property

Public Sub Clean()
    Dim md As CompositingMode
    md = Graphics.CompositingMode
    G.CompositingMode = CompositingModeSourceCopy
    G.Clear RGBA(0, 0, 0, 255)
    G.CompositingMode = md
End Sub

Public Property Get Width() As Long
    Width = Bounds.Width
End Property
Public Property Get Height() As Long
    Height = Bounds.Height
End Property
Public Property Get Bounds() As XBounds
    Dim R As RECTF
    GdipGetImageBounds h, R, UnitPixel
    Set Bounds = New XBounds
    Bounds.Create CInt(R.Left), CInt(R.Top), CInt(R.Bottom), CInt(R.Right)
End Property

Public Function Clone() As XBitmap
    Set Clone = New XBitmap
    Dim ch As Long
    GdipCloneImage h, ch
    Clone.Handle = ch
End Function

Private Sub Class_Terminate()
    IDispose_Dispose
End Sub

Private Sub IDispose_Dispose()
    GdipDisposeImage h
End Sub

Private Sub XImage_Clean()
    Clean
End Sub

Private Property Get XImage_Graphics() As XGraphics
    Set XImage_Graphics = G
End Property

Private Property Get XImage_Height() As Long
    XImage_Height = Height
End Property

Private Property Get XImage_Width() As Long
    XImage_Width = Width
End Property
