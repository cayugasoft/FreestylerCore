//import UIKit


/** Defines style for given `UIView` subclass. Style is made of 1 or several closures (see initializers), or from several other styles for this subclass. You can apply style to view using `applyTo(_:)` method or operator `<~`. You can combine styles using `combineStyles(_:_:)` method or operator `+`. */
public class Style: StyleType, ExpressibleByArrayLiteral, CustomStringConvertible {
    /// Array of closures for this style.
    public let closures: [StyleClosure]
    
    /// Name of style (i.e. "Rounded corners"). Useful for debugging.
    public var name: String
    
    public required init(_ name: String? = nil, styleClosures: [StyleClosure]) {
        self.closures = styleClosures
        self.name = ""
        self.name = name ?? "<<Anonymous style: \(Unmanaged.passUnretained(self))>>"
    }
    
    public convenience init(_ name: String? = nil, styleClosure: @escaping StyleClosure) {
        self.init(name, styleClosures: [styleClosure])
    }
    
    public convenience init<S: Styleable>(_ name: String? = nil, closures: [(S) -> Void]) {
        self.init(name, styleClosures: closures.map(cast))
    }
    
    public convenience init<S: Styleable>(_ name: String? = nil, closure: @escaping (S) -> Void) {
        self.init(name, styleClosure: cast(closure: closure))
    }
    
    public required convenience init(arrayLiteral elements: StyleType...) {
        let allClosures: [StyleClosure] = elements.reduce([]) { accumulator, style in
            accumulator + style.closures
        }
        let finalName = elements.map { $0.name }.joined(separator: " + ")
        self.init(finalName, styleClosures: allClosures)
    }
    
    public var description: String {
        return "\"\(name)\""
    }
}

/** Check the type of parameter and casts it to necessary type. How to use inside style closure:
 
```let label: UILabel = try typeChecker($0)```
*/
private func typeChecker<X: Styleable>(styleable: Styleable) throws -> X {
    guard let x = styleable as? X else {
        throw StyleError.wrongType(expected: X.self, actual: type(of: styleable))
    }
    return x
}

private func cast<S: Styleable>(closure: @escaping (S) -> Void) -> StyleClosure {
    return {
        (styleable: Styleable) in
        let s: S = try typeChecker(styleable: styleable)
        closure(s)
    }
}

// MARK: OPERATORS

precedencegroup StyleApplicationPrecedence {
    associativity: left
    higherThan: AssignmentPrecedence
}

infix operator <~ : StyleApplicationPrecedence

/// The same as `applyTo` method.
public func <~ <V: Styleable> (left: V, right: StyleType) -> V {
    right.apply(to: left)
    return left
}

precedencegroup StyleAdditionPrecedence {
    associativity: left
    higherThan: StyleApplicationPrecedence
}

infix operator + : StyleAdditionPrecedence
/// The same as `combineStyles` method.
public func + <X: StyleType> (left: X, right: X) -> X {
    return X.combineStyles(left, right)
}


