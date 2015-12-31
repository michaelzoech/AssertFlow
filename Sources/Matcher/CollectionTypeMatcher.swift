
import Foundation

public extension MatcherType where Element: CollectionType, Element.Generator.Element: Equatable {
    
    typealias Item = Element.Generator.Element
    
    public func contains(expected: Item) -> Self {
        match.unpack { actual in
            for e in actual {
                if expected == e {
                    return
                }
            }
            match.fail("Expected \(Element.self) to contain:", expected: expected, actualMsg: "But was: ", actual: actual)
        }
        return self
    }
    
    public func containsInOrder(expected: Item...) -> Self {
        match.unpack { actual in
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
            match.fail("Expected sequence to contain in order \(expected)")
        }
        return self
    }
    
    public func containsOneOf(expected: Item...) -> Self {
        match.unpack { actual in
            for e in expected {
                for a in actual {
                    if (a == e) {
                        return
                    }
                }
            }
            match.fail("Expected sequence to contain one of \(expected)")
        }
        return self
    }

    public func isEmpty() -> Self {
        match.unpack { actual in
            if !actual.isEmpty {
                match.fail("Expected collection to be empty")
            }
        }
        return self
    }

    public func hasCount(expected: Element.Index.Distance) -> Self {
        match.unpack { actual in
            let count = actual.count
            if count != expected {
                match.fail("Expected collection count to be \(expected), but was \(count)")
            }
        }
        return self
    }
}
