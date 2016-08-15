//
//  ViewController.swift
//  FreestylerCore
//
//  Created by Alexander Doloz on 08/12/2016.
//  Copyright (c) 2016 Alexander Doloz. All rights reserved.
//

import UIKit
import FreestylerCore


class ViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let roundCornersStyle = Style("Round corners") {
            (view: UIView) in
            view.layer.cornerRadius = 5.0
        }
        
        let redBackgroundStyle = Style {
            (view: UIView) in
            view.backgroundColor = .redColor()
        }
        
        button <~ roundCornersStyle + redBackgroundStyle
        
        
//        let redBackgroundStyle = Style(
    }
}

