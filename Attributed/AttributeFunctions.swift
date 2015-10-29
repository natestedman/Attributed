// Attributed
// Written in 2015 by Nate Stedman <nate@natestedman.com>
//
// To the extent possible under law, the author(s) have dedicated all copyright and
// related and neighboring rights to this software to the public domain worldwide.
// This software is distributed without any warranty.
//
// You should have received a copy of the CC0 Public Domain Dedication along with
// this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

#if os(iOS)
    import UIKit
#else
    import AppKit
#endif

/**
 Applies a text attachment attribute to the enclosed attributed strings.
 
 The text attachment value will not override a text attachment value set deeper in the hierarchy.
 
 - parameter attachment: The text attachment setting.
 - parameter strings:    The attributed strings to apply the text attachment to.
 */
public func Attachment(attachment: NSTextAttachment, _ strings: AttributedStringConvertible...)
    -> AttributedStringConvertible
{
    return Attribute(NSAttachmentAttributeName, attachment, strings)
}

/**
 Applies a background color attribute to the enclosed attributed strings.
 
 The background color will not override a background color set deeper in the hierarchy.
 
 - parameter color:   The background color.
 - parameter strings: The attributed strings to apply the background color to.
 */
public func Background(color: ColorType, _ strings: AttributedStringConvertible...) -> AttributedStringConvertible
{
    return Attribute(NSBackgroundColorAttributeName, color, strings)
}

/**
 Applies a baseline offset attribute to the enclosed attributed strings.
 
 The baseline offset value will not override a baseline offset value set deeper in the hierarchy.
 
 - parameter offset:  The baseline offset value.
 - parameter strings: The attributed strings to apply the baseline offset to.
 */
public func BaselineOffset(offset: CGFloat, _ strings: AttributedStringConvertible...) -> AttributedStringConvertible
{
    return Attribute(NSBaselineOffsetAttributeName, offset, strings)
}

/**
 Applies a foreground color attribute to the enclosed attributed strings.
 
 The foreground color will not override a foreground color set deeper in the hierarchy.
 
 - parameter color:   The foreground color.
 - parameter strings: The attributed strings to apply the foreground color to.
 */
public func Color(color: ColorType, _ strings: AttributedStringConvertible...) -> AttributedStringConvertible
{
    return Attribute(NSForegroundColorAttributeName, color, strings)
}

/**
 Applies a font attribute to the enclosed attributed strings.
 
 The font will not override a font set deeper in the hierarchy.
 
 - parameter font:    The font.
 - parameter strings: The attributed strings to apply the font to.
 */
public func Font(font: FontType, _ strings: AttributedStringConvertible...) -> AttributedStringConvertible
{
    return Attribute(NSFontAttributeName, font, strings)
}

/**
 Applies a kerning attribute to the enclosed attributed strings.
 
 The kerning value will not override a kerning value set deeper in the hierarchy.
 
 - parameter kerning: The kerning value.
 - parameter strings: The attributed strings to apply the font to.
 */
public func Kern(kerning: CGFloat, _ strings: AttributedStringConvertible...) -> AttributedStringConvertible
{
    return Attribute(NSKernAttributeName, kerning, strings)
}

/**
 Applies a ligature setting to the enclosed attributed strings.
 
 The ligature setting will not override a ligature setting set deeper in the hierarchy.
 
 - parameter ligature: The ligature setting.
 - parameter strings:  The attributed strings to apply the ligature setting to.
 */
public func Ligature(ligature: AttributedLigature, _ strings: AttributedStringConvertible...)
    -> AttributedStringConvertible
{
    return Attribute(NSLigatureAttributeName, ligature.rawValue, strings)
}

/**
 Applies a paragraph style to the enclosed attributed strings.
 
 The paragraph style will not override a paragraph style set deeper n the hierarchy.
 
 - parameter style:   The paragraph style.
 - parameter strings: The attributed strings to apply the paragraph style to.
 */
public func Style(style: NSParagraphStyle, _ strings: AttributedStringConvertible...) -> AttributedStringConvertible
{
    return Attribute(NSParagraphStyleAttributeName, style, strings)
}