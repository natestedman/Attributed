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

public extension NSNumberConvertible
{
    /**
     Applies a kerning attribute to the enclosed attributed strings.
     
     The kerning value will not override a kerning value set deeper in the hierarchy.
     
     - parameter strings: The attributed strings to apply the kerning attribute to.
     */
    func kernAttribute(strings: AttributedStringConvertible...) -> AttributedStringConvertible
    {
        return Attribute(NSKernAttributeName, self.NSNumberValue, strings)
    }
    
    /**
     Applies a kerning attribute to the enclosed attributed strings.
     
     The kerning value will not override a kerning value set deeper in the hierarchy.
     
     - parameter strings: The attributed strings to apply the kerning attribute to.
     */
    func kernAttribute(strings: [AttributedStringConvertible]) -> AttributedStringConvertible
    {
        return Attribute(NSKernAttributeName, self.NSNumberValue, strings)
    }
}
