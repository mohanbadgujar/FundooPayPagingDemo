//
//  paymentBillsViewController.swift
//  FundooPay
//
//  Created by BridgeLabz Solutions LLP  on 9/7/17.
//  Copyright © 2017 BridgeLabz Solutions LLP . All rights reserved.
//

import UIKit

var width123 = 0
var height123 = 0
var x_position123 = 0


class paymentBillsViewController: UIViewController {

    @IBOutlet weak var btn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    // Do any additional setup after loading the view.
        self.view.setNeedsLayout()
        self.view.layoutIfNeeded()
        
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: nil) { _ in
            // Your code here
            
            width123 = Int(self.btn.frame.width)
            height123 = Int(self.btn.frame.height)
            x_position123 = Int(self.btn.frame.origin.x-self.btn.frame.origin.x)
            print("height123",height123)
            print("x_postion",x_position123)
            print("width",width123)
            
        }
    }
}
