# [English](README.en.md)

# SwiftDevHints

[![Version](https://img.shields.io/cocoapods/v/SwiftDevHints.svg?style=flat)](http://cocoapods.org/pods/SwiftDevHints)
[![License](https://img.shields.io/cocoapods/l/SwiftDevHints.svg?style=flat)](http://cocoapods.org/pods/SwiftDevHints)
[![Platform](https://img.shields.io/cocoapods/p/SwiftDevHints.svg?style=flat)](http://cocoapods.org/pods/SwiftDevHints)

Swift日常开发工具集

- [功能](#features)
- [环境要求](#requirements)
- [安装](#installation)
- [使用说明](#usage)
  + [快速生成指定范围的随机数](#快速生成指定范围的随机数)
  + [格式化输出](#格式化输出)
  + [浮点型数据的四舍五入](#浮点型数据的四舍五入)
  + [安全地使用下标访问集合中指定位置的元素](#安全地使用下标访问集合中指定位置的元素)
  + [改造UserDefaults](#改造userdefaults)
  + [改造print函数](#改造print函数)
  + [改造UIColor](#改造uicolor)
  + [更优雅的实现Segue](#更优雅的实现segue)
  + [改造Optional](#改造optional)
  + [CircularImageView](#circularimageview)
  + [快速读取Info.plist](#快速读取infoplist)
  + [自定义一些常用函数](#自定义一些常用函数)
  + [Date类的帮助方法](#date类的帮助方法)
  + [SortDescriptor](#sortdescriptor)
  + [Typed Notifications](#typed-notifications)
  + [Auto Layout with Key Paths](#auto-layout-with-key-paths)
    - [联系方式](#contact)
- [版权](#license)

## 环境要求

- iOS 9.0+
- Swift 4 (SwiftDevHints 0.4.x), Swift 3 (SwiftDevHints 0.3.x)

## 安装

### CocoaPods

Swift4

```ruby
pod 'SwiftDevHints'
```

## 使用说明

### 快速生成指定范围的随机数

 详细讲解：[Swift开发小技巧系列 - 随机数生成](http://blog.derekcoder.com/2017/09/13/swiftdevhints-random-int/)

```swift
let randomInt = (0...10).randomInt // 0 ~ 10 (包括10)之间的随机数
let randomInt = (0..<10).randomInt // 0 ~ 10 (不包括10)之间的随机数
```

### 格式化输出

详细讲解：[Swift开发小技巧系列 - 格式化输出](http://blog.derekcoder.com/2017/09/14/swiftdevhints-format-int-double/)

```swift
let aInt = 8
let formatedInt1 = aInt.format("03") // "008"
let formatedInt2 = aInt.format("3") // "  8"

let aDouble = 3.14159265
let formatedDouble = aDouble.format(".2") // "3.14"
let formatedDouble = aDouble.format(".3") // "3.142"
```

### 浮点型数据的四舍五入

详细讲解：[Swift开发小技巧系列 - 浮点型数据的四舍五入](http://blog.derekcoder.com/2017/09/15/swiftdevhints-round-double/)

```swift
let aDouble = 3.14159265
let roundedDouble1 = aDouble.roundTo(places: 2) // 3.14
let roundedDouble2 = aDouble.roundTo(places: 3) // 3.142

let aFloat: Float = 3.14159265
let roundedFloat1 = aFloat.roundTo(places: 2) // 3.14
let roundedFloat2 = aFloat.roundTo(places: 3) // 3.142
```

### 安全地使用下标访问集合中指定位置的元素

实现引用了：https://github.com/Luur/SwiftTips#1-safe-way-to-return-element-at-specified-index

```swift
let animals = ["Zebra", "Giraffe", "Tiger"]
let zebra = animals[safe: 0] // "Zebra"
let lion = animals[safe: 3] // nil
```

### 改造UserDefaults

[Swift开发小技巧系列 - 改造UserDefaults](http://blog.derekcoder.com/2017/09/19/swiftdevhints-new-methods-using-userdefaults/)

```swift
import SwiftDevHints

extension UserDefaults.Name {
    static let Username: UserDefaults.Name = "SwiftDevHints-Demo.Username"
    static let Password: UserDefaults.Name = "SwiftDevHints-Demo.Password"
}

// 注册初始值
UserDefaults.standard.register(defaults: [.Username: "Unknown"])

// 赋值
UserDefaults.standard.set("Derek", forName: .Username)
UserDefaults.standard.set("Password", forName: .Password)

// 取值
let username = UserDefaults.standard.string(forName: .Username)
let password = UserDefaults.standard.string(forName: .Password)
```

### 改造print函数

[Swift开发小技巧系列 - 改造print函数](http://blog.derekcoder.com/2017/09/20/swiftdevhints-debug-printlog/)

- 支持显示输出语句的所在的文件，函数和行数
- 支持不输出任何信息
- Release模式下自动失效。

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

### 改造UIColor

[Swift开发小技巧系列 - 改造UIColor](http://blog.derekcoder.com/2017/09/22/swiftdevhints-uicolor-extensions/)

- 支持直接以0 ~ 255 之间的RGB值来初始化UIColor
- 支持直接以十六进制长度RGB值初始化UIColor
- 可以直接根据UIColor对象得到各种格式的RGB值

```swift
// Initialize UIColor with RGB based 255 (255 32 171)
let color = UIColor(redIn255: 255, greenIn255: 32, blueIn255: 171)

// Initialize UIColor with RGB Hex String
let color = UIColor(hex: "FF20AB") 
// let color = UIColor(hex: "ff20ab") 
// let color = UIColor(hex: "#FF20AB") 
// let color = UIColor(hex: "#ff20ab")

// Get RGBA based 1.0 from a color
let rgba = color.rgba // (red 1.0, green 0.125490196078431, blue 0.670588235294118, alpha 1.0)

// Get RGB based 255 and A base 100 from a color
let intRGBA = color.intRGBA // (red 255, green 32, blue 171, alpha 100)

let rgbHexString = color.rgbHexString(prefix: "#") // "#FF20AB"
// let rgbHexString = color.rgbHexString() // "FF20AB"
```

### 更优雅的实现Segue

[Swift开发小技巧系列 - 更优雅的实现Segue](http://blog.derekcoder.com/2017/09/25/swiftdevhints-custom-segue/)

```swift
class TestCustomSegueViewController: UITableViewController, CustomSegueProtocol {
    enum CustomSegueIdentifier: String {
        case showNext
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performCustomSegue(.showNext, sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch customSegueIdentifier(forSegue: segue) {
        case .showNext:
            // Configuration for next page
        }
    }
}
```

### 改造Optional

[Swift开发小技巧系列 - 改造Optional](http://blog.derekcoder.com/2017/10/05/swiftdevhints-emptyandnil-for-optional/)

```swift
guard let text = textField.text.nilIfEmpty else {
    // handle for nil or empty
    return
}
// Do something with text
```

```swift
let names = ["Derek", "", "John", "", "Tony", nil]   // [String?]

let validNames1 = names.map { $0.nilIfEmpty }  // [String?]
print(validNames1) // [Optional("Derek"), nil, Optional("John"), nil, Optional("Tony"), nil]

let validNames2 = names.flatMap { $0.nilIfEmpty } // [String]
print(validNames2)  // ["Derek", "John", "Tony"]
```

### CircularImageView

Using in Storyboard

* Marked your UIView as `CircularImageView` in Xcode
* You can change `image` and `saturation` properties directly in Xcode

Using programmatically

```swift
let circularImageView = CircularImageView(frame: frame)
```

### 快速读取Info.plist

```swift
let bundle = Bundle.main

let displayName = bundle.displayName  // String?
let identifier = bundle.identifier    // String?
let version = bundle.version          // String?
let build = bundle.build              // String?

// 所有已经定义的可以快速访问的Key
private enum InfoPlistKey: String {
case name = "CFBundleName"
case displayName = "CFBundleDisplayName"
case developmentRegion = "CFBundleDevelopmentRegion"
case identifier = "CFBundleIdentifier"
case version = "CFBundleShortVersionString"
case build = "CFBundleVersion"
case packageType = "CFBundlePackageType"
}
```

### 自定义一些常用函数

```swift
// accumulate
let nums = [1, 2, 3, 4]
nums.accumulate(0, +)  // [1, 3, 6, 10]

// last
let names = ["Derek", "Tony", "Jogn"]
names.last { $0.hasPrefix("De") }  // Optional("Derek")

// all
let evenNums = [2, 4, 6, 8, 10]
evenNums.all { $0 % 2 == 0 }  // true

// map
let dict: [Int: String] = [1: "Apple", 2: "Google", 3: "Amazon"]
let newDict: [String: String] = dict.map { "Index \($0)" } // ["Index 1": "Apple", "Index 2": "Google", "Index 3": "Amazon"]
```

### Date类的帮助方法

```swift
let today = Date()                   // December 17, 2017 at 5:54:46 PM GMT+8
let startOfToday = today.startOfDay  // December 17, 2017 at 12:00:00 AM GMT+8
let endOfToday = today.endOfDay      // December 17, 2017 at 11:59:59 PM GMT+8
let previousDay = today.previousDay  // December 16, 2017 at 5:54:46 PM GMT+8
let nextDay = today.nextDay          // December 18, 2017 at 5:54:46 PM GMT+8

// December 14, 2017 at 5:54:46 PM GMT+8
// December 15, 2017 at 5:54:46 PM GMT+8
// December 16, 2017 at 5:54:46 PM GMT+8
let last3Days = today.lastDays(withCount: 3, includingToday: false)

// December 17, 2017 at 5:54:46 PM GMT+8
// December 18, 2017 at 5:54:46 PM GMT+8
// December 19, 2017 at 5:54:46 PM GMT+8
let next3Days = today.nextDays(withCount: 3, includingToday: true)
```

### SortDescriptor

想法和实现都来自[Swift Talk: From Runtime Programming to Functions](https://talk.objc.io/episodes/S01E19-from-runtime-programming-to-functions)

```swift
final class Person {
    var first: String
    var last: String
    var yearOfBirth: Int

    init(first: String, last: String, yearOfBirth: Int) {
        self.first = first
        self.last = last
        self.yearOfBirth = yearOfBirth
    }
}

let person1 = Person(first: "Jo", last: "Smith", yearOfBirth: 1970)
let person2 = Person(first: "Joanne", last: "Williams", yearOfBirth: 1985)
let person3 = Person(first: "Annie", last: "Williams", yearOfBirth: 1985)
let person4 = Person(first: "Robert", last: "Jones", yearOfBirth: 1990)

let people = [person1, person2, person3, person4]
let yearOfBirth: SortDescriptor<Person> = sortDescriptor { $0.yearOfBirth }
let lastName: SortDescriptor<Person> = sortDescriptor(property: { $0.last }, comparator: String.localizedCaseInsensitiveCompare)
let firstName: SortDescriptor<Person> = sortDescriptor(property: { $0.first }, comparator: String.localizedCaseInsensitiveCompare)
let sortedPeople = people.sorted(by: combine(sortDescriptors: [yearOfBirth, lastName, firstName]))
/*
person1: { first "Jo", last "Smith", yearOfBirth 1970 },
person3: { first "Annie", last "Williams", yearOfBirth 1985 },
person2: { first "Joanne", last "Williams", yearOfBirth 1985 },
person4: { first "Robert", last "Jones", yearOfBirth 1990 }
*/
```

### Typed Notifications

想法和实现都来自[Swift Talk: Typed Notifications (Part 2)](https://talk.objc.io/episodes/S01E28-typed-notifications-part-2)

```swift
struct KeyboardWillShowNotification: NotificationDescriptor {
    let beginFrame: CGRect
    let endFrame: CGRect
    let animationDuration: Double
    let animationCurve: UIViewAnimationCurve

    static let name = Notification.Name.UIKeyboardWillShow
    init(notification: Notification) {
        beginFrame = notification.userInfo![UIKeyboardFrameBeginUserInfoKey] as! CGRect
        endFrame = notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! CGRect
        animationDuration = notification.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! Double
        animationCurve = UIViewAnimationCurve(rawValue: notification.userInfo![UIKeyboardAnimationCurveUserInfoKey] as! Int)!
    }
}

let token = NotificationCenter.default.addObserver { (note: KeyboardWillShowNotification) in
    print(note)
}
```

### Auto Layout with Key Paths

想法和实现都来自[Swift Talk: Auto Layout with Key Paths)](https://talk.objc.io/episodes/S01E75-auto-layout-with-key-paths)

```swift
parentView.addSubview(subview, constraints: [
    equal(\.topAnchor),
    equal(\.leadingAnchor),
    equal(\.trailingAnchor),
    equal(\.heightAnchor, to: 200),
])
```

## 联系方式

- [博客](http://blog.derekcoder.com)
- [Twitter](https://twitter.com/derekcoder_)
- [微博](https://weibo.com/u/6155322764)
- 邮件: derekcoder@gmail.com

  ## 版权

SwiftDevHints is released under the MIT license. [See LICENSE](https://github.com/derekcoder/SwiftDevHints/blob/master/LICENSE) for details.
