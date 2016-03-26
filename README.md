## AssertFlow

[![version](https://img.shields.io/badge/version-v0.2.0-blue.svg)](https://github.com/crazymaik/AssertFlow/releases/tag/v0.2.0)
[![GitHub License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/crazymaik/AssertFlow/master/LICENSE.txt)
[![Build Status](https://travis-ci.org/crazymaik/AssertFlow.svg?branch=master)](https://travis-ci.org/crazymaik/AssertFlow)

AssertFlow is a matcher library to be used with XCTest.
It provides fluent assertions with helpful error messages.

````swift
class MyTest: XCTestCase {

    func testMyArray() {
        let array = [1, 2, 3, 4]
        assertThat(array).contains(2)
        assertThat(array).isEmpty()
        assertThat(array).containsInOrder(4, 3)
    }

    func testMyValues() {
        let d = 42.0
        assertThat(d).greaterThan(41)
    }
}
````

### Provided Matchers

AssertFlow provides matchers for the following types and more:

* CollectionType where Generator.Element: Equatable
  * contains
  * containsInOrder
  * containsOneOf
  * isEmpty
  * hasCount
* Comparable
  * greaterThan
  * greaterOrEqual
  * smallerThan
  * smallerOrEqual
* Dictionary<K,V> where K: Hashable
  * containsKey
  * containsKeyWithValue
* Equatable
  * equals
* FloatingPointType
  * isNan
* String
  * contains
  * hasPrefix
  * hasSuffix
* AnyObject
  * isNil
  * notNil

### Extending AssertFlow

AssertFlow can be easily extended with new matchers.

```swift
// Your system under test
class MySUT {

    ...

    var completed: Bool

    ...
}

// Your Matcher extension

extension MatcherType where Element: MySUT {

    public func isHidden() -> Self {
        // The actual object should not be nil
        if unpack {
            if !actual.completed {
                fail("Expected \(actual) to be completed, but was not.")
            }
        }
        return self
    }
}

```

### License

Copyright (c) 2015 Michael Zoech under the MIT license.

