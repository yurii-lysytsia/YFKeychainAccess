# YFKeychainAccess

Convenient, beautiful and easy to use KeychainAccess, that written in Swift

- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)


## Requirements

- iOS 8.0+
- Xcode 8.1+
- Swift 3.0+

## Installation
### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

> CocoaPods 1.1.0+ is required to build.

To integrate YFVolumeView into your Xcode project using CocoaPods, create `Podfile`.

- Open up Terminal, `cd` into your top-level project directory

- Run the following command in your top-level folder of your project:

```bash
$ pod init
```

- Open created  `Podfile`

```bash
$ open Podfile
```

- Then, in the `Podfile` that appears, specify. Instead of `<Your Target Name>`, enter your project's name :

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, ‘8.0’
use_frameworks!

target '<Your Target Name>' do
	pod 'YFVolumeView'
end
```

- Finally, run the following command:

```bash
$ pod install
```

### Manually
#### Embedded Framework

- Open up Terminal, `cd` into your top-level project directory, and run the following command "if" your project is not initialized as a git repository:

```bash
$ git init
```

- Add a git submodule by running the following command:

```bash
$ git submodule add https://github.com/YuriFox/YFKeychainAccess.git
```

- Open your Xcode project, select your application project in the Project Navigator (blue project icon) to navigate to the target configuration window and select the application target under the `Targets` heading in the sidebar.

- In the tab bar at the top of that window, open the `General` panel

- Click on the `+` button under the `Embedded Binaries` section and select `Add Other...`

- Select `YFKeychainAccess.framework`. Check `Copy items if needed`

## Usage

```swift
import YFKeychainAccess
```
### Set(Update)

```swift
let keychain = YFKeychainAccess() // You can add 'keyPrefix' and 'options' to customize KeychainAccess

do {
    try keychain.set(value, forKey: "KEY") // You can add 'accessible' parameter too
    // 'set' function update item or creates a new one
} catch {
    // Handle error if necessary
}
```

### Get

```swift
let keychain = YFKeychainAccess() // You can add 'keyPrefix' and 'options' to customize KeychainAccess

do {
    let data = try keychain.data(forKey: "DATA_KEY")
    let string = try keychain.string(forKey: "STRING_KEY")
    let bool = try keychain.bool(forKey: "BOOL_KEY")
    let int = try keychain.(forKey: "INT_KEY")
    let float = try keychain.float(forKey: "FLOAT_KEY")
    let double = try keychain.double(forKey: "DOUBLE_KEY")
} catch {
    // Handle error if necessary
}
```

### Delete

```swift
let keychain = YFKeychainAccess() // You can add 'keyPrefix' and 'options' to customize KeychainAccess

do {
    try keychin.delete(forKey: "KEY") // Delete one item for key
    try keychin.deleteAll() // Delete all item for this app
} catch {
    // Handle error if necessary
}
```

### Contains

```swift
let keychain = YFKeychainAccess() // You can add 'keyPrefix' and 'options' to customize KeychainAccess

do {
    try keychin.contains(forKey: "KEY")
} catch {
    // Handle error if necessary
}

```

