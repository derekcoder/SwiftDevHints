
# SwiftDevHints

[![Version](https://img.shields.io/cocoapods/v/SwiftDevHints.svg?style=flat)](http://cocoapods.org/pods/SwiftDevHints)
[![License](https://img.shields.io/cocoapods/l/SwiftDevHints.svg?style=flat)](http://cocoapods.org/pods/SwiftDevHints)
[![Platform](https://img.shields.io/cocoapods/p/SwiftDevHints.svg?style=flat)](http://cocoapods.org/pods/SwiftDevHints)

## Installation

```ruby
pod 'SwiftDevHints'
```

## Usage

<details>
<summary>String Extensions</summary>
<br>
    
* **The safe way to return string slice**
```swift
let string = "Hello, Swift!"
string[safe: 0..<5] // "Hello"
string[safe: 0..<14] // nil

string[safe: 0...4] // "Hello"
string[safe: 0...13] // nil
```

* **MD5**
```swift
"hello".md5 // 5d41402abc4b2a76b9719d911017c592
```

* **nilIfEmpty**
```swift
var string: String? = nil
string.nilIfEmpty // nil
string = ""
string.nilIfEmpty // nil
string = "hello"
string.nifIfEmpty // "hello"

["Derek", "", "John", "", "Tony", nil].compactMap { $0.nilIfEmpty } // ["Derek", "John", "Tony"]

guard let text = textField.text.nilIfEmpty else {
    // handle for nil or empty
    return
}
```
</details>

<details>
<summary>Collection Extensions</summary>
<br>

* **The safe way to return element at specified index**
```swift
let animals = ["Zebra", "Giraffe", "Tiger"]
let zebra = animals[safe: 0] // "Zebra"
let lion = animals[safe: 3] // nil
```
</details>

<details>
<summary>UserDefaults Extensions</summary>
<br>

* **A safe way to use UserDefaults**
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
</details> 

<details>
<summary>UIColor Extensions</summary>
<br>

* **Initialize UIColor with RGB based 255**
```swift
let color = UIColor(redIn255: 255, greenIn255: 32, blueIn255: 171)
```

* **Initialize UIColor with RGB Hex String**
```swift
let color = UIColor(hex: "FF20AB") 
// let color = UIColor(hex: "ff20ab") 
// let color = UIColor(hex: "#FF20AB") 
// let color = UIColor(hex: "#ff20ab")
```

* **Get RGB(A) from a color**
```swift
let rgba = color.rgba // (red 1.0, green 0.125490196078431, blue 0.670588235294118, alpha 1.0)
let intRGBA = color.intRGBA // (red 255, green 32, blue 171, alpha 100)
let hexRGB = hexRGB(prefix: "#") // "#FF20AB"
// let hexRGB = hexRGB() // "FF20AB"
```
</details>

<details>
<summary>Bundle Extensions</summary>
<br>

* **Convenient methods to access Info.plist**
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

</details>

<details>
<summary>Date Extensions</summary>
<br>

* **Some convenient methods**
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

</details>

<details>
<summary>Other Extensions</summary>
<br>
    
* **Customized Log function**

```swift
// PrintHelperViewController.swift
func testPrintLog() {
    Log.debug("Hello, World!")
}

// 输出结果： PrintHelperViewController.testPrintLog():20 DEBUG -> Hello, World!
```

* **Format Int and Double**
```swift
let aInt = 8
let formatedInt1 = aInt.format("03") // "008"
let formatedInt2 = aInt.format("3") // "  8"

let aDouble = 3.14159265
let formatedDouble = aDouble.format(".2") // "3.14"
let formatedDouble = aDouble.format(".3") // "3.142"
```

</details>

## References

- https://github.com/Luur/SwiftTips#1-safe-way-to-return-element-at-specified-index
- https://github.com/onevcat/Kingfisher/blob/master/Sources/String%2BMD5.swift

## License

SwiftDevHints is released under the MIT license. [See LICENSE](https://github.com/derekcoder/SwiftDevHints/blob/master/LICENSE) for details.
