//
//  CurrentLocationViewController2.swift
//  FundooPay
//
//  Created by BridgeLabz Solutions LLP  on 9/6/17.
//  Copyright © 2017 BridgeLabz Solutions LLP . All rights reserved.
//

import UIKit

class CurrentLocationViewController2: UIViewController {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var currentLocation: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
  //  self.currentLocation.text = Street
        // Do any additional setup after loading the view.
    
    }

    @IBAction func backBtn(_ sender: UIButton) {
         self.dismiss(animated: true, completion: nil)
    }
}
