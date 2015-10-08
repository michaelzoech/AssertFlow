
import Foundation

public class Matcher<T> : MatcherType {
    
    public typealias Element = T
    
    let matchInfo: MatchInfo<Element>
    
    public var actual: Element { get { return matchInfo.actual! } }

    public var actualOrNil: Element? { get { return matchInfo.actual } }
    
    public init(actual: MatchInfo<Element>) {
        self.matchInfo = actual
    }
    
    public func isNil() -> Self {
        if let a = matchInfo.actual {
            fail("Expected nil, but was \(a)")
        }
        return self
    }
    
    public func unpack() -> Bool {
        if matchInfo.actual == nil {
            fail("MatchInfo for assertion is nil")
            return false
        } else {
            return true
        }
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
