# FazeKit

[![CI Status](http://img.shields.io/travis/NextFaze/FazeKit.svg?style=flat)](https://travis-ci.org/NextFaze/FazeKit)
[![Version](https://img.shields.io/cocoapods/v/FazeKit.svg?style=flat)](http://cocoapods.org/pods/FazeKit)
[![License](https://img.shields.io/cocoapods/l/FazeKit.svg?style=flat)](http://cocoapods.org/pods/FazeKit)
[![Platform](https://img.shields.io/cocoapods/p/FazeKit.svg?style=flat)](http://cocoapods.org/pods/FazeKit)

A collection of extensions and convenience functions on Foundation, UIKit and other Cocoa Frameworks, built in Swift for iOS development. The spiritual successor to [NFAllocInit](https://github.com/NextFaze/NFAllocInit).

Included are little things, like shorthand mutation of views:

```swift
view.left = 40.0
```

device accessors:

```
UIDevice.is4Inch()
```

and operator overloads for `NSDate`:

```swift
if oneDate < anotherDate {
    print("one date is earlier")
}
```

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

iOS 9.0

## Installation

FazeKit is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "FazeKit"
```

## License

FazeKit is available under the APACHE 2.0 license. See the LICENSE file for more info.
