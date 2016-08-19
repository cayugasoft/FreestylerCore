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
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.clipsToBounds = true
    }
    
    @IBAction func applyStyle(styleButton: UIButton) {
        let style = allStyles[styleButton.tag]
        label <~ style
    }
}


