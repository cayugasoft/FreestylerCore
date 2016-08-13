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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view <~ Style() {
            ($0 as! UIView).backgroundColor = .redColor()
        }
    }
}

