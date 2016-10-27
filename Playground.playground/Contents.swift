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

let s2 = Style { (v: UIView) in
    v.backgroundColor = .green
}

let s3 = Style(closures: [{ (v: UIView) in
    v.backgroundColor = .green
    }, { (v: UIView) in
        v.backgroundColor = .green
    } ])

//view <~ style
let x = style <~ style
[view, v2] <~ ((style <~ [style, style]) <~ style) <~ s <~ s2
view.backgroundColor
v2.backgroundColor

var str = "Hello, playground"

