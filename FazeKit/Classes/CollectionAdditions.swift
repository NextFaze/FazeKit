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
