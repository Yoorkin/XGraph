# XBitmap
图片对象,提供图片宽高信息,可通过`XGraphics`在图片上进行绘制.

## 属性
|名称|返回类型|描述|
|:---:|:---:|:---:|
|Width|Long|图片的宽度,单位为像素|
|Height|Long|图片的高度,单位为像素|
|Bounds|[XBounds](XBounds.md)|图片的高和宽集合|
|Graphics|[XGraphics](XGraphics.md)|图片的画布|
|Handle|Long|该Gdip对象的句柄|

## 方法
清空图片内容,使其变为全透明.
```
Sub Clean()
```
## 实现的接口
 XImage    

 [XDispose]()