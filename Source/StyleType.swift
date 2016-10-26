import UIKit

/// Closure that takes `Styleable` and performs actions with it.
public typealias StyleClosure = (Styleable) throws -> Void


/** This protocol takes heavy load from `Style` class. Style can have name (useful for debugging), and array of closures which do actual work. */
public protocol StyleType {
    init(_ name: String?, styleClosures: [StyleClosure])
    var closures: [StyleClosure] { get }
    var name: String { get }
}


extension StyleType {
    /// Applies this style to given `Styleable`. For error handling, see `StyleDebugBehavior`.
    @discardableResult func apply(to styleable: Styleable) -> Styleable {
        for (index, closure) in closures.enumerated() {
            do {
                try closure(styleable)
            } catch {
                let messages = [
                    "😡 Error happened while trying to apply style \(self) to Styleable \(styleable).",
                    "Error in closure with index \(index).",
                    "\(error)"
                ]
                switch debugBehavior {
                case .ignore: continue
                case .warning: messages.forEach { print($0) }
                case .crash: fatalError("\n" + messages.joined(separator: "\n") + "\n")
                }
            }
        }
        return styleable
    }
    
    /// Combines styles into 1 by merging arrays of closures. Order of closures is preserved.
    static func combineStyles<X: StyleType>(_ style1: X, _ style2: X) -> X {
        let finalName = [style1.name, style2.name].joined(separator: " + ")
        return X(finalName, styleClosures: style1.closures + style2.closures)
    }
}
