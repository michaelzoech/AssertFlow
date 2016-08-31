
import Foundation

open class DictionaryMatcher<K: Hashable,V> : Matcher<Dictionary<K,V>> {

    public override init(actual: MatchInfo<Element>) {
        super.init(actual: actual)
    }
}

public extension DictionaryMatcher {
    
    public func containsKey(_ key: K) -> Self {
        if unpack () {
            if actual[key] == nil {
                fail("Expected dictionary to contain key:", expected: key, actualMsg: "But key not found in:", actual: actual)
            }
        }
        return self
    }
}

extension DictionaryMatcher where V: Equatable {
    
    public func containsKey(_ key: K, value: V) -> Self{
        if unpack() {
            if let actualValue = actual[key] {
                if actualValue != value {
                    fail("Expected dictionary to contain key \(key) with value \(value)")
                }
            } else {
                fail("Expected dictionary to contain key \(key)")
            }
        }
        return self
    }
}

public func assertThat<K: Hashable, V>(_ actual: Dictionary<K,V>?, file: StaticString = #file, line: UInt = #line) -> DictionaryMatcher<K,V> {
    return DictionaryMatcher(actual: MatchInfo(actual: actual, file: file, line: line))
}
