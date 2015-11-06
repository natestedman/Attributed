// Attributed
// Written in 2015 by Nate Stedman <nate@natestedman.com>
//
// To the extent possible under law, the author(s) have dedicated all copyright and
// related and neighboring rights to this software to the public domain worldwide.
// This software is distributed without any warranty.
//
// You should have received a copy of the CC0 Public Domain Dedication along with
// this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

import Foundation

/// An attributed string converible with a dictionary of attributes and a list of child attributed string convertibles.
internal struct NestedAttributedString
{
    /// The attributes to apply over this string's children.
    let attributes: [String:AnyObject?]
    
    /// The children of this attributed string.
    let children: [AttributedStringConvertible]
}

// MARK: - AttributedStringConvertible
extension NestedAttributedString: AttributedStringConvertible
{
    var attributedString: NSAttributedString
    {
        return attributedStringWithAddedAttributes([:])
    }
    
    func attributedStringWithAddedAttributes(attributes: [String : AnyObject]) -> NSAttributedString
    {
        // combine the attributes, with our attributes overriding the passed-in attributes
        var combined = attributes
        
        for (attribute, value) in self.attributes
        {
            combined[attribute] = value
        }
        
        // build an attributed string
        let mutable = NSMutableAttributedString()
        
        for child in children
        {
            mutable.appendAttributedString(child.attributedStringWithAddedAttributes(combined))
        }
        
        return mutable
    }
}