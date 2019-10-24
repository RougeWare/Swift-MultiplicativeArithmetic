//
//  Mandelbrot Generation.swift
//  Mandelplay
//
//  Created by Ben Leggiero on 2019-10-23.
//  Copyright © 2019 Ben Leggiero BH-1-PS
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
    
public extension Int: MultiplicativeArithmetic {
        
    }
    
public extension Double: MultiplicativeArithmetic {
        
    }
    
public extension Float: MultiplicativeArithmetic {
        
    }
    
public extension UInt: MultiplicativeArithmetic{
        
    }
}
