
import Foundation
import XCTest
import AssertFlow

class DictionaryMatcherTest : XCTestCase {
    
    var handler: CaptureAssertHandler = CaptureAssertHandler()
    
    override func setUp() {
        handler = CaptureAssertHandler()
        AssertHandler.instance = handler
    }
    
    func testContainsKey() {
        var dict: [String:String] = [:]
        dict["foo"] = "bar";
        
        assertThat(dict).containsKey("foo")
        XCTAssertFalse(handler.called)
        assertThat(dict).containsKey("foo2")
        XCTAssertTrue(handler.called)
    }

    func testContainsKeyWithValue() {
        var dict: [String:Int] = [:]
        dict["a"] = 1
        
        assertThat(dict).containsKey("a", value: 1)
        XCTAssertFalse(handler.called)
        assertThat(dict).containsKey("a", value: 2)
        XCTAssertTrue(handler.called)
    }
    
    func testContainsKeyWithValueWithNonExistingKey() {
        var dict: [String:Int] = [:]
        dict["a"] = 1
        
        assertThat(dict).containsKey("b", value: 1)
        XCTAssertTrue(handler.called)
    }
}
