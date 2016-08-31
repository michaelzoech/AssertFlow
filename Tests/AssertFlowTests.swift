
import XCTest
import AssertFlow

class CaptureAssertHandler : AssertHandler {
    
    var called: Bool
    
    override init() {
        called = false
        super.init()
    }
    
    override func fail(_ message: String, file: StaticString, line: UInt) {
        self.called = true
    }
}
