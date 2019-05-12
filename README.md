 
# 概览
### XGraph是什么？
 XGraph是对Gdiplus的常用绘图函数和小部分GDI32函数进行封装的，旨在弥补VB6对绘图支持的缺陷的类库。

### 使用XGraph有什么好处？

* 使用面向对象的类似于DotNet中绘图库的方式让vb6调用Gdiplus
* 自动垃圾回收，避免因忘记销毁对象造成的内存泄露
* 不必记住Gdip.bas中又长又臭的的参数列表和函数名

# 快速开始
### 以绘制D盘根目录下名为Img的png为例:
* 下载本仓库的所有对象并添加至vb6的工程
*  声明一个XGraphics变量`Graphic` 并从Form1.frm的设备相关上下文实例化XGraphics 
```
‘Form1.frm中的代码
Dim Graphics as XGraphics
Set Graphics=XGraph.GraphicsFormHdc(Me.hdc)

```
* 创建Image对象
```
Dim Img as XImage
Set Img = XGraph.ImageFromFile("d:/Img.png")
```
* 在坐标为(100,200)处绘制图像
```
Graphics.DrawImage(Img,Pos(100,200))
```
   如果要对图片进行缩放，可以这样写：
```
'在(100,200)处绘制缩放到高为150,宽为300的Img
Graphics.DrawBitmapStrech(Img,Bounds(100,200,150,300)
```
### 文档和更多示例
  将会陆续更新

### 目前已封装的部分对象
|   类名     | 描述 |
| :-----: | :-----: |
|XGraphics| 画布。提供绘制图像、线段、椭圆、矩形、贝尔塞曲线、路径、多边形、文字、缩放、旋转等功能。
|    XPen     | 画笔。提供颜色、笔帽、宽度等属性。|
|     XSolidBrush    |实心画刷|
|    XTextureBrush     |材质画刷|
|     XImage    |图片。提供宽度高度属性。|
|     XPath    |路径|
|     XRegion    |区域|
|     XBufferBitmap | 缓冲位图|
|     XFonts    | 字形。封装了Gdiplus多个文字相关函数。提供加粗、下划线、斜体、删除线、字号等属性。|
|    XPoint|坐标点。提供xy坐标|
|    XBound|包围盒。提供xy坐标和长宽|









