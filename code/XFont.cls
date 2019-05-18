VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "XFont"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Private Declare Function GdipDeleteFontFamily _
               Lib "gdiplus" (ByVal fontFamily As Long) As GpStatus
Private Declare Function GdipDeleteFont Lib "gdiplus" (ByVal curFont As Long) As GpStatus
Private Declare Function GdipDeleteStringFormat _
               Lib "gdiplus" (ByVal StringFormat As Long) As GpStatus
Private Declare Function GdipCreateFontFamilyFromName _
               Lib "gdiplus" (ByVal Name As Long, _
                              ByVal fontCollection As Long, _
                              fontFamily As Long) As GpStatus
Private Declare Function GdipCreateFont _
               Lib "gdiplus" (ByVal fontFamily As Long, _
                              ByVal emSize As Single, _
                              ByVal Style As FontStyle, _
                              ByVal unit As GpUnit, _
                              createdfont As Long) As GpStatus
Private Declare Function GdipCreateStringFormat _
               Lib "gdiplus" (ByVal formatAttributes As Long, _
                              ByVal language As Integer, _
                              StringFormat As Long) As GpStatus
Private Declare Function GdipSetStringFormatAlign _
               Lib "gdiplus" (ByVal StringFormat As Long, _
                              ByVal Align As StringAlignment) As GpStatus
'Public Declare Function GdipCloneFont _
'               Lib "gdiplus" (ByVal curFont As Long, _
'                              cloneFont As Long) As GpStatus
'Public Declare Function GdipCloneFontFamily _
'               Lib "gdiplus" (ByVal fontFamily As Long, _
'                              clonedFontFamily As Long) As GpStatus
'Public Declare Function GdipCloneStringFormat _
'               Lib "gdiplus" (ByVal StringFormat As Long, _
'                              newFormat As Long) As GpStatus

Implements IDispose

Private mFont As Long, mStrformat As Long, mFontfam As Long, mStyle As FontStyle
Private mFontSize As Single, mFontName As String
Private mAlignment As StringAlignment
Private mBold As Boolean, mUnderline As Boolean, mItalic As Boolean, mStrikeout As Boolean

Public Function Clone() As XFont
    Set Clone = New XFont
    Clone.Create mFontName, mFontSize, mStyle, mAlignment
End Function

Friend Sub Create(FontName As String, Size As Single, Style As FontStyle, Alignment As StringAlignment)
    XGraphModule.InitGdip
    mStyle = Style
    mFontSize = Size
    mAlignment = Alignment
    Name = FontName
End Sub

Private Sub IDispose_Dispose()
    GdipDeleteFont mFont
    GdipDeleteStringFormat mStrformat
    GdipDeleteFontFamily mFontfam
    XGraphModule.TerminateGdip
End Sub

Private Sub Class_Terminate()
    IDispose_Dispose
End Sub

Friend Property Get Style() As Long
    Style = mStyle
End Property

Friend Property Get Font() As Long
    Font = mFont
End Property

Friend Property Get Strformat() As Long
    Strformat = mStrformat
End Property

Friend Property Get FontFam() As Long
    FontFam = mFontfam
End Property

'---������
Public Property Let Name(ByVal vData As String)
    mFontName = vData
    GdipDeleteFontFamily mFontfam
    GdipDeleteFont mFont
    GdipDeleteStringFormat mStrformat
    GdipCreateFontFamilyFromName StrPtr(mFontName), 0, mFontfam
    GdipCreateFont mFontfam, mFontSize, mStyle, UnitPixel, mFont
    GdipCreateStringFormat 0, 0, mStrformat
    GdipSetStringFormatAlign mStrformat, mAlignment
End Property
Public Property Get Name() As String
    Name = mFontName
End Property

'---�����С
Public Property Let Size(vData As Single)
    mFontSize = vData
    GdipDeleteFont mFont
    GdipCreateFont mFontfam, mFontSize, mStyle, UnitPixel, mFont
End Property
Public Property Get Size() As Single
    Size = mFontSize
End Property
'---����
Public Property Let Bold(vData As Boolean) '����
    If mBold <> vData Then
       If vData = True Then
          mStyle = mStyle + FontStyleBold
       Else
          mStyle = mStyle - FontStyleBold
       End If
    mBold = vData
    GdipDeleteFont mFont
    GdipCreateFont mFontfam, mFontSize, mStyle, UnitPixel, mFont
    End If
End Property
Public Property Get Bold() As Boolean
    Bold = mBold
End Property

Public Property Let Underline(vData As Boolean) '�»���
    If mUnderline <> vData Then
       If vData = True Then
          mStyle = mStyle + FontStyleUnderline
       Else
          mStyle = mStyle - FontStyleUnderline
       End If
    mUnderline = vData
    GdipDeleteFont mFont
    GdipCreateFont mFontfam, mFontSize, mStyle, UnitPixel, mFont
    End If
End Property
Public Property Get Underline() As Boolean
    Underline = mUnderline
End Property

Public Property Let Strikeout(vData As Boolean)  'ɾ����
    If mStrikeout <> vData Then
       If vData = True Then
          mStyle = mStyle + FontStyleStrikeout
       Else
          mStyle = mStyle - FontStyleStrikeout
       End If
    mStrikeout = vData
    GdipDeleteFont mFont
    GdipCreateFont mFontfam, mFontSize, mStyle, UnitPixel, mFont
    End If
End Property
Public Property Get Strikeout() As Boolean
    Strikeout = mStrikeout
End Property

Public Property Let Italic(vData As Boolean) 'б��
    If mItalic <> vData Then
       If vData = True Then
          mStyle = mStyle + FontStyleItalic
       Else
          mStyle = mStyle + FontStyleItalic
       End If
    mUnderline = vData
    GdipDeleteFont mFont
    GdipCreateFont mFontfam, mFontSize, mStyle, UnitPixel, mFont
    End If
End Property
Public Property Get Italic() As Boolean
    Italic = mItalic
End Property
'---���뷽ʽ
Public Property Let Alignment(vData As StringAlignment)
    mAlignment = vData
    GdipSetStringFormatAlign mStrformat, mAlignment
End Property
Public Property Get Alignment() As StringAlignment
    Alignment = mAlignment
End Property
