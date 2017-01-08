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
import Nimble
import XCTest

final class NestedAttributedStringTests: XCTestCase
{
    func testAttributedString()
    {
        expect(nested.attributedString) == NSAttributedString(string: string, attributes: attributes)
    }

    func testAttributedStringAddingAttributes()
    {
        expect(nested.attributedString(adding: ["boolean": true])) == NSAttributedString(string: string, attributes: [
            "number": 0,
            "string": "test",
            "boolean": true
        ])
    }

    func testAttributedStringAddingAttributesNotOverriding()
    {
        expect(nested.attributedString(adding: ["number": 1])) ==
            NSAttributedString(string: string, attributes: attributes)
    }
}

private let nested = NestedAttributedString(attributes: attributes, children: [string])
private let string = "string"
private let attributes: [String:Any] = [
    "number": 0,
    "string": "test"
]
