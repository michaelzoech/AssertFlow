
import Foundation
import XCTest
import AssertFlow

class CaptureTest: XCTestCase {

    var handler: CaptureAssertHandler = CaptureAssertHandler()

    override func setUp() {
        handler = CaptureAssertHandler()
        AssertHandler.instance = handler
    }

    func testCallCaptureFunctionOnBackgroundThread_shouldUnblockAndMatchPassedValue() {
        var function: (String -> ())?
        let myCapture = Capture1<String>()

        function = myCapture.capture()

        dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), {
            function!("bar")
        })

        myCapture.await(1)
        XCTAssertFalse(handler.called)

        assertThat(myCapture.p0).contains("bar")
        XCTAssertFalse(handler.called)
    }

    func testCaptureNotCalled_shouldFailAwait() {
        let myCapture = Capture1<String>()
        myCapture.await(0.1)
        XCTAssertTrue(handler.called)
    }
}
