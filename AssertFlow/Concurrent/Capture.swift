
import Foundation
import XCTest

public class BaseCapture {

    private var condition: NSCondition
    private var called: Bool

    public init() {
        self.condition = NSCondition()
        self.called = false
    }

    func captured() {
        condition.lock()
        called = true
        condition.signal()
        condition.unlock()
    }

    public func await(waitFor: NSTimeInterval, _ description: String = "", file: String = __FILE__, line: UInt = __LINE__) {
        let waitUntil = NSDate(timeIntervalSinceNow: waitFor)
        condition.lock()
        if !called {
            condition.waitUntilDate(waitUntil)
        }
        let result = called
        condition.unlock()
        if !result {
            AssertHandler.instance.fail(description ?? "Capture not called", file: file, line: line)
        }
    }
}

public class Capture1<Param0>: BaseCapture {

    public var p0: Param0?

    public override init() {
        super.init()
    }

    public func capture() -> (Param0 -> ()) {
        return { p0 in
            self.p0 = p0
            self.captured()
        }
    }
}

public class Capture2<Param0, Param1>: BaseCapture {

    public var p0: Param0?
    public var p1: Param1?

    public override init() {
        super.init()
    }

    public func capture() -> ((Param0, Param1) -> ()) {
        return { (p0, p1) in
            self.p0 = p0
            self.p1 = p1
            self.captured()
        }
    }
}