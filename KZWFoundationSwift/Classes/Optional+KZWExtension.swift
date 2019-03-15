//
//  Optional+KZWExtension.swift
//  KZWFoundationSwfit
//
//  Created by yang ou on 2019/3/15.
//

import Foundation

public extension Optional {
    // 可选值为空的时候返回 true
    public var isNone: Bool {
        switch self {
        case .none:
            return true
        case .some:
            return false
        }
    }
    
    /// 可选值非空返回 true
    public var isSome: Bool {
        return !isNone
    }
    
    /// 返回可选值或默认值
    /// - 参数: 如果可选值为空，将会默认值
    public func or(_ default: Wrapped) -> Wrapped {
        return self ?? `default`
    }
    
    /// 返回可选值或 `else` 表达式返回的值
    /// 例如. optional.or(else: print("Arrr"))
    public func or(else: @autoclosure () -> Wrapped) -> Wrapped {
        return self ?? `else`()
    }
    
    /// 返回可选值或者 `else` 闭包返回的值
    // 例如. optional.or(else: {
    /// ... do a lot of stuff
    /// })
    public func or(else: () -> Wrapped) -> Wrapped {
        return self ?? `else`()
    }
    
    /// 当可选值不为空时，返回可选值
    /// 如果为空，抛出异常
    public func or(throw exception: Error) throws -> Wrapped {
        guard let unwrapped = self else { throw exception }
        return unwrapped
    }
    
    /// 可选值变换返回，如果可选值为空，则返回默认值
    /// - 参数 fn: 映射值的闭包
    /// - 参数 default: 可选值为空时，将作为返回值
    public func map<T>(_ fn: (Wrapped) throws -> T, default: T) rethrows -> T {
        return try map(fn) ?? `default`
    }
    
    /// 可选值变换返回，如果可选值为空，则调用 `else` 闭包
    /// - 参数 fn: 映射值的闭包
    /// - 参数 else: The function to call if the optional is empty
    public func map<T>(_ fn: (Wrapped) throws -> T, else: () throws -> T) rethrows -> T {
        return try map(fn) ?? `else`()
    }
    
    /// 当可选值不为空时，执行 `some` 闭包
    public func on(some: () throws -> Void) rethrows {
        if self != nil { try some() }
    }
    
    /// 当可选值为空时，执行 `none` 闭包
    public func on(none: () throws -> Void) rethrows {
        if self == nil { try none() }
    }
    
    /// 可选值不为空且可选值满足 `predicate` 条件才返回，否则返回 `nil`
    public func filter(_ predicate: (Wrapped) -> Bool) -> Wrapped? {
        guard let unwrapped = self,
            predicate(unwrapped) else { return nil }
        return self
    }
    
    /// 可选值不为空时返回，否则 crash
    public func expect(_ message: String) -> Wrapped {
        guard let value = self else { fatalError(message) }
        return value
    }
}

public extension Optional where Wrapped == Error {
    /// 当可选值不为空时，执行 `else`
    public func or(_ else: (Error) -> Void) {
        guard let error = self else { return }
        `else`(error)
    }
}
