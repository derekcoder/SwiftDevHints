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

### Random Int

```swift
import SwiftDevHints

let range = Range<Int>(0...10)
let randomNum = Int.random(range) // randomNum is Int number between 0 ~ 10
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

## Contact

Follow and contact me on [Twitter](https://twitter.com/derekcoder_). If you find an issue, just [open a ticket](https://github.com/derekcoder/SwiftDevHints/issues/new). Pull requests are warmly welcome as well.

## License

SwiftDevHints is released under the MIT license. [See LICENSE](https://github.com/derekcoder/SwiftDevHints/blob/master/LICENSE) for details.
