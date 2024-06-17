# GSToggleSwitch

[![CI Status](https://img.shields.io/travis/megaganjotsingh/GSToggleSwitch.svg?style=flat)](https://travis-ci.org/megaganjotsingh/GSToggleSwitch)
[![Version](https://img.shields.io/cocoapods/v/GSToggleSwitch.svg?style=flat)](https://cocoapods.org/pods/GSToggleSwitch)
[![License](https://img.shields.io/cocoapods/l/GSToggleSwitch.svg?style=flat)](https://cocoapods.org/pods/GSToggleSwitch)
[![Platform](https://img.shields.io/cocoapods/p/GSToggleSwitch.svg?style=flat)](https://cocoapods.org/pods/GSToggleSwitch)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.


## Installation

GSToggleSwitch is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'GSToggleSwitch', '~> 0.3'
```

## Easy to Use

You can simply set all the properties in simple way

```swift
       toggleSwitch.set(
          properties: { prop in
              prop.width = 40
              prop.height = 20
              prop.cornerRadius = 10
              prop.onBackgroundColor = .green
              prop.thumbProperties.showThumbShadow = true
              prop.thumbProperties.backgroundColor = .white
          },
          tapOnSwitch: { [weak self] in
              guard let self = self else { return .off }
              return self.toggle1.currentState
          }
      )
```

## Author

Gaganjot Singh(megaganjotsingh@gmail.com)

## License

GSToggleSwitch is available under the MIT license. See the LICENSE file for more info.
