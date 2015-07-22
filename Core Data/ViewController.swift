//
//  ViewController.swift
//  Core Data
//
//  Created by Brad Gray on 7/21/15.
//  Copyright (c) 2015 Brad Gray. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
        var appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        var context: NSManagedObjectContext = appDel.managedObjectContext!
        
        //var newuser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context) as! NSManagedObject
        
        //newuser.setValue("Brad", forKey: "username")
        //newuser.setValue("pass2", forKey: "password")
        
        //context.save(nil)
       var request = NSFetchRequest(entityName: "Users")
        
        //request.returnsObjectsAsFaults = false
        
        request.predicate = NSPredicate(format: "username = %@", "Brad")
        
        var results = context.executeFetchRequest(request, error: nil)
        if results?.count > 0 {
            println(results)
       
        for result:AnyObject in results! {
            if let user = result.valueForKey("username") as? String {
               
                println(result)
                
                if user == "Brad" {
                   // context.deleteObject(result as! NSManagedObject)
                   // println(user)
                //}
               result.setValue("newPass", forKey: "password")
                    println()
            
                }
            }
            
            context.save(nil)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

