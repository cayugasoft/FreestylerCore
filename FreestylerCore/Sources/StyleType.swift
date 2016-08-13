import UIKit

/// Closure that takes `Styleable` and performs actions with it.
public typealias StyleClosure = (Styleable) throws -> Void


/** This protocol takes heavy load from `Style` class. Style can have name (useful for debugging), and array of closures which do actual work. */
public protocol StyleType {
    init(name: String?, closures: [StyleClosure])
    var closures: [StyleClosure] { get }
    var name: String { get }
}


extension StyleType {
    /// Applies this style to given `Styleable`. For error handling, see `StyleDebugBehavior`.
    func applyTo(styleable: Styleable) -> Styleable {
        for (index, closure) in closures.enumerate() {
            do {
                try closure(styleable)
            } catch {
                let messages = [
                    "😡 Error happened while trying to apply style \(self) to Styleable \(styleable).",
                    "Error in closure with index \(index).",
                    "\(error)"
                ]
                switch debugBehavior {
                case .Ignore: continue
                case .Warning: messages.forEach { print($0) }
                case .Crash: fatalError("\n" + messages.joinWithSeparator("\n") + "\n")
                }
            }
        }
        return styleable
    }
    
    /// Combines styles into 1 by merging arrays of closures. Order of closures is preserved.
    static func combineStyles<X: StyleType>(style1: X, _ style2: X) -> X {
        let finalName = [style1.name, style2.name].joinWithSeparator(" + ")
        return X(name: finalName, closures: style1.closures + style2.closures)
    }
}