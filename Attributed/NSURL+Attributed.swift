// Attributed
// Written in 2016 by Nate Stedman <nate@natestedman.com>
//
// To the extent possible under law, the author(s) have dedicated all copyright and
// related and neighboring rights to this software to the public domain worldwide.
// This software is distributed without any warranty.
//
// You should have received a copy of the CC0 Public Domain Dedication along with
// this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

import Foundation

#if os(iOS)
    import UIKit
#else
    import AppKit
#endif

/// `NSURL` is extended to provide support for link attributes.
extension NSURL
{
    // MARK: - Link

    /**
     Applies a link attribute to the enclosed attributed string.

     The link will not override a link set deeper in the hierarchy.

     - parameter string: The attributed string convertible to apply the link to.
     */
    public func attribute(string: AttributedStringConvertible) -> AttributedStringConvertible
    {
        return Attributed.attribute(name: NSLinkAttributeName, value: self)(string)
    }
}
