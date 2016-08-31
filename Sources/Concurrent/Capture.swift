
import Foundation
import XCTest

open class BaseCapture {

    fileprivate var condition: NSCondition
    fileprivate var called: Bool

    public init() {
        self.condition = NSCondition()
        self.called = false
    }

    open func captured(file: StaticString, line: UInt) {
        condition.lock()
        if called {
            AssertHandler.instance.fail("Capture called multiple times", file: file, line: line)
        }
        called = true
        condition.signal()
        condition.unlock()
    }

    open func await(_ waitFor: TimeInterval, _ description: String = "", file: StaticString = #file, line: UInt = #line) {
        let waitUntil = Date(timeIntervalSinceNow: waitFor)
        condition.lock()
        if !called {
            condition.wait(until: waitUntil)
        }
        let result = called
        condition.unlock()
        if !result {
            AssertHandler.instance.fail(description, file: file, line: line)
        }
    }
}

open class Capture1<Param0>: BaseCapture {

    open var p0: Param0?

    public override init() {
        super.init()
    }

    open func capture(_ file: StaticString = #file, line: UInt = #line) -> ((Param0) -> ()) {
        return { p0 in
            self.p0 = p0
            self.captured(file: file, line: line)
        }
    }
}

open class Capture2<Param0, Param1>: BaseCapture {

    open var p0: Param0?
    open var p1: Param1?

    public override init() {
        super.init()
    }

    open func capture(_ file: StaticString = #file, line: UInt = #line) -> ((Param0, Param1) -> ()) {
        return { (p0, p1) in
            self.p0 = p0
            self.p1 = p1
            self.captured(file: file, line: line)
        }
    }
}

open class Capture3<Param0, Param1, Param2>: BaseCapture {

    open var p0: Param0?
    open var p1: Param1?
    open var p2: Param2?

    public override init() {
        super.init()
    }

    open func capture(_ file: StaticString = #file, line: UInt = #line) -> ((Param0, Param1, Param2) -> ()) {
        return { (p0, p1, p2) in
            self.p0 = p0
            self.p1 = p1
            self.p2 = p2
            self.captured(file: file, line: line)
        }
    }
}

open class Capture4<Param0, Param1, Param2, Param3>: BaseCapture {

    open var p0: Param0?
    open var p1: Param1?
    open var p2: Param2?
    open var p3: Param3?

    public override init() {
        super.init()
    }

    open func capture(_ file: StaticString = #file, line: UInt = #line) -> ((Param0, Param1, Param2, Param3) -> ()) {
        return { (p0, p1, p2, p3) in
            self.p0 = p0
            self.p1 = p1
            self.p2 = p2
            self.p3 = p3
            self.captured(file: file, line: line)
        }
    }
}
