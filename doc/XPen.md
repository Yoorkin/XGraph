# XPen


## 方法
|Function Clone() As XPen|创建副本|
|:---:|:---:|

## 属性
| 名称| 返回类型 | 描述|
| :---:|:---:|:---:|
| Color |[XColor](XColor.md)|画笔颜色|
|Alignment|[PenAlignment](PenAlignment.md)|画笔的线条对齐模式|
|Width|Single|画笔的粗细|
|Handle|Long|Gdiplus的Pen对象的句柄|

## 事件
* ### **Change**
   ```
   Event Change()
   ```
   当画笔的属性发生改变时触发

   *note:使用Handle传入Gdip.bas的API进行的更改不会触发`Change`*

## 实现的接口

XTool

[IDispose](IDispose.md)
