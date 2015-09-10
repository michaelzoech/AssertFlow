
import Foundation

public class DictionaryMatcher<K: Hashable,V> : Matcher<Dictionary<K,V>> {

    public override init(actual: MatchInfo<Element>) {
        super.init(actual: actual)
    }
    
    public func containsKey(expected: K) -> Self {
        if unpack () {
            if actual[expected] == nil {
                fail("Expected dictionary to contain key:", expected: expected, actualMsg: "But key not found in:", actual: actual)
            }
        }
        return self
    }
    
    public func containsKey<X: Equatable>(key: K, value: X) -> Self{
        if unpack() {
            if let actualValue = actual[key] {
                if let castedValue = actualValue as? X {
                    if castedValue != value {
                        fail("Expected dictionary to contain key \(key) with value \(value)")
                    }
                } else {
                    fail("Expected dictionary to contain key \(key) with value \(value)")
                }
            } else {
                fail("Expected dictionary to contain key \(key)")
            }
        }
        return self
    }
}