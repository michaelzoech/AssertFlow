
import Foundation

public class DictionaryMatcher<K: Hashable, V> : AbstractMatcher<Dictionary<K,V>> {
    
    override public init(actual: MatchInfo<Dictionary<K,V>>) {
        super.init(actual: actual)
    }
    
    public func containsKey(expected: K) {
        if unpack () {
            if actual[expected] == nil {
                AssertHandler.instance.fail(self, message: "Expected dictionary to contain key \(expected)")
            }
        }
    }
    
    public func containsKey<X: Equatable>(key: K, withValue: X) {
        if unpack() {
            if let value = actual[key] {
                if let castedValue = value as? X {
                    if castedValue != withValue {
                        AssertHandler.instance.fail(self, message: "Expected dictionary to contain key \(key) with value \(withValue)")
                    }
                } else {
                    AssertHandler.instance.fail(self, message: "Expected dictionary to contain key \(key) with value \(withValue)")
                }
            } else {
                AssertHandler.instance.fail(self, message: "Expected dictionary to contain key \(key)")
            }
        }
    }
}