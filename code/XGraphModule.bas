Attribute VB_Name = "XGraphModule"
Option Explicit

Public Declare Function GdiplusStartup _
               Lib "gdiplus" (Token As Long, _
                              inputbuf As GdiplusStartupInput, _
                              Optional ByVal outputbuf As Long = 0) As GpStatus
Public Declare Function GdiplusShutdown Lib "gdiplus" (ByVal Token As Long) As GpStatus

Public Type GdiplusStartupInput
    GdiplusVersion As Long
    DebugEventCallback As Long
    SuppressBackgroundThread As Long
    SuppressExternalCodecs As Long
End Type



Private Token As Long, ReferenceCount As Long

Public Sub InitGdip()
    ReferenceCount = ReferenceCount + 1
    If Token = 0 Then
        Dim GdipInput As GdiplusStartupInput
        GdipInput.GdiplusVersion = 1
        GdiplusStartup Token, GdipInput
    End If
End Sub
Public Sub TerminateGdip()
    ReferenceCount = ReferenceCount - 1
    If ReferenceCount = 0 Then
       GdiplusShutdown Token
    End If
End Sub

Public Function IsBrush(Tool As Object)
If Right(TypeName(Tool), 3) = "ush" Then IsBrush = True Else IsBrush = False
End Function
