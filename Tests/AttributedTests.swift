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
        let attributed = ColorType.red.foregroundAttribute([
            "Test",
            ColorType.blue.foregroundAttribute([
                "Test",
                ColorType.green.foregroundAttribute("Test"),
                "Test"
            ].join()),
            "Test"
        ].join()).attributedString
        
        let mutable = NSMutableAttributedString(string: "TestTestTestTestTest")
        mutable.addAttribute(NSForegroundColorAttributeName, value: ColorType.red, range: NSMakeRange(0, 4))
        mutable.addAttribute(NSForegroundColorAttributeName, value: ColorType.blue, range: NSMakeRange(4, 4))
        mutable.addAttribute(NSForegroundColorAttributeName, value: ColorType.green, range: NSMakeRange(8, 4))
        mutable.addAttribute(NSForegroundColorAttributeName, value: ColorType.blue, range: NSMakeRange(12, 4))
        mutable.addAttribute(NSForegroundColorAttributeName, value: ColorType.red, range: NSMakeRange(16, 4))
        
        XCTAssertEqual(attributed, mutable)
    }
    
    func testDeepNesting()
    {
        let attributed = 10.kernAttribute([
            "Test",
            ColorType.blue.foregroundAttribute([
                "Test",
                ColorType.green.foregroundAttribute("Test"),
                "Test"
            ].join()),
            "Test"
        ].join()).attributedString
        
        let mutable = NSMutableAttributedString(string: "TestTestTestTestTest")
        mutable.addAttribute(NSKernAttributeName, value: 10, range: NSMakeRange(0, 20))
        mutable.addAttribute(NSForegroundColorAttributeName, value: ColorType.blue, range: NSMakeRange(4, 4))
        mutable.addAttribute(NSForegroundColorAttributeName, value: ColorType.green, range: NSMakeRange(8, 4))
        mutable.addAttribute(NSForegroundColorAttributeName, value: ColorType.blue, range: NSMakeRange(12, 4))
        
        XCTAssertEqual(attributed, mutable)
    }
    
    func testNilValue()
    {
        let attributed = ColorType.blue.foregroundAttribute([
            "Test",
            attribute(name: NSForegroundColorAttributeName, value: nil)([
                "Test",
                ColorType.green.foregroundAttribute("Test")
            ].join())
        ].join()).attributedString
        
        let mutable = NSMutableAttributedString(string: "TestTestTest")
        mutable.addAttribute(NSForegroundColorAttributeName, value: ColorType.blue, range: NSMakeRange(0, 4))
        mutable.addAttribute(NSForegroundColorAttributeName, value: ColorType.green, range: NSMakeRange(8, 4))
        
        XCTAssertEqual(attributed, mutable)
    }
    
    func testStringJoin()
    {
        let attributed = [
            "Test",
            NSAttributedString(string: "Test", attributes: [NSForegroundColorAttributeName: ColorType.red])
        ].join().attributedString
        
        let mutable = NSMutableAttributedString(string: "TestTest")
        mutable.addAttribute(NSForegroundColorAttributeName, value: ColorType.red, range: NSMakeRange(4, 4))
        
        XCTAssertEqual(attributed, mutable)
    }
    
    func testFunctionJoin()
    {
        let functions = [
            ColorType.black.foregroundAttribute,
            ColorType.red.backgroundAttribute,
            2.kernAttribute
        ]
        
        XCTAssertEqual(
            functions.join()("Test").attributedString,
            NSAttributedString(
                string: "Test",
                attributes: [
                    NSForegroundColorAttributeName: ColorType.black,
                    NSBackgroundColorAttributeName: ColorType.red,
                    NSKernAttributeName: 2
                ]
            )
        )
    }
    
    func testFunctionJoinOverride()
    {
        let functions = [
            ColorType.red.foregroundAttribute,
            ColorType.green.foregroundAttribute,
            ColorType.blue.foregroundAttribute,
        ]
        
        XCTAssertEqual(
            functions.join()("Test").attributedString,
            NSAttributedString(string: "Test", attributes: [NSForegroundColorAttributeName: ColorType.blue])
        )
    }
}
