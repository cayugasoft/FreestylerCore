import UIKit

/** Defines what will happen if you apply style to the wrong object (for instance, style that changes text color of `UILabel` to `UISegmentedControl`).
 - `.Warning`: program will output error message if something is wrong, but continue execution then.
 - `.Crash`: program will output error message and crash.
 - `.Ignore`: program will silently ignore all errors.
 
    
You can change this behavior using `debugBehavior` variable. By default it's `.Crash`.
*/
public enum StyleDebugBehavior {
    case Warning
    case Crash
    case Ignore
}

/** Default type for errors which thrown while applying style. Try to use them in your own styles. */
public enum StyleError: ErrorType, CustomStringConvertible {
    /// `Styleable` has unexpected type.
    case WrongType(expected: Any.Type, actual: Any.Type)
    
    /// `Styleable` not responding to selector to which is expected to respond.
    case NotRespondingToSelector(selector: Selector)
    
    public var description: String {
        switch self {
        case .WrongType(let expected, let actual):
            return "Expected to get Styleable of type \(expected) but actually get \(actual)."
        case .NotRespondingToSelector(let selector):
            return "Expected Styleable to respond to selector \(selector)."
        }
    }
}

/** Check the type of parameter and casts it to necessary type. How to use inside style closure:
 
 ```let label: UILabel = try typeChecker($0)```
*/
public func typeChecker<X: Styleable>(styleable: Styleable) throws -> X {
    guard let x = styleable as? X else {
        throw StyleError.WrongType(expected: X.self, actual: styleable.dynamicType)
    }
    return x
}

/// See `StyleDebugBehavior`. Default is `.Crash`.
public var debugBehavior = StyleDebugBehavior.Crash