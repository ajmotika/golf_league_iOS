//
//  GolferTests.swift
//  Golf LeagueTests
//
//  Created by Andrew Motika on 12/26/17.
//  Copyright © 2017 Andrew Motika. All rights reserved.
//

import XCTest
@testable import Golf_League

class GolferTests: XCTestCase {
    
    func testInitAllFields() {
        let golfer = Golfer(firstName: "FName", lastName: "LName", emailAddress: "test@email.com", phoneNumber: 1238675309)
        
        XCTAssertEqual("FName", golfer.firstName)
        XCTAssertEqual("LName", golfer.lastName)
        XCTAssertEqual("test@email.com", golfer.emailAddress)
        XCTAssertEqual(1238675309, golfer.phoneNumber)
    }
    
    func testInitOnlyRequiredFields() {
        let golfer = Golfer(firstName: "FName", lastName: "LName", emailAddress: nil, phoneNumber: nil)
        
        XCTAssertEqual("FName", golfer.firstName)
        XCTAssertEqual("LName", golfer.lastName)
        XCTAssertNil(golfer.emailAddress)
        XCTAssertNil(golfer.phoneNumber)
    }
    
    func testInitOptionalFieldPermutations() {
        let golfer = Golfer(firstName: "FName", lastName: "LName", emailAddress: "test@email.com", phoneNumber: nil)
        
        XCTAssertEqual("FName", golfer.firstName)
        XCTAssertEqual("LName", golfer.lastName)
        XCTAssertEqual("test@email.com", golfer.emailAddress)
        XCTAssertNil(golfer.phoneNumber)
        
        let golfer2 = Golfer(firstName: "FName", lastName: "LName", emailAddress: nil, phoneNumber: 1238675309)
        
        XCTAssertEqual("FName", golfer2.firstName)
        XCTAssertEqual("LName", golfer2.lastName)
        XCTAssertNil(golfer2.emailAddress)
        XCTAssertEqual(1238675309, golfer2.phoneNumber)
    }
}
