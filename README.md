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

In your project AppDelegate.swift:

```swift
import YFKeychainAccess

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    ...
    
    func setVolumeIndicator() {
        
        let volumeIndicator = YFVolumeView.current
        volumeIndicator.isActive = true // Make active YFVolumeView and hide native HUD
        volumeIndicator.backgroundColor = .white // Set custom background color
        volumeIndicator.isAnimatingEnable = true // Change animation enable 

//        if let window = self.window {
//            volumeIndicator.setBackgroundColorAsWindowWithRootNavigationBar(window: window)
//            // If AppDelegate.window.rootViewController is UINavigationController, volume indicator color will be as UINavigationController.navigationBar.barTintColor
//        }


    }

    ...

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        ...
        
        self.setVolumeIndicator()
        
        ...

    }

    ...
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        YFVolumeView.current.updateActiveState() // FIX.
    }

...

}

```
