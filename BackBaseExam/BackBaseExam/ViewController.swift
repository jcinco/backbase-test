//
//  ViewController.swift
//  BackBaseExam
//
//  Created by John Freidrich Cinco on 03/05/2019.
//  Copyright © 2019 John Freidrich Cinco. All rights reserved.
//

import UIKit

class ViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let currentOrientation = UIDevice.current.orientation
        self.setRootVC(forOrientation: currentOrientation)
        
        self.title = "City Search"
    }

    public func setRootVC(forOrientation currentOrientation:UIDeviceOrientation) {
        if (currentOrientation == .portrait) {
            let portraitVC = ViewControllerFactory.sharedInstance?.viewController(withStoryboardName: "citySelection")
            self.setViewControllers([portraitVC!], animated: false)
        }
        else if (currentOrientation == .landscapeLeft || currentOrientation == .landscapeRight) {
            let landscapeVC = ViewControllerFactory.sharedInstance?.viewController(withStoryboardName: "landscape")
            self.setViewControllers([landscapeVC!], animated: false)
            
        }
    }

}

