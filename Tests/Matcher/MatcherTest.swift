//  Copyright © 2016 Michael Zoech. All rights reserved.

import Foundation
import XCTest
import AssertFlow

class MatcherTest: AssertFlowTestCase {

    func testIsNil() {
        assertThat(nil).isNil()
        assertNotCalled()
        assertThat("a").isNil()
        assertCalled()
    }

    func testNotNil() {
        assertThat("a").notNil()
        assertNotCalled()
        assertThat(nil).notNil()
        assertCalled()
    }
}
