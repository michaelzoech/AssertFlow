
import Foundation

public extension MatcherType where Element: Equatable {

    public func equals(expected: Element?) -> Self {
        if let expected = expected {
            match.unpack { actual in
                if actual != expected {
                    match.fail("Expected \(actual) to equal \(expected)")
                }
            }
        } else {
            if let actual = match.actual {
                match.fail("Expected nil but was \(actual)")
            }
        }
        return self
    }
}
