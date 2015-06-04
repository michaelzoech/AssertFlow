
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
}