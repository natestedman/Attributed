# Attributed
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Build Status](https://travis-ci.org/natestedman/Attributed.svg?branch=master)](https://travis-ci.org/natestedman/Attributed)
[![License](https://img.shields.io/badge/license-Creative%20Commons%20Zero%20v1.0%20Universal-blue.svg)](https://creativecommons.org/publicdomain/zero/1.0/)

A small, flexible framework for expressing `NSAttributedString` values structurally.

```swift
label.attributedText = [
    "This is a string with ",
    UIColor.blueColor().foregroundAttribute([
        "blue ",
        100.kernAttribute(
            "kerned"
        ),
        " text"
    ].join()),
    " and ",
    UIColor.redColor().foregroundAttribute([
        NSAttributedString(string: "red", attributes: ["Custom": "Value"]),
        " text"
    ].join()),
    "."
].join().attributedString
```

## Usage

### Attributed String Convertibles
Attributed defines the `AttributedStringConvertible` protocol, which allows clients to create an `NSAttributedString` value with the `attributedString` property. `String` and `NSAttributedString` are extended to conform to this protocol.

### Attribute Functions
The most important values in Attributed are _attribute functions_, which take an `AttributedStringConvertible` value as a parameter, and return a second `AttributedStringConvertible` value, with additional attributes applied. A basic attribute function can be created with the `attribute(name:value:)` function:

```swift
let attributeFunction = attribute(name: "Foo", value: "Bar")
let attributedString = attributeFunction("Baz").attributedString
```

Multiple attributes can also be set at once:

```swift
let attributeFunction = attributes(values: [
    "Foo": "Bar",
    "Bar": "Foo"
])

let attributedString = attributeFunction("Baz").attributedString
```

The `AttributeFunction` `typealias` is provided to define this function type.

### Extension Attribute Functions
The core of Attributed's functionality is in the extensions added to support the [standard attributes](https://developer.apple.com/library/ios/documentation/Cocoa/Conceptual/AttributedStrings/Articles/standardAttributes.html).

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
- `NSURL`: `attribute`, which maps to `NSLinkAttributeName`.
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
- `expansionAttribute`, which maps to `NSExpansionAttributeName`.
- `kernAttribute`, which maps to `NSKernAttributeName`.

#### Ligatures
To enforce valid values for the ligature attribute, the `Ligature` type is declared as an enumeration, with the cases:

- `None`
- `Default`
- `All` (this case is only available on OS X)

The `Ligature` enumeration is extended with the `attribute` function, which maps to `NSLigatureAttributeName`.

### Composition
Attributed extends `SequenceType` with `join()` functions, which make flattening sequences of `AttributedStringConvertible` and `AttributeFunction` values possible.

```swift
let attributedString = [
    UIColor.redColor().foregroundAttribute("Red"),
    UIColor.greenColor().foregroundAttribute("Green")
].join().attributedString
```

```swift
let attributes = [
    UIColor.redColor().foregroundAttribute,
    UIColor.greenColor().backgroundAttribute
].join()

let attributedString = attributes("Complementary").attributedString
```

If you are writing an extension that composes with Attributed, it's best to work in terms of these two types. Here's an extension that applies [Photoshop tracking values](http://www.devsign.co/notes/tracking-and-character-spacing), which require knowledge of both the current font and the tracking value, and thus cannot be implemented as an `AttributeFunction`-compatible extension of either type:

```swift
extension UIFont
{
    public func photoshopTrackingAttributes(tracking: CGFloat) -> AttributeFunction
    {
        return [attribute, (pointSize * tracking / 1000).kernAttribute].join()
    }
}
```

This is better than a function taking the tracking value and an attributed string convertible as two arguments and returning an `AttributedStringConvertible` because it can be composed with other attribute functions:

```swift
let attributes = [
    UIColor.redColor().foregroundAttribute,
    font.photoshopTrackingAttributes(500)
].join()

let attributedString = attributes("Tracked Red").attributedString
```

### Attribute Scoping
Outer attributed values *do not* override inner values, so this code works as expected:

```swift
UIColor.greenColor().foregroundAttribute([
    "There is some ",
    UIColor.blueColor().foregroundAttribute(
        "blue text "
    ),
    "embedded in this green text."
].join())
```

## Installation

Add:

    github "natestedman/Attributed"

To your `Cartfile`.
