
[1]: https://github.com/Yoorkin/XGraph/tree/master/doc/XTool.md
[2]: https://github.com/Yoorkin/XGraph/tree/master/doc/XBounds.md
[3]: https://github.com/Yoorkin/XGraph/tree/master/doc/XPoint.md
[4]: https://github.com/Yoorkin/XGraph/tree/master/doc/XPen.md
[5]: https://github.com/Yoorkin/XGraph/tree/master/doc/XPath.md
[6]: https://github.com/Yoorkin/XGraph/tree/master/doc/XBitmap.md


## XGraphics
画布.创建后可在相应位置进行多种绘图操作.使用最频繁,是XGraph的核心类.
## 创建
从设备相关上下文(hdc)创建:
```
Function GraphicsFromHdc(Hdc as long)
```
|名称|类型|描述|
|:---:|:---:|:---:|
|Hdc|Long|设备相关上下文|


从窗体句柄(Hwnd)创建:
```
Function GraphicsFormHwnd(Hwnd as long)
```
|名称|类型|描述|
|:---:|:---:|:---:|
|Hwnd|Long|窗体句柄|

## 属性
|名称|类型|描述|
|:---:|:---:|:---:|
|InterpolationMode|[InterpolationMode]()|插值模式,与绘制图片时缩放的质量有关.拉伸像素画时应设置为无插值|
|SmoothingMode|[SmoothingMode]()|平滑模式,可设置为抗锯齿.|
|CompositingMode|[CompositingMode]()|作图模式.可设置为混合或复制.|
|TextRenderingHint|[TextRenderingHint]()|文字渲染模式|

## 方法
|名称|描述|
|:---:|:---:|
|[Clear](#Clear)|清空画布|
|[DrawEllipose](#DrawEllipse)|绘制椭圆|
| [DrawPolygon](#DrawPolygon)|绘制多边形|
|[DrawLine](#DrawLine)|绘制线段|
|[DrawBezier](#DrawBezier)|绘制贝塞尔曲线|
|[DrawArc](#DrawArc)|绘制圆弧|
|[DrawPie](#DrawPie)|绘制饼图|
|[DrawPath](#DrawPath)|绘制路径|
|[DrawRectangle](#DrawRectangle)|绘制矩形|
|[DrawBitmap](#DrawBitmap)|绘制位图|
|[DrawBitmapStretch](#DrawBitmapStretch)|拉伸并绘制位图|
|[DrawBitmapClip](#DrawBitmapClip)|剪裁拉伸并绘制位图|
|[DrawRoundRectangle](#DrawRoundRectangle)|绘制圆角矩形|
|[DrawText](#DrawText)|绘制文本|
### **<div id="Clear">Clear<div/>**
清空画布
```
Sub Clear(Optional Color As XColor)
```
参数|类型|描述
|:---:|:---:|:---:|
Color|[XColor](#https://github.com/Yoorkin/XGraph/tree/master/doc/XColor.md)|可选,清除画布时使用的颜色.若为空则使用白色.

### **<div id="DrawEllipose">DrawDllipose<div/>**
绘制椭圆
```
Sub DrawEllipse(Tool As XTool, Bounds As XBounds)
```

参数|类型|描述
---:|:---:|:---
Tool|[XTool][1]|要使用的绘图工具
Bounds|[XBounds][2]|绘制的椭圆的坐标及大小|

### **<div id="DrawPolygon">DrawPolygon<div/>**
绘制多边形
```
Sub DrawPolygon(Tool As XTool, Fillmode As Fillmode, ParamArray Points() As Variant)
```
参数|类型|描述
---:|:---:|:---
Tool|[XTool][1]|要使用的绘图工具
Points()|Variant|按顺序排列的多边形的所有点,组成`Points()`的对象类型应为[XPoint][3]|
***tips:*** *可使用[Array函数](#http://www.w3school.com.cn/vbscript/func_array.asp)初始化`Points()`*


### **<div id="DrawLine">DrawLine<div/>**
绘制线段
```
Sub DrawLine(Pen As XPen, Point1 As XPoint, Point2 As XPoint)
```
参数|类型|描述
---:|:---:|:---
Tool|[XTool][1]|要使用的绘图工具
Point1|[XPoint][3]|起点
Point2|[XPoint][3]|终点

### **<div id="DrawBezier">DrawBezier<div/>**
绘制[贝塞尔曲线](#https://baike.baidu.com/item/%E8%B4%9D%E5%A1%9E%E5%B0%94%E6%9B%B2%E7%BA%BF)
```
DrawBezier(Pen As XPen, Point1 As XPoint, Point2 As XPoint, Point3 As XPoint, Point4 As XPoint)
```
参数|类型|描述
---:|:---:|:---
XPen|[XPen][4]|要使用的画笔
Point1|[XPoint][3]|
Point2|[XPoint][3]|
Point3|[XPoint][3]|
Point4|[XPoint][3]|

### **<div id="DrawArc">DrawArc<div/>**
绘制圆弧
```
Sub DrawArc(Pen As XPen, Bounds As XBounds, ByVal StartAngle As Single, ByVal SweepAngle As Single)
```
参数|类型|描述
---:|:---:|:---
XPen|[XPen][4]|要使用的画笔
Bounds|[XBounds][2]|绘制的圆弧的坐标及大小|
StartAngle|Single|起始角度
SweepAngle|Single|跨过的角度

*角度的零点位于坐标系中x的正半轴,从逆时针角度大小递增.*
### **<div id="DrawPie">DrawPie<div/>**
绘制饼图
```
DrawPie(Tool As XTool, Bounds As XBounds, StartAngle As Single, SweepAngle As Single)
```
参数|类型|描述
---:|:---:|:---
Tool|[XTool][1]|要使用的绘制工具
Bounds|[XBounds][2]|绘制的圆弧的坐标及大小|
StartAngle|Single|起始角度
SweepAngle|Single|跨过的角度

*角度的零点位于坐标系中x的正半轴,从逆时针角度大小递增.*

### **<div id="DrawPath">DrawPath<div/>**
绘制路径
```
Sub DrawPath(Tool As XTool, Path As XPath)
```
参数|类型|描述
---:|:---:|:---
Tool|[XTool][1]|要使用的绘制工具
Path|[Path][5]|要使用的路径

### **<div id="DrawRectangle">DrawRectangle<div/>**
绘制矩形
```
Sub DrawRectangle(Tool As XTool, Bounds As XBounds)
```
参数|类型|描述
---:|:---:|:---
Tool|[XTool][1]|要使用的绘制工具
Bounds|[XBounds][2]|绘制的矩形的坐标及大小|
### **<div id="DrawBitmap">DrawBitmap<div/>**
绘制位图
```
Sub DrawBitmap(Bitmap As XBitmap, Point As XPoint)
```
参数|类型|描述
---:|:---:|:---
Bitmap|[XBitmap][6]|位图
Point|[XPoint][3]|绘制坐标

### **<div id="DrawBitmapStretch">DrawBitmapStretch<div/>**
拉伸并绘制位图
```
Sub DrawBitmapStretch(Bitmap As XBitmap, Bounds As XBounds) 
```
参数|类型|描述
---:|:---:|:---
Bitmap|[XBitmap][6]|位图
Bounds|[XBounds][2]|绘制坐标及宽高
### **<div id="DrawBitmapClip">DrawBitmapClip<div/>**
拉伸剪裁并绘制位图
```
Sub DrawBitmapClip(Bitmap As XBitmap, Target As XBounds, source As XBounds)
```
参数|类型|描述
---:|:---:|:---
Bitmap|[XBitmap][6]|位图
Target|[XBounds][2]|目标区域的坐标及宽高
Source|[XBounds][2]|源区域的坐标及宽高

### **<div id="DrawRoundRectangle">DrawRoundRectangle<div/>**
绘制圆角矩形
```
Sub DrawRoundRectangle(Tool As XTool, Bounds As XBounds, Corner As XThickness)
```
参数|类型|描述
---:|:---:|:---
Tool|[XTool][1]|要使用的绘制工具
Bounds|[XBounds][2]|绘制的矩形的坐标及大小|
Corner|[XTickness](#https://github.com/Yoorkin/XGraph/tree/master/doc/XTickness.md)|四个角的圆弧的半径

### **<div id="DrawText">DrawText<div/>**
绘制文本
```
Sub DrawText(Brush As XBrush, Context As String, Font As XFont, Bounds As XBounds)
```
参数|类型|描述
---:|:---:|:---
Brush|[XBrush](#https://github.com/Yoorkin/XGraph/tree/master/doc/XBrush.md)|要使用的画刷
Context|String|文字内容
Font|[XFont](#https://github.com/Yoorkin/XGraph/tree/master/doc/XFont.md)|字形
Bounds|[XBounds][2]|绘制的文字的限制区域|

## 实现的接口
[IDispose](#https://github.com/Yoorkin/XGraph/tree/master/doc/IDispose.md)


















