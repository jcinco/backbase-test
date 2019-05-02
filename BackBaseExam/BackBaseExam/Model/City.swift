//
//  City.swift
//  BackBaseExam
//
//  Created by John Freidrich Cinco on 03/05/2019.
//  Copyright © 2019 John Freidrich Cinco. All rights reserved.
//

import Foundation
/*
 {
 "country":"UA",
 "name":"Hurzuf",
 "_id":707860,
 "coord":{
 "lon":34.283333,
 "lat":44.549999
 }
 }
 */
public struct City:Codable {
    public var country:String?
    public var name:String?
    public var id:Int?
    public var coord:Coordinates?
}

public struct Coordinates:Codable {
    public var lon:Float?
    public var lat:Float?
}
