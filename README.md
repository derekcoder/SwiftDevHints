![](/SwiftDevHints/Assets/swiftdevhints.png)

[![Version](https://img.shields.io/cocoapods/v/SwiftDevHints.svg?style=flat)](http://cocoapods.org/pods/SwiftDevHints)
[![License](https://img.shields.io/cocoapods/l/SwiftDevHints.svg?style=flat)](http://cocoapods.org/pods/SwiftDevHints)
[![Platform](https://img.shields.io/cocoapods/p/SwiftDevHints.svg?style=flat)](http://cocoapods.org/pods/SwiftDevHints)

## Requirements

- iOS 10.0+ / macOS 10.12+
- Swift 5

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

### String Extensions

The safe way to return string slice
```swift
let string = "Hello, Swift!"
string[safe: 0..<5]  // "Hello"
string[safe: 0...4]  // "Hello"
string[safe: 0..<14] // nil
```

`intBaseHex`
Get int value form hex string
```swift
print("FF".intBaseHex)  // 255
print("0xFF".intBaseHex)  // 255
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
let color = UIColor(red: 255, green: 32, blue: 171)
```

Initialize UIColor with RGB Hex String
```swift
let color = UIColor(hexString: "FF20AB") 
```

Create a black or white UIColor object that constrasts to specified color.
```swift
let color = UIColor(constrastingBlackOrWhiteColorOn: UIColor.green)
```

Get hexadecimal value string of this color (start with "#")
```swift
let hexString = UIColor.red.hexString // #FF0000
```

Get RGB or HSBA components
```swift
let rgb = UIColor.red.rgbComponents // (red: 255, green: 0, blue: 0)
let rgba = UIColor.red.rgbaComponents // (red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
let hsba = UIColor.red.hsbaComponents // (hue: 0.0, saturation: 1.0, brightness: 1.0, alpha: 1.0)
```

Get random color
```swift
let randomColor = UIColor.random
```

### Bundle Extensions

Convenient methods to access Info.plist
```swift
let bundle = Bundle.main

let displayName = bundle.displayName
let identifier = bundle.identifier
let version = bundle.version
let build = bundle.build

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

## References

- https://github.com/Luur/SwiftTips#1-safe-way-to-return-element-at-specified-index
- https://github.com/onevcat/Kingfisher
- https://github.com/AliSoftware/Reusable
- https://github.com/andyyhope/nemo

## Author

- Twitter: [@derekcoder_](https://twitter.com/derekcoder_)
- Weibo: [@derekcoder](https://weibo.com/u/6155322764)
- Email: derekcoder@gmail.com

## License

SwiftDevHints is released under the MIT license. [See LICENSE](https://github.com/derekcoder/SwiftDevHints/blob/master/LICENSE) for details.
