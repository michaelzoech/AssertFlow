
import Foundation

public class Matcher<T> : MatcherType {
    
    public typealias Element = T
    
    public let match: MatchInfo<Element>
    
    public init(actual: MatchInfo<Element>) {
        self.match = actual
    }
}

extension Matcher {
    
    public func isNil() -> Self {
        if let a = match.actual {
            match.fail("Expected nil, but was \(a)")
        }
        return self
    }
}
