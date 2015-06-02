
import Foundation
import XCTest

public class AssertHandler {
    
    public static var instance: AssertHandler = XCTestAssertHandler()
    
    public init() {
    }
    
    public func fail<T>(matcher: AbstractMatcher<T>, message: String) {
    }
}

public class XCTestAssertHandler : AssertHandler {
    
    override public func fail<T>(matcher: AbstractMatcher<T>, message: String) {
        XCTFail(message, file: matcher.file, line: matcher.line)
    }
}

public struct Actual<T> {
    
    let value: T?
    let file: String
    let line: UInt
    
    public init(value: T?, file: String, line: UInt) {
        self.value = value
        self.file = file
        self.line = line
    }
}

public func assertThat<T: IntegerType>(actual: T?, file: String = __FILE__, line: UInt = __LINE__) -> IntegerTypeMatcher<T> {
    return IntegerTypeMatcher(actual: Actual(value: actual, file: file, line: line))
}