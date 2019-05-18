# XSolidBrush



## 方法
|Function Clone() As XSolidBrush|创建副本|
|:---:|:---:|

## 属性
| 名称| 返回类型 | 描述|
| :---:|:---:|:---:|
| Color |[XColor](XColor.md)|画刷的颜色|
|Handle|Long|Gdiplus的Solid对象的句柄|

## 事件

*  ###  **Change**
   ```
   Event Change()
    ```
   当画刷的属性发生改变时触发


   *note:使用Handle传入Gdip.bas的API进行的更改不会触发`Change`*

## 实现的接口
[XTool](XTool.md)

[IDispose](IDispose.md)

[XBrush](XBrush.md)