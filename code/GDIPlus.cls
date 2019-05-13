VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "GDIPlus"
Attribute VB_GlobalNameSpace = True
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit

Public Enum GpUnit
    UnitWorld = 0
    UnitDisplay
    UnitPixel
    UnitPoint
    UnitInch
    UnitDocument
    UnitMillimeter
End Enum

Public Enum GpStatus
    Ok = 0
    GenericError = 1
    InvalidParameter = 2
    OutOfMemory = 3
    ObjectBusy = 4
    InsufficientBuffer = 5
    NotImplemented = 6
    Win32Error = 7
    WrongState = 8
    Aborted = 9
    FileNotFound = 10
    ValueOverflow = 11
    AccessDenied = 12
    UnknownImageFormat = 13
    FontFamilyNotFound = 14
    FontStyleNotFound = 15
    NotTrueTypeFont = 16
    UnsupportedGdiplusVersion = 17
    GdiplusNotInitialized = 18
    PropertyNotFound = 19
    PropertyNotSupported = 20
    ProfileNotFound = 21
End Enum

Public Enum PenAlignment
    PenAlignmentCenter = 0
    PenAlignmentInset = 1
End Enum

Public Enum CombineMode
    CombineModeReplace = 0
    CombineModeIntersect
    CombineModeUnion
    CombineModeXor
    CombineModeExclude
    CombineModeComplement
End Enum

Public Enum Fillmode
    FillModeAlternate = 0
    FillModeWinding
End Enum

Public Enum FontStyle
    FontStyleRegular = 0
    FontStyleBold = 1
    FontStyleItalic = 2
    FontStyleBoldItalic = 3
    FontStyleUnderline = 4
    FontStyleStrikeout = 8
End Enum

Public Enum StringAlignment
    StringAlignmentNear = 0
    StringAlignmentCenter = 1
    StringAlignmentFar = 2
End Enum

Public Enum CompositingMode
    CompositingModeSourceOver = 0
    CompositingModeSourceCopy
End Enum

Public Enum QualityMode
    QualityModeInvalid = -1
    QualityModeDefault = 0
    QualityModeLow = 1
    QualityModeHigh = 2
End Enum

Public Enum CompositingQuality
    CompositingQualityInvalid = QualityModeInvalid
    CompositingQualityDefault = QualityModeDefault
    CompositingQualityHighSpeed = QualityModeLow
    CompositingQualityHighQuality = QualityModeHigh
    CompositingQualityGammaCorrected
    CompositingQualityAssumeLinear
End Enum

Public Enum TextRenderingHint
    TextRenderingHintSystemDefault = 0            ' Glyph with system default rendering hint
    TextRenderingHintSingleBitPerPixelGridFit     ' Glyph bitmap with hinting
    TextRenderingHintSingleBitPerPixel            ' Glyph bitmap without hinting
    TextRenderingHintAntiAliasGridFit             ' Glyph anti-alias bitmap with hinting
    TextRenderingHintAntiAlias                    ' Glyph anti-alias bitmap without hinting
    TextRenderingHintClearTypeGridFit             ' Glyph CT bitmap with hinting
End Enum
Public Enum SmoothingMode
    SmoothingModeInvalid = QualityModeInvalid
    SmoothingModeDefault = QualityModeDefault
    SmoothingModeHighSpeed = QualityModeLow
    SmoothingModeHighQuality = QualityModeHigh
    SmoothingModeNone
    SmoothingModeAntiAlias
    #If GdipVersion >= 1.1 Then
    SmoothingModeAntiAlias8x4 = SmoothingModeAntiAlias
    SmoothingModeAntiAlias8x8
    #End If
End Enum

Public Enum InterpolationMode
    InterpolationModeInvalid = QualityModeInvalid
    InterpolationModeDefault = QualityModeDefault
    InterpolationModeLowQuality = QualityModeLow
    InterpolationModeHighQuality = QualityModeHigh
    InterpolationModeBilinear
    InterpolationModeBicubic
    InterpolationModeNearestNeighbor
    InterpolationModeHighQualityBilinear
    InterpolationModeHighQualityBicubic
End Enum

'=================================
'Bitmap Structure
Public Type RGBQUAD
    rgbBlue     As Byte
    rgbGreen    As Byte
    rgbRed      As Byte
    rgbReserved As Byte
End Type

Public Type BITMAPINFOHEADER
    biSize          As Long
    biWidth         As Long
    biHeight        As Long
    biPlanes        As Integer
    biBitCount      As Integer
    biCompression   As Long
    biSizeImage     As Long
    biXPelsPerMeter As Long
    biYPelsPerMeter As Long
    biClrUsed       As Long
    biClrImportant  As Long
End Type

Public Type BITMAPINFO
    bmiHeader As BITMAPINFOHEADER
    bmiColors As RGBQUAD
End Type

Public Type BitmapData
    Width       As Long
    Height      As Long
    stride      As Long
    PixelFormat As GpPixelFormat
    scan0       As Long
    Reserved    As Long
End Type

'=================================
'Pixel
Public Enum GpPixelFormat
    PixelFormat1bppIndexed = &H30101
    PixelFormat4bppIndexed = &H30402
    PixelFormat8bppIndexed = &H30803
    PixelFormat16bppGreyScale = &H101004
    PixelFormat16bppRGB555 = &H21005
    PixelFormat16bppRGB565 = &H21006
    PixelFormat16bppARGB1555 = &H61007
    PixelFormat24bpprgb = &H21808
    PixelFormat32bppRGB = &H22009
    PixelFormat32bppARGB = &H26200A
    PixelFormat32bppPARGB = &HE200B
    PixelFormat48bppRGB = &H10300C
    PixelFormat64bppARGB = &H34400D
    PixelFormat64bppPARGB = &H1C400E
End Enum

'=================================
'Color Matrix
Public Enum MatrixOrder
    MatrixOrderPrepend = 0
    MatrixOrderAppend = 1
End Enum

Public Enum ColorAdjustType
    ColorAdjustTypeDefault = 0
    ColorAdjustTypeBitmap
    ColorAdjustTypeBrush
    ColorAdjustTypePen
    ColorAdjustTypeText
    ColorAdjustTypeCount
    ColorAdjustTypeAny
End Enum

Public Enum ColorMatrixFlags
    ColorMatrixFlagsDefault = 0
    ColorMatrixFlagsSkipGrays = 1
    ColorMatrixFlagsAltGray = 2
End Enum

Public Enum WarpMode
    WarpModePerspective = 0
    WarpModeBilinear
End Enum


Public Enum ImageLockMode
    ImageLockModeRead = 1
    ImageLockModeWrite = 2
    ImageLockModeUserInputBuf = 4
End Enum


'=================================
'Fill / Wrap


Public Enum WrapMode
    WrapModeTile = 0
    WrapModeTileFlipX
    WrapModeTileFlipY
    WrapModeTileFlipXY
    WrapModeClamp
End Enum

Public Enum LinearGradientMode
    LinearGradientModeHorizontal = 0
    LinearGradientModeVertical
    LinearGradientModeForwardDiagonal
    LinearGradientModeBackwardDiagonal
End Enum

'=================================
'Point Structure
Public Type POINTL
    X As Long
    Y As Long
End Type

Public Type POINTF
    X As Single
    Y As Single
End Type

'=================================
'Rectange Structure
Public Type RECTL
    Left   As Long
    Top    As Long
    Right  As Long
    Bottom As Long
End Type

Public Type RECTF
    Left   As Single
    Top    As Single
    Right  As Single
    Bottom As Single
End Type

'=================================
'Size Structure
Public Type SIZEL
    cx As Long
    cy As Long
End Type

Public Type SIZEF
    cx As Single
    cy As Single
End Type


