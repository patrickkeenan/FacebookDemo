//
//  FeedViewController.swift
//  FacebookDemo
//
//  Created by Scott Horsfall on 5/19/16.
//  Copyright © 2016 Scott Horsfall. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var infiniteLoadingIndicator: UIActivityIndicatorView!
    var refreshControl: UIRefreshControl!
    var numberOfImageViews: CGFloat = 1
    var fadeTransition: FadeTransition!
    var selectedImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = imageView.image!.size
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(FeedViewController.onRefresh), forControlEvents: UIControlEvents.ValueChanged)
        scrollView.insertSubview(refreshControl, atIndex: 0)
        scrollView.frame = CGRectMake(0 , 64 + 44, self.view.frame.width, self.view.frame.height  - 64 - 44)
//        scrollView.contentSize = imageView.image!.size - 44 - 64
        infiniteLoadingIndicator.center.y = imageView.image!.size.height + 20
        scrollView.contentInset.bottom = 130
        scrollView.delegate = self

    }
    func scrollViewDidScroll(scrollView: UIScrollView) {
        // This method is called as the user scrolls
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        
    }
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
//        print("Scrolling Stopped")
//        if scrollView.contentOffset.y + scrollView.frame.size.height >= scrollView.contentSize.height {
//            print("You reached the bottom")
//            delay(0.5, closure: { () -> () in
//                let newFrame = self.imageView.frame
//                let newImageView = UIImageView(frame: newFrame)
//                let newImage = UIImage(named: "home_feed")
//                newImageView.image = newImage
//                newImageView.frame.origin.y = self.imageView.frame.origin.y + self.numberOfImageViews * self.imageView.frame.size.height
//                scrollView.addSubview(newImageView)
//                self.infiniteLoadingIndicator.center.y = self.imageView.image!.size.height + 20 + self.numberOfImageViews * newImageView.image!.size.height
//                self.scrollView.contentSize = CGSize(width: self.imageView.frame.size.width,
//                    height: self.imageView.frame.size.height + self.numberOfImageViews * newImageView.frame.size.height)
//                self.numberOfImageViews += 1
//            })
//        }
    }
    func onRefresh() {
        delay(0.5, closure: {
            self.refreshControl.endRefreshing()
        })
    }
    override func viewWillAppear(animated: Bool) {
//        imageView.hidden = true
//        loadingIndicator.startAnimating()
    }
    override func viewDidAppear(animated: Bool) {
//        delay(0.1) { () -> () in
//            self.imageView.hidden = false
//            self.loadingIndicator.stopAnimating()
//            self.imageView.alpha = 0
//            UIView.animateWithDuration(0.5, animations: {
//                self.imageView.alpha = 1.0
//            })
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func openImage(sender: UITapGestureRecognizer) {
        performSegueWithIdentifier("photoSegue", sender: sender.view)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let destinationViewController = segue.destinationViewController as! PhotoViewController
        selectedImage = sender as! UIImageView
        destinationViewController.image = sender!.image
        
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        fadeTransition = FadeTransition()

        destinationViewController.transitioningDelegate = fadeTransition
        
        fadeTransition.duration = 1.0
    }

}
