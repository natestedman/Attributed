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

/**
 Applies a baseline offset attribute to the enclosed attributed strings.
 
 The baseline offset value will not override a baseline offset value set deeper in the hierarchy.
 
 - parameter offset:  The baseline offset value.
 - parameter strings: The attributed strings to apply the baseline offset to.
 */
public func BaselineOffset(offset: CGFloat, _ strings: AttributedStringConvertible...) -> AttributedStringConvertible
{
    return Attribute(NSBaselineOffsetAttributeName, offset, strings)
}

/**
 Applies a baseline offset attribute to the enclosed attributed strings.
 
 The baseline offset value will not override a baseline offset value set deeper in the hierarchy.
 
 - parameter offset:  The baseline offset value.
 - parameter strings: The attributed strings to apply the baseline offset to.
 */
public func BaselineOffset(offset: CGFloat, _ strings: [AttributedStringConvertible]) -> AttributedStringConvertible
{
    return Attribute(NSBaselineOffsetAttributeName, offset, strings)
}
