
import Foundation
import XCTest
import AssertFlow

class DictionaryMatcherTest : XCTestCase {
    
    var handler: CaptureAssertHandler = CaptureAssertHandler()
    
    override func setUp() {
        handler = CaptureAssertHandler()
        AssertHandler.instance = handler
    }
    
    func testDict() {
        var dict: [String:String] = [:];
        dict["foo"] = "bar";
        
        assertThat(dict).containsKey("foo");
        XCTAssertFalse(handler.called)
        assertThat(dict).containsKey("foo2");
        XCTAssertTrue(handler.called)
    }

}
