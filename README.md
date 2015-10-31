# Attributed
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Build Status](https://travis-ci.org/natestedman/Attributed.svg?branch=master)](https://travis-ci.org/natestedman/Attributed)
[![License](https://img.shields.io/badge/license-Creative%20Commons%20Zero%20v1.0%20Universal-blue.svg)](https://creativecommons.org/publicdomain/zero/1.0/)

A Swift DSL for `NSAttributedString`.

## Usage
Attributed strings are composed through function calls that take an attribute value, followed by a list of attributed string values to apply the attributes to. The return values of these function calls can be included within lists passed to other function calls, creating a nested structure.

```swift
label.attributedText = Join(
    "This is a string with ",
    Color(
        UIColor.blueColor(),
        "blue ",
        Kern(
            100,
            "kerned"
        ),
        " text"
    ),
    " and ",
    Color(
        UIColor.redColor(),
        NSAttributedString(string: "red", attributes: ["Custom": "Value"]),
        " text"
    ),
    "."
).attributedString
```

The `Join` function can be used to combine attributed strings without applying any additional attributes.

Any value that conforms to the `AttributedStringConvertible` protocol can be passed as an argument. Implementations for `NSAttributedString` and `String` are included. All attribute functions return a value of this protocol type.

### Scoping
Outer attributed values *do not* override inner values, so this code works as expected:

```swift
Color(
    UIColor.greenColor(),
    "There is some ",
    Color(
        UIColor.blueColor(),
        "blue text "
    ),
    "embedded in this green text."
)
```

### Standard Attributes
The supported attribute functions are:

- `Attachment`, which maps to `NSAttachmentAttributeName`.
- `Background`, which maps to `NSBackgroundColorAttributeName`.
- `BaselineOffset`, which maps to `NSBaselineOffsetAttributeName`.
- `Color`, which maps to `NSForegroundColorAttributeName`. This function takes an argument of `ColorType`, which is a typealias for `NSColor` on OS X and `UIColor` on iOS.
- `Font`, which maps to `NSFontAttributeName`. This function takes an argument of `FontType`, which is a typealias for `NSFont` on OS X and `UIFont` on iOS.
- `Kern`, which maps to `NSKernAttributeName`.
- `Ligature`, which maps to `NSLigatureAttributeName`. This function uses the `AttributedLigature` enumeration instead of raw integer values.
- `Style`, which maps to `NSParagraphStyleAttributeName`.

All of these functions take the value of the attribute as the first value, and an arbitrary number of `AttributedStringConvertible` values afterwards. For composition in other functions, versions taking an `[AttributedStringConvertible]` parameter are also provided.

### Custom Attributes
Custom attributes can be added with the `Attribute` and `Attributes` functions.

```swift
Color(
    UIColor.blueColor(),
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
