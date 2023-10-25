//
//  Decimal + MultiplicativeArithmetic tests.swift
//  
//
//  Created by The Northstar✨ System on 2023-10-24.
//

import XCTest
import MultiplicativeArithmetic



final class Decimal___MultiplicativeArithmetic_tests: XCTestCase {

    func testSqrt() throws {
        let two: Decimal = 2
        XCTAssertEqual(two.sqrt().description, "1.41421356237309504880168872420969807856")
    }
    
    
    func testPow() throws {
        let seven: Decimal = 7
        let eleven: Decimal = 11
        
        XCTAssertEqual(seven.pow(eleven).description, "1977326743")
        
        // Expect `pow` to round half-up due to API constraints
        XCTAssertEqual(seven.pow(3.9).description, "2401")
        XCTAssertEqual(seven.pow(4.0).description, "2401")
        XCTAssertEqual(seven.pow(4.1).description, "2401")
        XCTAssertEqual(seven.pow(4.2).description, "2401")
        XCTAssertEqual(seven.pow(4.3).description, "2401")
        XCTAssertEqual(seven.pow(4.4).description, "2401")
        XCTAssertEqual(seven.pow(4.5).description, "16807")
        XCTAssertEqual(seven.pow(4.6).description, "16807")
        XCTAssertEqual(seven.pow(4.7).description, "16807")
        XCTAssertEqual(seven.pow(4.8).description, "16807")
        XCTAssertEqual(seven.pow(4.9).description, "16807")
        XCTAssertEqual(seven.pow(5.1).description, "16807")
    }
}
