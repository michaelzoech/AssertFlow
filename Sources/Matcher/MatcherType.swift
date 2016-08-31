
import Foundation

public protocol MatcherType : class {

    associatedtype Element
    
    var actual: Element { get }

    var actualOrNil: Element? { get }
    
    func unpack() -> Bool
    
    func fail(_ message: String)
    
    func fail<A, B>(_ expectedMsg: String, expected: A, actualMsg: String, actual: B)
}
