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
// MulticastTests.swift
// FazeKit
//
// Created by swoolcock on 16/08/2016.
//

import UIKit
import XCTest
import FazeKit

class MulticastTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testMulticast() {
        var multi = Multicast()
        var temp: Int = 0
        
        multi += { temp += 1 }
        multi.invoke()
        XCTAssertEqual(temp, 1)
        
        multi += { temp += 3 }
        multi += { temp -= 10 }
        multi.invoke()
        XCTAssertEqual(temp, -5)
        
        let test = MulticastTestClass()
        multi += (test, #selector(MulticastTestClass.testFunc1))
        multi.invoke()
        XCTAssertEqual(temp, -11)
        XCTAssertEqual(test.value, 10)
        
        multi += (test, #selector(MulticastTestClass.testFunc2))
        multi.invoke()
        XCTAssertEqual(temp, -17)
        XCTAssertEqual(test.value, 60)
        
        multi -= test
        multi.invoke()
        XCTAssertEqual(temp, -23)
        XCTAssertEqual(test.value, 60)
    }
}

private class MulticastTestClass {
    var value: Int = 0
    
    @objc func testFunc1() {
        value += 10
    }
    
    @objc func testFunc2() {
        value += 40
    }
}
