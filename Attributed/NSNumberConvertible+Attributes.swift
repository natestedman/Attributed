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

/// `NSNumberConvertible` is extended to provide baseline offset and kerning attribute functions.
public extension NSNumberConvertible
{
    // MARK: - Baseline Offset
    
    /**
     Applies a baseline offset attribute to the enclosed attributed strings.
     
     The baseline offset value will not override a baseline offset value set deeper in the hierarchy.
     
     - parameter string: The attributed string convertible to apply the baseline offset to.
     */
    public func baselineOffsetAttribute(string: AttributedStringConvertible) -> AttributedStringConvertible
    {
        return Attributed.attribute(name: NSBaselineOffsetAttributeName, value: self.NSNumberValue)(string)
    }
    
    // MARK: - Kern
    
    /**
     Applies a kerning attribute to the enclosed attributed strings.
     
     The kerning value will not override a kerning value set deeper in the hierarchy.
     
     - parameter string: The attributed string convertible to apply the kerning attribute to.
     */
    func kernAttribute(string: AttributedStringConvertible) -> AttributedStringConvertible
    {
        return Attributed.attribute(name: NSKernAttributeName, value: self.NSNumberValue)(string)
    }
}
