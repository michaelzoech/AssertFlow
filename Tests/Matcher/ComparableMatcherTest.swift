
import Foundation
import XCTest
import AssertFlow

class IntegerTypeMatcherTest : XCTestCase {
    
    var handler: CaptureAssertHandler = CaptureAssertHandler()
    
    override func setUp() {
        handler = CaptureAssertHandler()
        AssertHandler.instance = handler
    }
    
    func testGreaterThan() {
        assertThat(3).greaterThan(2)
        XCTAssertFalse(handler.called)
        assertThat(2).greaterThan(2)
        XCTAssertTrue(handler.called)
    }
    
    func testGreaterOrEqual() {
        assertThat(3).greaterOrEqual(2)
        XCTAssertFalse(handler.called)
        assertThat(2).greaterOrEqual(2)
        XCTAssertFalse(handler.called)
        assertThat(1).greaterThan(2)
        XCTAssertTrue(handler.called)
    }

    func testSmallerThan() {
        assertThat(2).smallerThan(3)
        XCTAssertFalse(handler.called)
        assertThat(3).smallerThan(3)
        XCTAssertTrue(handler.called)
    }
    
    func testSmallerOrEqual() {
        assertThat(2).smallerOrEqual(3)
        XCTAssertFalse(handler.called)
        assertThat(3).smallerOrEqual(3)
        XCTAssertFalse(handler.called)
        assertThat(4).smallerOrEqual(3)
        XCTAssertTrue(handler.called)
    }
}
