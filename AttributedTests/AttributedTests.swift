// Attributed
// Written in 2015 by Nate Stedman <nate@natestedman.com>
//
// To the extent possible under law, the author(s) have dedicated all copyright and
// related and neighboring rights to this software to the public domain worldwide.
// This software is distributed without any warranty.
//
// You should have received a copy of the CC0 Public Domain Dedication along with
// this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

import Attributed
import XCTest

class AttributedTests: XCTestCase
{
    func testNestedColors()
    {
        let attributed = Color(
            NSColor.redColor(),
            "Test",
            Color(
                NSColor.blueColor(),
                "Test",
                Color(
                    NSColor.greenColor(),
                    "Test"
                ),
                "Test"
            ),
            "Test"
        ).attributedString
        
        let mutable = NSMutableAttributedString(string: "TestTestTestTestTest")
        mutable.addAttribute(NSForegroundColorAttributeName, value: NSColor.redColor(), range: NSMakeRange(0, 4))
        mutable.addAttribute(NSForegroundColorAttributeName, value: NSColor.blueColor(), range: NSMakeRange(4, 4))
        mutable.addAttribute(NSForegroundColorAttributeName, value: NSColor.greenColor(), range: NSMakeRange(8, 4))
        mutable.addAttribute(NSForegroundColorAttributeName, value: NSColor.blueColor(), range: NSMakeRange(12, 4))
        mutable.addAttribute(NSForegroundColorAttributeName, value: NSColor.redColor(), range: NSMakeRange(16, 4))
        
        XCTAssertEqual(attributed, mutable)
    }
}
