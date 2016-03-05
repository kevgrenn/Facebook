//
//  FeedViewController.swift
//  Facebook
//
//  Created by kevin grennan on 2/3/16.
//  Copyright © 2016 kevin grennan. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController{
    
    @IBOutlet weak var feedScroll: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    var photoView: UIImageView!
    var lightboxTransition: LigthboxTransition!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        feedScroll.contentSize = imageView.image!.size
        lightboxTransition = LigthboxTransition()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    //    imageView.hidden = true
   //     loadingIndicator.startAnimating()
        
        
    }
    
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
   
    @IBAction func photoTap(sender: UITapGestureRecognizer) {
        photoView = sender.view as! UIImageView
        performSegueWithIdentifier("photoSegue", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        let destinationVC = segue.destinationViewController as! PhotoViewController
        destinationVC.image = self.photoView.image
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationVC.transitioningDelegate = lightboxTransition
        
    }
    



}
