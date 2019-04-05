![](/SwiftDevHints/Assets/swiftdevhints.png)

[![Version](https://img.shields.io/cocoapods/v/SwiftDevHints.svg?style=flat)](http://cocoapods.org/pods/SwiftDevHints)
[![License](https://img.shields.io/cocoapods/l/SwiftDevHints.svg?style=flat)](http://cocoapods.org/pods/SwiftDevHints)
[![Platform](https://img.shields.io/cocoapods/p/SwiftDevHints.svg?style=flat)](http://cocoapods.org/pods/SwiftDevHints)

## Requirements

- iOS 10.0+
- Swift 4.2+

## Installation

Tapticc is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SwiftDevHints'
```

## Usage

* String Extensions
* Collection Optional Extensions
* Optional Extensions
* Collection Extensions
* UITableView Extensions
* UserDefaults Extensions
* UIColor Extensions
* Bundle Extensions
* Date Extensions
* Others

### String Extensions

The safe way to return string slice
```swift
let string = "Hello, Swift!"
string[safe: 0..<5]  // "Hello"
string[safe: 0...4]  // "Hello"
string[safe: 0..<14] // nil
```

`md5`
Converted to MD5
```swift
"hello".md5 // 5d41402abc4b2a76b9719d911017c592
```

`intBaseHex`
Get int value form hex string
```swift
print("FF".intBaseHex)  // 255
print("Ff".intBaseHex)  // 255
print("fF".intBaseHex)  // 255
print("ff".intBaseHex)  // 255
print("0xff".intBaseHex)  // 255
print("fg".intBaseHex)  // nil
```

`trimmed()`
```swift
" hello world \n\t".trimmed()  // "hello world"
```

`trimming()`
```swift
var string = " hello world \n\t"
string.trimming()
string  // "hello world"
```

`isBlank`
```swift
" \n\t ".isBlank  // true
```

`nilIfEmpty`
```swift
"".nilIfEmpty  // nil

let result = ["Derek", "", "John", "", "Tony", nil].compactMap { $0.nilIfEmpty } 
result  // ["Derek", "John", "Tony"]

guard let text = textField.text.nilIfEmpty else {
    // handle for nil or empty
    return
}
```

### Collection Optional Extensions

`isNilOrEmpty`
```swift
"".isNilOrEmpty  // true
([] as? [String]).isNilOrEmpty  // true
```

### Optional Extensions

`isNone` & `isSome`
```swift
"hello".isNone  // false
"hello".isSome  // true

var name: String? = nil
name.isNone  // true
name.isSome  // false
```

`noneDo` & `someDo`
```swift
var name: String? = nil

name.noneDo {
    print("name is nil")
}

name.someDo {
    print("name is not nil")
}

name.someDo {
    print("name has a value \($0)")
}
```

### Collection Extensions

The safe way to return element at specified index
```swift
let animals = ["Zebra", "Giraffe", "Tiger"]
let zebra = animals[safe: 0] // "Zebra"
let lion = animals[safe: 3] // nil
```

### UITableView Extensions

Register & Dequeue UITableViewCell
```swift
class UserCell: UITableViewCell, NibReusable { }

tableView.register(UserCell.self)
let cell: UserCell = tableView.dequeueReusableCell(for: indexPath)
```

### UICollectionView Extensions

Register & Dequeue UICollectionViewCell
```swift
class PhotoCell: UICollectionViewCell, NibReusable { }

collectionView.register(PhotoCell.self)
let cell: PhotoCell = collectionView.dequeueReusableCell(for: indexPath)
```

### UserDefaults Extensions

A safe way to use UserDefaults
```swift
extension UserDefaults.Name {
static let username: UserDefaults.Name = "SwiftDevHints-Demo.Username"
static let password: UserDefaults.Name = "SwiftDevHints-Demo.Password"
}

// Register Initial Value
UserDefaults.standard.register(defaults: [.username: "Unknown"])

// Set Value
UserDefaults.standard.set("Derek", forName: .username)
UserDefaults.standard.set("12345", forName: .password)

// Get Value
let username = UserDefaults.standard.string(forName: .username)
let password = UserDefaults.standard.string(forName: .password)
```

### UIColor Extensions

Initialize UIColor with RGB based 255
```swift
let color = UIColor(redIn255: 255, greenIn255: 32, blueIn255: 171)
```

Initialize UIColor with RGB Hex String
```swift
let color = UIColor(hex: "FF20AB") 
// let color = UIColor(hex: "ff20ab") 
// let color = UIColor(hex: "#FF20AB") 
// let color = UIColor(hex: "#ff20ab")
```

Get RGB(A) from a color
```swift
let rgba = color.rgba // (red 1.0, green 0.125490196078431, blue 0.670588235294118, alpha 1.0)
let intRGBA = color.intRGBA // (red 255, green 32, blue 171, alpha 100)
let hexRGB = hexRGB(prefix: "#") // "#FF20AB"
// let hexRGB = hexRGB() // "FF20AB"
```

### Bundle Extensions

Convenient methods to access Info.plist
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

### Date Extensions

Some convenient methods
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

### Others

Customized Log function

```swift
// PrintHelperViewController.swift
func testPrintLog() {
    Log.debug("Hello, World!")
}

// Console：PrintHelperViewController.testPrintLog():20 DEBUG -> Hello, World!
```

Format Int and Double
```swift
let aInt = 8
let formatedInt1 = aInt.format("03") // "008"
let formatedInt2 = aInt.format("3") // "  8"

let aDouble = 3.14159265
let formatedDouble = aDouble.format(".2") // "3.14"
let formatedDouble = aDouble.format(".3") // "3.142"
```

## References

- https://github.com/Luur/SwiftTips#1-safe-way-to-return-element-at-specified-index
- https://github.com/onevcat/Kingfisher
- https://github.com/AliSoftware/Reusable
- https://github.com/andyyhope/nemo

## Author

- Twitter: [@derekcoder_](https://twitter.com/derekcoder_)
- Weibo: [@derekcoder](https://weibo.com/u/6155322764)
- Email: derekcoder@gmail.com

## Donation
If you like this project or has been helpful to you, you can buy me a cup of coffe ☕️. Very appreciate it!😉 

[![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg)](http://paypal.me/derekcoder)

## License

SwiftDevHints is released under the MIT license. [See LICENSE](https://github.com/derekcoder/SwiftDevHints/blob/master/LICENSE) for details.
