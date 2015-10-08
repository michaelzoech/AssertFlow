
import Foundation


public class StringMatcher : Matcher<String> {
    
    public override init(actual: MatchInfo<Element>) {
        super.init(actual: actual)
    }
    
    public func contains(expected: String) -> Self {
        if unpack() {
            if actual.rangeOfString(expected) == nil {
                fail("Expected string \"\(actual)\" to contain \"\(expected)\"")
            }
        }
        return self
    }
}
