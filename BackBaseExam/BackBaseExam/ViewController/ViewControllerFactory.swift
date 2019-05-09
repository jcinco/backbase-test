//
//  ViewControllerFactory.swift
//  BackBaseExam
//
//  Created by John Freidrich Cinco on 07/05/2019.
//  Copyright © 2019 John Freidrich Cinco. All rights reserved.
//

import Foundation
import UIKit

/**
 We need a factory for the view controllers to dynamically load them as needed
 when the orientation changes.
 */
public class ViewControllerFactory:NSObject {
    
    private var storyboard:UIStoryboard!
    private let vcNames:[String] = ["portrait", "landscape", "citySelection", "about", "map"]
    /**
     Constructs the view controllers as needed.
     */
    public func viewController(withStoryboardName name:String)->UIViewController? {
        if (self.isValidName(name: name)) {
            return storyboard.instantiateViewController(withIdentifier: name)
        }
        return nil
    }
    
    private func isValidName(name:String)->Bool {
        for vcName in vcNames {
            if (name == vcName) {
                return true
            }
        }
        return false
    }
    
    
    private static var INSTANCE:ViewControllerFactory?
    public static var sharedInstance:ViewControllerFactory? {
        get {
            if (nil == INSTANCE) {
                INSTANCE = ViewControllerFactory()
            }
            return INSTANCE
        }
    }
    private override init() {
        super.init()
        
        let bundle = Bundle.main
        self.storyboard = UIStoryboard(name: "Main", bundle: bundle)
        
    }
}
