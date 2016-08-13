import UIKit

/// Protocol for classes that are styleable. Currently only `UIView` and `UIBarItem` (and their descendands) are conforming to this protocol.
public protocol Styleable {}
extension UIView: Styleable {}
extension UIBarItem: Styleable {}
