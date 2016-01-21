// Attributed
// Written in 2015 by Nate Stedman <nate@natestedman.com>
//
// To the extent possible under law, the author(s) have dedicated all copyright and
// related and neighboring rights to this software to the public domain worldwide.
// This software is distributed without any warranty.
//
// You should have received a copy of the CC0 Public Domain Dedication along with
// this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

/**
 Returns an attributed string convertible with the specified attributes applied at the root level.
 
 The attributes will not override matching attributes deeper in the hierarchy.
 
 - parameter attributes: The attributes to apply.
 - parameter strings:    The convertible strings.
 */
public func attributes(attributes: [String:AnyObject?], _ string: AttributedStringConvertible)
    -> AttributedStringConvertible
{
    return NestedAttributedString(attributes: attributes, children: [string])
}

/**
 Returns an attributed string convertible with the specified attribute applied at the root level.
 
 The attribute value will not override a matching attribute deeper in the hierarchy.
 
 - parameter attribute: The attribute name to apply.
 - parameter value:     The attribute value to apply.
 - parameter strings:   The convertible strings.
 */
public func attribute(attribute: String, _ value: AnyObject?, _ string: AttributedStringConvertible)
    -> AttributedStringConvertible
{
    return Attributed.attributes([attribute: value], string)
}
