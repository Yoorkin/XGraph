# XTickness

用于表示上下左右的边框厚度

| 成员 | 返回类型 | 描述 |
| :---: | :---: | :-:|
| Right | Long | 右边的厚度|
| Left | Long | 左边的厚度 |
| Bottom | Long | 底边的厚度|
| Top | Long | 上边的厚度 |
| Clone | XSize | 克隆信息相同的的副本 |

## 创建方法

```
Dim t as XTickness
Set t = XGraph.Tickness(4,4,4,4)
```

***tip:所有的创建方法均位于`XGraph`全局空间中,使用创建方法时可不加`XGraph.`***

## 实现的接口

[XLocation](XLocation.md)


## 请查阅

[XBounds](XBounds.md)

[XSize](XSize.md)

[XPoint](XPoint.md)