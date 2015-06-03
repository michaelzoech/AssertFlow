
import Foundation

public class StringMatcher<S> : AbstractMatcher<String> {
    
    override public init(actual: Actual<String>) {
        super.init(actual: actual)
    }
    
    public func contains(expected: String) {
        if let a = value {
            if a.rangeOfString(expected) == nil {
                AssertHandler.instance.fail(self, message: "Expected string \"\(a)\" to contain \"\(expected)\"")
            }
        } else {
            AssertHandler.instance.fail(self, message: "Expected string to contain \"\(expected)\" but was nil")
        }
    }
}
