
import Foundation

public extension MatcherType where Element: CollectionType, Element.Generator.Element: Equatable {
    
    typealias Item = Element.Generator.Element
    
    public func contains(expected: Item) {
        if unpack() {
            for e in actual {
                    if expected == e {
                        return
                    }
            }
            fail("Expected \(Element.self) to contain \(expected)")
        }
    }
    
    public func containsInOrder(expected: Item...) {
        if unpack() {
            var g = expected.generate()
            var next = g.next()
            for e in actual {
                    if next == e {
                        next = g.next()
                        if next == nil {
                            return
                        }
                    }
            }
            fail("Expected sequence to contain in order \(expected)")
        }
    }
    
    public func containsOneOf(expected: Item...) {
        if unpack() {
            for e in expected {
                for a in actual {
                        if (a == e) {
                            return
                        }
                }
            }
            fail("Expected sequence to contain one of \(expected)")
        }
    }

}
