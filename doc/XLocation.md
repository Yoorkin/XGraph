# XLocation 目录
`XLocation`是XGraph中所有用于表示坐标和高宽的类实现的接口。以下类实现了`XLocation`:

[XPoint](#XPoint)

[XBounds](#XBounds)

[XSize](#XSize)

[XThickness](#XTickness)


---
# 详细

# <div id="XPoint">XPoint</div>
坐标集合

## 成员
| 成员 | 返回类型 | 描述 |
| :---: | :---: | :-:|
| x | Long | x坐标值|
| y | Long | y坐标值|
| Clone | XPoint | 克隆信息相同的的副本 |

## 创建方法

```
Dim P as XPoint
Set P = XGraph.Pos(100,200)
'不写XGraph.也行，下同
Set P = Pos(100,200) 
```


# <div id="XBounds">XBounds</div>
宽高和xy信息的集合
## 成员

| 成员 | 返回类型 | 描述 |
| :---: | :---: | :-:|
| x | Long | x坐标值|
| y | Long | y坐标值|
| Width | Long | 宽度|
| Heght | Long | 高度|
| Clone | XBounds | 克隆信息相同的的副本 |

## 创建方法

```
Dim b as XBounds
Set b = XGraph.Bounds(10,10,100,200)
```

## <div id="XSize">XSize</div>

宽高信息的集合
## 成员

| 成员 | 返回类型 | 描述 |
| :---: | :---: | :-:|
| Width | Long | 宽度|
| Heght | Long | 高度|
| Clone | XSize | 克隆信息相同的的副本 |

## 创建方法

```
Dim s as XSize
Set s = XGraph.Size(100,200)
```


## <div id="XThickness">XTickness</div>
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