
import Foundation
import XCTest
import AssertFlow


class StringMatcherTest : AssertFlowTestCase {
    
    func testContainsSubstring() {
        let s = "This is a longer string for testing"
        
        assertThat(s).contains("a longer")
        assertNotCalled()
        assertThat(s).contains("unknown")
        assertCalled()
    }
    
    func testContainsSubstringWithOptional() {
        var s: String? = "Hello"
        
        assertThat(s).contains("ll")
        assertNotCalled()
        
        s = nil
        
        assertThat(s).contains("ll")
        assertCalled()
    }

    func testHasPrefix() {
        assertThat("Some string").hasPrefix("Some")
        assertNotCalled()
        assertThat("Some string").hasPrefix("string")
        assertCalled()
    }

    func testHasSuffix() {
        assertThat("Some string").hasSuffix("string")
        assertNotCalled()
        assertThat("Some string").hasSuffix("Some")
        assertCalled()
    }
}
