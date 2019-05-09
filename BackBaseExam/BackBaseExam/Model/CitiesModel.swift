//
//  CitiesModel.swift
//  BackBaseExam
//
//  Created by John Freidrich Cinco on 03/05/2019.
//  Copyright © 2019 John Freidrich Cinco. All rights reserved.
//

import Foundation

/**
 Represents the list of cities retreived from the JSON file provided.
 This handles loading and caching of the city information, as well as
 filtering / querying of specific city information.
 */
public class CitiesModel:NSObject {
    
    private var _filterString:String? = ""
    public var filterString:String? {
        get {
            return _filterString
        }
    }
    
    // Make cities array read only. Tampering not allowed.
    private var cities:[City]? = nil
    public var cityList:[City]? {
        get {
            return self.cities
        }
    }
    
    /**
     */
    public func cities(withName name:String?)->[City]? {
        // set lower case for case insensitivity
        self._filterString = name?.lowercased()
        if ((nil != name || name?.count ?? 0 > 0)
            && self.isWhitespaceString(string: name ?? "  ") == false) {
            return self.cities?.filter { (item) -> Bool in
                return (item.name?.lowercased().hasPrefix(self._filterString!))!
            }
        }
        else {
            return self.cities
        }
    }
    
    
    private func isWhitespaceString(string:String)->Bool {
        let inverted:CharacterSet = CharacterSet.whitespaces.inverted
        let inString:NSString = NSString(string: string)
        let empty:Bool = inString.rangeOfCharacter(from: inverted).location == NSNotFound
        return empty
    }
    
    
    /**
     Loads the json data from the "cities.json" file.
     
     - Parameters:
        - completion: Block - called when loading is done. 
     */
    public func loadJson(completion:@escaping (Bool)->Void) {
        do {
            let jsonFilePath = Bundle.main.path(forResource: "cities", ofType: "json")
            let data = try Data(contentsOf: URL(fileURLWithPath: jsonFilePath!))
            
            // parse json
            self.parseJson(json: data) { (success)->Void in
                completion(success)
            }
        }
        catch let e as NSError {
            print(e.localizedDescription)
        }
    }
    
    
    /**
     Parses through the json data obtained from the "cities.json" file.
     */
    private func parseJson(json:Data?, completion: @escaping (Bool)->Void) {
        guard let inJson = json else {
            print("Nil json array")
            return
        }
        DispatchQueue.global().async {
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let result = try decoder.decode([City].self, from: inJson)
                self.cities = result.sorted(by: { (c1, c2) -> Bool in
                    return c1.name! < c2.name!
                })
                
                completion(true)
            }
            catch let e as NSError {
                print(e.localizedDescription)
                completion(false)
            }
        }
      
    }
    
    
    // MARK: - Singleton implementation
    private static var INSTANCE:CitiesModel!
    private override init() {
        super.init()
    }
    public static var sharedInstance:CitiesModel! {
        get {
            if (nil == INSTANCE) {
                INSTANCE = CitiesModel()
            }
            return INSTANCE
        }
    }
    
    
    public static func destroy() {
        INSTANCE = nil
    }
}
