// Attributed
// Written in 2015 by Nate Stedman <nate@natestedman.com>
//
// To the extent possible under law, the author(s) have dedicated all copyright and
// related and neighboring rights to this software to the public domain worldwide.
// This software is distributed without any warranty.
//
// You should have received a copy of the CC0 Public Domain Dedication along with
// this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

import CoreGraphics
import Foundation

// MARK: - Protocol

/// A protocol for types that can be converted to `NSNumber`.
///
/// Extensions for number-based attributes extend this type.
public protocol NSNumberConvertible
{
    /// The value, wrapped in an `NSNumber` instance.
    var NSNumberValue: NSNumber { get }
}

// MARK: - NSNumber

/// `NSNumber` is extended to conform to `NSNumberConvertible`.
extension NSNumber: NSNumberConvertible
{
    /// Returns `self`.
    public var NSNumberValue: NSNumber
    {
        return self
    }
}

// MARK: - Int

/// `Int` is extended to conform to `NSNumberConvertible`.
extension Int: NSNumberConvertible
{
    /// The value, wrapped in an `NSNumber` instance.
    public var NSNumberValue: NSNumber
    {
        return self
    }
}

// MARK: - UInt

/// `UInt` is extended to conform to `NSNumberConvertible`.
extension UInt: NSNumberConvertible
{
    /// The value, wrapped in an `NSNumber` instance.
    public var NSNumberValue: NSNumber
    {
        return self
    }
}

// MARK: - Int8

/// `Int8` is extended to conform to `NSNumberConvertible`.
extension Int8: NSNumberConvertible
{
    /// The value, wrapped in an `NSNumber` instance.
    public var NSNumberValue: NSNumber
    {
        return Int(self)
    }
}

// MARK: - UInt8

/// `UInt8` is extended to conform to `NSNumberConvertible`.
extension UInt8: NSNumberConvertible
{
    /// The value, wrapped in an `NSNumber` instance.
    public var NSNumberValue: NSNumber
    {
        return UInt(self)
    }
}

// MARK: - Int16

/// `Int16` is extended to conform to `NSNumberConvertible`.
extension Int16: NSNumberConvertible
{
    /// The value, wrapped in an `NSNumber` instance.
    public var NSNumberValue: NSNumber
    {
        return Int(self)
    }
}

// MARK: - UInt16

/// `UInt16` is extended to conform to `NSNumberConvertible`.
extension UInt16: NSNumberConvertible
{
    /// The value, wrapped in an `NSNumber` instance.
    public var NSNumberValue: NSNumber
    {
        return UInt(self)
    }
}

// MARK: - Int32

/// `Int32` is extended to conform to `NSNumberConvertible`.
extension Int32: NSNumberConvertible
{
    /// The value, wrapped in an `NSNumber` instance.
    public var NSNumberValue: NSNumber
    {
        return Int(self)
    }
}

// MARK: - UInt32

/// `UInt32` is extended to conform to `NSNumberConvertible`.
extension UInt32: NSNumberConvertible
{
    /// The value, wrapped in an `NSNumber` instance.
    public var NSNumberValue: NSNumber
    {
        return UInt(self)
    }
}

// MARK: - Int64

/// `Int64` is extended to conform to `NSNumberConvertible`.
extension Int64: NSNumberConvertible
{
    /// The value, wrapped in an `NSNumber` instance.
    public var NSNumberValue: NSNumber
    {
        return NSNumber(longLong: self)
    }
}

// MARK: - UInt64

/// `UInt64` is extended to conform to `NSNumberConvertible`.
extension UInt64: NSNumberConvertible
{
    /// The value, wrapped in an `NSNumber` instance.
    public var NSNumberValue: NSNumber
    {
        return NSNumber(unsignedLongLong: self)
    }
}

// MARK: - Float

/// `Float` is extended to conform to `NSNumberConvertible`.
extension Float: NSNumberConvertible
{
    /// The value, wrapped in an `NSNumber` instance.
    public var NSNumberValue: NSNumber
    {
        return self
    }
}

// MARK: - Double

/// `Double` is extended to conform to `NSNumberConvertible`.
extension Double: NSNumberConvertible
{
    /// The value, wrapped in an `NSNumber` instance.
    public var NSNumberValue: NSNumber
    {
        return self
    }
}

// MARK: - CGFloat

/// `CGFloat` is extended to conform to `NSNumberConvertible`.
extension CGFloat: NSNumberConvertible
{
    /// The value, wrapped in an `NSNumber` instance.
    public var NSNumberValue: NSNumber
    {
        return self
    }
}
