//
//  LoginViewController.swift
//  FacebookDemo
//
//  Created by Patrick Keenan on 5/23/16.
//  Copyright © 2016 Scott Horsfall. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    var initialY: CGFloat!
    var offset: CGFloat!
    
    @IBOutlet weak var fieldParentView: UIView!
    @IBOutlet weak var labelParentView: UIView!
    @IBOutlet weak var logoView: UIImageView!
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialY = fieldParentView.frame.origin.y
        offset = -50

        // Do any additional setup after loading the view.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillShow(_:)), name:UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillHide(_:)), name:UIKeyboardWillHideNotification, object: nil)
        
        signInButton.enabled = false

    }

    @IBAction func fieldChanged(sender: AnyObject) {
        if emailField.text!.isEmpty || passwordField.text!.isEmpty{
            signInButton.enabled = false
        }else{
            signInButton.enabled = true
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func attemptSignin(sender: AnyObject) {
        self.signInButton.selected = true
        delay(2) {
            self.loadingView.stopAnimating()
            self.signInButton.enabled = true
            self.signInButton.selected = false
            self.view.endEditing(true)
            
            if self.emailField.text == "u" && self.passwordField.text == "p" {
                self.performSegueWithIdentifier("loginToFeed", sender: nil)
            }else{
                
                let alertController = UIAlertController(title: "Login Failed", message: "The username/password did not match, try again.", preferredStyle: .Alert)
                
                let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
                    
                }
                
                alertController.addAction(cancelAction)
                
                let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                    
                }
                alertController.addAction(OKAction)
                
                self.presentViewController(alertController, animated: true) {
                    // optional code for what happens after the alert controller has finished presenting
                }
            }
            
        }
        loadingView.startAnimating()
//        signInButton.enabled = false
        signInButton.selected = true
    }
    

    func keyboardWillShow(notification: NSNotification!) {
        let frame = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        fieldParentView.frame.origin.y = initialY - frame.height/4
        logoView.frame.origin.y = initialY - frame.height/4 - 50
    }
    @IBAction func didTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        let frame = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        fieldParentView.frame.origin.y = initialY
        logoView.frame.origin.y = initialY - 32 - logoView.frame.size.height
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
