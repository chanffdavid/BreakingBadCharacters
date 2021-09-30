//
//  BreakingBadCharactersTests.swift
//  BreakingBadCharactersTests
//
//  Created by iovoi on 30/09/2021.
//

import XCTest
@testable import BreakingBadCharacters

class BreakingBadCharactersTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBreakingBadCharacters() {
        let e = expectation(description: "BreakingBadCharactersApi")
        
        let apiServer = BreakingBadApi(data: [:], service: .characters, method: .get, isJSONRequest: false).executeQuery {
        
            (result: Result<[Character],Error>) in
            switch result{
            case .success(let response):
                e.fulfill()
                print(response)
            case .failure(let error):
                XCTAssertNil(error, "Whoops, error \(error)")
                print(error)
              }
            
        }
        waitForExpectations(timeout: 5.0, handler: nil)
  }
     
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
