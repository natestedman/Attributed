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

/// `String` is extended to provide a tooltip attribute function.
extension String
{
    // MARK: - Tooltip
    
    /**
     Applies a tooltip attribute to the enclosed attributed strings.
     
     The tooltip will not override a tooltip set deeper in the hierarchy.
     
     - parameter string: The attributed string convertible to apply the tooltip to.
     */
    public func toolTipAttribute(_ string: AttributedStringConvertible) -> AttributedStringConvertible
    {
        return Attributed.attribute(name: NSToolTipAttributeName, value: self as NSString)(string)
    }
}
#endif
