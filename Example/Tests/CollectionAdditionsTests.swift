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
// CollectionAdditionsTests.swift
// FazeKit
//
// Created by swoolcock on 09/11/2016.
//

import Foundation
import XCTest
import FazeKit

class CollectionAdditionsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCollectionLast() {
        let intArray = [3, 1, 4, 1, 5]
        XCTAssertEqual(intArray.last, 5, "Collection.last: last element did not match")
    }
    
    func testCollectionFirstMatch() {
        let stringArray = ["hello", "world", "this", "is", "a", "unit", "test"]
        XCTAssertEqual(stringArray.firstMatch { $0[0] == "t" }, "this", "Collection.firstMatch: couldn't find element")
        XCTAssertNil(stringArray.firstMatch { $0[0] == "z" }, "Collection.firstMatch: found something we shouldn't")
    }
    
    func testSequenceCategorise() {
        struct CategoriseTestStruct {
            var name: String
            var age: Int
        }
        
        var categoriseArray: [CategoriseTestStruct] = []
        categoriseArray.append(CategoriseTestStruct(name: "John", age: 32))
        categoriseArray.append(CategoriseTestStruct(name: "Peter", age: 12))
        categoriseArray.append(CategoriseTestStruct(name: "Michael", age: 30))
        categoriseArray.append(CategoriseTestStruct(name: "Philip", age: 22))
        categoriseArray.append(CategoriseTestStruct(name: "Lucy", age: 53))
        categoriseArray.append(CategoriseTestStruct(name: "Anna", age: 25))
        categoriseArray.append(CategoriseTestStruct(name: "Aaron", age: 40))
        
        let categorised = categoriseArray.categorise { return $0.name[0] }
        // result should be grouped on A, J, L, M, and P
        XCTAssertEqual(categorised.count, 5, "Sequence.categorise: wrong number of categories")
        XCTAssertEqual(categorised.keys.sorted(), ["A", "J", "L", "M", "P"], "Sequence.categorise: wrong categories")
        XCTAssertEqual(categorised["A"]?.count, 2)
        XCTAssertEqual(categorised["J"]?.count, 1)
        XCTAssertEqual(categorised["L"]?.count, 1)
        XCTAssertEqual(categorised["M"]?.count, 1)
        XCTAssertEqual(categorised["P"]?.count, 2)
        XCTAssertEqual(categorised["A"]!.flatMap({$0.name}).sorted(), ["Aaron", "Anna"])
        XCTAssertEqual(categorised["J"]!.flatMap({$0.name}), ["John"])
        XCTAssertEqual(categorised["L"]!.flatMap({$0.name}), ["Lucy"])
        XCTAssertEqual(categorised["M"]!.flatMap({$0.name}), ["Michael"])
        XCTAssertEqual(categorised["P"]!.flatMap({$0.name}).sorted(), ["Peter", "Philip"])
    }
}
