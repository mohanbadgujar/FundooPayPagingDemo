//
//  CurrentLocationViewController1.swift
//  FundooPay
//
//  Created by BridgeLabz Solutions LLP  on 9/6/17.
//  Copyright © 2017 BridgeLabz Solutions LLP . All rights reserved.
//

import UIKit

class CurrentLocationViewController1: UIViewController {

 
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
    }
    
    @IBOutlet weak var getLocation: UIButton!
    @IBAction func getLocation(_ sender: UIButton) {
        
        let imageName = "Screen Shot 2017-09-08 at 1.07.08 PM"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        
        imageView.frame = CGRect(x: 0, y:0, width: self.view.frame.width, height: self.view.frame.height)
        view.addSubview(imageView)
        imageView.transform = CGAffineTransform(scaleX: 0,y: 0)
        
        UIView.animate(withDuration: 1, animations: {() -> Void in
            imageView.transform = CGAffineTransform(scaleX: 1, y: 1)
        }, completion: {(_ finished: Bool) -> Void in

            let vc = self.storyboard?.instantiateViewController(withIdentifier: "CurrentLocationViewController")
          //  self.navigationController?.pushViewController(vc!, animated: true)
            self.present(vc!, animated: false, completion: nil)
        })
    
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        
         self.dismiss(animated: true, completion: nil)
    }
    
}

