# SwiftDevHints
A very useful set of development tools.

## Features

## Requirements

- iOS 9.0+
- Swift 3

## Installation

### CocoaPods

```ruby
pod 'SwiftDevHints'
```

## Usage

### IntExtensions

Random Int
```swift
import SwiftDevHints

let range = Range<Int>(0...10)
let randomNum = Int.random(range) // randomNum is Int number between 0 ~ 10
```

Format Int
```
import SwiftDevHints

let aInt = 8
let formatedInt1 = aInt.format("03") // "003"
let formatedInt2 = aInt.format("3") // "  3"
```

### DoubleExtensions

Format Double
```swift
import SwiftDevHints

let aDouble = 3.14159265
let formatedDouble = aDouble.format(".2") // "3.14"
let formatedDouble = aDouble.format(".3") // "3.142"
```

Round Double
```swift
import SwiftDevHints

let aDouble = 3.14159265
let roundedDouble1 = aDouble.roundTo(places: 2) // 3.14
let roundedDouble2 = aDouble.roundTo(places: 3) // 3.142
```

### DictionaryExtensions

```swift
import SwiftDevHints

let dictionary: [String: Any] = ["id": "1", "name": "Derek", "age": 29, "isOnline": true, "latitude": 1.290270, "longitude": 103.851959]

let id = dictionary.intValue(forKey: "id") // Int: 1
let name = dictionary.stringValue(forKey: "name") // String: "Derek"
let age = dictionary.intValue(forKey: "age") // Int: 29
let isOnline = dictionary.boolValue(forKey: "isOnline") // Bool: true
let latitude = dictionary.doubleValue(forKey: "latitude") // Double: 1.290270
let longitude = dictionary.doubleValue(forKey: "longitude") // Double: 103.851959
```

### UITableViewCellExtensions

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

### PrintHelper

- show which file you are logging
- show line number your are logging
- `printLog` only valid for DEBUG mode

```swift
import SwiftDevHints

@IBAction func tapPrintLogButton() {
    printLog("You just tap button.")
}

// PrintHelperViewController.swift:15  You just tap button.
```

## Contact

Follow and contact me on [Twitter](https://twitter.com/derekcoder_). If you find an issue, just [open a ticket](https://github.com/derekcoder/SwiftDevHints/issues/new). Pull requests are warmly welcome as well.

## License

SwiftDevHints is released under the MIT license. [See LICENSE](https://github.com/derekcoder/SwiftDevHints/blob/master/LICENSE) for details.
