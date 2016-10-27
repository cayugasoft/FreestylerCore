// Copyright (c) 2016 Alexander Doloz <adoloz@cayugasoft.com>
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.


import UIKit


/// Closure that takes `Styleable` and performs actions with it.
public typealias StyleClosure = (Styleable) throws -> Void


public protocol StyleType {
    init(_ name: String?, styleClosures: [StyleClosure])
    var closures: [StyleClosure] { get }
    var name: String { get }
}


extension StyleType {
    /// Applies this style to given `Styleable`. For error handling, see `StyleDebugBehavior`.
    /// - parameters:
    ///     - styleable: `styleable` to which `self` will be applied.
    /// - returns: The same `styleable` passed as parameter. This allows to chain method calls.
    @discardableResult public func apply(to styleable: Styleable) -> Styleable {
        for (index, closure) in closures.enumerated() {
            do {
                try closure(styleable)
            } catch {
                let messages = [
                    "😡 Error happened while trying to apply style \(self) to Styleable \(styleable).",
                    "Error in closure with index \(index).",
                    "\(error)"
                ]
                switch StyleDebugBehavior.behavior {
                case .ignore: continue
                case .warning: messages.forEach { print($0) }
                case .crash: fatalError("\n" + messages.joined(separator: "\n") + "\n")
                }
            }
        }
        return styleable
    }
    

    /**
     An example of using the seealso field
     
     - seealso:
     [The Swift Standard Library Reference](https://developer.apple.com/library/prerelease/ios//documentation/General/Reference/SwiftStandardLibraryReference/index.html)
     */
    static func combineStyles<X: StyleType>(_ style1: X, _ style2: X) -> X {
        let finalName = [style1.name, style2.name].joined(separator: " + ")
        return X(finalName, styleClosures: style1.closures + style2.closures)
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

public func <~ <X: StyleType> (left: X, right: X) -> X {
    return X.combineStyles(left, right)
}
