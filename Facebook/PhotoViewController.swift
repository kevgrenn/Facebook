//
//  PhotoViewController.swift
//  Facebook
//
//  Created by kevin grennan on 2/29/16.
//  Copyright © 2016 kevin grennan. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scroller: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var doneButton: UIButton!
    
    
    var image: UIImage!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
        imageView.clipsToBounds = true
        if image.size.width == 320{
        imageView.frame.size.height = 480
        } else if image.size.width == 480{
            imageView.frame.size.height = 220
        }
        imageView.center.y = 280

        scroller.backgroundColor = UIColor(white: 0, alpha: 1)
        scroller.delegate = self
        
        scroller.contentSize = CGSize(width: 320, height: 570)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismiss(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        
        return true;
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        doneButton.alpha = 0
        scroller.contentSize = CGSize(width: 320, height: 570)

    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let scrollAlpha = 1.2 - abs(scroller.contentOffset.y / 80)
        if imageView.frame.size.width == 320 {
        scroller.backgroundColor = UIColor(white: 0, alpha: scrollAlpha)
    }
    }

    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if scroller.contentOffset.y < -40 || scroller.contentOffset.y > 40{
        dismissViewControllerAnimated(true, completion: nil)
        } else {
        doneButton.alpha = 1
        }

    }

    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
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
