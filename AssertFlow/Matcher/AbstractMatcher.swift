
import Foundation

public class AbstractMatcher<T> {
    
    let actual: Actual<T>
    var value: T { get { return actual.value! } }
    
    public init(actual: Actual<T>) {
        self.actual = actual
    }
    
    public func isNil() {
        if let a = actual.value {
            AssertHandler.instance.fail(self, message: "Expected nil, but was \(a)")
        }
    }
    
    public func equals<X: Equatable>(expected: X) {
        if unpack() {
            if let a = value as? X {
                if expected != a {
                    AssertHandler.instance.fail(self, message: "Expected \(a) to equal \(expected)")
                }
            } else {
                AssertHandler.instance.fail(self, message: "Expected \(value) to equal \(expected)")
            }
        }
    }
    
    func unpack() -> Bool {
        if actual.value == nil {
            AssertHandler.instance.fail(self, message: "Actual for assertion is nil")
            return false
        } else {
            return true
        }
    }
}