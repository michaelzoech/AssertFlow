
import Foundation

public protocol MatcherType : class {

    typealias Element
    
    var match: MatchInfo<Element> { get }
}
