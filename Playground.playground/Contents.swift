//: Playground - noun: a place where people can play

import UIKit
import FreestylerCore_iOS


let view = UIView()
let v2 = UIView()

let style = Style { (v: UIView) in
    v.backgroundColor = .red
}

let s: Style = [style, style]
view <~ [style, style]
[view, view] <~ [style, style]

//view <~ style
let x = style <~ style
[view, v2] <~ ((style <~ [style, style]) <~ style)
view.backgroundColor
v2.backgroundColor

var str = "Hello, playground"
