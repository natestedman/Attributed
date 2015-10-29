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

// MARK: - Protocol

/// A protocol for a type that can be converted to an attributed string.
public protocol AttributedStringConvertible
{
    /// The attributed string value.
    var attributedString: NSAttributedString { get }
    
    /**
     Returns an attributed string value, with additional attributes applied.
     
     - parameter attributes: The attributes to apply.
     */
    func attributedStringWithAddedAttributes(attributes: [String:AnyObject]) -> NSAttributedString
}

// MARK: - String
extension String: AttributedStringConvertible
{
    public var attributedString: NSAttributedString
    {
        return NSAttributedString(string: self)
    }
    
    public func attributedStringWithAddedAttributes(attributes: [String : AnyObject]) -> NSAttributedString
    {
        return NSAttributedString(string: self, attributes: attributes)
    }
}

// MARK: - NSAttributedString
extension NSAttributedString: AttributedStringConvertible
{
    public var attributedString: NSAttributedString
    {
        return self
    }
    
    public func attributedStringWithAddedAttributes(attributes: [String : AnyObject]) -> NSAttributedString
    {
        let mutable = NSMutableAttributedString(attributedString: self)
        let range = NSMakeRange(0, mutable.length)
        let options = NSAttributedStringEnumerationOptions()
        
        for (attribute, value) in attributes
        {
            mutable.enumerateAttribute(attribute, inRange: range, options: options, usingBlock: { current, range, _ in
                if current == nil
                {
                    mutable.addAttribute(attribute, value: value, range: range)
                }
            })
        }
        
        return mutable
    }
}