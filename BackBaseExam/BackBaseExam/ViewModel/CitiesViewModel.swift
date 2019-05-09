//
//  CitiesViewModel.swift
//  BackBaseExam
//
//  Created by John Freidrich Cinco on 08/05/2019.
//  Copyright © 2019 John Freidrich Cinco. All rights reserved.
//

import Foundation

public class CitiesViewModel:NSObject {
    
    private var _selectedCity:City? = nil
    public var selectedCity:City? {
        set {
            _selectedCity = newValue
            
            // Notify listening VC
            NotificationCenter.default.post(name: Notification.Name("citySelected"), object:nil)
        }
        get {
            return _selectedCity
        }
    }
    
    private var searchString:String? = nil
    public var searchEntry:String? {
        set {
            searchString = newValue
            // Do async execution to optimize UI performance.
            DispatchQueue.main.async {
                 self.cityList = self.model.cities(withName: self.searchString) // Get the result of the search value.
                
                // Notify listening VC
                NotificationCenter.default.post(name: Notification.Name("citiesUpdated"), object: nil)
            }
           
        }
        get {
            return searchString
        }
    }
    
    private var cityList:[City]? = nil
    public var cities:[City]! {
        get {
            if (cityList == nil || cityList?.count ?? 0 < 1) {
                cityList = model.cities(withName: searchString) ?? []
            }
            return cityList!
        }
    }
    
    private let model:CitiesModel = CitiesModel.sharedInstance
    
    public func load(completion: @escaping (Bool) -> Void) {
        if (self.model.cityList?.count ?? 0 < 1) {
            self.model.loadJson(completion: completion)
        }
        else {
            // call completion block if json file is already loaded.
            completion(true)
        }
    }
    
    
    
    
    // MARK: - Singleton implementation
    private static var INSTANCE:CitiesViewModel!
    public static var sharedInstance:CitiesViewModel! {
        get {
            if (nil == INSTANCE) {
                INSTANCE = CitiesViewModel()
            }
            return INSTANCE
        }
    }
    private override init() {
        super.init()
    }
    
    public static func destroy() {
        INSTANCE = nil
    }
}


