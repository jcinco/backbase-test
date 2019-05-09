//
//  CityCell.swift
//  BackBaseExam
//
//  Created by John Freidrich Cinco on 08/05/2019.
//  Copyright © 2019 John Freidrich Cinco. All rights reserved.
//

import Foundation
import UIKit

public class CityCell:UITableViewCell {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var coordLabel: UILabel!
    @IBOutlet weak var aboutButton: UIButton!
    
    public var index:Int! = 0
    public var action:(Int)->Void = {(index:Int)->Void in}
    
    @IBAction func buttonClick(_ sender: Any) {
        self.action(self.index)
    }
   
    
}
