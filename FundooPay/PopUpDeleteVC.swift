//
//  PopUpDeleteVC.swift
//  LoginForm
//
//  Created by BridgeLabz Solutions LLP  on 6/14/17.
//  Copyright © 2017 BridgeLabz Solutions LLP . All rights reserved.
//

import UIKit

class PopUpDeleteVC: UIViewController,UITableViewDelegate,UITableViewDataSource,PopupContentViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var menu : [String] = ["Unarchive","Delete","Make a copy","Send"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
      //  tableView.separatorStyle = .none
        
//        //for table view border
//        tableView.layer.borderColor = UIColor.blue.cgColor
//        tableView.layer.borderWidth = 1.0
        
//        //for shadow
        let containerView:UIView = UIView(frame:self.tableView.frame)
//        containerView.backgroundColor = UIColor.clear
//        containerView.layer.shadowColor = UIColor.lightGray.cgColor
//        containerView.layer.shadowOffset = CGSize(width: -10, height: 10) //Left-Bottom shadow
//        containerView.layer.shadowOffset = CGSize(width: 10, height: 10) //Right-Bottom shadow
//        containerView.layer.shadowOpacity = 1.0
//        containerView.layer.shadowRadius = 2

        //for rounded corners
        tableView.layer.cornerRadius = 5
        tableView.layer.masksToBounds = true
        self.view.addSubview(containerView)
        containerView.addSubview(tableView)
    }
    
    func sizeForPopup(_ popupController: PopupController, size: CGSize, showingKeyboard: Bool) -> CGSize {
        
        return CGSize(width: width, height: 175)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.count
    }
    
    
    class func instance() -> PopUpDeleteVC{
        let storyboard = UIStoryboard(name: "PopUpDeleteVC", bundle: nil)
        return storyboard.instantiateInitialViewController() as! PopUpDeleteVC
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PopUpDeleteVCCell") as! PopUpDeleteVCCell
        cell.labelName.text = menu[indexPath.row]
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        
//        UIView.animate(withDuration: 1.0, animations: {
//            cell.layer.transform = CATransition.init()
//        })
//        
        
        //1. Setup the CATransform3D structure
        var rotation = CATransform3D()
        rotation = CATransform3DMakeRotation(90.0, 90.0, 0.90, 0.90)
        //rotation.m34 = 1.0 / -600
        
        //2. Define the initial state (Before the animation)
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 10, height: 10)
        cell.alpha = 0
        cell.layer.transform = rotation
        cell.layer.anchorPoint = CGPoint(x: 0, y: 0.5)
        
        //3. Define the final state (After the animation) and commit the animation
        UIView.beginAnimations("rotation", context: nil)
        UIView.setAnimationDuration(0.8)
        cell.layer.transform = CATransform3DIdentity
        cell.alpha = 1
        cell.layer.shadowOffset = CGSize(width: 0, height: 0)
        UIView.commitAnimations()
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        
        switch index {
        case 0:
            
           DispatchQueue.main.asyncAfter(deadline: (DispatchTime.now()+0.2), execute: {
            self.view.removeFromSuperview()
           })

            break
            
        case 1:
            
            DispatchQueue.main.asyncAfter(deadline: (DispatchTime.now()+0.2), execute: {
                self.view.removeFromSuperview()
            })
            
            break
            
        case 2:
            
            DispatchQueue.main.asyncAfter(deadline: (DispatchTime.now()+0.2), execute: {
                self.view.removeFromSuperview()
            })
            
            break
        case 3:
            
            DispatchQueue.main.asyncAfter(deadline: (DispatchTime.now()+0.2), execute: {
                self.view.removeFromSuperview()
            })
            break
            
        default:
            
            DispatchQueue.main.asyncAfter(deadline: (DispatchTime.now()+0.2), execute: {
                self.view.removeFromSuperview()
            })
            
            break
        }
    }

}
