# FreestylerCore

[![Version](https://img.shields.io/cocoapods/v/FreestylerCore.svg?style=flat)](http://cocoapods.org/pods/FreestylerCore)
[![License](https://img.shields.io/cocoapods/l/FreestylerCore.svg?style=flat)](http://cocoapods.org/pods/FreestylerCore)
[![Platform](https://img.shields.io/cocoapods/p/FreestylerCore.svg?style=flat)](http://cocoapods.org/pods/FreestylerCore)

## What is it?
FreestylerCore is the core collection of classes, enums and protocols which make possible to create and reuse *styles* and apply them to `UIView`s and `UIBarItem`s.

### What is Style?
The simplest way to explain it is an example:
```swift
// "Round corners" is a name of this style.
// You are not required to provide a name but it is good thing to do.
// Style closure takes exactly 1 parameter.
// If you don't explicitly declare type of this parameter,
// it will be inferred as Styleable.
// However, it almost always makes sense to use explicit type,
// because it ensures that this style cannot be applied to wrong type.
let roundCornersStyle = Style("Round corners") {
(view: UIView) in
view.layer.cornerRadius = 5.0
}

// Style without a name.
let redBackgroundStyle = Style {
(view: UIView) in
view.backgroundColor = .redColor()
}

let button = UIButton()

// You apply style to view (or bar item) using <~ operator.
button <~ roundCornersStyle + redBackgroundStyle
// ^ Now button has rounded corners and red background. 🎉

// You can add styles using just simple + operator. 
// Notice that order matters and last addends take precedence to first.
let roundCornersAndRedBackground = roundCornersStyle + redBackgroundStyle
button <~ roundCornersAndRedBackground
// ^ The same effect as before.
```

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

iOS 8+

## Installation

FreestylerCore is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "FreestylerCore"
```

## Author

Alexander Doloz, adoloz@cayugasoft.com

## License

FreestylerCore is available under the MIT license. See the LICENSE file for more info.