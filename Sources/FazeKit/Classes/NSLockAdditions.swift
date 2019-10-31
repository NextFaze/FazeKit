//
//  NSLockAdditions.swift
//  FazeKit
//
//  Created by Shane Woolcock on 10/10/19.
//

import Foundation

public extension NSLock {
    @discardableResult
    func lockAndExecute(timeout: TimeInterval = 0, execute: () -> Void) -> Bool {
        if timeout == 0 {
            self.lock()
            defer { self.unlock() }
            execute()
            return true
        }
        
        if self.lock(before: Date().addingTimeInterval(timeout)) {
            defer { self.unlock() }
            execute()
            return true
        }
        
        return false
    }
}
