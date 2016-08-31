
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

        DispatchQueue.global(qos: DispatchQoS.QoSClass.userInitiated).async(execute: {
            expectation.fulfill()
        })
        DispatchQueue.global(qos: DispatchQoS.QoSClass.background).async(execute: {
            expectation.fulfill()
        })

        expectation.await(1)
        assertNotCalled()
    }
}
