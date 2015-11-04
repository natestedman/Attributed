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
    /// The value of the type, as an `NSNumber` instance.
    var NSNumberValue: NSNumber { get }
}

// MARK: - NSNumber
extension NSNumber: NSNumberConvertible
{
    public var NSNumberValue: NSNumber
    {
        return self
    }
}

// MARK: - Int
extension Int: NSNumberConvertible
{
    public var NSNumberValue: NSNumber
    {
        return self
    }
}

// MARK: - UInt
extension UInt: NSNumberConvertible
{
    public var NSNumberValue: NSNumber
    {
        return self
    }
}

// MARK: - Int8
extension Int8: NSNumberConvertible
{
    public var NSNumberValue: NSNumber
    {
        return Int(self)
    }
}

// MARK: - UInt8
extension UInt8: NSNumberConvertible
{
    public var NSNumberValue: NSNumber
    {
        return UInt(self)
    }
}

// MARK: - Int16
extension Int16: NSNumberConvertible
{
    public var NSNumberValue: NSNumber
    {
        return Int(self)
    }
}

// MARK: - UInt16
extension UInt16: NSNumberConvertible
{
    public var NSNumberValue: NSNumber
    {
        return UInt(self)
    }
}

// MARK: - Int32
extension Int32: NSNumberConvertible
{
    public var NSNumberValue: NSNumber
    {
        return Int(self)
    }
}

// MARK: - UInt32
extension UInt32: NSNumberConvertible
{
    public var NSNumberValue: NSNumber
    {
        return UInt(self)
    }
}

// MARK: - Int64
extension Int64: NSNumberConvertible
{
    public var NSNumberValue: NSNumber
    {
        return NSNumber(longLong: self)
    }
}

// MARK: - UInt64
extension UInt64: NSNumberConvertible
{
    public var NSNumberValue: NSNumber
    {
        return NSNumber(unsignedLongLong: self)
    }
}

// MARK: - Float
extension Float: NSNumberConvertible
{
    public var NSNumberValue: NSNumber
    {
        return self
    }
}

// MARK: - Double
extension Double: NSNumberConvertible
{
    public var NSNumberValue: NSNumber
    {
        return self
    }
}

// MARK: - CGFloat
extension CGFloat: NSNumberConvertible
{
    public var NSNumberValue: NSNumber
    {
        return self
    }
}
