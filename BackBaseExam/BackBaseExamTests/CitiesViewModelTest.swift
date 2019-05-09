//
//  CitiesViewModel.swift
//  BackBaseExamTests
//
//  Created by John Freidrich Cinco on 09/05/2019.
//  Copyright © 2019 John Freidrich Cinco. All rights reserved.
//

import XCTest

@testable import BackBaseExam

class CitiesViewModelTest: XCTestCase {

    private var vm:CitiesViewModel! = CitiesViewModel.sharedInstance
    
    override func setUp() {
        var count:Int! = 0
        
        // Async test
        let promise = expectation(description: "json file loaded")
        
        vm.load { (success:Bool)->Void in
            if (success) {
                count = self.vm.cities.count
                XCTAssertTrue(count ?? 0 > 0) // Cities should be successfully loaded from json file.
            }
            else {
                XCTFail("Failed to load cities from file.")
            }
            promise.fulfill()
        }
        
        wait(for: [promise], timeout: 30)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

  

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
