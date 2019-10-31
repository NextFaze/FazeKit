//
//  Disposable.swift
//  FazeKit
//
//  Created by Shane Woolcock on 24/9/19.
//
//  Works similarly to C#'s using/IDisposable pattern, implemented with defer.
//
//  /* Example of regular initializer */
//  using(FileHandle(forReadingFrom: url)) { handle in
//      /* use handle here */
//  }
//  /* FileHandle has been closed */
//
//  /* Example of failable initializer */
//  using(FileHandle(forReadingAtPath: filename)) { handle in
//      guard let handle = handle else {
//          print("Error opening file: \(filename)")
//          return
//      }
//      /* use handle here */
//  }
//  /* FileHandle has been closed if it was successfully opened */

import Foundation

public protocol Disposable {
    func dispose()
}

public func using<T: Disposable>(_ value: @autoclosure () throws -> T, execute: (T) throws -> Void) rethrows {
    let value = try value()
    defer { value.dispose() }
    try execute(value)
}

public func using<T: Disposable>(_ value: @autoclosure () throws -> T?, execute: (T?) throws -> Void) rethrows {
    let value = try value()
    defer { value?.dispose() }
    try execute(value)
}

extension FileHandle: Disposable {
    public func dispose() {
        self.closeFile()
    }
}

extension UnsafeMutablePointer: Disposable {
    public func dispose() {
        self.deallocate()
    }
}

extension UnsafePointer: Disposable {
    public func dispose() {
        self.deallocate()
    }
}
