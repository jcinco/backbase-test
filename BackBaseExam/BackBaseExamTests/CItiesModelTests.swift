//
//  CItiesModelTests.swift
//  BackBaseExamTests
//
//  Created by John Freidrich Cinco on 03/05/2019.
//  Copyright © 2019 John Freidrich Cinco. All rights reserved.
//

import XCTest

@testable import BackBaseExam

class CItiesModelTests: XCTestCase {

    private var model:CitiesModel!
    
    override func setUp() {
        self.model = CitiesModel.sharedInstance
        
        let promise = expectation(description: "json loaded")
        self.model.loadJson { (success) in
            if (success) {
                promise.fulfill()
            }
            else {
                XCTFail("Failed to load json file.")
            }
        }
        // Make sure our model is not nil
        XCTAssertNotNil(self.model)
        
        wait(for: [promise], timeout: 30)
    }

    override func tearDown() {
        CitiesModel.destroy()
        // clean up
        self.model = nil
    }

    func testFiltering() {
        // one letter entry
        var result = self.model.cities(withName:"p")
        XCTAssertTrue(result?.count ?? 0 > 0)
        
        // exactly two cities
        result = self.model.cities(withName: "Cebu")
        XCTAssertTrue(result?.count ?? 0 == 2)
    }
    
    func testFilteringNegative() {
        // non-existent entry
        var result = self.model.cities(withName: "xx")
        XCTAssertTrue(result?.count ?? 0 == 0)
        
        // nil entry should return all cities
        result = self.model.cities(withName: nil)
        XCTAssertTrue(result?.count ?? 0 > 0)
        XCTAssertNotNil(self.model.cities) // Should not be nil
        
        // Empty string should return all cities
        result = self.model.cities(withName: "")
        XCTAssertTrue(result?.count ?? 0 > 0)
        
        result = self.model.cities(withName: "        ")
        XCTAssertTrue(result?.count ?? 0 > 0)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
