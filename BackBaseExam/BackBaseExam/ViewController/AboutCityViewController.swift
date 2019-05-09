//
//  CityDetailsViewController.swift
//  BackBaseExam
//
//  Created by John Freidrich Cinco on 09/05/2019.
//  Copyright © 2019 John Freidrich Cinco. All rights reserved.
//

import Foundation
import UIKit

public class AboutCityViewController:UIViewController {
    public var city:City? = nil
    @IBOutlet weak var countryCodeLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "About"
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.cityNameLabel.text = self.city?.name
        self.countryCodeLabel.text = self.city?.country
    }
}
