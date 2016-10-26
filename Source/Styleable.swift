/// Protocol for classes that are styleable. Concrete classes depend on platform.
public protocol Styleable {}

#if os(iOS) || os(tvOS)
import UIKit
extension UIView: Styleable {}
extension UIBarItem: Styleable {}
#elseif os(macOS)
import AppKit
extension NSView: Styleable {}
#endif

