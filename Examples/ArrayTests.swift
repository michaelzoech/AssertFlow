
import Foundation
import XCTest
import AssertFlow

class ArrayTests : XCTestCase {
    
    func testSimple() {
        
        let a: Array<String> = ["a", "b"]
        
        assertThat(a).contains("a")
        assertThat(a).contains("c")
    }
    
    func testNonEqualable() {
        
        let a: Array<AnyObject> = ["a", "b"]
        
        assertThat(a).contains("a")
    }
}