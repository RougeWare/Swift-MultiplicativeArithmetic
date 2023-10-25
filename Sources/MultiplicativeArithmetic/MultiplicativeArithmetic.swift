//
//  MultiplicativeArithmetic.swift
//  MultiplicativeArithmetic
//
//  Created by Ky Leggiero on 2019-10-23
//



/// A type with values that support multiplication and division.
///
/// See `AdditiveArithmetic` for the inspiration.
public protocol MultiplicativeArithmetic {
    
    /// Multiplies the two arguments and returns the product
    ///
    /// - Parameters:
    ///   - lhs: The multiplicand
    ///   - rhs: The multiplier
    ///
    /// - Returns: The product
    static func * (lhs: Self, rhs: Self) -> Self
    
    
    /// Multiplies the two arguments and stores the product in the first argument
    ///
    /// - Parameters:
    ///   - lhs: The multiplicand. On return, the product.
    ///   - rhs: The multiplier
    static func *= (lhs: inout Self, rhs: Self)
    
    
    /// Divides the two arguments and returns the quotient
    ///
    /// - Parameters:
    ///   - lhs: The dividend
    ///   - rhs: The divisor
    ///
    /// - Returns: The quotient
    static func / (lhs: Self, rhs: Self) -> Self
    
    
    /// Divides the two arguments and stores the quotient in the first argument
    ///
    /// - Parameters:
    ///   - lhs: The dividend. On return, the quotient.
    ///   - rhs: The divisor
    static func /= (lhs: inout Self, rhs: Self)
    
    
    /// Raises the given base to the given power.
    ///
    /// - SeeAlso: [Exponentiation – Wikipedia](https://en.wikipedia.org/wiki/Exponentiation#In_programming_languages)
    ///
    /// - Parameters:
    ///   - base:     The number to multiply by itself `exponent` number of times
    ///   - exponent: The number of times to multiply `base` by itself
    ///
    /// - Returns: `base ^ exponent`
    func pow(_ exponent: Self) -> Self
    
    
    /// Takes the square root of the given number
    ///
    /// - SeeAlso: [Square root – Wikipedia](https://en.wikipedia.org/wiki/Square_root#Computation)
    ///
    /// - Parameters:
    ///   - x: The number whose square root to find
    ///
    /// - Returns: √x
    func sqrt() -> Self
}



/// A version of `MultiplicativeArithmetic` which is simpler to implement since some of it is synthesized
public protocol SimpleMultiplicativeArithmetic: MultiplicativeArithmetic {
    
}



public extension SimpleMultiplicativeArithmetic {
    
    static func *= (lhs: inout Self, rhs: Self) {
        lhs = lhs * rhs
    }
    
    
    static func /= (lhs: inout Self, rhs: Self) {
        lhs = lhs / rhs
    }
}
