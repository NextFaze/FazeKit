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
// NSProcessInfoAdditionsTests.swift
// FazeKit
//
// Created by swoolcock on 16/08/2016.
//

import UIKit
import XCTest
import FazeKit

class NSProcessInfoAdditionsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testOperatingSystemVersion() {
        let osVersion = NSOperatingSystemVersion(majorVersion: 8, minorVersion: 1, patchVersion: 2)
        XCTAssertTrue(osVersion == 8, "'== major' failed")
        XCTAssertTrue(osVersion == (8, 1), "'== (major, minor)' failed")
        XCTAssertTrue(osVersion == (8, 1, 2), "'== (major, minor, patch)' failed")
        XCTAssertFalse(osVersion != 8, "'!= major' failed")
        XCTAssertFalse(osVersion != (8, 1), "'!= (major, minor)' failed")
        XCTAssertFalse(osVersion != (8, 1, 2), "'!= (major, minor, patch)' failed")
        XCTAssertTrue(osVersion >= 8, "'>= major' failed")
        XCTAssertTrue(osVersion >= (8, 1), "'>= (major, minor)' failed")
        XCTAssertTrue(osVersion >= (8, 1, 2), "'>= (major, minor, patch)' failed")
        XCTAssertFalse(osVersion >= 9, "'>= major' failed")
        XCTAssertFalse(osVersion >= (8, 2), "'>= (major, minor)' failed")
        XCTAssertFalse(osVersion >= (8, 1, 3), "'>= (major, minor, patch)' failed")
        XCTAssertTrue(osVersion < 9, "'< major' failed")
        XCTAssertTrue(osVersion < (8, 2), "'< (major, minor)' failed")
        XCTAssertTrue(osVersion < (8, 1, 3), "'< (major, minor, patch)' failed")
        XCTAssertTrue(osVersion <= 8, "'<= major' failed")
        XCTAssertTrue(osVersion <= (8, 1), "'<= (major, minor)' failed")
        XCTAssertTrue(osVersion <= (8, 1, 2), "'<= (major, minor, patch)' failed")
        XCTAssertFalse(osVersion <= 7, "'<= major' failed")
        XCTAssertFalse(osVersion <= (8, 0), "'<= (major, minor)' failed")
        XCTAssertFalse(osVersion <= (8, 1, 1), "'<= (major, minor, patch)' failed")
        XCTAssertTrue(osVersion > 7, "'> major' failed")
        XCTAssertTrue(osVersion > (8, 0), "'> (major, minor)' failed")
        XCTAssertTrue(osVersion > (8, 1, 1), "'> (major, minor, patch)' failed")
    }
}
