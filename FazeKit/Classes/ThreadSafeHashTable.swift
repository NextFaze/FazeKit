//
//  ThreadSafeHashTable.swift
//  FazeKit
//
//  Created by Shane Woolcock on 10/10/19.
//

import Foundation

open class ThreadSafeHashTable<ObjectType: AnyObject> {
    public typealias HashTableType = NSHashTable<ObjectType>
    
    private let lock = NSLock()
    private let hashTable: HashTableType
    
    open var timeout: TimeInterval
    
    public init(_ hashTable: HashTableType, timeout: TimeInterval = 0) {
        self.hashTable = hashTable
        self.timeout = timeout
    }
    
    public init(weakObjects: Bool, timeout: TimeInterval = 0) {
        self.hashTable = weakObjects ? HashTableType.weakObjects() : HashTableType()
        self.timeout = timeout
    }
    
    open var allObjects: [ObjectType] {
        var rv: [ObjectType] = []
        self.lock.lockAndExecute(timeout: self.timeout) {
            rv = self.hashTable.allObjects
        }
        return rv
    }
    
    open var count: Int {
        var rv: Int = 0
        self.lock.lockAndExecute(timeout: self.timeout) {
            rv = self.hashTable.count
        }
        return rv
    }
    
    open func add(_ object: ObjectType?) {
        guard let object = object else { return }
        self.lock.lockAndExecute(timeout: self.timeout) {
            self.hashTable.add(object)
        }
    }
    
    open func add(contentsOf array: [ObjectType]) {
        guard !array.isEmpty else { return }
        self.lock.lockAndExecute(timeout: self.timeout) {
            array.forEach { self.hashTable.add($0) }
        }
    }
    
    open func remove(_ object: ObjectType?) {
        guard let object = object else { return }
        self.lock.lockAndExecute(timeout: self.timeout) {
            self.hashTable.remove(object)
        }
    }
    
    open func remove(contentsOf array: [ObjectType]) {
        guard !array.isEmpty else { return }
        self.lock.lockAndExecute(timeout: self.timeout) {
            array.forEach { self.hashTable.remove($0) }
        }
    }
    
    open func removeAllObjects() {
        self.lock.lockAndExecute(timeout: self.timeout) {
            self.hashTable.removeAllObjects()
        }
    }
    
    open func contains(_ object: ObjectType?) -> Bool {
        guard let object = object else { return false }
        var rv: Bool = false
        self.lock.lockAndExecute(timeout: self.timeout) {
            rv = self.hashTable.contains(object)
        }
        return rv
    }
    
    open func contains(where predicate: (ObjectType) -> Bool) -> Bool {
        var rv: Bool = false
        self.lock.lockAndExecute(timeout: self.timeout) {
            rv = self.hashTable.allObjects.contains(where: predicate)
        }
        return rv
    }
    
    open func first(where predicate: (ObjectType) -> Bool) -> ObjectType? {
        var rv: ObjectType?
        self.lock.lockAndExecute(timeout: self.timeout) {
            rv = self.hashTable.allObjects.first(where: predicate)
        }
        return rv
    }
}
