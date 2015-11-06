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

public extension NSUnderlineStyle
{
    /**
     Applies an underline style attribute to the enclosed attributed strings.
     
     The underline style will not override an underline style set deeper in the hierarchy.
     
     - parameter strings: The attributed strings to apply the underline style to.
     */
    public func attribute(strings: AttributedStringConvertible...) -> AttributedStringConvertible
    {
        return Attributed.attribute(NSUnderlineStyleAttributeName, self.rawValue, strings)
    }
    
    /**
     Applies an underline style attribute to the enclosed attributed strings.
     
     The underline style will not override an underline style set deeper in the hierarchy.
     
     - parameter strings: The attributed strings to apply the underline style to.
     */
    public func attribute(strings: [AttributedStringConvertible]) -> AttributedStringConvertible
    {
        return Attributed.attribute(NSUnderlineStyleAttributeName, self.rawValue, strings)
    }
    
    /**
     Applies a strikethrough style attribute to the enclosed attributed strings.
     
     The strikethrough style will not override a strikethrough style set deeper in the hierarchy.
     
     - parameter strings: The attributed strings to apply the strikethrough style to.
     */
    public func strikethroughAttribute(strings: AttributedStringConvertible...) -> AttributedStringConvertible
    {
        return Attributed.attribute(NSStrikethroughStyleAttributeName, self.rawValue, strings)
    }
    
    /**
     Applies a strikethrough style attribute to the enclosed attributed strings.
     
     The strikethrough style will not override a strikethrough style set deeper in the hierarchy.
     
     - parameter strings: The attributed strings to apply the strikethrough style to.
     */
    public func strikethroughAttribute(strings: [AttributedStringConvertible]) -> AttributedStringConvertible
    {
        return Attributed.attribute(NSStrikethroughStyleAttributeName, self.rawValue, strings)
    }
}
