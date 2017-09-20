# [English](README.md)
# SwiftDevHints
Swift日常开发工具集

- [功能](#features)
- [环境要求](#requirements)
- [安装](#installation)
- [使用说明](#usage)
    + [随机数生成](#random-int)
    + [格式化输出](#format-int-and-double)
    + [浮点型数据的四舍五入](#round-double)
    + [改造UserDefaults](#new-method-using-userdefaults)
    + [改造print函数](#debug-print-log)
    + [UIColor Extensions](#uicolor-extensions)
    + [Custom Segue](#custom-segue)
    + [CircularImageView](#circularimageview)
 - [联系方式](#contact)
- [版权](#license)

## 功能

- [x] 随机数生成
- [x] 格式化输出
- [x] 浮点型数据的四舍五入
- [x] 改造UserDefaults
- [x] 改造print函数
- [x] UIColor Init with RGBA(Int) and get RGBA(Int)
- [x] Custom Segue
- [x] CircularImageView
- [ ] Base64 Encoding and Decoding
- [ ] Handling empty and nil for optional strings
- [ ] Generic Table View Controller
- [ ] Nib Register for UITableViewCell
- [ ] Convenient Methods for Adding Constraints
- [ ] Networking

## 环境要求

- iOS 9.0+
- Swift 3

## 安装

### CocoaPods

```ruby
pod 'SwiftDevHints'
```

## 使用说明

### 随机数生成

```swift
import SwiftDevHints

let randomInt = (0...10).randomInt // randomInt is Int number between 0 ~ 10 (include 10)
let randomInt = (0..<10).randomInt // randomInt is Int number between 0 ~ 10 (not include 10)
```

### 格式化输出

```
import SwiftDevHints

let aInt = 8
let formatedInt1 = aInt.format("03") // "008"
let formatedInt2 = aInt.format("3") // "  8"
```

```swift
import SwiftDevHints

let aDouble = 3.14159265
let formatedDouble = aDouble.format(".2") // "3.14"
let formatedDouble = aDouble.format(".3") // "3.142"
```

### 浮点型数据的四舍五入

```swift
import SwiftDevHints

let aDouble = 3.14159265
let roundedDouble1 = aDouble.roundTo(places: 2) // 3.14
let roundedDouble2 = aDouble.roundTo(places: 3) // 3.142

let aFloat: Float = 3.14159265
let roundedFloat1 = aFloat.roundTo(places: 2) // 3.14
let roundedFloat2 = aFloat.roundTo(places: 3) // 3.142
```

### 改造UserDefaults

```swift
import SwiftDevHints

extension UserDefaults.Name {
    static let Username: UserDefaults.Name = "SwiftDevHints-Demo.Username"
    static let Password: UserDefaults.Name = "SwiftDevHints-Demo.Password"
}

UserDefaults.standard.set("Derek", forName: .Username)
UserDefaults.standard.set("Password", forName: .Password)

let username = UserDefaults.standard.string(forName: .Username)
let password = UserDefaults.standard.string(forName: .Password)
```


### 改造print函数

- 支持显示输出语句的所在的文件，函数和行数
- 支持不输出任何信息
- 支持release模式，自动失效。

```swift
import SwiftDevHints

// PrintHelperViewController.swift
func testPrintLog() {
    debugPrintLog("Hello, World!")
}

// 输出结果： PrintHelperViewController.swift:testPrintLog():20 -> Hello, World!
```
```swift
// PrintHelperViewController.swift
func testPrintLog() {
    debugPrintLog()
}
// 输出结果： PrintHelperViewController.swift:testPrintLog():20
```

### UIColor Extensions

```swift
// Initialize UIColor with RGB based 255
let color = UIColor(redIn255: 255, greenIn255: 0, blueIn255: 0, alphaIn100: 100)

// Get RGBA based 1.0 from a color
let rgba = color.rgba  // rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) 

// Get RGB based 255 and A base 100 from a color
let rgbaInt = color.intRGBA // rgbaInt: (red: Int, green: Int, blue: Int, alpha: Int)
```

### Custom Segue
```swift
extension CustomSegue {
    static let ShowCustomSegue: CustomSegue = "ShowCustomSegue"
}

class ViewController: UIViewController {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performCustomSegue(.ShowCustomSegue)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.customSegue {
        case CustomSegue.ShowCustomSegue:
            // configuration
        default: break
        }
    }   
}
```

### CircularImageView
Using in Storyboard
* Marked your UIView as `CircularImageView` in Xcode
* You can change `image` and `saturation` properties directly in Xcode

Using programmatically
```swift
let circularImageView = CircularImageView(frame: frame)
```

<!---
### Generic Table View Controllers

```swift
import SwiftDevHints

struct Category {
    var title: String
}
let categories = [Category(title: "Computers"), Category(title: "Electronics")]

let categoriesVC = ItemsViewController(items: categories, configure: { (cell, category) in
    cell.textLabel?.text = category.title
})
nc.pushViewController(categoriesVC, animated: true)
```


### Nib Register for UITableViewCell

```swift
import SwiftDevHints

override func viewDidLoad() {
    super.viewDidLoad()
    
    registerNibForCellWithIdentifier(ItemCell.cellIdentifier, tableView: tableView)
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: ItemCell.cellIdentifier, for: indexPath) as! ItemCell
    // configure cell
    return cell
}
```

### Convenient Methods for Adding Constraints

```
```

### Networking

```swift
```
-->

## 联系方式

你可以在 [Twitter](https://twitter.com/derekcoder_)关注和联系我. 如果你有任何问题和建议，也非常欢迎 [open a ticket](https://github.com/derekcoder/SwiftDevHints/issues/new)。
## 版权

SwiftDevHints is released under the MIT license. [See LICENSE](https://github.com/derekcoder/SwiftDevHints/blob/master/LICENSE) for details.

