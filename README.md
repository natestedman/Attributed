# Attributed
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Build Status](https://travis-ci.org/natestedman/Attributed.svg?branch=master)](https://travis-ci.org/natestedman/Attributed)
[![License](https://img.shields.io/badge/license-Creative%20Commons%20Zero%20v1.0%20Universal-blue.svg)](https://creativecommons.org/publicdomain/zero/1.0/)

A Swift DSL for `NSAttributedString`.

## Usage
Attributed strings are composed through function calls on extensions of attribute value types, where the parameter is a list of attributed string values to apply the attributes to. The return values of these function calls can be included within lists passed to other function calls, creating a nested structure.

```swift
label.attributedText = Join(
    "This is a string with ",
    UIColor.blueColor().foregroundAttribute(
        "blue ",
        100.kernAttribute(
            "kerned"
        ),
        " text"
    ),
    " and ",
    UIColor.redColor().foregroundAttribute(
        NSAttributedString(string: "red", attributes: ["Custom": "Value"]),
        " text"
    ),
    "."
).attributedString
```

The `Join` function can be used to combine attributed strings without applying any additional attributes.

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
The provided attribute functions take the value of the attribute as the first value, and a variadic number of `AttributedStringConvertible` values afterwards. For composition in other functions, versions with a single `[AttributedStringConvertible]` parameter are also provided for all functions.

#### Framework Types
The framework types extended with attribute functions are:

- `NSColor`/`UIColor`: `foregroundAttribute`, which maps to `NSForegroundColorAttributeName`, and `backgroundAttribute`, which maps to `NSBackgroundColorAttributeName`
- `NSFont`/`UIFont`: `attribute`, which maps to `NSFontAttributeName`.
- `NSTextAttachment`: `attribute`, which maps to `NSAttachmentAttributeName`.
- `NSParagraphStyle`: `attribute`, which maps to `NSParagraphStyleAttributeName`.
- `NSUnderlineStyle`: `attribute`, which maps to `NSUnderlineStyleAttributeName`.

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
Custom attributes can be added with the `Attribute` and `Attributes` functions.

```swift
UIColor.blueColor().foregroundColor(
    "This is a blue string with a ",
    Attributes(
        ["Custom": "Value"],
        "custom attribute included"
    ),
    "."
)
```

## Installation

Add:

    github "natestedman/Attributed"

To your `Cartfile`.
