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
    
    func testCollectionPartitioned() {
        let array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        let parts = array.partitioned { $0 % 2 == 0 }
        XCTAssertEqual(parts.0, [2, 4, 6, 8, 10], "Collection.partitioned: 'true' array did not match")
        XCTAssertEqual(parts.1, [1, 3, 5, 7, 9], "Collection.partitioned: 'false' array did not match")
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
        XCTAssertEqual(categorised["A"]!.map({$0.name}).sorted(), ["Aaron", "Anna"])
        XCTAssertEqual(categorised["J"]!.map({$0.name}), ["John"])
        XCTAssertEqual(categorised["L"]!.map({$0.name}), ["Lucy"])
        XCTAssertEqual(categorised["M"]!.map({$0.name}), ["Michael"])
        XCTAssertEqual(categorised["P"]!.map({$0.name}).sorted(), ["Peter", "Philip"])
    }
    
    func testDictionaryOperators() {
        var dict1 = ["Foo": 1, "Bar": 2]
        let dict2 = ["Hello": 3, "World": 4, "Foo": 5]
        XCTAssertEqual(dict1 + dict2, ["Foo": 5, "Bar": 2, "Hello": 3, "World": 4], "Dictionary + operator failed")
        
        dict1 += ["Bar": 6, "Test": 7]
        XCTAssertEqual(dict1, ["Foo": 1, "Bar": 6, "Test": 7], "Dictionary += operator failed")
        
        var dict3 = ["Foo": 1, "Bar": 2]
        let dict4 = ["Bar": 3, "Test": 5]
        XCTAssertEqual(dict3 - dict4, ["Foo": 1], "Dictionary - operator failed")
        
        dict3 -= ["Bar": 3, "Test": 5, "Hello": 10]
        XCTAssertEqual(dict3, ["Foo": 1], "Dictionary -= operator failed")
    }
}
