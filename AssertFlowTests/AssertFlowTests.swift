
import XCTest
import AssertFlow

class CaptureAssertHandler : AssertHandler {
    
    var called: Bool
    
    override init() {
        called = false
        super.init()
    }
    
    override func fail<T>(matcher: AbstractMatcher<T>, message: String) {
        self.called = true
    }
}

class AssertFlowTest: XCTestCase {
    
//    func testString() {
//        var s = "This is a longer string for testing"
//        
//        assertThat(s).contains("a longer")
//        XCTAssertFalse(handler.called)
//        assertThat(s).contains("unknown")
//        XCTAssertTrue(handler.called)
//    }
//    
//    func testOptionalSupport() {
//        var d: [String:String] = ["a": "b", "c": "d"]
//        
//        assertThat(d["a"]).equals("b")
//        assertThat(d["d"]).isNil()
//    }
//    
//    func testSequencTypeContains() {
//        var a = ["a", "b", "c", "d"]
//        
//        assertThat(a).contains("a")
//        XCTAssertFalse(handler.called)
//        assertThat(a).contains(1)
//        XCTAssertTrue(handler.called)
//    }
//    
//    func testSequenceTypeContainsInOrder() {
//        var a = ["a", "b", "c", "d"]
//        
//        assertThat(a).containsInOrder("a", "b")
//        XCTAssertFalse(handler.called)
//        assertThat(a).containsInOrder("b", "d")
//        XCTAssertFalse(handler.called)
//        assertThat(a).containsInOrder("a", "c", "b")
//        XCTAssertTrue(handler.called)
//    }
    
    //assertThat(a).containsOneOf("z", "d")
}