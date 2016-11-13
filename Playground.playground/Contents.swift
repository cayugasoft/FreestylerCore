/*:
#   FreestylerCore
 
Please build scheme *FreestylerCore_iOS* before using this playground.
 
 ---
*/
import UIKit
import PlaygroundSupport
import FreestylerCore_iOS

let mainView = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 540))

let button1 = UIButton(type: .custom)
let button2 = UIButton(type: .custom)
button1.frame = CGRect(x: 0, y: 0, width: 160, height: 44)
button2.frame = CGRect(x: 160, y: 0, width: 160, height: 44)
button1.setTitle("First button", for: .normal)
button2.setTitle("Second button", for: .normal)

let label = UILabel(frame: CGRect(x: 0, y: 60, width: 320, height: 44))
label.textColor = .white
label.text = "Label"
[button1, button2, label].forEach {
    mainView.addSubview($0)
}
PlaygroundPage.current.liveView = mainView

/*:
## _FreestylerCore_ lets you create *styles* and apply them to `UIView`s and `UIBarButtonItem`s.
 
 `Style` is a class which basically wraps array of closures. Closures take 1 argument – some `Styleable`. `Styleable` is protocol for types that support styling. In iOS, these are `UIView` and `UIBarButtonItem`.
 
 Style can be applied to styleable using `apply(to:)` method or `<~` operator. When style is applied, its closures are called one by one with this styleable passed as argument.
 
 Styles can be combined using `Style.combine(_:)` method or `<~` operator. This creates new style which has all closures of given styles. Order of closures is preserved.
 
 It's possible to apply style to array of styleables; or apply array of styles to styleable; or even apply array of styles to array of styleables - everything could be done (surprise-surprise) using `<~` operator.

 ## Examples
 - Create style
*/
let redBackground = Style {
    (view: UIView) in
    view.backgroundColor = .red
}

let grayBackground = Style {
    (view: UIView) in
    view.backgroundColor = .gray
}
/*: 
 Styles may have name. It's useful for debugging.
*/
let roundedCorners = Style("Rounded corners") {
    (view: UIView) in
    view.layer.cornerRadius = 5.0
}

/*:
 - Combine styles
 
 You can use `<~` operator for that.*/
let redAndRounded = redBackground <~ roundedCorners

/*: Or you can initialize style from array literal of other styles (note you have to explicitly declare type in this case).*/
let grayAndRounded: Style = [grayBackground, roundedCorners]

/*: 
 - Apply styles
 
 Try to uncomment these lines one by one and see how they work in **Timeline**.
*/
//button1 <~ redBackground
//button2 <~ grayBackground
//label <~ redBackground <~ grayBackground
//button2 <~ [redBackground, roundedCorners]
//[button1, button2] <~ roundedCorners
//[button1, button2] <~ [roundedCorners, redBackground]
//[button1, button2] <~ redAndRounded

/*:
 - If you apply style to wrong object (such as style for `UILabel` to `UIButton`), crash will happen. Try to uncomment these lines to see.
*/
//let greenText = Style {
//    (label: UILabel) in
//    label.textColor = .green
//}
//button1 <~ greenText
