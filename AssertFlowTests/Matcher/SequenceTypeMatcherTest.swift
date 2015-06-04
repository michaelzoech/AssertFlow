
import Foundation
import XCTest
import AssertFlow

class SequenceTypeMatcherTest : XCTestCase {
    
    var handler: CaptureAssertHandler = CaptureAssertHandler()
    
    override func setUp() {
        handler = CaptureAssertHandler()
        AssertHandler.instance = handler
    }
    
    func testContains() {
        var a = ["a", "b", "c", "d"]
        
        assertThat(a).contains("a")
        XCTAssertFalse(handler.called)
        assertThat(a).contains(1)
        XCTAssertTrue(handler.called)
    }
    
    func testContainsInOrder() {
        var a = ["a", "b", "c", "d"]
        
        assertThat(a).containsInOrder("a", "b")
        XCTAssertFalse(handler.called)
        assertThat(a).containsInOrder("b", "d")
        XCTAssertFalse(handler.called)
        assertThat(a).containsInOrder("a", "c", "b")
        XCTAssertTrue(handler.called)
    }
    
    func testContainsOneOf() {
        var a = ["a", "b", "c", "d"]
        
        assertThat(a).containsOneOf("a", "x")
        XCTAssertFalse(handler.called)
        assertThat(a).containsOneOf("x", "a")
        XCTAssertFalse(handler.called)
        assertThat(a).containsOneOf("x", "d")
        XCTAssertFalse(handler.called)
        assertThat(a).containsOneOf("x", "y")
        XCTAssertTrue(handler.called)
    }
}