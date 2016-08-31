
import Foundation

public extension MatcherType where Element: Comparable {
    
    public func greaterThan(_ expected: Element) -> Self {
        if unpack() {
            if actual <= expected {
                fail("Expected \(actual) to be greater than \(expected)")
            }
        }
        return self
    }
    
    public func greaterOrEqual(_ expected: Element) -> Self {
        if unpack() {
            if actual < expected {
                fail("Expected \(actual) to be greater or equal than \(expected)")
            }
        }
        return self
    }
    
    public func smallerThan(_ expected: Element) -> Self {
        if unpack() {
            if actual >= expected {
                fail("Expected \(actual) to be smaller than \(expected)")
            }
        }
        return self
    }
    
    public func smallerOrEqual(_ expected: Element) -> Self {
        if unpack() {
            if actual > expected {
                fail("Expected \(actual) to be smaller or equal than \(expected)")
            }
        }
        return self
    }
}
