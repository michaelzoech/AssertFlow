//  Copyright © 2015 Michael Zoech. All rights reserved.

import Foundation

public extension MatcherType where Element: FloatingPointType {
    
    public func isNaN() -> Self {
        if unpack() {
            if actual.isNaN {
                return self
            }
            fail("Expected \(actual) to be NaN")
        }
        return self
    }
}