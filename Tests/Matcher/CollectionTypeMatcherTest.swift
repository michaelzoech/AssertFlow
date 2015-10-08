
import Foundation
import XCTest
import AssertFlow

class CollectionTypeMatcherTest : AssertFlowTestCase {
    
    func testContains() {
        let a = ["a", "b", "c", "d"]
        
        assertThat(a).contains("a")
        assertNotCalled()
        //assertThat(a).contains(1)
        //assertCalled()
    }
    
    func testContainsInOrder() {
        let a = ["a", "b", "c", "d"]
        
        assertThat(a).containsInOrder("a", "b")
        assertNotCalled()
        assertThat(a).containsInOrder("b", "d")
        assertNotCalled()
        assertThat(a).containsInOrder("a", "c", "b")
        assertCalled()
    }
    
    func testContainsOneOf() {
        let a = ["a", "b", "c", "d"]
        
        assertThat(a).containsOneOf("a", "x")
        assertNotCalled()
        assertThat(a).containsOneOf("x", "a")
        assertNotCalled()
        assertThat(a).containsOneOf("x", "d")
        assertNotCalled()
        assertThat(a).containsOneOf("x", "y")
        assertCalled()
    }
    
    func testChaining() {
        let a = ["a", "b"]
        
        assertThat(a).contains("a").contains("b")
        assertNotCalled()
        assertThat(a).contains("a").contains("c")
        assertCalled()
    }
    
    func testSet() {
        var a = Set<String>()
        a.insert("a")
        
        assertThat(a).contains("a")
        assertNotCalled()
        assertThat(a).contains("uknown")
        assertCalled()
    }

    func testIsEmpty() {
        assertThat([String]()).isEmpty()
        assertNotCalled()
        assertThat(["a"]).isEmpty()
        assertCalled()
    }

    func testHasCount() {
        assertThat([String]()).hasCount(0)
        assertNotCalled()
        assertThat(["a"]).hasCount(0)
        assertCalled()
    }
}
