# [简体中文](README.md)
# SwiftDevHints

[![Version](https://img.shields.io/cocoapods/v/SwiftDevHints.svg?style=flat)](http://cocoapods.org/pods/SwiftDevHints)
[![License](https://img.shields.io/cocoapods/l/SwiftDevHints.svg?style=flat)](http://cocoapods.org/pods/SwiftDevHints)
[![Platform](https://img.shields.io/cocoapods/p/SwiftDevHints.svg?style=flat)](http://cocoapods.org/pods/SwiftDevHints)

A very useful set of development tools.

- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
    + [Format Int and Double](#format-int-and-double)
    + [Round Double](#round-double)
    + [Safe way to access element using subscript in collection](#safe-way-to-access-element-using-subscript-in-collection)
    + [New Method using UserDefaults](#new-method-using-userdefaults)
    + [Debug Print Log](#debug-print-log)
    + [UIColor Extensions](#uicolor-extensions)
    + [Custom Segue](#custom-segue)
    + [Optional Extension](#optional-extension)
    + [CircularImageView](#circularimageview)
    + [Convenient methods to access Info.plist](#convenient-methods-to-access-infoplist)
    + [Custom Some Functions](#custom-some-functions)
    + [Date Helper Methods](#date-helper-methods)
    + [SortDescriptor](#sortdescriptor)
    + [Typed Notifications](#typed-notifications)
    + [Auto Layout with Key Paths](#auto-layout-with-key-paths)
 - [Contact](#contact)
- [License](#license)

## Requirements

- iOS 9.0+
- Swift 4 (SwiftDevHints 0.4.x), Swift 3 (SwiftDevHints 0.3.x)

## Installation

### CocoaPods

```ruby
pod 'SwiftDevHints'
```

Swift 3
```ruby
pod 'SwiftDevHints', '~> 0.3.0'
```

## Usage

### Format Int and Double

```swift
let aInt = 8
let formatedInt1 = aInt.format("03") // "008"
let formatedInt2 = aInt.format("3") // "  8"

let aDouble = 3.14159265
let formatedDouble = aDouble.format(".2") // "3.14"
let formatedDouble = aDouble.format(".3") // "3.142"
```
### Round Double

```swift
let aDouble = 3.14159265
let roundedDouble1 = aDouble.roundTo(places: 2) // 3.14
let roundedDouble2 = aDouble.roundTo(places: 3) // 3.142

let aFloat: Float = 3.14159265
let roundedFloat1 = aFloat.roundTo(places: 2) // 3.14
let roundedFloat2 = aFloat.roundTo(places: 3) // 3.142
```
### Safe way to access element using subscript in collection

Referenced from https://github.com/Luur/SwiftTips#1-safe-way-to-return-element-at-specified-index

```swift
let animals = ["Zebra", "Giraffe", "Tiger"]
let zebra = animals[safe: 0] // "Zebra"
let lion = animals[safe: 3] // nil
```

### New Method using UserDefaults

New usage methods for `UserDefaults` like `NotificationCenter`
```swift
import SwiftDevHints

extension UserDefaults.Name {
    static let Username: UserDefaults.Name = "SwiftDevHints-Demo.Username"
    static let Password: UserDefaults.Name = "SwiftDevHints-Demo.Password"
}

// Register Initial Value
UserDefaults.standard.register(defaults: [.Username: "Unknown"])

// Set Value
UserDefaults.standard.set("Derek", forName: .Username)
UserDefaults.standard.set("Password", forName: .Password)

// Get Value
let username = UserDefaults.standard.string(forName: .Username)
let password = UserDefaults.standard.string(forName: .Password)
```


### Debug Print Log

- Support display file name, function name and line number
- `Log.debug` only valid for DEBUG mode

```swift
import SwiftDevHints

// PrintHelperViewController.swift
func testPrintLog() {
    Log.debug("Hello, World!")
}

// 输出结果： PrintHelperViewController.testPrintLog():20 DEBUG -> Hello, World!
```
```swift
// PrintHelperViewController.swift
func testPrintLog() {
    Log.debug()
}
// 输出结果： PrintHelperViewController.testPrintLog():20 DBEUG
```


### UIColor Extensions

```swift
// Initialize UIColor with RGB based 255 (255 32 171)
let color = UIColor(red: 255/255, green: 32/255, blue: 171/255, alpha: 1)

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

### Custom Segue
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
### Optional Extension

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

### Convenient methods to access Info.plist

```swift
let bundle = Bundle.main

let displayName = bundle.displayName  // String?
let identifier = bundle.identifier    // String?
let version = bundle.version          // String?
let build = bundle.build              // String?

// All keys
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
### Custom Some Functions

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

### Date Helper Methods

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

Idea and Implementation come from [Swift Talk: From Runtime Programming to Functions](https://talk.objc.io/episodes/S01E19-from-runtime-programming-to-functions)

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

Idea and Implementation come from [Swift Talk: Typed Notifications (Part 2)](https://talk.objc.io/episodes/S01E28-typed-notifications-part-2)

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

Idea and Implementation come from[Swift Talk: Auto Layout with Key Paths)](https://talk.objc.io/episodes/S01E75-auto-layout-with-key-paths)

```swift
parentView.addSubview(subview, constraints: [
    equal(\.topAnchor),
    equal(\.leadingAnchor),
    equal(\.trailingAnchor),
    equal(\.heightAnchor, to: 200),
])
```

## Contact

- [Blog](http://blog.derekcoder.com)
- [Twitter](https://twitter.com/derekcoder_)
- [Weibo](https://weibo.com/u/6155322764)
- Email: derekcoder@gmail.com

## License

SwiftDevHints is released under the MIT license. [See LICENSE](https://github.com/derekcoder/SwiftDevHints/blob/master/LICENSE) for details.

