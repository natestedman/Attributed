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

// MARK: - Function Types

/// The type for attribute functions.
///
/// All extensions provided by Attributed add functions of this type. For example, an extension of `UIColor` can be used
/// to create red text:
///
///     UIColor.redColor().foregroundAttribute(text)
///
/// However, referencing `UIColor.redColor().foregroundAttribute` alone can also be useful, as it is equivalent to an
/// `AttributeFunction` that applies red text to its parameter. Attribute functions can be used in sequences, which can
/// be reduced to a single `AttributeFunction` with the `join` extension of `SequenceType`.
///
/// If writing code that should compose with Attributed, it typically makes sense to write functions that will apply
/// attributes in terms of `AttributeFunction`. If additional parameters are required, it's better to return a closure
/// than to accept an `AttributedStringConvertible` alongside other parameters.
public typealias AttributeFunction = AttributedStringConvertible -> AttributedStringConvertible

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

/// Swift's `String` is extended to conform to `AttributedStringConvertible`.
extension String: AttributedStringConvertible
{
    // MARK: - Attributed String Convertible
    
    /// Required to conform to `AttributedStringConvertible`.
    public var attributedString: NSAttributedString
    {
        return NSAttributedString(string: self)
    }
    
    /// Required to conform to `AttributedStringConvertible`.
    public func attributedStringWithAddedAttributes(attributes: [String : AnyObject]) -> NSAttributedString
    {
        return NSAttributedString(string: self, attributes: attributes)
    }
}

// MARK: - NSAttributedString

/// Foundation's `NSAttributedString` is extended to conform to `AttributedStringConvertible`.
extension NSAttributedString: AttributedStringConvertible
{
    // MARK: - Attributed String Convertible
    
    /// Required to conform to `AttributedStringConvertible`.
    public var attributedString: NSAttributedString
    {
        return self
    }
    
    /// Required to conform to `AttributedStringConvertible`.
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
