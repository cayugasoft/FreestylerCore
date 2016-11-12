![Logo](https://raw.githubusercontent.com/Cayugasoft/FreestylerCore/master/FreestylerCore.png)

---


[![Version](https://img.shields.io/cocoapods/v/FreestylerCore.svg?style=flat)](http://cocoapods.org/pods/FreestylerCore)
[![License](https://img.shields.io/cocoapods/l/FreestylerCore.svg?style=flat)](http://cocoapods.org/pods/FreestylerCore)
[![Platform](https://img.shields.io/cocoapods/p/FreestylerCore.svg?style=flat)](http://cocoapods.org/pods/FreestylerCore)
[![CAYUGAsoft](https://rawgithub.com/cayugasoft/Resources/master/Badges_by_Cayuga/by_Cayuga.svg)](http://cayugasoft.com/?utm_source=github)

# FreestylerCore

## What is it?
When we develop our applications from designer's mockups, we often encounter the same visual patterns over and over again – colors, fonts, etc. It's wise decision to keep them in one place in your app's code and reuse everywhere. That's exactly what *FreestylerCore* helps you to do.

*FreestylerCore* defines class `Style`. Style can be applied to `UIView` or `UIBarButtonItem`. Multiple `Style`s can be combined into one. See how to create your own styles and apply them in [Usage](#usage) section.
## Requirements
* iOS 8.0+
* Swift 3
* Xcode 8.0+

## Installation
### [Cocoapods](http://cocoapods.org)
1. Install **Cocoapods**: `sudo gem install cocoapods`
2. Create *Podfile* in your project directory.
3. Add in your *Podfile*:

	```
	use_frameworks!
	pod 'FreestylerCore', '~> 1.0'
	```
4. Run `pod install`
5. `import FreestylerCore` in your .swift files.

### Manually
1. Clone or download *FreestylerCore*
2. Drag `Source` folder to your project in Xcode; make sure **☑️ Copy items into destination's group folder (if needed)** option is checked.

## Usage
Here is example of style which adds rounded corners to the view:

```swift
let roundCornersStyle = Style("Round corners") {
    (view: UIView) in
    view.layer.cornerRadius = 5.0
}
```


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