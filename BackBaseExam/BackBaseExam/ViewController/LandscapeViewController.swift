//
//  LandscapeViewController.swift
//  BackBaseExam
//
//  Created by John Freidrich Cinco on 07/05/2019.
//  Copyright © 2019 John Freidrich Cinco. All rights reserved.
//

import Foundation
import UIKit


public class LandscapeViewController : UIViewController {
    
    @IBOutlet weak var selectionContainerView: UIView!
    @IBOutlet weak var mapContainerView: UIView!
    
    public override var prefersStatusBarHidden: Bool {
        get {
            return true
        }
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        let selectionVC = ViewControllerFactory.sharedInstance?.viewController(withStoryboardName: "citySelection")
        let mapVC = ViewControllerFactory.sharedInstance?.viewController(withStoryboardName: "map")
        
        self.addChildViewController(selectionVC!)
        self.addChildViewController(mapVC!)
        
        self.selectionContainerView.addSubview(selectionVC!.view)
        self.mapContainerView.addSubview(mapVC!.view)
        
        self.addViewConstraint(toView: selectionVC!.view, container: self.selectionContainerView)
        self.addViewConstraint(toView: mapVC!.view, container: self.mapContainerView)
    }
    
    
    
    func addViewConstraint(toView view:UIView, container:UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let top = NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.top,
                                     relatedBy: NSLayoutConstraint.Relation.equal,
                                     toItem: container, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 0)
        
        let bottom = NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.bottom,
                                        relatedBy: NSLayoutConstraint.Relation.equal,
                                        toItem: container, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 0)
        
        let right = NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.right,
                                       relatedBy: NSLayoutConstraint.Relation.equal,
                                       toItem: container, attribute: NSLayoutConstraint.Attribute.right, multiplier: 1, constant: 0)
        
        let left = NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.left,
                                      relatedBy: NSLayoutConstraint.Relation.equal, toItem: container, attribute: NSLayoutConstraint.Attribute.left, multiplier: 1, constant: 0)
        
        container.addConstraints([top,bottom,left,right])
    }
    
    
  
    
}
