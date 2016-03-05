//
//  LigthboxTransition.swift
//  Facebook
//
//  Created by kevin grennan on 3/1/16.
//  Copyright © 2016 kevin grennan. All rights reserved.
//

import UIKit

class LigthboxTransition: BaseTransition {
    
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        let feedViewController = fromViewController as! FeedViewController
        let photoViewController = toViewController as! PhotoViewController
        let movingImageView = UIImageView()
        var window = UIApplication.sharedApplication().keyWindow
        var movingImageFrame = window!.convertRect(feedViewController.photoView.frame, fromView: feedViewController.feedScroll)
        
        print(movingImageFrame)

        movingImageView.frame = movingImageFrame
        movingImageView.image = feedViewController.photoView.image
        movingImageView.clipsToBounds = photoViewController.imageView.clipsToBounds
        movingImageView.contentMode = photoViewController.imageView.contentMode
       
        containerView.addSubview(movingImageView)
        feedViewController.photoView.alpha = 0
        toViewController.view.alpha = 0
        photoViewController.imageView.alpha = 0
        UIView.animateWithDuration(duration, animations: {
            toViewController.view.alpha = 1
            photoViewController.imageView.alpha = 0
            movingImageView.frame = photoViewController.imageView.frame
           // movingImageView.contentMode = UIViewContentMode.ScaleAspectFit

            }) { (finished: Bool) -> Void in
                photoViewController.imageView.alpha = 1
                feedViewController.photoView.alpha = 1
                movingImageView.removeFromSuperview()
                self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        let feedViewController = toViewController as! FeedViewController
        let photoViewController = fromViewController as! PhotoViewController
        let movingImageView = UIImageView()
        var window = UIApplication.sharedApplication().keyWindow
        var movingImageFrame = window!.convertRect(feedViewController.photoView.frame, fromView: feedViewController.feedScroll)
        var initialImageFrame = window!.convertRect(photoViewController.imageView.frame, fromView: photoViewController.view)
        let offset = photoViewController.scroller.contentOffset.y
        
        
        movingImageView.frame.origin.x = photoViewController.imageView.frame.origin.x
        movingImageView.frame.origin.y = photoViewController.imageView.frame.origin.y - offset
        movingImageView.frame.size.height = photoViewController.imageView.frame.size.height
        movingImageView.frame.size.width = photoViewController.imageView.frame.size.width

        
        movingImageView.image = photoViewController.imageView.image
        movingImageView.clipsToBounds = photoViewController.imageView.clipsToBounds
        movingImageView.contentMode = photoViewController.imageView.contentMode
        
        containerView.addSubview(movingImageView)
        photoViewController.imageView.alpha = 0
        feedViewController.photoView.alpha = 0
        fromViewController.view.alpha = 1
        UIView.animateWithDuration(duration, animations: {
            fromViewController.view.alpha = 0
            feedViewController.photoView.alpha = 0
            movingImageView.frame = movingImageFrame
            
            }) { (finished: Bool) -> Void in
                photoViewController.imageView.alpha = 1
                feedViewController.photoView.alpha = 1
                movingImageView.removeFromSuperview()
                self.finish()
        }
    }
}
