
import Foundation
import XCTest

open class Expectation {

    fileprivate var count: UInt
    fileprivate let description: String?
    fileprivate let condition: NSCondition

    public init(count: UInt = 1, description: String? = nil) {
        self.count = count
        self.description = description
        condition = NSCondition()
    }

    open func fulfill() {
        condition.lock()
        if (count > 0) {
            count -= 1
            if (count == 0) {
                condition.signal()
            }
        }
        condition.unlock()
    }

    open func await(_ interval: TimeInterval, file: StaticString = #file, line: UInt = #line) {
        let waitUntil = Date(timeIntervalSinceNow: interval)
        condition.lock()
        let fulfilled = count == 0 || condition.wait(until: waitUntil)
        condition.unlock()
        if !fulfilled {
            AssertHandler.instance.fail(description ?? "Expectation not fulfilled", file: file, line: line)
        }
    }
}
