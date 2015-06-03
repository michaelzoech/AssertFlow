
import Foundation

public class AbstractMatcher<T> {
    
    let actual: Actual<T>
    var value: T? { get { return actual.value } }
    var file: String { get { return actual.file } }
    var line: UInt { get { return actual.line } }
    
    public init(actual: Actual<T>) {
        self.actual = actual
    }
    
    public func isNil() {
        if let a = value {
            AssertHandler.instance.fail(self, message: "Expected nil, but was \(a)")
        }
    }
    
    public func equals<X: Equatable>(expected: X) {
        if let a = value as? X {
            if expected != a {
                AssertHandler.instance.fail(self, message: "Expected \(a) to equal \(expected)")
            }
        } else {
            AssertHandler.instance.fail(self, message: "Expected actual to equal \(expected), but was nil")
        }
    }
}