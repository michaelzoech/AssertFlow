//  Copyright © 2015 Michael Zoech. All rights reserved.

import Foundation
import XCTest
import AssertFlow

class FloatingPointTypeMatcherTest: XCTestCase {
    
    var handler: CaptureAssertHandler = CaptureAssertHandler()
    
    override func setUp() {
        handler = CaptureAssertHandler()
        AssertHandler.instance = handler
    }
    
    func testIsNan() {
        assertThat(Float.NaN).isNaN()
        XCTAssertFalse(handler.called)
        assertThat(2.3).isNaN()
        XCTAssertTrue(handler.called)
    }
}