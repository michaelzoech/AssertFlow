
import Foundation

open class Matcher<T> : MatcherType {
    
    public typealias Element = T
    
    let matchInfo: MatchInfo<Element>
    
    open var actual: Element { get { return matchInfo.actual! } }

    open var actualOrNil: Element? { get { return matchInfo.actual } }
    
    public init(actual: MatchInfo<Element>) {
        self.matchInfo = actual
    }
    
    open func isNil() -> Self {
        if let a = matchInfo.actual {
            fail("Expected nil, but was \(a)")
        }
        return self
    }

    open func notNil() -> Self {
        if matchInfo.actual == nil {
            fail("Expected value to be not nil, but was nil.")
        }
        return self
    }
    
    open func unpack() -> Bool {
        if matchInfo.actual == nil {
            fail("MatchInfo for assertion is nil")
            return false
        } else {
            return true
        }
    }
    
    open func fail(_ message: String) {
        AssertHandler.instance.fail(self, message: message)
    }
    
    open func fail<A, B>(_ expectedMsg: String, expected: A, actualMsg: String, actual: B) {
        fail(expectedMsg + wrapIfMultiline("\(expected)") + actualMsg + wrapIfMultiline("\(actual)"))
    }
    
    fileprivate func wrapIfMultiline(_ s: String) -> String {
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
