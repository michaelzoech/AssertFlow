
import Foundation
import XCTest
import AssertFlow

class CaptureTest: AssertFlowTestCase {

    func testCallCapture1FunctionOnBackgroundThread_shouldUnblockAndMatchPassedValue() {
        var function: (String -> ())?
        let myCapture = Capture1<String>()

        function = myCapture.capture()

        dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), {
            function!("a")
        })

        myCapture.await(1)
        assertNotCalled()

        assertThat(myCapture.p0).equals("a")
        assertNotCalled()
    }

    func testCaptureNotCalled_shouldFailAwait() {
        let myCapture = Capture1<String>()
        myCapture.await(0.1)
        assertCalled()
    }

    func testCallCapture2FunctionOnBackgroundThread_shouldUnblockAndMatchPassedValue() {
        var function: ((String, Int) -> ())?
        let myCapture = Capture2<String, Int>()

        function = myCapture.capture()

        dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), {
            function!("a", 1)
        })

        myCapture.await(1)
        assertNotCalled()

        assertThat(myCapture.p0).equals("a")
        assertThat(myCapture.p1).equals(1)
        assertNotCalled()
    }

    func testCallCapture3FunctionOnBackgroundThread_shouldUnblockAndMatchPassedValue() {
        var function: ((String, Int, Bool) -> ())?
        let myCapture = Capture3<String, Int, Bool>()

        function = myCapture.capture()

        dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), {
            function!("a", 1, true)
        })

        myCapture.await(1)
        assertNotCalled()

        assertThat(myCapture.p0).equals("a")
        assertThat(myCapture.p1).equals(1)
        assertThat(myCapture.p2).equals(true)
        assertNotCalled()
    }

    func testCallCapture4FunctionOnBackgroundThread_shouldUnblockAndMatchPassedValue() {
        var function: ((String, Int, Bool, Double) -> ())?
        let myCapture = Capture4<String, Int, Bool, Double>()

        function = myCapture.capture()

        dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), {
            function!("a", 1, true, 2.5)
        })

        myCapture.await(1)
        assertNotCalled()

        assertThat(myCapture.p0).equals("a")
        assertThat(myCapture.p1).equals(1)
        assertThat(myCapture.p2).equals(true)
        assertThat(myCapture.p3).equals(2.5)
        assertNotCalled()
    }

}
