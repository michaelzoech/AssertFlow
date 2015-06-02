
import Foundation
import XCTest
import AssertFlow

class IntegerTypeMatcherTest : XCTestCase {
    
    var handler: CaptureAssertHandler = CaptureAssertHandler()
    
    override func setUp() {
        handler = CaptureAssertHandler()
        AssertHandler.instance = handler
    }
    
    func testExample() {
        assertThat(3).greaterThan(2)
        XCTAssertFalse(handler.called)
        assertThat(3).greaterThan(3)
        XCTAssertTrue(handler.called)
    }

}
