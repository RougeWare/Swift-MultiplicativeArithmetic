//
//  Default Conformances.swift
//  MultiplicativeArithmetic
//
//  Created by Ky Leggiero on 2019-10-26
//

import Foundation
import CoreGraphics



// MARK: floating-point

public extension FloatingPoint where Self: MultiplicativeArithmetic {
    func sqrt() -> Self { CoreGraphics.sqrt(self) }
}



extension CGFloat: MultiplicativeArithmetic {
    public func pow(_ exponent: Self) -> Self { CoreGraphics.pow(self, exponent) }
}
extension Float32: MultiplicativeArithmetic {
    public func pow(_ exponent: Self) -> Self { CoreGraphics.pow(self, exponent) }
}
extension Float64: MultiplicativeArithmetic {
    public func pow(_ exponent: Self) -> Self { CoreGraphics.pow(self, exponent) }
}
#if (arch(i386) || arch(x86_64)) && !os(Windows)
extension Float80: MultiplicativeArithmetic {
    public func pow(_ exponent: Self) -> Self { CoreGraphics.pow(self, exponent) }
}
#endif



// MARK: - integers

public extension BinaryInteger where Self: MultiplicativeArithmetic {
    func pow(_ exponent: Self) -> Self { .init(CoreGraphics.pow(CGFloat(self), CGFloat(exponent))) }
    func sqrt() -> Self { .init(CoreGraphics.sqrt(CGFloat(self))) }
}



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



// MARK: - big decimal

let numIterationsToConvergence: UInt8 = 6



extension Decimal: MultiplicativeArithmetic {
    
    /// - Attention: Because of how Decimal is implemented in Swift's `Foundation` library, this first rounds `exponent` to an integer before exponentiating
    public func pow(_ exponent: Self) -> Self {
        Foundation.pow(self, Int(truncating: NSDecimalNumber(decimal: exponent).rounding(accordingToBehavior: .halfUp)))
    }
    
    
    // Adapted from https://www.cocoawithlove.com/2008/05/square-root-numerical-fun-with.html
    public func sqrt() -> Self {
        guard self > .zero else {
            return .quietNaN
        }
        
        return (0 ..< numIterationsToConvergence).reduce(into: (self + 1) / 2) { guess, _ in
            guess = ((self / guess) + guess) / 2
            // deliberately ignore ObjC exceptions and assume the last guess is good enough
        }
    }
}



private final class RoundHalfUpDecimalBehavior: NSDecimalNumberBehaviors {
    func roundingMode() -> NSDecimalNumber.RoundingMode { .plain }
    
    
    func scale() -> Int16 { 0 }
    
    
    func exceptionDuringOperation(_ operation: Selector, error: NSDecimalNumber.CalculationError, leftOperand: NSDecimalNumber, rightOperand: NSDecimalNumber?) -> NSDecimalNumber? {
        switch error {
        case .noError:
            assertionFailure("""
                I was told to handle an arithmetic exception.. and then told there was none? I'll just return the left operand I guess??
                
                operation: \(operation)
                leftOperand: \(leftOperand)
                rightOperand: \(String(describing: rightOperand))
                """)
            return leftOperand
            
        case .lossOfPrecision:
            return leftOperand
            
        case .underflow:
            return .zero
            
        case .overflow:
            return .maximum
            
        case .divideByZero:
            return nil
            
        @unknown default:
            assertionFailure("Tell Ky to account for \(error) in \(#file):\(#line) (\(#function))")
            return nil
        }
    }
}



private extension NSDecimalNumberBehaviors where Self == RoundHalfUpDecimalBehavior {
    static var halfUp: Self { Self() }
}



private final class NoError: NSException {
    init() { super.init(name: NSExceptionName("NoError"), reason: nil) }
    required init?(coder: NSCoder) { super.init(coder: coder) }
}
