//
//  ViewController.swift
//  Image
//
//  Created by Chatterjee, Snigdhaman on 12/01/16.
//  Copyright © 2016 Chatterjee, Snigdhaman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = NSURL(string: "https://upload.wikimedia.org/wikipedia/en/9/93/FF_XV_Demo_screenshot.png")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data, response, error) -> Void in
            
            if error != nil {
                
                print("Error")
                
            } else {
                
                var picDirectory:String?
                
                var paths: [AnyObject] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
                if paths.count > 0 {
                    
                    picDirectory = paths[0] as? String
                    
                    let savePath = picDirectory! + "/img.jpg"
                    
                    NSFileManager.defaultManager().createFileAtPath(savePath, contents: data, attributes: nil)
                    
                    
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                            
                            self.imageView.image = UIImage(named: savePath)
                        
                    })
                    
                }
                
            }
            
        }
        
        task.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

