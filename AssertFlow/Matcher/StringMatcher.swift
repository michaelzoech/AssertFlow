
import Foundation

public class StringMatcher<S> : AbstractMatcher<String> {
    
    override public init(actual: Actual<String>) {
        super.init(actual: actual)
    }
    
    public func contains(expected: String) {
        if unpack() {
            if value.rangeOfString(expected) == nil {
                AssertHandler.instance.fail(self, message: "Expected string \"\(value)\" to contain \"\(expected)\"")
            }
        }
    }
}
