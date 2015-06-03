
import Foundation
import XCTest
import AssertFlow

class StringMatcherTest : XCTestCase {
    
    var handler: CaptureAssertHandler = CaptureAssertHandler()
    
    override func setUp() {
        handler = CaptureAssertHandler()
        AssertHandler.instance = handler
    }
    
    func testContainsSubstring() {
        var s = "This is a longer string for testing"
        
        assertThat(s).contains("a longer")
        XCTAssertFalse(handler.called)
        assertThat(s).contains("unknown")
        XCTAssertTrue(handler.called)
    }
}
