
import Foundation

public extension MatcherType where Element: Comparable {
    
    public func greaterThan(expected: Element) -> Self {
        if unpack() {
            if actual <= expected {
                fail("Expected \(actual) to be greater than \(expected)")
            }
        }
        return self
    }
    
    public func greaterOrEqual(expected: Element) -> Self {
        if unpack() {
            if actual < expected {
                fail("Expected \(actual) to be greater or equal than \(expected)")
            }
        }
        return self
    }
    
    public func smallerThan(expected: Element) -> Self {
        if unpack() {
            if actual >= expected {
                fail("Expected \(actual) to be smaller than \(expected)")
            }
        }
        return self
    }
    
    public func smallerOrEqual(expected: Element) -> Self {
        if unpack() {
            if actual > expected {
                fail("Expected \(actual) to be smaller or equal than \(expected)")
            }
        }
        return self
    }
}
