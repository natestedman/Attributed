// Attributed
// Written in 2015 by Nate Stedman <nate@natestedman.com>
//
// To the extent possible under law, the author(s) have dedicated all copyright and
// related and neighboring rights to this software to the public domain worldwide.
// This software is distributed without any warranty.
//
// You should have received a copy of the CC0 Public Domain Dedication along with
// this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

#if os(OSX)

import AppKit

extension NSCursor
{
    /**
     Applies a cursor to the enclosed attributed strings.
     
     The cursor will not override a cursor set deeper in the hierarchy.
     
     - parameter strings: The attributed strings to apply the shadow to.
     */
    public func attribute(strings: AttributedStringConvertible...) -> AttributedStringConvertible
    {
        return Attributed.attribute(NSCursorAttributeName, self, strings)
    }
    
    /**
     Applies a cursor to the enclosed attributed strings.
     
     The cursor will not override a cursor set deeper in the hierarchy.
     
     - parameter strings: The attributed strings to apply the cursor to.
     */
    public func attribute(strings: [AttributedStringConvertible]) -> AttributedStringConvertible
    {
        return Attributed.attribute(NSCursorAttributeName, self, strings)
    }
}

#endif
