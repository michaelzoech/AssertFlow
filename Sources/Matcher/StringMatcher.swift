
import Foundation

public class StringMatcher : Matcher<String> {
    
    public override init(actual: MatchInfo<Element>) {
        super.init(actual: actual)
    }
}

public extension StringMatcher {

    public func contains(expected: String) -> Self {
        match.unpack { actual in
            if actual.rangeOfString(expected) == nil {
                match.fail("Expected string \"\(actual)\" to contain \"\(expected)\"")
            }
        }
        return self
    }
}

public func assertThat(actual: String?, file: String = __FILE__, line: UInt = __LINE__) -> StringMatcher {
    return StringMatcher(actual: MatchInfo(actual: actual, file: file, line: line))
}
