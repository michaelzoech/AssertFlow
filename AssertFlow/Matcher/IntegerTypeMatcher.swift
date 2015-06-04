
import Foundation

public class IntegerTypeMatcher<T: IntegerType> : AbstractMatcher<T> {
    
    override public init(actual: MatchInfo<T>) {
        super.init(actual: actual)
    }
    
    public func greaterThan(expected: T) {
        if unpack() {
            if actual <= expected {
                AssertHandler.instance.fail(self, message: "Expected \(actual) to be greater than \(expected)")
            }
        }
    }
}