
import Foundation
import XCTest
import AssertFlow

class DictionaryMatcherTest : AssertFlowTestCase {
    
    func testContainsKey() {
        var dict: [String:String] = [:]
        dict["foo"] = "bar";
        
        assertThat(dict).containsKey("foo")
        assertNotCalled()
        assertThat(dict).containsKey("foo2")
        assertCalled()
    }

    func testContainsKeyWithValue() {
        var dict: [String:Int] = [:]
        dict["a"] = 1
        
        assertThat(dict).containsKey("a", value: 1)
        assertNotCalled()
        assertThat(dict).containsKey("a", value: 2)
        assertCalled()
    }
    
    func testContainsKeyWithValueWithNonExistingKey() {
        var dict: [String:Int] = [:]
        dict["a"] = 1
        
        assertThat(dict).containsKey("b", value: 1)
        assertCalled()
    }
}
