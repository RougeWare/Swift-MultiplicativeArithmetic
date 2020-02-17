//
//  Default Conformances.swift
//  MultiplicativeArithmetic
//
//  Created by Ben Leggiero on 2019-10-26.
//  Copyright © 2019 Ben Leggiero BH-1-PS
//

import Foundation
import CoreGraphics



extension CGFloat: MultiplicativeArithmetic {}
extension Float32: MultiplicativeArithmetic {}
extension Float64: MultiplicativeArithmetic {}
#if (arch(i386) || arch(x86_64)) && !os(Windows)
extension Float80: MultiplicativeArithmetic {}
#endif



extension Int: MultiplicativeArithmetic {}
extension Int8: MultiplicativeArithmetic {}
extension Int16: MultiplicativeArithmetic {}
extension Int32: MultiplicativeArithmetic {}
extension Int64: MultiplicativeArithmetic {}



extension UInt: MultiplicativeArithmetic {}
extension UInt8: MultiplicativeArithmetic {}
extension UInt16: MultiplicativeArithmetic {}
extension UInt32: MultiplicativeArithmetic {}
extension UInt64: MultiplicativeArithmetic {}



extension Decimal: MultiplicativeArithmetic {}
