//
//  MapViewModel.swift
//  BackBaseExam
//
//  Created by John Freidrich Cinco on 09/05/2019.
//  Copyright © 2019 John Freidrich Cinco. All rights reserved.
//

import Foundation
import MapKit
public class MapViewModel:NSObject {
    
    public var currentAnnotation:MKAnnotation? = nil
    
    
    public static func destroy() {
        INSTANCE = nil
    }
    
    private static var INSTANCE:MapViewModel!
    public static var sharedInstance:MapViewModel! {
        get {
            if (nil == INSTANCE) {
                INSTANCE = MapViewModel()
            }
            return INSTANCE
        }
    }
    private override init() {
        super.init()
    }
}
