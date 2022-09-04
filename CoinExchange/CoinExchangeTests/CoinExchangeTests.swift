//
//  CoinExchangeTests.swift
//  CoinExchangeTests
//
//  Created by admin on 2/9/2565 BE.
//

import XCTest
@testable import CoinExchange

class CoinExchangeTests: XCTestCase {
    
    private var model: CurrencyModel!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        model = CurrencyModel(code: "USD", symbol: "&#36;", rate: "19,917.5156", description: "United States Dollar", rate_float: Optional(19917.516))
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
        model = nil
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testCurrentTypeIsCorrectForName() {
        
        XCTAssertEqual(CurrencyType.USD, Utils.shared.getCurrenyType(for: model.code))
        XCTAssertTrue(Utils.shared.getCurrenyType(for: model.code) == .USD)
        
        model = CurrencyModel(code: "EUR", symbol: "&#36;", rate: "19,917.5156", description: "United States Dollar", rate_float: Optional(19917.516))
        XCTAssertTrue(Utils.shared.getCurrenyType(for: model.code) == .EUR)
        
        model = CurrencyModel(code: "GBP", symbol: "&#36;", rate: "19,917.5156", description: "United States Dollar", rate_float: Optional(19917.516))
        XCTAssertTrue(Utils.shared.getCurrenyType(for: model.code) == .GBP)
        
        model = CurrencyModel(code: "GHJ", symbol: "&#36;", rate: "19,917.5156", description: "United States Dollar", rate_float: Optional(19917.516))
        XCTAssertTrue(Utils.shared.getCurrenyType(for: model.code) == .UNKNOWN)
    }
    

}
