
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
    
    public func containsKey<X: Equatable>(key: K, withValue: X) -> Self{
        if unpack() {
            if let value = actual[key] {
                if let castedValue = value as? X {
                    if castedValue != withValue {
                        fail("Expected dictionary to contain key \(key) with value \(withValue)")
                    }
                } else {
                    fail("Expected dictionary to contain key \(key) with value \(withValue)")
                }
            } else {
                fail("Expected dictionary to contain key \(key)")
            }
        }
        return self
    }
}