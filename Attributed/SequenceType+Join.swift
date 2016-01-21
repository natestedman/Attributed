// Attributed
// Written in 2015 by Nate Stedman <nate@natestedman.com>
//
// To the extent possible under law, the author(s) have dedicated all copyright and
// related and neighboring rights to this software to the public domain worldwide.
// This software is distributed without any warranty.
//
// You should have received a copy of the CC0 Public Domain Dedication along with
// this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

public extension SequenceType where Generator.Element == AttributedStringConvertible
{
    /**
     Joins multiple `AttributedStringConvertible` values into one.
     */
    public func join() -> AttributedStringConvertible
    {
        return NestedAttributedString(attributes: [:], children: Array(self))
    }
}

public extension SequenceType where Generator.Element == AttributeFunction
{
    /// Joins a sequence of partially applied attribute functions (or, extension member functions of an attribute value)
    /// into a single function.
    ///
    /// If redundant attributes are included, the later version will take precedence.
    public func join() -> AttributeFunction
    {
        return { string in
            self.reverse().reduce(string, combine: { current, function in function(current) })
        }
    }
}
