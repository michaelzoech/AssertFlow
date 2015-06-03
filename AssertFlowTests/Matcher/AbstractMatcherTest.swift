
import Foundation
import XCTest
import AssertFlow

class AbstractMatcherTest : XCTestCase {
    
    var handler: CaptureAssertHandler = CaptureAssertHandler()
    
    override func setUp() {
        handler = CaptureAssertHandler()
        AssertHandler.instance = handler
    }
    
    func testNil() {
        var s: String?
        assertThat(s).isNil()
        XCTAssertFalse(handler.called)
        s = "hello"
        assertThat(s).isNil()
        XCTAssertTrue(handler.called)
    }
    
    func testEquals() {
        var a = "a"
        
        assertThat(a).equals("a")
        XCTAssertFalse(handler.called)
        assertThat(a).equals("b")
        XCTAssertTrue(handler.called)
    }
    
    func testEqualsWithNil() {
        var a: String? = nil
        XCTAssertFalse(handler.called)
        assertThat(a).equals("b")
        XCTAssertTrue(handler.called)
    }
}