//
//  ViewController.swift
//  FundooPay
//
//  Created by BridgeLabz Solutions LLP  on 8/29/17.
//  Copyright © 2017 BridgeLabz Solutions LLP . All rights reserved.
//

import UIKit
var width = 0
var x_position = 0
var y_position = 0

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var usernameLbl: UITextField!
    
    @IBOutlet weak var shopName: UITextField!
    
    @IBOutlet weak var serviceTypesMenuBtn: UIButton!
    
    @IBOutlet weak var nextBtn: UIButton!
    //var mChooseEmpTypeDropDown = DropDown()
    @IBOutlet weak var topView: UIView!

    @IBOutlet weak var middleView: UIView!
    
    
    var activeTextField = UITextField()
    
    let attrs1 = [NSFontAttributeName : UIFont.boldSystemFont(ofSize: 30), NSForegroundColorAttributeName : UIColor.white]
    
    let attrs2 = [NSFontAttributeName : UIFont.boldSystemFont(ofSize: 30), NSForegroundColorAttributeName : UIColor.orange]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        //set padding to textfield text
        self.usernameLbl.layer.sublayerTransform = CATransform3DMakeTranslation(25, 0, 0)
        self.shopName.layer.sublayerTransform = CATransform3DMakeTranslation(25, 0, 0)

        
        usernameLbl.delegate = self
        shopName.delegate = self
        
        usernameLbl.layer.cornerRadius = 3
        shopName.layer.cornerRadius = 3
        serviceTypesMenuBtn.layer.cornerRadius = 3
        
        let attributedString1 = NSMutableAttributedString(string:"Fundoo", attributes:attrs1)
        
        let attributedString2 = NSMutableAttributedString(string:"Pay", attributes:attrs2)
        
        attributedString1.append(attributedString2)
        self.titleLbl.attributedText = attributedString1
        
        self.titleLbl.font = UIFont(name: "Bauhaus 93", size: 35)//
        self.usernameLbl.font = UIFont.font_medium(14.fontSize)
        self.shopName.font = UIFont.font_medium(14.fontSize)
        self.serviceTypesMenuBtn.titleLabel?.font = UIFont.font_medium(14.fontSize)
        
//        self.mChooseEmpTypeDropDown.anchorView = self.serviceTypesMenuBtn.titleLabel
//        self.mChooseEmpTypeDropDown.dismissMode = .automatic
//        self.mChooseEmpTypeDropDown.direction = .any
//        self.mChooseEmpTypeDropDown.cellNib = UINib(nibName: "DropDownCell", bundle: Bundle(for: DropDownCell.self))
//        self.mChooseEmpTypeDropDown.customCellConfiguration = nil
//        self.mChooseEmpTypeDropDown.dataSource = ["Mohan","Rahul","Yogesh"]
//        self.mChooseEmpTypeDropDown.selectionAction = { (index,item) in
//        self.serviceTypesMenuBtn.titleLabel?.text = item
//            
//            if self.serviceTypesMenuBtn.imageView?.transform != .identity
//            {
//                
//                UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [], animations: {
//                    self.serviceTypesMenuBtn.imageView?.transform = .identity
//                }, completion: nil)
//            }
//        }
//        self.mChooseEmpTypeDropDown.cancelAction = {
//            if self.serviceTypesMenuBtn.imageView?.transform != .identity
//            {
//                UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [], animations: {
//                    self.serviceTypesMenuBtn.imageView?.transform = .identity
//                }, completion: nil)
//            }
//            
//        }
//
//        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        serviceTypesMenuBtn.imageEdgeInsets = UIEdgeInsetsMake(0, serviceTypesMenuBtn.frame.size.width - ((serviceTypesMenuBtn.currentImage?.size.width)! + 15), 0, 0)
    }
    
    override func viewDidLayoutSubviews() {
        width = Int(serviceTypesMenuBtn.frame.width)
        x_position = Int(serviceTypesMenuBtn.frame.origin.x)
        y_position = Int(serviceTypesMenuBtn.frame.origin.y + topView.frame.height + serviceTypesMenuBtn.frame.height)
        print("x",x_position)
        print("y",y_position)
        print("width",width)
    }

    override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
        serviceTypesMenuBtn.imageEdgeInsets = UIEdgeInsetsMake(0, serviceTypesMenuBtn.frame.size.width - ((serviceTypesMenuBtn.currentImage?.size.width)! + 15), 0, 0)
    }
    
    @IBAction func serviceTypesMenuBtn(_ sender: UIButton) {
        
        func radToDegree(degree:CGFloat) -> CGFloat{
            return ((degree * 3.14)/180)
        }
        
        self.serviceTypesMenuBtn.imageView?.transform = CGAffineTransform(rotationAngle: radToDegree(degree: 180))
 
        PopupController
            
            .create(self)
            .customize(
                [     .layout(.mychoise) ,
                      .animation(.fadeIn),
                      .scrollable(false),
                      .backgroundStyle(.blackFilter(alpha: 0.1)),
                      .dismissWhenTaps(true)
                ]
            )
            .didShowHandler { _ in
                
                print("opened")
                
            }
            .didCloseHandler { _ in
                print("closed")
                self.serviceTypesMenuBtn.imageView?.transform = .identity

            }.show(PopUpDeleteVC.instance())

  //      self.mChooseEmpTypeDropDown.show()
    }

    
    @IBAction func nextBtn(_ sender: UIButton) {
        
       let bounds = self.nextBtn.bounds
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: .transitionCrossDissolve, animations: {
            self.nextBtn.bounds = CGRect(x: bounds.origin.x - 20, y: bounds.origin.y, width: bounds.size.width + 60, height: bounds.size.height)
            
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "CurrentLocationViewController1")
                    self.present(vc!, animated: false, completion: nil)
                 }, completion: nil)
        
    }
    
    //text field Delegate method call when textfield edit begins
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        self.activeTextField = textField

        if (activeTextField.text?.isEmpty)!{
            let color = UIColor.lightText
            activeTextField.attributedPlaceholder = NSAttributedString(string: textField.placeholder!, attributes: [NSForegroundColorAttributeName : color])
        }
        return true
    }
    
    //text field Delegate method to return from keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        
    self.dismiss(animated: true, completion: nil)
    }
    
}

extension UIFont {
    class func font_medium(_ size : CGFloat) -> UIFont {
        return UIFont(name: "Avenir", size: size)!;
    }
}

extension UIDevice {
    enum DeviceTypes {
        case iPhone4_4s
        case iPhone5_5s
        case iPhone6_6s
        case iPhone6p_6ps
        case after_iPhone6p_6ps
    }
    
    static var deviceType : DeviceTypes {
        switch UIScreen.main.bounds.height {
        case 480.0:
            return .iPhone4_4s
        case 568.0:
            return .iPhone5_5s
        case 667.0:
            return .iPhone6_6s
        case 736.0:
            return .iPhone6p_6ps
        default:
            return .after_iPhone6p_6ps
        }
    }
}

extension Int{
    
    var fontSize : CGFloat {
        
        var deltaSize : CGFloat = 0;
        switch (UIDevice.deviceType) {
        case .iPhone4_4s,
             .iPhone5_5s :
            deltaSize = -1;
        case .iPhone6_6s :
            deltaSize = 2;
        case .iPhone6p_6ps :
            deltaSize = 2;
        default:
            deltaSize = 0;
        }
        
        let selfValue = self;
        return CGFloat(selfValue) + deltaSize;
    }
}
