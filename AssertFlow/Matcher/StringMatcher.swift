
import Foundation

public class StringMatcher<S> : AbstractMatcher<String> {
    
    override public init(actual: MatchInfo<String>) {
        super.init(actual: actual)
    }
    
    public func contains(expected: String) {
        if unpack() {
            if actual.rangeOfString(expected) == nil {
                fail("Expected string \"\(actual)\" to contain \"\(expected)\"")
            }
        }
    }
}
