//  Copyright © 2015 Michael Zoech. All rights reserved.

import Foundation
import XCTest
import AssertFlow

class FloatingPointTypeMatcherTest: AssertFlowTestCase {
    
    func testIsNan() {
        assertThat(Float.NaN).isNaN()
        assertNotCalled()
        assertThat(2.3).isNaN()
        assertCalled()
    }
}