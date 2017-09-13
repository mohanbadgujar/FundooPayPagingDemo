//
//  LaunchScreenViewController.swift
//  FundooPay
//
//  Created by BridgeLabz Solutions LLP  on 9/2/17.
//  Copyright © 2017 BridgeLabz Solutions LLP . All rights reserved.
//

import UIKit

class LaunchScreenViewController: UIViewController {

    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var msgLbl: UILabel!
    
    let attrs1 = [NSFontAttributeName : UIFont.boldSystemFont(ofSize: 30), NSForegroundColorAttributeName : UIColor.white]
    
    let attrs2 = [NSFontAttributeName : UIFont.boldSystemFont(ofSize: 30), NSForegroundColorAttributeName : UIColor.orange]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let attributedString1 = NSMutableAttributedString(string:"Fundoo", attributes:attrs1)
        
        let attributedString2 = NSMutableAttributedString(string:"Pay", attributes:attrs2)
        
        attributedString1.append(attributedString2)
        self.titleLbl.attributedText = attributedString1
        
        self.titleLbl.font = UIFont(name: "Bauhaus 93", size: 35)
    }
    
    @IBAction func swipeRight(_ sender: UISwipeGestureRecognizer) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController")
        self.present(vc!, animated: false, completion: nil)
    }
    
    @IBAction func nextBtn(_ sender: UIButton) {
      
        
        let imageName = "Screen Shot 2017-09-08 at 1.07.08 PM"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        
        imageView.frame = CGRect(x: self.view.frame.minX, y:self.view.frame.minX, width: self.view.frame.width, height: self.view.frame.height)
        view.addSubview(imageView)
        imageView.transform = CGAffineTransform(scaleX: 0,y: 0)
        
        UIView.animate(withDuration: 1, animations: {() -> Void in
            imageView.transform = CGAffineTransform(scaleX: 1, y: 1)
        }, completion: {(_ finished: Bool) -> Void in
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController")
            self.present(vc!, animated: false, completion: nil)        })


    }
}
