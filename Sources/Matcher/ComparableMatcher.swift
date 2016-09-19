
import Foundation

public extension MatcherType where Element: Comparable {

    @discardableResult
    public func greaterThan(_ expected: Element) -> Self {
        if unpack() {
            if actual <= expected {
                fail("Expected \(actual) to be greater than \(expected)")
            }
        }
        return self
    }

    @discardableResult
    public func greaterOrEqual(_ expected: Element) -> Self {
        if unpack() {
            if actual < expected {
                fail("Expected \(actual) to be greater or equal than \(expected)")
            }
        }
        return self
    }

    @discardableResult
    public func smallerThan(_ expected: Element) -> Self {
        if unpack() {
            if actual >= expected {
                fail("Expected \(actual) to be smaller than \(expected)")
            }
        }
        return self
    }

    @discardableResult
    public func smallerOrEqual(_ expected: Element) -> Self {
        if unpack() {
            if actual > expected {
                fail("Expected \(actual) to be smaller or equal than \(expected)")
            }
        }
        return self
    }
}
