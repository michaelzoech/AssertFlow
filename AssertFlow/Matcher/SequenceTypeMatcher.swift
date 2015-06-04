
import Foundation

public class SequenceTypeMatcher<T: SequenceType> : AbstractMatcher<T> {
    
    override public init(actual: Actual<T>) {
        super.init(actual: actual)
    }
    
    public func contains<E: Equatable>(expected: E) {
        if let a = value {
            for e in a {
                if let e2 = e as? E {
                    if expected == e2 {
                        return
                    }
                }
            }
            AssertHandler.instance.fail(self, message: "Expected sequence to contain \(expected)")
        } else {
            AssertHandler.instance.fail(self, message: "Expected sequence to contain \(expected) but was nil")
        }
    }
    
    public func containsInOrder<E: Equatable>(expected: E...) {
        if let a = value {
            var g = expected.generate()
            var next = g.next()
            for e in a {
                if let e2 = e as? E {
                    if next == e2 {
                        next = g.next()
                        if next == nil {
                            return
                        }
                    }
                }
            }
            AssertHandler.instance.fail(self, message: "Expected sequence to contain in order \(expected)")
        } else {
            AssertHandler.instance.fail(self, message: "Expected sequence to contain in order \(expected) but was nil")
        }
    }
}