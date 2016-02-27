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
    
    /// A typealias for `UIFont`.
    public typealias FontType = UIFont
    
    /// A typealias for `UIColor`.
    public typealias ColorType = UIColor
#else
    import AppKit
    
    /// A typealias for `NSFont`.
    public typealias FontType = NSFont
    
    /// A typealias for `NSColor`.
    public typealias ColorType = NSColor
#endif
