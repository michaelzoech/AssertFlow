
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
