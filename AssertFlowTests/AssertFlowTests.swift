
import XCTest
import AssertFlow

class CaptureAssertHandler : AssertHandler {
    
    var called: Bool
    
    override init() {
        called = false
        super.init()
    }
    
    override func fail<T>(matcher: Matcher<T>, message: String) {
        self.called = true
    }
}
