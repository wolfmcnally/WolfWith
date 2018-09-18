//
//  WithOperator.swift
//  WolfWith
//
//  Created by Wolf McNally on 6/24/17.
//  Copyright © 2017 Wolf McNally.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

///
/// With-Operator
///
/// The special character here ("•") is called the "bullet" and is typed by pressing Option-8.
///
infix operator • : CastingPrecedence
infix operator •• : CastingPrecedence
infix operator ••• : CastingPrecedence

/// This version of the with-operator is used to configure reference type (class) instances
/// and also returns the reference for assignment:
///
///   let view = View() • {
///       $0.backgroundColor = .red
///   }
///
/// Because the right-hand side of the with-operator is a class instance, you can operate on a
/// pre-existing instance:
///
///   view • {
///       $0.alpha = 0.5
///   }
@discardableResult public func • <T: AnyObject>(lhs: T, rhs: (T) throws -> Void) rethrows -> T {
    try rhs(lhs)
    return lhs
}

/// This version of the with-operator is used to configure value type (struct) instances
/// and also returns the modified copy of the instance for assignment.
///
/// Because the right-hand side of the with-operator is a struct instance, you *must*
/// assign the result of this operator. The assignee may be declared as `let`.
///
///   let point = Point.zero •• {
///       $0.x = 10
///   }
///
@discardableResult public func •• <T: Any>(lhs: T, rhs: (inout T) throws -> Void) rethrows -> T {
    var lhs = lhs
    try rhs(&lhs)
    return lhs
}

/// This version of the with-operator is used to configure pre-existing value type
/// (struct) instance.
///
/// Because this modifies the instance in place, it must be delared as `var`.
///
///   var point: Point = .zero
///
///   point ••• {
///       $0.x = 10
///   }
///
public func ••• <T: Any>(lhs: inout T, rhs: (inout T) throws -> Void) rethrows {
    try rhs(&lhs)
}
