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

public extension NSTextAttachment
{
    /**
     Applies a text attachment attribute to the enclosed attributed strings.
     
     The text attachment value will not override a text attachment value set deeper in the hierarchy.
     
     - parameter strings: The attributed strings to apply the text attachment to.
     */
    public func attribute(strings: AttributedStringConvertible...) -> AttributedStringConvertible
    {
        return Attachment(self, strings)
    }
    
    /**
     Applies a text attachment attribute to the enclosed attributed strings.
     
     The text attachment value will not override a text attachment value set deeper in the hierarchy.
     
     - parameter strings: The attributed strings to apply the text attachment to.
     */
    public func attribute(strings: [AttributedStringConvertible]) -> AttributedStringConvertible
    {
        return Attachment(self, strings)
    }
}
