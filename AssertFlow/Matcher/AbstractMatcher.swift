
import Foundation

public class AbstractMatcher<T> {
    
    let matchInfo: MatchInfo<T>
    var actual: T { get { return matchInfo.actual! } }
    
    public init(actual: MatchInfo<T>) {
        self.matchInfo = actual
    }
    
    public func isNil() {
        if let a = matchInfo.actual {
            fail("Expected nil, but was \(a)")
        }
    }
    
    public func equals<X: Equatable>(expected: X) {
        if unpack() {
            if let a = actual as? X {
                if expected != a {
                    fail("Expected \(a) to equal \(expected)")
                }
            } else {
                fail("Expected \(actual) to equal \(expected)")
            }
        }
    }
    
    func unpack() -> Bool {
        if matchInfo.actual == nil {
            fail("MatchInfo for assertion is nil")
            return false
        } else {
            return true
        }
    }
    
    func fail(message: String) {
        AssertHandler.instance.fail(self, message: message)
    }
}