## AssertFlow

AssertFlow is a matcher library to be used with XCTest.
It provides fluent assertions with helpful error messages.

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

