//
//  FadeTransition.swift
//  transitionDemo
//
//  Created by Timothy Lee on 11/4/14.
//  Copyright (c) 2014 Timothy Lee. All rights reserved.
//

import UIKit

class FadeTransition: BaseTransition {
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        let tabViewController = fromViewController as! UITabBarController
        let navigationController = tabViewController.selectedViewController as! UINavigationController
        let feedViewController = navigationController.topViewController as! FeedViewController
        let toViewController = toViewController as! PhotoViewController
        let selectedImageView = feedViewController.selectedImage
        let imageView = UIImageView()
        imageView.image = selectedImageView.image
        print(selectedImageView.frame)
        
        containerView.addSubview(imageView)
        
        imageView.contentMode = selectedImageView.contentMode
        imageView.frame = containerView.convertRect(selectedImageView.frame, fromView: selectedImageView.superview)
        toViewController.view.alpha = 0
        toViewController.imageView.hidden = true
        UIView.animateWithDuration(0.3, animations: {
            let imageWidth = toViewController.view.frame.width
            let imageAspect = (selectedImageView.image?.size.height)!/(selectedImageView.image?.size.width)!
            let imageHeight = imageWidth*imageAspect
            imageView.frame = toViewController.view.frame
            imageView.frame.size.height = imageHeight
            imageView.frame.origin.y = containerView.frame.height/2 - imageView.frame.height/2
            toViewController.imageView.frame = imageView.frame
            
            toViewController.view.alpha = 1
        }) { (finished: Bool) -> Void in
            imageView.removeFromSuperview()
            toViewController.imageView.hidden = false
            self.finish()
            
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        let tabViewController = toViewController as! UITabBarController
        let navigationController = tabViewController.selectedViewController as! UINavigationController
        let feedViewController = navigationController.topViewController as! FeedViewController
        let fromViewController = fromViewController as! PhotoViewController
        let selectedImageView = feedViewController.selectedImage
        let imageView = UIImageView()
        let fromImageView = fromViewController.imageView
        imageView.image = selectedImageView.image
        imageView.frame = containerView.convertRect(fromImageView.frame, fromView: fromViewController.scroll)
        fromViewController.imageView.hidden = true
        imageView.contentMode = selectedImageView.contentMode
        containerView.addSubview(imageView)
        fromViewController.imageView.hidden = true
        UIView.animateWithDuration(0.3, animations: {
            imageView.frame = containerView.convertRect(selectedImageView.frame, fromView: selectedImageView.superview)
            fromViewController.view.alpha = 0
        }) { (finished: Bool) -> Void in
            imageView.removeFromSuperview()
            self.finish()
            fromViewController.view.alpha = 1
        }

    }
}
