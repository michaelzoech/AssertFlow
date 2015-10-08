
import Foundation
import XCTest
import AssertFlow

class CaptureTest: AssertFlowTestCase {

    func testCallCaptureFunctionOnBackgroundThread_shouldUnblockAndMatchPassedValue() {
        var function: (String -> ())?
        let myCapture = Capture1<String>()

        function = myCapture.capture()

        dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), {
            function!("bar")
        })

        myCapture.await(1)
        assertNotCalled()

        assertThat(myCapture.p0).contains("bar")
        assertNotCalled()
    }

    func testCaptureNotCalled_shouldFailAwait() {
        let myCapture = Capture1<String>()
        myCapture.await(0.1)
        assertCalled()
    }
}
