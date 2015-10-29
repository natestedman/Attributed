// Attributed
// Written in 2015 by Nate Stedman <nate@natestedman.com>
//
// To the extent possible under law, the author(s) have dedicated all copyright and
// related and neighboring rights to this software to the public domain worldwide.
// This software is distributed without any warranty.
//
// You should have received a copy of the CC0 Public Domain Dedication along with
// this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

@testable import Attributed
import XCTest

class AttributedStringConvertibleTests: XCTestCase
{
    func testNSAttributedStringNoOverride()
    {
        // create an attributed string with the center set to blue
        let string = NSMutableAttributedString(string: "Test")
        string.addAttribute(NSForegroundColorAttributeName, value: ColorType.blueColor(), range: NSMakeRange(1, 2))
        
        // apply the red color over the entire string, but avoid overriding
        let added = string.attributedStringWithAddedAttributes([NSForegroundColorAttributeName: ColorType.redColor()])
        
        /// manually create the same string
        let copy = NSMutableAttributedString(attributedString: string)
        copy.addAttribute(NSForegroundColorAttributeName, value: ColorType.redColor(), range: NSMakeRange(0, 1))
        copy.addAttribute(NSForegroundColorAttributeName, value: ColorType.redColor(), range: NSMakeRange(3, 1))
        
        XCTAssertEqual(added, copy)
    }
    
    func testString()
    {
        let string = "Test"
        let added = string.attributedStringWithAddedAttributes([NSForegroundColorAttributeName: ColorType.blueColor()])
        let manual = NSAttributedString(string: string, attributes: [NSForegroundColorAttributeName: ColorType.blueColor()])
        
        XCTAssertEqual(added, manual)
    }
}
