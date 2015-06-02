
import Foundation

public class AbstractMatcher<T> {
    
    let actual: Actual<T>
    var value: T? { get { return actual.value } }
    var file: String { get { return actual.file } }
    var line: UInt { get { return actual.line } }
    
    public init(actual: Actual<T>) {
        self.actual = actual
    }
}