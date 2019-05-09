//
//  AboutViewTest.swift
//  BackBaseExamTests
//
//  Created by John Freidrich Cinco on 09/05/2019.
//  Copyright © 2019 John Freidrich Cinco. All rights reserved.
//

import XCTest

class AboutViewTest: XCTestCase {

    var app:XCUIApplication!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        app = XCUIApplication()
        app.launch()

    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAbout() {
        
        // Wait for the table to load
        var cell = app.cells.firstMatch
        _ = cell.waitForExistence(timeout: 10)
        
        // Search for a specific city
        let searchBar = app.searchFields.firstMatch
        searchBar.tap()
        searchBar.typeText("Cebu City")
        
        cell = app.cells.firstMatch
        _ = cell.waitForExistence(timeout: 1)
        cell.buttons.firstMatch.tap()
        
        let aboutView = app.tables.firstMatch
        _ = aboutView.waitForExistence(timeout: 1)
        
        let aboutCells = app.cells.allElementsBoundByIndex
        let cityText = aboutCells[0].staticTexts.element(matching: .any, identifier: "Cebu City").label
        let countryText = aboutCells[1].staticTexts.element(matching: .any, identifier: "PH").label
        
        XCTAssertNotNil(cityText)
        XCTAssertNotNil(countryText)
        XCTAssertEqual(cityText, "Cebu City")
        XCTAssertEqual(countryText, "PH")
        
    }

}
