//
//  CityAboutModel.swift
//  BackBaseExam
//
//  Created by John Freidrich Cinco on 09/05/2019.
//  Copyright © 2019 John Freidrich Cinco. All rights reserved.
//

import Foundation
public class CityAboutModel:NSObject, AboutModel {
    
    public var city:City? = nil
    
    public override init() {
        super.init()
    }
    
    public func loadAboutInfo(with presenter: AboutPresenter) {
        guard let inCity = city
            else {
                presenter.aboutInfoDidFailLoading(error: ModelError.failedLoading)
                return
        }
        
        let aboutInfo:AboutInfo = AboutInfo(companyName: <#T##String#>, companyAddress: <#T##String#>, postalCode: <#T##String#>, city: city?.name, details: <#T##String#>)
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            presenter.aboutInfoDidLoad(aboutInfo: info)
        }
    }
}
