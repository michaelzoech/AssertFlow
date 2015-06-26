
import Foundation

public extension MatcherType where Element: CollectionType, Element.Generator.Element: Equatable {
    
    typealias Item = Element.Generator.Element
    
    public func contains(expected: Item) -> Self {
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
    
    public func containsInOrder(expected: Item...) -> Self {
        if unpack() {
            var g = expected.generate()
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
    
    public func containsOneOf(expected: Item...) -> Self {
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

}
