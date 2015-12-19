# Attributed
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Build Status](https://travis-ci.org/natestedman/Attributed.svg?branch=master)](https://travis-ci.org/natestedman/Attributed)
[![License](https://img.shields.io/badge/license-Creative%20Commons%20Zero%20v1.0%20Universal-blue.svg)](https://creativecommons.org/publicdomain/zero/1.0/)

A Swift DSL for `NSAttributedString`.

## Usage
Attributed strings are composed through function calls on extensions of attribute value types, where the parameter is a list of attributed string values to apply the attributes to. The return values of these function calls can be included within lists passed to other function calls, creating a nested structure.

```swift
label.attributedText = [
    "This is a string with ",
    UIColor.blueColor().foregroundAttribute([
        "blue ",
        100.kernAttribute([
            "kerned"
        ]),
        " text"
    ]),
    " and ",
    UIColor.redColor().foregroundAttribute([
        NSAttributedString(string: "red", attributes: ["Custom": "Value"]),
        " text"
    ]),
    "."
].join().attributedString
```

The `join` extension of `SequenceType` can be used to combine attributed strings without applying any additional attributes.

Any value that conforms to the `AttributedStringConvertible` protocol can be passed as an argument. Implementations for `NSAttributedString` and `String` are included, so it shouldn't be necessary to implement this type. All attribute functions return a value of this protocol type. It can be unwrapped into a `NSAttributedString` with the `attributedString` property.

### Scoping
Outer attributed values *do not* override inner values, so this code works as expected:

```swift
UIColor.greenColor().foregroundAttribute(
    "There is some ",
    UIColor.blueColor().foregroundAttribute(
        "blue text "
    ),
    "embedded in this green text."
)
```

### Attributes
Attribute functions take an array of attributed string convertibles, which are joined to form an attributed string.

#### Colors
`NSColor` and `UIColor` are extended with these attribute functions:

- `foregroundAttribute`, which maps to `NSForegroundColorAttributeName`.
- `backgroundAttribute`, which maps to `NSBackgroundColorAttributeName`.
- `underlineAttribute`, which maps to `NSUnderlineColorAttributeName`.
- `strikethroughAttribute`, which maps to `NSStrikethroughColorAttributeName`.

#### Other Framework Types
These additional framework types are extended with attribute functions:

- `NSCursor`, on OS X only: `attributes`, which maps to `NSCursorAttributeName`.
- `NSFont`/`UIFont`: `attribute`, which maps to `NSFontAttributeName`.
- `NSTextAttachment`: `attribute`, which maps to `NSAttachmentAttributeName`.
- `NSParagraphStyle`: `attribute`, which maps to `NSParagraphStyleAttributeName`.
- `NSShadow`: `attribute`, which maps to `NSShadowAttributeName`.
- `NSUnderlineStyle`: `attribute`, which maps to `NSUnderlineStyleAttributeName`; and `strikethroughAttribute`, which maps to `NSStrikethroughStyleAttributeName`.
- `String`, on OS X only: `toolTipAttribute`, which maps to `NSToolTipAttributeName`.

#### Numeric Types
Attributes with numeric values use the `NSNumberConvertible` protocol. The framework provides implementations for these types:

- `NSNumber`
- `Int`
- `UInt`
- `Int8`
- `UInt8`
- `Int16`
- `UInt16`
- `Int32`
- `UInt32`
- `Int64`
- `UInt64`
- `Float`
- `Double`
- `CGFloat`

Types that conform to `NSNumberConvertible` are extended with these functions:

- `baselineOffsetAttribute`, which maps to `NSBaselineOffsetAttributeName`.
- `kernAttribute`, which maps to `NSKernAttributeName`.

#### Ligatures
To enforce valid values for the ligature attribute, the `Ligature` type is declared as an enumeration, with the cases:

- `None`
- `Default`
- `All` (this case is only available on OS X)

The `Ligature` enumeration is extended with the `attribute` function, which maps to `NSLigatureAttributeName`.

#### Custom Attributes
Custom attributes can be added with the `attribute` and `attributes` functions.

```swift
UIColor.blueColor().foregroundColor([
    "This is a blue string with a ",
    attributes(
        ["Custom": "Value"],
        ["custom attribute included"]
    ),
    "."
])
```

## Installation

Add:

    github "natestedman/Attributed"

To your `Cartfile`.
