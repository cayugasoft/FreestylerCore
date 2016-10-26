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
