//
//  SegueHandler.swift
//  CoreDataDemo
//
//  Created by liyoucheng on 2019/3/15.
//  Copyright © 2019年 JZYI. All rights reserved.
//

import UIKit

protocol SegueHandler {
    
    associatedtype SegueIdentifier: RawRepresentable
}

extension SegueHandler where Self: UIViewController, SegueIdentifier.RawValue == String {
    
    func segueIdentifier(for segue: UIStoryboardSegue) -> SegueIdentifier {
        
        guard let identifier = segue.identifier,
            let segueIdentifier = SegueIdentifier(rawValue: identifier) else {
            
                fatalError("Unknow segue: \(segue)")
        }
        return segueIdentifier
    }
    
    func performSegue(withIdentifier segueIdentifier: SegueIdentifier) {
        
        performSegue(withIdentifier: segueIdentifier.rawValue, sender: nil )
    }
}
