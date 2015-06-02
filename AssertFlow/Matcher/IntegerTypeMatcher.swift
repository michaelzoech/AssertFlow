
import Foundation

public class IntegerTypeMatcher<T: IntegerType> : AbstractMatcher<T> {
    
    override public init(actual: Actual<T>) {
        super.init(actual: actual)
    }
    
    public func greaterThan(expected: T) {
        if let a = value {
            if (a <= expected) {
                AssertHandler.instance.fail(self, message: "Expected \(a) to be greater than \(expected)")
            }
        } else {
            AssertHandler.instance.fail(self, message: "Actual expected to be greater than \(expected), but was nil")
        }
    }
}