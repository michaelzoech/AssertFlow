
import Foundation

public class StringMatcher : Matcher<String> {
    
    public override init(actual: MatchInfo<Element>) {
        super.init(actual: actual)
    }
}

public extension StringMatcher {

    public func contains(expected: String) -> Self {
        if unpack() {
            if actual.rangeOfString(expected) == nil {
                fail("Expected string \"\(actual)\" to contain \"\(expected)\"")
            }
        }
        return self
    }

    public func hasPrefix(prefix: String) -> Self {
        if unpack() {
            if !actual.hasPrefix(prefix) {
                fail("Expected string \"\(actual)\" to have prefix \"\(prefix)\"")
            }
        }
        return self
    }

    public func hasSuffix(suffix: String) -> Self {
            if !actual.hasSuffix(suffix) {
                fail("Expected string \"\(actual)\" to have suffix \"\(suffix)\"")
            }
        return self
    }
}

public func assertThat(actual: String?, file: StaticString = #file, line: UInt = #line) -> StringMatcher {
    return StringMatcher(actual: MatchInfo(actual: actual, file: file, line: line))
}
