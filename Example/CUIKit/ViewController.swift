//
//  ViewController.swift
//  CUIKit
//
//  Created by emadhejazian on 07/08/2018.
//  Copyright (c) 2018 emadhejazian. All rights reserved.
//

import UIKit
import CUIKit

class ViewController: UIViewController {

    @IBOutlet weak var toggleButton: CUIButton!
    @IBOutlet weak var resiazableView: CResizableView!
    @IBOutlet weak var txtYourText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func toggleButtonClicked(_ sender: Any) {
        toggleButton.isSelected = !toggleButton.isSelected
    }
    
    @IBAction func changeTextClicked(_ sender: Any) {
        resiazableView.internalLabel.text = txtYourText.text
        resiazableView.updateSize();
    }
    
}

