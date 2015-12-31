//  Copyright © 2015 Michael Zoech. All rights reserved.

import Foundation

public extension MatcherType where Element: FloatingPointType {
    
    public func isNaN() -> Self {
        match.unpack { actual in
            if actual.isNaN {
                return
            }
            match.fail("Expected \(actual) to be NaN")
        }
        return self
    }
}