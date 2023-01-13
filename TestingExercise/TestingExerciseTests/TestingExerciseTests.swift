//
//  TestingExerciseTests.swift
//  TestingExerciseTests
//
//  Created by Rivaldo Fernandes on 13/01/23.
//

import XCTest
 
@testable import TestingExercise
class EmptyWindowTestTests: XCTestCase {
 
    var viewController = ViewController()
    
    func testDicodingSwift() {
        let input = "swift"
        let output = " "
        XCTAssertEqual(output, self.viewController.dicodingSwift(input), "Failed to produce \(output) from \(input)")
    }
}
