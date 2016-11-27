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
 Returns an attribute function to apply the specified attributes.
 
 The attributes will not override matching attributes deeper in the hierarchy.
 
 - parameter attributes: The attributes to apply.
 */
public func attributes(values: [String:AnyObject?]) -> AttributeFunction
{
    return { NestedAttributedString(attributes: values, children: [$0]) }
}

/**
 Returns an attribute function to apply the specified attribute.
 
 The attribute value will not override a matching attribute deeper in the hierarchy.
 
 - parameter attribute: The attribute name to apply.
 - parameter value:     The attribute value to apply.
 */
public func attribute(name: String, value: AnyObject?) -> AttributeFunction
{
    return attributes(values: [name: value])
}
