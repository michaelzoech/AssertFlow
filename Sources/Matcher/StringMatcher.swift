
import Foundation

open class StringMatcher : Matcher<String> {
    
    public override init(actual: MatchInfo<Element>) {
        super.init(actual: actual)
    }
}

public extension StringMatcher {

    @discardableResult
    public func contains(_ expected: String) -> Self {
        if unpack() {
            if actual.range(of: expected) == nil {
                fail("Expected string \"\(actual)\" to contain \"\(expected)\"")
            }
        }
        return self
    }

    @discardableResult
    public func hasPrefix(_ prefix: String) -> Self {
        if unpack() {
            if !actual.hasPrefix(prefix) {
                fail("Expected string \"\(actual)\" to have prefix \"\(prefix)\"")
            }
        }
        return self
    }

    @discardableResult
    public func hasSuffix(_ suffix: String) -> Self {
            if !actual.hasSuffix(suffix) {
                fail("Expected string \"\(actual)\" to have suffix \"\(suffix)\"")
            }
        return self
    }
}

public func assertThat(_ actual: String?, file: StaticString = #file, line: UInt = #line) -> StringMatcher {
    return StringMatcher(actual: MatchInfo(actual: actual, file: file, line: line))
}
