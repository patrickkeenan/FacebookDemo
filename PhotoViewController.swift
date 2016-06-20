//
//  PhotoViewController.swift
//  FacebookDemo
//
//  Created by Patrick Keenan on 6/15/16.
//  Copyright © 2016 Scott Horsfall. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var background: UIView!
    
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
        scroll.contentSize = imageView.frame.size
        scroll.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func doneButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let offsetY = scroll.contentOffset.y
        print (offsetY)
        let newAlpha = convertValue(offsetY, r1Min: 0, r1Max: -100, r2Min: 1, r2Max: 0)
        background.alpha = newAlpha
        
    }
    func scrollViewDidEndDragging(scrollView: UIScrollView,
                                  willDecelerate decelerate: Bool) {
        let offsetY = scroll.contentOffset.y
        if offsetY < -50 {
            dismissViewControllerAnimated(true, completion: nil)
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
