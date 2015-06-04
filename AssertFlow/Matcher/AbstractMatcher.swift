
import Foundation

public class AbstractMatcher<T> {
    
    let matchInfo: MatchInfo<T>
    var actual: T { get { return matchInfo.actual! } }
    
    public init(actual: MatchInfo<T>) {
        self.matchInfo = actual
    }
    
    public func isNil() {
        if let a = matchInfo.actual {
            AssertHandler.instance.fail(self, message: "Expected nil, but was \(a)")
        }
    }
    
    public func equals<X: Equatable>(expected: X) {
        if unpack() {
            if let a = actual as? X {
                if expected != a {
                    AssertHandler.instance.fail(self, message: "Expected \(a) to equal \(expected)")
                }
            } else {
                AssertHandler.instance.fail(self, message: "Expected \(actual) to equal \(expected)")
            }
        }
    }
    
    func unpack() -> Bool {
        if matchInfo.actual == nil {
            AssertHandler.instance.fail(self, message: "MatchInfo for assertion is nil")
            return false
        } else {
            return true
        }
    }
}