# XColor
颜色对象

## 创建方法
* **RGBA**
    ```
     Function RGBA(Red As Byte, Green As Byte, Blue As Byte, Optional Alpha As Byte = 255) As XColor
    ```
     |参数|类型|描述|
    |:---:|:---:|:---:|
    |Red|Byte|红色通道|
    |Green|Byte|绿色通道|
    |Blue|Byte|蓝色通道|
     |Alpha|Byte|不透明度|
* **ColorFromCode**

    从16位带Alpha通道的颜色码创建`XColor`
    ```
    ColorFromCode(Code as long) As XColor
    ```

* **ColorFormCodeWithAlpha**
    从从16位带Alpha通道的颜色码创建`XColor`并根据`Alpha`覆盖其透明度
    ```
    Function ColorFromCodeWithAlpha(Code as Long,Alpha As Long)as XColor
    ```

## 属性
|名称|返回类型|描述|
|:---:|:---:|:---|
|Code|Long|16位颜色码|
|Red|Byte|红色通道|
|Green|Byte|绿色通道|
|Blue|Byte|蓝色通道|
|Alpha|Byte|不透明度|