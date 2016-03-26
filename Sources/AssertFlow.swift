
import Foundation
import XCTest

public class AssertHandler {

    public static var instance: AssertHandler = XCTestAssertHandler()
    
    public init() {
    }

    public func fail<T>(matcher: Matcher<T>, message: String) {
        fail(message, file: matcher.matchInfo.file, line: matcher.matchInfo.line)
    }

    public func fail(message: String, file: StaticString, line: UInt) {
    }

}

class XCTestAssertHandler : AssertHandler {
    
    override func fail(message: String, file: StaticString, line: UInt) {
        XCTFail(message, file: file, line: line)
    }
}

public struct MatchInfo<T> {
    
    let actual: T?
    let file: StaticString
    let line: UInt
    
    public init(actual: T?, file: StaticString, line: UInt) {
        self.actual = actual
        self.file = file
        self.line = line
    }
}

public func assertThat<E>(actual: E?, file: StaticString = #file, line: UInt = #line) -> Matcher<E> {
    return Matcher(actual: MatchInfo(actual: actual, file: file, line: line))
}
