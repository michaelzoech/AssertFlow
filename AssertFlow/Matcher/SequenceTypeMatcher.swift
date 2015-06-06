
import Foundation

public class SequenceTypeMatcher<T: SequenceType> : AbstractMatcher<T> {
    
    override public init(actual: MatchInfo<T>) {
        super.init(actual: actual)
    }
    
    public func contains<E: Equatable>(expected: E) {
        if unpack() {
            for e in actual {
                if let e2 = e as? E {
                    if expected == e2 {
                        return
                    }
                }
            }
            fail("Expected sequence to contain \(expected)")
        }
    }
    
    public func containsInOrder<E: Equatable>(expected: E...) {
        if unpack() {
            var g = expected.generate()
            var next = g.next()
            for e in actual {
                if let e2 = e as? E {
                    if next == e2 {
                        next = g.next()
                        if next == nil {
                            return
                        }
                    }
                }
            }
            fail("Expected sequence to contain in order \(expected)")
        }
    }
    
    public func containsOneOf<E: Equatable>(expected: E...) {
        if unpack() {
            for e in expected {
                for a2 in actual {
                    if let a3 = a2 as? E {
                        if (a3 == e) {
                            return
                        }
                    }
                }
            }
            fail("Expected sequence to contain one of \(expected)")
        }
    }
}