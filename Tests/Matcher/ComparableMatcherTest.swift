
import Foundation
import XCTest
import AssertFlow

class IntegerTypeMatcherTest : AssertFlowTestCase {
    
    func testGreaterThan() {
        assertThat(3).greaterThan(2)
        assertNotCalled()
        assertThat(2).greaterThan(2)
        assertCalled()
    }
    
    func testGreaterOrEqual() {
        assertThat(3).greaterOrEqual(2)
        assertNotCalled()
        assertThat(2).greaterOrEqual(2)
        assertNotCalled()
        assertThat(1).greaterThan(2)
        assertCalled()
    }

    func testSmallerThan() {
        assertThat(2).smallerThan(3)
        assertNotCalled()
        assertThat(3).smallerThan(3)
        assertCalled()
    }
    
    func testSmallerOrEqual() {
        assertThat(2).smallerOrEqual(3)
        assertNotCalled()
        assertThat(3).smallerOrEqual(3)
        assertNotCalled()
        assertThat(4).smallerOrEqual(3)
        assertCalled()
    }
}
