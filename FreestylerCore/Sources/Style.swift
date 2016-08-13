import UIKit


/** Defines style for given `UIView` subclass. Style is made of 1 or several closures (see initializers), or from several other styles for this subclass. You can apply style to view using `applyTo(_:)` method or operator `<~`. You can combine styles using `combineStyles(_:_:)` method or operator `+`. */
public class Style: StyleType, ArrayLiteralConvertible, CustomStringConvertible {
    /// Array of closures for this style.
    public let closures: [StyleClosure]
    
    /// Name of style. Useful for debugging.
    public var name: String
    
    public required init(name: String? = nil, closures: [StyleClosure]) {
        self.closures = closures
        self.name = ""
        self.name = name ?? "<<Anonymous style: \(unsafeAddressOf(self))>>"
    }
    
    public convenience init(_ name: String? = nil, _ closure: StyleClosure) {
        self.init(name: name, closures: [closure])
    }
    
    public required convenience init(arrayLiteral elements: StyleType...) {
        let allClosures: [StyleClosure] = elements.reduce([]) { accumulator, style in
            accumulator + style.closures
        }
        let finalName = elements.map { $0.name }.joinWithSeparator(" + ")
        self.init(name: finalName, closures: allClosures)
    }
    
    public var description: String {
        return "\"\(name)\""
    }
}

infix operator <~ { associativity left precedence 100 }
/// The same as `applyTo` method.
public func <~ <V: Styleable> (left: V, right: StyleType) -> V {
    right.applyTo(left)
    return left
}

infix operator + { associativity left precedence 140 }
/// The same as `combineStyles` method.
public func + <X: StyleType> (left: X, right: X) -> X {
    return X.combineStyles(left, right)
}
