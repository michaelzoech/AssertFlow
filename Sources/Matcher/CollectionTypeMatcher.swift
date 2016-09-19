
import Foundation

public extension MatcherType where Element: Collection, Element.Iterator.Element: Equatable {
    
    typealias Item = Element.Iterator.Element
    
    @discardableResult
    public func contains(_ expected: Item) -> Self {
        if unpack() {
            for e in actual {
                    if expected == e {
                        return self
                    }
            }
            fail("Expected \(Element.self) to contain:", expected: expected, actualMsg: "But was: ", actual: actual)
        }
        return self
    }

    @discardableResult
    public func containsInOrder(_ expected: Item...) -> Self {
        if unpack() {
            var g = expected.makeIterator()
            var next = g.next()
            for e in actual {
                    if next == e {
                        next = g.next()
                        if next == nil {
                            return self
                        }
                    }
            }
            fail("Expected sequence to contain in order \(expected)")
        }
        return self
    }

    @discardableResult
    public func containsOneOf(_ expected: Item...) -> Self {
        if unpack() {
            for e in expected {
                for a in actual {
                        if (a == e) {
                            return self
                        }
                }
            }
            fail("Expected sequence to contain one of \(expected)")
        }
        return self
    }

    @discardableResult
    public func isEmpty() -> Self {
        if unpack() {
            if !actual.isEmpty {
                fail("Expected collection to be empty")
            }
        }
        return self
    }

    @discardableResult
    public func hasCount(_ expected: Element.IndexDistance) -> Self {
        if unpack() {
            let count = actual.count
            if count != expected {
                fail("Expected collection count to be \(expected), but was \(count)")
            }
        }
        return self
    }
}
