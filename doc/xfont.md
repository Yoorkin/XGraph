## XFont

保存字形信息,用于`XGraphics.DrawText`和`XPath.AddText`

## 创建
```
Function Fonts(Name As String, Size As Single, Style As FontStyle, Optional Alignment As StringAlignment = StringAlignment.StringAlignmentNear) As XFont
```
|参数|类型|描述|
|:---:|:---:|:---:|
|Name|String|字体名字|
|Size|Single|字号|
|Style|[FontStyle](FontStyle.md)|设置字形为加粗斜体等|
|StringAlignment|[StringAlignment](stringalignment.md)|设置对齐方式|

**例子:**
```
'创建一个字号为25的粗体带下划线的微软雅黑字形
Dim Yahei as XFont
Set Yahei = XGraph.Fonts("微软雅黑",25,FontStyleBold + FontStyleUnderline,StringAlignmentCenter)
```
*~~友情提示:社会险恶,版权流氓横行,使用微软雅黑等字体进行商业活动当心版权勒索~~*

## 属性
|名称|返回类型|描述|
|:---:|:---:|:---:|
|Name|String|字体名称|
|Size|Single|字号|
|Bold|Boolean|是否加粗|
|Underline|Boolean|是否加下划线|
|Strikeout|Boolean|是否加删除线|
|Italic|Boolean|是否为斜体|
|Alignment|[StringAlignment](stringalignment.md)|对齐方式|

## 方法
* ### **Clone**
    ```
    Function Clone() As XFont
    ```
    克隆字形副本


## 请查阅
[XGraphics](xgraphics.md).DrawText