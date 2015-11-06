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

public extension ColorType
{
    /**
     Applies a foreground color attribute to the enclosed attributed strings.
     
     The foreground color will not override a foreground color set deeper in the hierarchy.
     
     - parameter strings: The attributed strings to apply the foreground color to.
     */
    public func foregroundAttribute(strings: AttributedStringConvertible...) -> AttributedStringConvertible
    {
        return Attribute(NSForegroundColorAttributeName, self, strings)
    }
    
    /**
     Applies a foreground color attribute to the enclosed attributed strings.
     
     The foreground color will not override a foreground color set deeper in the hierarchy.
     
     - parameter strings: The attributed strings to apply the foreground color to.
     */
    public func foregroundAttribute(strings: [AttributedStringConvertible]) -> AttributedStringConvertible
    {
        return Attribute(NSForegroundColorAttributeName, self, strings)
    }
    
    /**
     Applies a background color attribute to the enclosed attributed strings.
     
     The background color will not override a background color set deeper in the hierarchy.
     
     - parameter strings: The attributed strings to apply the background color to.
     */
    public func backgroundAttribute(strings: AttributedStringConvertible...) -> AttributedStringConvertible
    {
        return Attribute(NSBackgroundColorAttributeName, self, strings)
    }
    
    /**
     Applies a background color attribute to the enclosed attributed strings.
     
     The background color will not override a background color set deeper in the hierarchy.
     
     - parameter strings: The attributed strings to apply the background color to.
     */
    public func backgroundAttribute(strings: [AttributedStringConvertible]) -> AttributedStringConvertible
    {
        return Attribute(NSBackgroundColorAttributeName, self, strings)
    }
    
    /**
     Applies an underline color attribute to the enclosed attributed strings.
     
     The underline color will not override an underline color set deeper in the hierarchy.
     
     - parameter strings: The attributed strings to apply the underline color to.
     */
    public func underlineAttribute(strings: AttributedStringConvertible...) -> AttributedStringConvertible
    {
        return Attribute(NSUnderlineColorAttributeName, self, strings)
    }
    
    /**
     Applies an underline color attribute to the enclosed attributed strings.
     
     The underline color will not override an underline color set deeper in the hierarchy.
     
     - parameter strings: The attributed strings to apply the underline color to.
     */
    public func underlineAttribute(strings: [AttributedStringConvertible]) -> AttributedStringConvertible
    {
        return Attribute(NSUnderlineColorAttributeName, self, strings)
    }
    
    /**
     Applies an strikethrough color attribute to the enclosed attributed strings.
     
     The strikethrough color will not override an strikethrough color set deeper in the hierarchy.
     
     - parameter strings: The attributed strings to apply the strikethrough color to.
     */
    public func strikethroughAttribute(strings: AttributedStringConvertible...) -> AttributedStringConvertible
    {
        return Attribute(NSStrikethroughColorAttributeName, self, strings)
    }
    
    /**
     Applies an strikethrough color attribute to the enclosed attributed strings.
     
     The strikethrough color will not override an strikethrough color set deeper in the hierarchy.
     
     - parameter strings: The attributed strings to apply the strikethrough color to.
     */
    public func strikethroughAttribute(strings: [AttributedStringConvertible]) -> AttributedStringConvertible
    {
        return Attribute(NSStrikethroughColorAttributeName, self, strings)
    }
}
