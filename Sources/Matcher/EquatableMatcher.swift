
import Foundation

public extension MatcherType where Element: Equatable {

    public func equals(expected: Element?) -> Self {
        if let expected = expected {
            if unpack() {
                if actual != expected {
                    fail("Expected \(actual) to equal \(expected)")
                }
            }
        } else {
            if let actual = actualOrNil {
                fail("Expected nil but was \(actual)")
            }
        }
        return self
    }
}

// Special case where CollectionType does not conform to Equatable, but Elements do.
public extension MatcherType where Element: CollectionType, Element.Generator.Element: Equatable {

    public func equals(expected: Element?) -> Self {
        if let expected = expected {
            if unpack() {
                guard actual.count == expected.count else {
                    fail("Expected equality but element count of expected: ", expected: expected, actualMsg: " was different from actual count: ", actual: actual)
                    return self
                }
                for (a,b) in zip(actual, expected) {
                    if a != b {
                        fail("Expected ", expected: expected, actualMsg: "but was", actual: actual)
                    }
                }
            }
        } else {
            if let actual = actualOrNil {
                fail("Expected nil but was \(actual)")
            }
        }
        return self
    }
}
