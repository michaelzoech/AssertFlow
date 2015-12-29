
import Foundation

public protocol WrappedDictionary: CollectionType, DictionaryLiteralConvertible {
    
    typealias WrappedKey
    typealias WrappedValue

    subscript (key: WrappedKey) -> WrappedValue? { get }
}

extension Dictionary: WrappedDictionary {
    public typealias WrappedKey = Dictionary.Key
    public typealias WrappedValue = Dictionary.Value
}

public extension MatcherType where Element: WrappedDictionary {
    
    public func containsKey(expected: Element.WrappedKey) -> Self {
        if unpack () {
            if actual[expected] == nil {
                fail("Expected dictionary to contain key:", expected: expected, actualMsg: "But key not found in:", actual: actual)
            }
        }
        return self
    }
}

public extension MatcherType where Element: WrappedDictionary, Element.WrappedValue: Equatable {
    
    public func containsKey(key: Element.WrappedKey, value: Element.WrappedValue) -> Self{
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
