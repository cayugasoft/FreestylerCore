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
