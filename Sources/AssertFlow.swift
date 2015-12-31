
import Foundation
import XCTest

class AssertHandler {

    static var instance: AssertHandler = XCTestAssertHandler()
    
    init() {
    }

    func fail<T>(match: MatchInfo<T>, message: String) {
        fail(message, file: match.file, line: match.line)
    }

    func fail(message: String, file: String, line: UInt) {
    }

}

class XCTestAssertHandler : AssertHandler {
    
    override func fail(message: String, file: String, line: UInt) {
        XCTFail(message, file: file, line: line)
    }
}

public struct MatchInfo<T> {
    
    let actual: T?
    let file: String
    let line: UInt
    
    public init(actual: T?, file: String, line: UInt) {
        self.actual = actual
        self.file = file
        self.line = line
    }
    
    public func unpack(@noescape block: (T) -> ()) {
        guard let actual = actual else {
            fail("MatchInfo for assertion is nil")
            return
        }
        block(actual)
    }
    
    public func fail(message: String) {
        AssertHandler.instance.fail(self, message: message)
    }
    
    public func fail<A, B>(expectedMsg: String, expected: A, actualMsg: String, actual: B) {
        fail(expectedMsg + wrapIfMultiline("\(expected)") + actualMsg + wrapIfMultiline("\(actual)"))
    }
    
    private func wrapIfMultiline(s: String) -> String {
        let splitted = s.characters.split() { $0 == "\n" }.map { String($0) }
        if splitted.count > 1 {
            var result = "\n"
            for e in splitted {
                result += "\t" + e + "\n"
            }
            return result
        } else {
            return " \(s). "
        }
    }
}

public func assertThat<E>(actual: E?, file: String = __FILE__, line: UInt = __LINE__) -> Matcher<E> {
    return Matcher(actual: MatchInfo(actual: actual, file: file, line: line))
}
