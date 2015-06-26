
import Foundation
import XCTest
import AssertFlow

class DictionaryTests : XCTestCase {
    
    let dict = ["a": 1, "b": 2]
    
    func testContainsKey() {
        assertThat(dict).containsKey("a")
        assertThat(dict).containsKey("a\nmulti-line\nstring")
    }
    
    func testContainsKeyWithValue_noKey() {
        assertThat(dict).containsKey("b", withValue: 2)
        assertThat(dict).containsKey("unknown", withValue: 0)
    }
    
    func testContainsKeyWithValue_wrongValue() {
        assertThat(dict).containsKey("a", withValue: 0)
    }
}
