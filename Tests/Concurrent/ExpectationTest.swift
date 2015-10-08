
import Foundation
import XCTest
import AssertFlow

class ExpectationTest: AssertFlowTestCase {

    func testFulfillBeforeAwait_shouldSucceed() {
        let expectation = Expectation()
        expectation.fulfill()
        expectation.await(0.1)
        assertNotCalled()
    }

    func testNotFulfilledBeforeAwaitEnds_shouldNotSucceeds() {
        let expectation = Expectation()
        expectation.await(0.1)
        assertCalled()
    }

    func testCountedFulfilled_shouldFulfillAfterCount() {
        let expectation = Expectation(count: 2)

        dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), {
            expectation.fulfill()
        })
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0), {
            expectation.fulfill()
        })

        expectation.await(1)
        assertNotCalled()
    }
}