// Attributed
// Written in 2015 by Nate Stedman <nate@natestedman.com>
//
// To the extent possible under law, the author(s) have dedicated all copyright and
// related and neighboring rights to this software to the public domain worldwide.
// This software is distributed without any warranty.
//
// You should have received a copy of the CC0 Public Domain Dedication along with
// this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

/// Enumerates supported ligature settings.
public enum Ligature: Int
{
    /// No ligatures will be used.
    case none = 0
    
    /// The default ligatures will be used.
    case `default` = 1
    
    #if os(OSX)
    /// All ligatures will be used. This case is only available on OS X.
    case All = 2
    #endif
}
