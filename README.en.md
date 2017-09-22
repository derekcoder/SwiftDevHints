# [简体中文](README.md)
# SwiftDevHints
A very useful set of development tools.

- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
    + [Random Int](#random-int)
    + [Format Int and Double](#format-int-and-double)
    + [Round Double](#round-double)
    + [New Method using UserDefaults](#new-method-using-userdefaults)
    + [Debug Print Log](#debug-print-log)
    + [UIColor Extensions](#uicolor-extensions)
    + [Custom Segue](#custom-segue)
    + [CircularImageView](#circularimageview)
 - [Contact](#contact)
- [License](#license)

## Features

- [x] Random Int
- [x] Format Int and Double
- [x] Round Double
- [x] New Method using UserDefaults
- [x] Debug Print Log
- [x] UIColor Init with RGBA(Int) and get RGBA(Int)
- [x] Custom Segue
- [x] CircularImageView
- [ ] Base64 Encoding and Decoding
- [ ] Handling empty and nil for optional strings
- [ ] Generic Table View Controller
- [ ] Nib Register for UITableViewCell
- [ ] Convenient Methods for Adding Constraints
- [ ] Networking

## Requirements

- iOS 9.0+
- Swift 3

## Installation

### CocoaPods

```ruby
pod 'SwiftDevHints'
```

## Usage

### Random Int

```swift
import SwiftDevHints

let randomInt = (0...10).randomInt // randomInt is Int number between 0 ~ 10 (include 10)
let randomInt = (0..<10).randomInt // randomInt is Int number between 0 ~ 10 (not include 10)
```

### Format Int and Double

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

### Round Double

```swift
import SwiftDevHints

let aDouble = 3.14159265
let roundedDouble1 = aDouble.roundTo(places: 2) // 3.14
let roundedDouble2 = aDouble.roundTo(places: 3) // 3.142

let aFloat: Float = 3.14159265
let roundedFloat1 = aFloat.roundTo(places: 2) // 3.14
let roundedFloat2 = aFloat.roundTo(places: 3) // 3.142
```

### New Method using UserDefaults

New usage methods for `UserDefaults` like `NotificationCenter`
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


### Debug Print Log

- Support display file name, function name and line number
- `debugPrintLog` only valid for DEBUG mode

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

## Contact

Follow and contact me on [Twitter](https://twitter.com/derekcoder_). If you find an issue, just [open a ticket](https://github.com/derekcoder/SwiftDevHints/issues/new). Pull requests are warmly welcome as well.

## License

SwiftDevHints is released under the MIT license. [See LICENSE](https://github.com/derekcoder/SwiftDevHints/blob/master/LICENSE) for details.

