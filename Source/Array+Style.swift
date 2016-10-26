//precedencegroup StyleMultipleApplicationPrecedence {
//    associativity: left
//    higherThan: StyleApplicationPrecedence
//}
//
//infix operator <~ : StyleMultipleApplicationPrecedence
//

public func <~ <V: Styleable> (left: [V], right: StyleType) -> [V] {
    left.forEach { right.apply(to: $0) }
    return left
}


public func <~ <V: Styleable> (left: V, right: [StyleType]) -> V {
    right.forEach { $0.apply(to: left) }
    return left
}


public func <~ <V: Styleable> (left: [V], right: [StyleType]) -> [V] {
    left.forEach { styleable in right.forEach { style in style.apply(to: styleable) } }
    return left
}
