//
//  ResultViewController.swift
//  Example
//
//  Created by Yuri Fox on 24.11.17.
//  Copyright © 2017 Yuri Lysytsia. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet private weak var resultLabel: UILabel!

    var isSuccess: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if !self.isSuccess {
            self.view.backgroundColor = .red
            self.resultLabel.text = "WRONG"
        }
        
    }

}
