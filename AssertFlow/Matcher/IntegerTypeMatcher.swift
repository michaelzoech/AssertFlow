
import Foundation

public class IntegerTypeMatcher<T: IntegerType> : AbstractMatcher<T> {
    
    override public init(actual: Actual<T>) {
        super.init(actual: actual)
    }
    
    public func greaterThan(expected: T) {
        if unpack() {
            if value <= expected {
                AssertHandler.instance.fail(self, message: "Expected \(value) to be greater than \(expected)")
            }
        }
    }
}