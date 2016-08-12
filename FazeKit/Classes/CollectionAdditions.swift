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

public extension CollectionType {
    public var last: Self.Generator.Element? {
        return self[self.endIndex.advancedBy(-1)]
    }
    
    public func firstMatch(@noescape predicate: (Generator.Element) throws -> Bool) rethrows -> Generator.Element? {
        guard let idx = try self.indexOf(predicate) else { return nil }
        return self[idx]
    }
}

// Borrowed from: http://stackoverflow.com/a/31220067
public extension SequenceType {
    /// Categorises elements of self into a dictionary, with the keys given by keyFunc
    public func categorise<U: Hashable>(@noescape keyFunc: Generator.Element -> U) -> [U: [Generator.Element]] {
        var dict: [U:[Generator.Element]] = [:]
        for el in self {
            let key = keyFunc(el)
            if case nil = dict[key]?.append(el) { dict[key] = [el] }
        }
        return dict
    }
}
