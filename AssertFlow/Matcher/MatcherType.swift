
import Foundation

public protocol MatcherType : class {

    typealias Element
    
    var actual: Element { get }
    
    func unpack() -> Bool
    
    func fail(message: String)
}
