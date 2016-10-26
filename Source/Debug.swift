//import UIKit

/** Defines what will happen if you apply style to the wrong object (for instance, style that changes text color of `UILabel` to `UISegmentedControl`).
 - `.warning`: program will output error message if something is wrong, but continue execution then.
 - `.crash`: program will output error message and crash.
 - `.ignore`: program will silently ignore all errors.
 
    
You can change this behavior using `debugBehavior` variable. By default it's `.Crash`.
*/
public enum StyleDebugBehavior {
    case warning
    case crash
    case ignore
}

/** Default type for errors which thrown while applying style. Try to use them in your own styles. */
public enum StyleError: Error, CustomStringConvertible {
    /// `Styleable` has unexpected type.
    case wrongType(expected: Any.Type, actual: Any.Type)
    
    /// `Styleable` not responding to selector to which is expected to respond.
    case notRespondingToSelector(selector: Selector)
    
    public var description: String {
        switch self {
        case .wrongType(let expected, let actual):
            return "Expected to get Styleable of type \(expected) but actually get \(actual)."
        case .notRespondingToSelector(let selector):
            return "Expected Styleable to respond to selector \(selector)."
        }
    }
}

/// See `StyleDebugBehavior`. Default is `.crash`.
public var debugBehavior = StyleDebugBehavior.crash
