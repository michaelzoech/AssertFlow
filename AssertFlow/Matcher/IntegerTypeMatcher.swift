
import Foundation

public extension MatcherType where Element: Comparable {
    
    public func greaterThan(expected: Element) {
        if unpack() {
            if actual <= expected {
                fail("Expected \(actual) to be greater than \(expected)")
            }
        }
    }
    
    public func greaterOrEqual(expected: Element) {
        if unpack() {
            if actual < expected {
                fail("Expected \(actual) to be greater or equal than \(expected)")
            }
        }
    }
    
    public func smallerThan(expected: Element) {
        if unpack() {
            if actual >= expected {
                fail("Expected \(actual) to be smaller than \(expected)")
            }
        }
    }
    
    public func smallerOrEqual(expected: Element) {
        if unpack() {
            if actual > expected {
                fail("Expected \(actual) to be smaller or equal than \(expected)")
            }
        }
    }
}