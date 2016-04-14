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

/// `NSTextAttachment` is extended to provide an attribute function.
public extension NSTextAttachment
{
    // MARK: - Attributes
    
    /**
     Applies a text attachment attribute to the enclosed attributed strings.
     
     The text attachment value will not override a text attachment value set deeper in the hierarchy.
     
     - parameter string: The attributed string convertible to apply the text attachment to.
     */
    public func attribute(string: AttributedStringConvertible) -> AttributedStringConvertible
    {
        return Attributed.attribute(name: NSAttachmentAttributeName, value: self)(string)
    }
}
