
import Foundation
import XCTest

public class Expectation {

    private var count: UInt
    private let description: String?
    private let condition: NSCondition

    public init(count: UInt = 1, description: String? = nil) {
        self.count = count
        self.description = description
        condition = NSCondition()
    }

    public func fulfill() {
        condition.lock()
        if (count > 0) {
            count--
            if (count == 0) {
                condition.signal()
            }
        }
        condition.unlock()
    }

    public func await(interval: NSTimeInterval, file: String = __FILE__, line: UInt = __LINE__) {
        let waitUntil = NSDate(timeIntervalSinceNow: interval)
        condition.lock()
        let fulfilled = count == 0 || condition.waitUntilDate(waitUntil)
        condition.unlock()
        if !fulfilled {
            AssertHandler.instance.fail(description ?? "Expectation not fulfilled", file: file, line: line)
        }
    }
}