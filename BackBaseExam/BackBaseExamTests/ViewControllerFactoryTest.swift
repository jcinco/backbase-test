//
//  ViewControllerFactoryTest.swift
//  BackBaseExamTests
//
//  Created by John Freidrich Cinco on 07/05/2019.
//  Copyright © 2019 John Freidrich Cinco. All rights reserved.
//

import XCTest

@testable import BackBaseExam

class ViewControllerFactoryTest: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPortraitVcCreation() {
        let portrait = ViewControllerFactory.sharedInstance?.viewController(withStoryboardName: "portrait")
        
        XCTAssertNotNil(portrait)
    }
    
    
    func testLandscapeVcCreation() {
        let landscape = ViewControllerFactory.sharedInstance?.viewController(withStoryboardName: "landscape")
        
        XCTAssertNotNil(landscape)
    }
    
    
    func testCitySelectionVcCreation() {
        let citySelection = ViewControllerFactory.sharedInstance?.viewController(withStoryboardName: "citySelection")
        
        XCTAssertNotNil(citySelection)
    }
    
    
    func testMapVcCreation() {
        let map = ViewControllerFactory.sharedInstance?.viewController(withStoryboardName: "map")
        
        XCTAssertNotNil(map)
    }
    
    func testAboutVcCreation() {
        let about = ViewControllerFactory.sharedInstance?.viewController(withStoryboardName: "about")
        
        XCTAssertNotNil(about)
    }

    func testInvalidInput() {
        let nothing = ViewControllerFactory.sharedInstance?.viewController(withStoryboardName: "asdfasdfasdf")
        XCTAssertNil(nothing)
        
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
