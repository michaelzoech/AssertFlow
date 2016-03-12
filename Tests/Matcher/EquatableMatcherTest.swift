
import Foundation
import XCTest
import AssertFlow

class EquatableMatcherTest: AssertFlowTestCase {

    func testEqualsOfInt() {
        assertThat(2).equals(2)
        assertNotCalled()
        assertThat(3).equals(2)
        assertCalled()
    }

    func testEqualsOfString() {
        let a = "a"

        assertThat(a).equals("a")
        assertNotCalled()
        assertThat(a).equals("b")
        assertCalled()
    }

    func testEqualsWithNil() {
        let a: String? = nil
        assertNotCalled()
        assertThat(a).equals("b")
        assertCalled()
    }

    func testEqualsBothSidesNil() {
        let a: String? = nil
        assertNotCalled()
        assertThat(a).equals(nil)
        assertNotCalled()
    }

    func testEqualsOfSameCollectionTypes() {
        let a = ["a", "b"]
        let b = ["a", "b"]
        assertThat(a).equals(a)
        assertNotCalled()
        assertThat(a).equals(b)
        assertNotCalled()
    }

    func testEqualsOfDifferingCollectionTypes() {
        let a = ["a", "b"]
        let b = ["a", "c"]
        assertThat(a).equals(b)
        assertCalled()
    }

    func testEqualsOfDifferingSizedCollectionTypes() {
        let a = ["a", "b"]
        let b = ["a"]
        assertThat(a).equals(b)
        assertCalled()
    }
}
