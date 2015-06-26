
import Foundation

public class DictionaryMatcher<K: Hashable,V> : Matcher<Dictionary<K,V>> {

    public override init(actual: MatchInfo<Element>) {
        super.init(actual: actual)
    }
    
    public func containsKey(expected: K) {
        if unpack () {
            if actual[expected] == nil {
                fail("Expected dictionary to contain \(expected)")
            }
        }
    }
    
    public func containsKey<X: Equatable>(key: K, withValue: X) {
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
    }
}