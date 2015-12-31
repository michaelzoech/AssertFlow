
import Foundation

public class DictionaryMatcher<K: Hashable,V> : Matcher<Dictionary<K,V>> {

    public override init(actual: MatchInfo<Element>) {
        super.init(actual: actual)
    }
}

public extension DictionaryMatcher {
    
    public func containsKey(key: K) -> Self {
        match.unpack { actual in
            if actual[key] == nil {
                match.fail("Expected dictionary to contain key:", expected: key, actualMsg: "But key not found in:", actual: actual)
            }
        }
        return self
    }
}

extension DictionaryMatcher where V: Equatable {
    
    public func containsKey(key: K, value: V) -> Self{
        match.unpack { actual in
            if let actualValue = actual[key] {
                if actualValue != value {
                    match.fail("Expected dictionary to contain key \(key) with value \(value)")
                }
            } else {
                match.fail("Expected dictionary to contain key \(key)")
            }
        }
        return self
    }
}

public func assertThat<K: Hashable, V>(actual: Dictionary<K,V>?, file: String = __FILE__, line: UInt = __LINE__) -> DictionaryMatcher<K,V> {
    return DictionaryMatcher(actual: MatchInfo(actual: actual, file: file, line: line))
}
