//
// Copyright 2017 NextFaze
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
//  StringAdditionsTests.swift
//  FazeKit_Tests
//
//  Created by Ricardo Santos on 19/12/17.
//

import Foundation
import XCTest
import FazeKit

class StringAdditionsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSubscript() {
        let string = "OMG. I can't believe it's a thing!"
        XCTAssertTrue(string[0] == "O", "String.subscript: should return the Character O")
        XCTAssertTrue(string[1] == "M", "String.subscript: should return the Character M")
        XCTAssertTrue(string[2] == "G", "String.subscript: should return the Character G")
    }
    
    func testSubstring() {
        let string = "OMG. Is this even a thing?"
        XCTAssertTrue(string.substring(0, length: 3) == "OMG", "String.substring: should create a new substring")
    }
    
    func testTrim() {
        let string = "   Hello World   \n\n\n "
        XCTAssertTrue(string.trim() == "Hello World", "String.trim(): should remove all whitespace and newlines")
    }
    
}
