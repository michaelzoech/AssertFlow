
import Foundation
import XCTest
import AssertFlow

class EquatableMatcherTest: XCTestCase {

    var handler: CaptureAssertHandler = CaptureAssertHandler()

    override func setUp() {
        handler = CaptureAssertHandler()
        AssertHandler.instance = handler
    }

    func testEqualsOfInt() {
        assertThat(2).equals(2)
        XCTAssertFalse(handler.called)
        assertThat(3).equals(2)
        XCTAssertTrue(handler.called)
    }

    func testEqualsOfString() {
        let a = "a"

        assertThat(a).equals("a")
        XCTAssertFalse(handler.called)
        assertThat(a).equals("b")
        XCTAssertTrue(handler.called)
    }

    func testEqualsWithNil() {
        let a: String? = nil
        XCTAssertFalse(handler.called)
        assertThat(a).equals("b")
        XCTAssertTrue(handler.called)
    }

    func testEqualsBothSidesNil() {
        let a: String? = nil
        XCTAssertFalse(handler.called)
        assertThat(a).equals(nil)
        XCTAssertFalse(handler.called)
    }
}
