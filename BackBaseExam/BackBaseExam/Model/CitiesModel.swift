//
//  CitiesModel.swift
//  BackBaseExam
//
//  Created by John Freidrich Cinco on 03/05/2019.
//  Copyright © 2019 John Freidrich Cinco. All rights reserved.
//

import Foundation

public class CitiesModel:NSObject {
    
    
    private func loadJson() {
        do {
            let jsonFilePath = Bundle.main.path(forResource: "cities", ofType: "json")
            let data = try Data(contentsOf: URL(fileURLWithPath: jsonFilePath!))
            let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! [[String:Any?]]
            
            // parse json
            self.parseJson(json: json)
        }
        catch let e as NSError {
            print(e.localizedDescription)
        }
    }
    
    private func parseJson(json:Array<[String:Any?]>?) {
        guard let inJson = json else {
            print("Nil json array")
            return
        }
        
        for item in inJson {
            
        }
        
    }
    
    
    // MARK: - Singleton implementation
    private static var INSTANCE:CitiesModel!
    private override init() {
        super.init()
        self.loadJson()
    }
    public static var sharedInstance:CitiesModel! {
        get {
            if (nil == INSTANCE) {
                INSTANCE = CitiesModel()
            }
            return INSTANCE
        }
    }
}
