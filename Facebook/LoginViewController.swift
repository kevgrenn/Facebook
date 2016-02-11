//
//  LoginViewController.swift
//  Facebook
//
//  Created by kevin grennan on 2/10/16.
//  Copyright © 2016 kevin grennan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginIndicator: UIActivityIndicatorView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var fieldParentView: UIView!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var labelParentView: UIView!
    
    var initialY: CGFloat!
    var offset: CGFloat!
    var initialLogoY: CGFloat!
    var offsetLogo: CGFloat!
    var initialLabelY: CGFloat!
    var offsetLabel: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         loginButton.enabled = false
        
        initialY = fieldParentView.frame.origin.y
        offset = -50
        
        initialLogoY = logo.frame.origin.y
        offsetLogo = -25
        
        initialLabelY = labelParentView.frame.origin.y
        offsetLabel = -225
        
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name:UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name:UIKeyboardWillHideNotification, object: nil)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func editingChanged(sender: AnyObject) {
        
        
        if emailField.text!.isEmpty || passwordField.text!.isEmpty {
            
            loginButton.enabled = false
            
            //not working
        
        } else {
            
            loginButton.enabled = true
          
        }
        
        
        
        
        
        
        
        
    }
    func keyboardWillShow(notification: NSNotification!) {
        
        logo.frame.origin.y = initialLogoY + offsetLogo
        
        labelParentView.frame.origin.y = initialLabelY + offsetLabel
        
        fieldParentView.frame.origin.y = initialY + offset

    }

    func keyboardWillHide(notification: NSNotification!) {
        
        logo.frame.origin.y = logo.frame.origin.y - offsetLogo
        
        labelParentView.frame.origin.y = labelParentView.frame.origin.y - offsetLabel
        
        fieldParentView.frame.origin.y = fieldParentView.frame.origin.y - offset
        
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    
    @IBAction func didTap(sender: AnyObject) {
        
        view.endEditing(true)
    }
    @IBAction func didPressLogin(sender: AnyObject){

        loginIndicator.startAnimating()
        loginButton.selected = true
        

        if emailField.text == "email" && passwordField.text == "password" {
            delay(2, closure: { () -> () in
            self.loginIndicator.stopAnimating()
                self.loginButton.selected = false
            self.performSegueWithIdentifier("loginSegue", sender: nil)
            })
        }else{
            delay(2, closure: { () -> () in
            self.loginIndicator.stopAnimating()
            self.loginButton.selected = false
            
            let alertController = UIAlertController(title: "", message: "Username and password are incorrect", preferredStyle: .Alert)
            
            let OKAction = UIAlertAction(title: "OK", style: .Default){(action) in
            }
            alertController.addAction(OKAction)
            //why no self?
                
            self.presentViewController(alertController, animated: true) {
            
            }
        })
            }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
