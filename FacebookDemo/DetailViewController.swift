//
//  DetailViewController.swift
//  FacebookDemo
//
//  Created by Scott Horsfall on 5/19/16.
//  Copyright © 2016 Scott Horsfall. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var initialY: CGFloat!
    var initialCommentY: CGFloat!
    var offset: CGFloat!
    @IBOutlet weak var fieldParentView: UIScrollView!
    @IBOutlet weak var commentField: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialY = fieldParentView.frame.origin.y
        initialCommentY = commentField.frame.origin.y
        offset = -50

        // Do any additional setup after loading the view.
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillShow(_:)), name:UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillHide(_:)), name:UIKeyboardWillHideNotification, object: nil)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButton(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
    }
    func keyboardWillShow(notification: NSNotification!) {
        fieldParentView.frame.origin.y = initialY + offset
        let frame = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        print(frame.minY)
        commentField.frame.origin.y = frame.origin.y - 102
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        fieldParentView.frame.origin.y = initialY
        commentField.frame.origin.y = initialCommentY
    }
    @IBAction func didTap(sender: AnyObject) {
        view.endEditing(true)
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
