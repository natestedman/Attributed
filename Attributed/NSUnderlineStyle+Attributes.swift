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

/// `NSUnderlineStyle` is extended to provide underline and strikethrough attribute functions.
public extension NSUnderlineStyle
{
    // MARK: - Underline
    
    /**
     Applies an underline style attribute to the enclosed attributed strings.
     
     The underline style will not override an underline style set deeper in the hierarchy.
     
     - parameter string: The attributed string convertible to apply the underline style to.
     */
    public func attribute(_ string: AttributedStringConvertible) -> AttributedStringConvertible
    {
        return Attributed.attribute(
            name: NSUnderlineStyleAttributeName,
            value: NSNumber(value: rawValue)
        )(string)
    }
    
    // MARK: - Strikethrough
    
    /**
     Applies a strikethrough style attribute to the enclosed attributed strings.
     
     The strikethrough style will not override a strikethrough style set deeper in the hierarchy.
     
     - parameter string: The attributed string convertible to apply the strikethrough style to.
     */
    public func strikethroughAttribute(_ string: AttributedStringConvertible) -> AttributedStringConvertible
    {
        return Attributed.attribute(
            name: NSStrikethroughStyleAttributeName,
            value: NSNumber(value: rawValue)
        )(string)
    }
}
