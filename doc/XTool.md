# XGraph绘图工具类

[XPen](#XPen)

[XSolidBrush](#XSolidBrush)

[XTexture](#XTexture)

[1]:[tool]
[2]:[dispose]
[3]:[alignment]
[4]:[color]
[5]:[Brush]
[6]:[tex]

# <div id="XPen">XPen</div>
## 实现的接口
[XTool][1]

[XDispose][2]

## 方法
|Function Clone() As XPen|创建副本|
|:---:|:---:|

## 属性
| 名称| 返回类型 | 描述|
| :---:|:---:|:---:|
| Color |[XColor][4]|画笔颜色|
|Alignment|[PenAlignment][3]|画笔的线条对齐模式|
|Width|Single|画笔的粗细|
|Handle|Long|Gdiplus的Pen对象的句柄|

## 事件
|Event Change()|当画笔的属性发生改变时触发|
|:---:|:---:|
注意:使用Handle传入Gdip.bas的API进行的更改不会触发`Change`


# <div id="XSolidBrush">XSolidBrush</div>

## 实现的接口
[XTool][1]

[XDispose][2]

[XBrush][5]

## 方法
|Function Clone() As XSolidBrush|创建副本|
|:---:|:---:|

## 属性
| 名称| 返回类型 | 描述|
| :---:|:---:|:---:|
| Color |[XColor][4]|画刷的颜色|
|Handle|Long|Gdiplus的Solid对象的句柄|

## 事件
|Event Change()|当画刷的属性发生改变时触发|
|:---:|:---:|
注意:使用Handle传入Gdip.bas的API进行的更改不会触发`Change`

# <div id="XTexture">XTexture</div>

## 实现的接口
[XTool][1]

[XDispose][2]

[XBrush][5]

## 方法
|Function Clone() As XTexture|创建副本|
|:---:|:---:|

## 属性
| 名称| 返回类型 | 描述|
| :---:|:---:|:---:|
| Texture |[XBitmap][7]|材质刷子使用的材质|
|Handle|Long|Gdiplus的Texture对象的句柄|