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
        let attributed = ColorType.redColor().foregroundAttribute([
            "Test",
            ColorType.blueColor().foregroundAttribute([
                "Test",
                ColorType.greenColor().foregroundAttribute("Test"),
                "Test"
            ].join()),
            "Test"
        ].join()).attributedString
        
        let mutable = NSMutableAttributedString(string: "TestTestTestTestTest")
        mutable.addAttribute(NSForegroundColorAttributeName, value: ColorType.redColor(), range: NSMakeRange(0, 4))
        mutable.addAttribute(NSForegroundColorAttributeName, value: ColorType.blueColor(), range: NSMakeRange(4, 4))
        mutable.addAttribute(NSForegroundColorAttributeName, value: ColorType.greenColor(), range: NSMakeRange(8, 4))
        mutable.addAttribute(NSForegroundColorAttributeName, value: ColorType.blueColor(), range: NSMakeRange(12, 4))
        mutable.addAttribute(NSForegroundColorAttributeName, value: ColorType.redColor(), range: NSMakeRange(16, 4))
        
        XCTAssertEqual(attributed, mutable)
    }
    
    func testDeepNesting()
    {
        let attributed = 10.kernAttribute([
            "Test",
            ColorType.blueColor().foregroundAttribute([
                "Test",
                ColorType.greenColor().foregroundAttribute("Test"),
                "Test"
            ].join()),
            "Test"
        ].join()).attributedString
        
        let mutable = NSMutableAttributedString(string: "TestTestTestTestTest")
        mutable.addAttribute(NSKernAttributeName, value: 10, range: NSMakeRange(0, 20))
        mutable.addAttribute(NSForegroundColorAttributeName, value: ColorType.blueColor(), range: NSMakeRange(4, 4))
        mutable.addAttribute(NSForegroundColorAttributeName, value: ColorType.greenColor(), range: NSMakeRange(8, 4))
        mutable.addAttribute(NSForegroundColorAttributeName, value: ColorType.blueColor(), range: NSMakeRange(12, 4))
        
        XCTAssertEqual(attributed, mutable)
    }
    
    func testNilValue()
    {
        let attributed = ColorType.blueColor().foregroundAttribute([
            "Test",
            attribute(NSForegroundColorAttributeName, withValue: nil)([
                "Test",
                ColorType.greenColor().foregroundAttribute("Test")
            ].join())
        ].join()).attributedString
        
        let mutable = NSMutableAttributedString(string: "TestTestTest")
        mutable.addAttribute(NSForegroundColorAttributeName, value: ColorType.blueColor(), range: NSMakeRange(0, 4))
        mutable.addAttribute(NSForegroundColorAttributeName, value: ColorType.greenColor(), range: NSMakeRange(8, 4))
        
        XCTAssertEqual(attributed, mutable)
    }
    
    func testStringJoin()
    {
        let attributed = [
            "Test",
            NSAttributedString(string: "Test", attributes: [NSForegroundColorAttributeName: ColorType.redColor()])
        ].join().attributedString
        
        let mutable = NSMutableAttributedString(string: "TestTest")
        mutable.addAttribute(NSForegroundColorAttributeName, value: ColorType.redColor(), range: NSMakeRange(4, 4))
        
        XCTAssertEqual(attributed, mutable)
    }
    
    func testFunctionJoin()
    {
        let functions = [
            ColorType.blackColor().foregroundAttribute,
            ColorType.redColor().backgroundAttribute,
            2.kernAttribute
        ]
        
        XCTAssertEqual(
            functions.join()("Test").attributedString,
            NSAttributedString(
                string: "Test",
                attributes: [
                    NSForegroundColorAttributeName: ColorType.blackColor(),
                    NSBackgroundColorAttributeName: ColorType.redColor(),
                    NSKernAttributeName: 2
                ]
            )
        )
    }
    
    func testFunctionJoinOverride()
    {
        let functions = [
            ColorType.redColor().foregroundAttribute,
            ColorType.greenColor().foregroundAttribute,
            ColorType.blueColor().foregroundAttribute,
        ]
        
        XCTAssertEqual(
            functions.join()("Test").attributedString,
            NSAttributedString(string: "Test", attributes: [NSForegroundColorAttributeName: ColorType.blueColor()])
        )
    }
}
