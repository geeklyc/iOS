//
//  RootViewController.swift
//  CoreDataDemo
//
//  Created by liyoucheng on 2019/3/15.
//  Copyright © 2019年 JZYI. All rights reserved.
//

import UIKit
import CoreData

class RootViewController: UIViewController, SegueHandler {

    enum SegueIdentifier: String {
        case embedNavigation = "embedNavigationController"
        case embedCamera = "embedCamera"
    }
    
    var managedObjectContext: NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        switch segueIdentifier(for: segue) {
        case .embedNavigation:
            guard let nc = segue.destination as? UINavigationController, let vc = nc.viewControllers.first as? MoodsTableViewController else {
                
                fatalError("wrong view controller type")
            }
            vc.managedObjectContext = managedObjectContext
            
        default:
            break
        }
    }
 

}
