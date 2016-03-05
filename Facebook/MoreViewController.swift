//
//  MoreViewController.swift
//  Facebook
//
//  Created by kevin grennan on 2/3/16.
//  Copyright © 2016 kevin grennan. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController {

    @IBOutlet weak var moreScroll: UIScrollView!
    @IBOutlet weak var moreImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        moreScroll.contentSize = moreImage.image!.size
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logOutButton(sender: AnyObject) {
        
        let alertController = UIAlertController(title: "", message: "Are you sure you want to Log Out", preferredStyle: .ActionSheet)
        
        let logOutAction = UIAlertAction(title: "Log Out", style: .Destructive) { (action) in
            
        }
        
        alertController.addAction(logOutAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
            
        }
        
        alertController.addAction(cancelAction)
        
        presentViewController(alertController, animated: true) {
            
            
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
