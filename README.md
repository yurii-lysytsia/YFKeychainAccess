# YFKeychainAccess

[![platform](https://img.shields.io/badge/platform-iOS-lightgray.svg)]()
[![license](https://img.shields.io/badge/license-MIT-lightgray.svg)]()

Convenient, beautiful and easy to use KeychainAccess, that written in Swift

- [Requirements](#requirements)

- [Installation](#installation)
    - [CocoaPods](#CocoaPods)
    - [Manually](#Manually)
    
- [Usage](#usage)
    - [Set](#Set)
    - [Get](#Get)
    - [Delete](#Delete)
    - [Contains](#Contains)
    
- [License](#license)

## Requirements

- iOS 8.0+
- Xcode 8.3+
- Swift 3.1+

## Installation
### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

- Create `Podfile` into your Xcode project. Open up `Terminal` → `cd` into your project's top-level directory → Run the following command:

```bash
$ pod init
```

- Open up created  `Podfile`.

```bash
$ open Podfile
```

- In the `Podfile` that appears, specify. Instead of `<Your Target Name>`, enter your project's name :

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, ‘8.0’
use_frameworks!

target '<Your Target Name>' do
	pod 'YFKeychainAccess'
end
```

- Then, run the following command:

```bash
$ pod install
```

- Finally, open your Xcode  `<Your Target Name>.xcworkspace`.

### Manually
#### Embedded Framework

- Download `YFKeychainAccess`. Open `Terminal` → `cd` into some directory

- If your project isn't initialized as a git repository run the following command:

```bash
$ git init
```

- Add a git submodule to this directory by running the following command:

```bash
$ git submodule add https://github.com/YuriFox/YFKeychainAccess.git
```

-  Open your Xcode project → Select the `Project` → Choose your Project's `Target` → Open `General` panel → Click on the `+` button under the `Embedded Binaries` section → Select `Add Other...` → Select `YFKeychainAccess.framework` from `YFKeychainAccess` submodule. Check `Copy items if needed`

- Before building and distributing your application, you need to remove the unused architecture. Because Apple doesn't allow the application with unused architectures to the App Store. For this you have to add the run script to your app. Select the `Project` → Choose your Project's `Target` → Select `Build Phases` → Click on the `+` → New Run Script Phase. You can add the name for this script like as `Remove Unused Architectures Script`

```bin/sh
FRAMEWORK="BetterHQ"
FRAMEWORK_EXECUTABLE_PATH="${BUILT_PRODUCTS_DIR}/${FRAMEWORKS_FOLDER_PATH}/$FRAMEWORK.framework/$FRAMEWORK"
EXTRACTED_ARCHS=()
for ARCH in $ARCHS
do
lipo -extract "$ARCH" "$FRAMEWORK_EXECUTABLE_PATH" -o "$FRAMEWORK_EXECUTABLE_PATH-$ARCH"
EXTRACTED_ARCHS+=("$FRAMEWORK_EXECUTABLE_PATH-$ARCH")
done
lipo -o "$FRAMEWORK_EXECUTABLE_PATH-merged" -create "${EXTRACTED_ARCHS[@]}"
rm "${EXTRACTED_ARCHS[@]}"
rm "$FRAMEWORK_EXECUTABLE_PATH"
mv "$FRAMEWORK_EXECUTABLE_PATH-merged" "$FRAMEWORK_EXECUTABLE_PATH"
```
## Usage

```swift
import YFKeychainAccess
```
### Set

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

## License
Released under the MIT license. See [LICENSE](https://github.com/YuriFox/YFKeychainAccess/blob/1.0/LICENSE) for details.
