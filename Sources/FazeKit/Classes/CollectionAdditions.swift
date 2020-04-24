//
// Copyright 2016 NextFaze
//
// Licensed under the Apache License, Version 2.0 (the "License"); you may not
// use this file except in compliance with the License. You may obtain a copy
// of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
// WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
// License for the specific language governing permissions and limitations
// under the License.
//
// CollectionAdditions.swift
// FazeKit
//
// Created by swoolcock on 12/08/2016.
//

public extension Collection {
    @available(*, deprecated, message: "Use first(where:) instead")
    func firstMatch(predicate: (Iterator.Element) throws -> Bool) rethrows -> Iterator.Element? {
        guard let idx = try self.index(where: predicate) else { return nil }
        return self[idx]
    }
    
    func partitioned(by comparisonBlock: (Iterator.Element) -> Bool) -> ([Iterator.Element], [Iterator.Element]) {
        var trueArray: [Iterator.Element] = []
        var falseArray: [Iterator.Element] = []
        for item in self {
            if comparisonBlock(item) {
                trueArray.append(item)
            } else {
                falseArray.append(item)
            }
        }
        return (trueArray, falseArray)
    }
    
    // Makes nil coalescing look nicer:
    //    Nice:     if foo?.isNotEmpty ?? false
    // Rather than:
    //    Ugly:     if foo?.isEmpty == false
    //    Uglier:   if !(foo ?? []).isEmpty
    //    Ugliest:  if !(foo?.isEmpty ?? true)
    var isNotEmpty: Bool { return !self.isEmpty }
}

// Borrowed from: http://stackoverflow.com/a/31220067
public extension Sequence {
    /// Categorises elements of self into a dictionary, with the keys given by keyFunc
    func categorise<U: Hashable>(_ keyFunc: (Iterator.Element) -> U) -> [U: [Iterator.Element]] {
        var dict: [U: [Iterator.Element]] = [:]
        for el in self {
            let key = keyFunc(el)
            if case nil = dict[key]?.append(el) { dict[key] = [el] }
        }
        return dict
    }
}

public func +<K, V>(lhs: Dictionary<K, V>, rhs: Dictionary<K, V>) -> Dictionary<K, V> {
    var dict = Dictionary<K, V>()
    lhs.forEach { dict[$0.key] = $0.value }
    rhs.forEach { dict[$0.key] = $0.value }
    return dict
}

public func -<K, V>(lhs: Dictionary<K, V>, rhs: Dictionary<K, V>) -> Dictionary<K, V> {
    var dict = Dictionary<K, V>()
    lhs.forEach { dict[$0.key] = $0.value }
    rhs.forEach { dict.removeValue(forKey: $0.key) }
    return dict
}

public func +=<K, V>(lhs: inout Dictionary<K, V>, rhs: Dictionary<K, V>) {
    rhs.forEach { lhs[$0.key] = $0.value }
}

public func -=<K, V>(lhs: inout Dictionary<K, V>, rhs: Dictionary<K, V>) {
    rhs.forEach { lhs.removeValue(forKey: $0.key) }
}

public extension Dictionary where Key == String, Value == Any {
    func value(forPath path: String) -> Any? {
        let tokens = path.components(separatedBy: "/")
        if tokens.count == 1 {
            return self[tokens[0]] ?? nil
        } else if tokens.count > 1, let dict = self[tokens[0]] as? [String: Any] {
            let subPath = String(path[path.index(path.startIndex, offsetBy: tokens[0].count + 1)...])
            return dict.value(forPath: subPath)
        }
        return nil
    }
    
    mutating func setValue(_ value: Any, forPath path: String, populating: Bool = false, mergingDictionaries: Bool = false) {
        let tokens = path.components(separatedBy: "/")
        if tokens.count == 1 {
            if let dict = self[tokens[0]] as? [String: Any], let value = value as? [String: Any], mergingDictionaries {
                self[tokens[0]] = dict.deepMerge(value)
            } else {
                self[tokens[0]] = value
            }
        } else if tokens.count > 1 {
            if var dict = self[tokens[0]] as? [String: Any] ?? (populating ? [String: Any]() : nil) {
                let subPath = String(path[path.index(path.startIndex, offsetBy: tokens[0].count + 1)...])
                dict.setValue(value, forPath: subPath, populating: populating, mergingDictionaries: mergingDictionaries)
                self[tokens[0]] = dict
            }
        }
    }
    
    mutating func clearValue(forPath path: String) {
        // check value exists at path first
        if self.value(forPath: path) != nil {
            let tokens = path.components(separatedBy: "/")
            if tokens.count == 1, let key = tokens.first {
                self.removeValue(forKey: key)
            } else if tokens.count > 1, let key = tokens.first, var dict = self[key] as? [String: Any] {
                let subPath = String(path[path.index(path.startIndex, offsetBy: tokens[0].count + 1)...])
                dict.clearValue(forPath: subPath)
                self[key] = dict // Because copy :(
            }
            else {
                fatalError("Failed to clear value for path \(path)")
            }
        }
    }
    
    func deepMerge(_ other: [String: Any]) -> [String: Any] {
        return self.merging(other, uniquingKeysWith: { (old, new) -> Any in
            if let old = old as? [String: Any], let new = new as? [String: Any] {
                return old.deepMerge(new)
            }
            return new
        })
    }
}
