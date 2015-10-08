
import Foundation
import XCTest
import AssertFlow

class AbstractMatcherTest : AssertFlowTestCase {
    
    func testNil() {
        var s: String?

        assertThat(s).isNil()
        assertNotCalled()

        s = "hello"
        assertThat(s).isNil()
        assertCalled()
    }
}