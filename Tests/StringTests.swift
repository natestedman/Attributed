// Attributed
// Written in 2017 by Nate Stedman <nate@natestedman.com>
//
// To the extent possible under law, the author(s) have dedicated all copyright and
// related and neighboring rights to this software to the public domain worldwide.
// This software is distributed without any warranty.
//
// You should have received a copy of the CC0 Public Domain Dedication along with
// this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

@testable import Attributed
import Nimble
import XCTest

final class StringTests: XCTestCase
{
    private let string = "string"
    private let attributes: [String:Any] = [
        "number": 0,
        "string": "test"
    ]

    func testWithoutAddingAttributes()
    {
        expect(self.string.attributedString) == NSAttributedString(string: string)
    }

    func testAddingAttributes()
    {
        expect(self.string.attributedString(adding: self.attributes)) ==
            NSAttributedString(string: string, attributes: attributes)
    }

    func testApplyingAttributeFunction()
    {
        let function = Attributed.attribute(name: "string", value: "test")

        expect(function(self.string).attributedString) ==
            NSAttributedString(string: string, attributes: ["string": "test"])
    }

    func testApplyingAttributesFunction()
    {
        let function = Attributed.attributes(values: attributes)
        expect(function(self.string).attributedString) == NSAttributedString(string: string, attributes: attributes)
    }
}
