
import Foundation
import XCTest
import AssertFlow

class DictionaryTests : XCTestCase {
    
    func testContainsKey() {
        var dict = ["a": 1, "b": 2]
        
        assertThat(dict).containsKey("a")
        assertThat(dict).containsKey("a", withValue: 3)
    }
}