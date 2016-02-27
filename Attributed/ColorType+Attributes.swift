// Attributed
// Written in 2015 by Nate Stedman <nate@natestedman.com>
//
// To the extent possible under law, the author(s) have dedicated all copyright and
// related and neighboring rights to this software to the public domain worldwide.
// This software is distributed without any warranty.
//
// You should have received a copy of the CC0 Public Domain Dedication along with
// this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

#if os(iOS)
    import UIKit
#else
    import AppKit
#endif

/// `ColorType` is extended to provide foreground, background, underline, and strikethrough color attributes.
public extension ColorType
{
    // MARK: - Foreground Color
    
    /**
     Applies a foreground color attribute to the enclosed attributed strings.
     
     The foreground color will not override a foreground color set deeper in the hierarchy.
     
     - parameter string: The attributed string convertible to apply the foreground color to.
     */
    public func foregroundAttribute(string: AttributedStringConvertible) -> AttributedStringConvertible
    {
        return Attributed.attribute(NSForegroundColorAttributeName, withValue: self)(string)
    }
    
    // MARK: - Background Color
    
    /**
     Applies a background color attribute to the enclosed attributed strings.
     
     The background color will not override a background color set deeper in the hierarchy.
     
     - parameter string: The attributed string convertible to apply the background color to.
     */
    public func backgroundAttribute(string: AttributedStringConvertible) -> AttributedStringConvertible
    {
        return Attributed.attribute(NSBackgroundColorAttributeName, withValue: self)(string)
    }
    
    // MARK: - Underline Color
    
    /**
     Applies an underline color attribute to the enclosed attributed strings.
     
     The underline color will not override an underline color set deeper in the hierarchy.
     
     - parameter string: The attributed string convertible to apply the underline color to.
     */
    public func underlineAttribute(string: AttributedStringConvertible) -> AttributedStringConvertible
    {
        return Attributed.attribute(NSUnderlineColorAttributeName, withValue: self)(string)
    }
    
    // MARK: - Strikethrough Color
    
    /**
     Applies an strikethrough color attribute to the enclosed attributed strings.
     
     The strikethrough color will not override an strikethrough color set deeper in the hierarchy.
     
     - parameter string: The attributed string convertible to apply the strikethrough color to.
     */
    public func strikethroughAttribute(string: AttributedStringConvertible) -> AttributedStringConvertible
    {
        return Attributed.attribute(NSStrikethroughColorAttributeName, withValue: self)(string)
    }
}
