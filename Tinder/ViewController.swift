//
//  ViewController.swift
//  Tinder
//
//  Created by Ali H on 2015-02-24.
//  Copyright (c) 2015 Ali H. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var fbloginView:FBLoginView = FBLoginView(readPermissions: ["email", "public_profile"])
    
    @IBAction func signIn(sender: AnyObject) {
        
        var permissions = ["email, public_profile"]
        
   /**    var push = PFPush()
        push.setMessage("This is a test to see if push notifications are working")
        push.sendPushInBackgroundWithBlock({
            (isSuccessful: Bool!, error:NSError!) -> Void in
            
            println(isSuccessful)
            
        })
*/
        PFFacebookUtils.logInWithPermissions(permissions, block: {
            (user: PFUser!, error: NSError!) -> Void in
            if user == nil {
                NSLog("Uh oh. The user cancelled the Facebook login.")
                
            } else if user.isNew {
                NSLog("User signed up and logged in through Facebook!")
                
            self.performSegueWithIdentifier("signUp", sender: self)
                
            } else {
                NSLog("User logged in through Facebook!")
                self.performSegueWithIdentifier("signUp", sender: self)

            }
        })

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       if  (PFUser.currentUser() != nil) {
        println("User logged in")
        
        }
        
           }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

