//
//  PortraitViewController.swift
//  BackBaseExam
//
//  Created by John Freidrich Cinco on 07/05/2019.
//  Copyright © 2019 John Freidrich Cinco. All rights reserved.
//

import Foundation
import UIKit

public class PortraitViewController : UIViewController {
    
    
    public override var prefersStatusBarHidden: Bool {
        get {
            return true
        }
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    
    public func setOrientation(orientation:UIInterfaceOrientation) {
        self.setNeedsStatusBarAppearanceUpdate()
        if (UIScreen.main.bounds.size.width > UIScreen.main.bounds.size.height) {
            let degToRad:CGFloat = 3.1415926 / 180.0
            var rotation:CGFloat! = 0.0
            switch(orientation) {
            case .portrait:
                rotation = degToRad * -90
                break
            default:
                rotation = degToRad * 90
                break
            }
            self.view.bounds = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.height, height: UIScreen.main.bounds.size.width)
            self.view.transform = CGAffineTransform(rotationAngle: rotation)
        }
    }
    
}
