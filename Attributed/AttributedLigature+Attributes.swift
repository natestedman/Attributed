// Attributed
// Written in 2015 by Nate Stedman <nate@natestedman.com>
//
// To the extent possible under law, the author(s) have dedicated all copyright and
// related and neighboring rights to this software to the public domain worldwide.
// This software is distributed without any warranty.
//
// You should have received a copy of the CC0 Public Domain Dedication along with
// this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

public extension AttributedLigature
{
    /**
     Applies a ligature setting to the enclosed attributed strings.
     
     The ligature setting will not override a ligature setting set deeper in the hierarchy.
     
     - parameter strings: The attributed strings to apply the ligature setting to.
     */
    public func attribute(strings: AttributedStringConvertible...) -> AttributedStringConvertible
    {
        return Ligature(self, strings)
    }
    
    /**
     Applies a ligature setting to the enclosed attributed strings.
     
     The ligature setting will not override a ligature setting set deeper in the hierarchy.
     
     - parameter strings: The attributed strings to apply the ligature setting to.
     */
    public func attribute(strings: [AttributedStringConvertible]) -> AttributedStringConvertible
    {
        return Ligature(self, strings)
    }
}
