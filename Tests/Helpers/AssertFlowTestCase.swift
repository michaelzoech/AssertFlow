//  Copyright © 2015 Michael Zoech. All rights reserved.

import Foundation
import XCTest
@testable import AssertFlow

/**
Base class for tests using the AssertHandler for verification
if the SUT functions correctly.
*/
class AssertFlowTestCase: XCTestCase {

    var assertHandler: CaptureAssertHandler = CaptureAssertHandler()

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        assertHandler = CaptureAssertHandler()
        AssertHandler.instance = assertHandler
    }

    /// Asserts that the AssertHandler.fail() has been called.
    func assertCalled(file: String = __FILE__, line: UInt = __LINE__) {
        XCTAssertTrue(assertHandler.called, file: file, line: line)
    }

    /// Asserts that the AssertHandler.fail() method has not been called.
    func assertNotCalled(file: String = __FILE__, line: UInt = __LINE__) {
        XCTAssertFalse(assertHandler.called, file: file, line: line)
    }
}