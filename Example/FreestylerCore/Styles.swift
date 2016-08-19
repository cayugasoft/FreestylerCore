//
//  Styles.swift
//  FreestylerCore
//
//  Created by Alexander on 19.08.16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import FreestylerCore


let redBackground = Style {
    (view: UIView) in
    view.backgroundColor = .redColor()
}


let greenTextColor = Style {
    (label: UILabel) in
    label.textColor = .greenColor()
}


let roundedCorners = Style {
    (view: UIView) in
    view.layer.cornerRadius = 5.0
}


let shadow = Style {
    (view: UIView) in
    view.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
    view.layer.shadowColor = UIColor.blackColor().CGColor
    view.layer.shadowOpacity = 0.7
}


let centerAlignment = Style {
    (label: UILabel) in
    label.textAlignment = .Center
}


let allStyles = [
    redBackground,
    greenTextColor,
    roundedCorners,
    shadow,
    centerAlignment
]