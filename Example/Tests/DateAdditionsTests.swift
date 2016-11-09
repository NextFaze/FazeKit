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
// DateAdditionsTests.swift
// FazeKit
//
// Created by swoolcock on 09/11/2016.
//

import Foundation
import XCTest
import FazeKit

class DateAdditionsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testDateFromComponents() {
        guard
            let date = Date.dateFromComponents(day: 1, month: 4, year: 2000, hour: 14, minute: 20, second: 12)
        else {
            XCTFail("dateFromComponents: returned nil")
            return
        }
        
        let dateComps = date.dateComponents()
        XCTAssertEqual(dateComps.year, 2000, "dateComponents: year does not match")
        XCTAssertEqual(dateComps.month, 4, "dateComponents: month does not match")
        XCTAssertEqual(dateComps.day, 1, "dateComponents: day does not match")
        XCTAssertNil(dateComps.hour, "dateComponents: hour is not nil")
        XCTAssertNil(dateComps.minute, "dateComponents: minute is not nil")
        XCTAssertNil(dateComps.second, "dateComponents: second is not nil")
        
        let timeCompsNoSec = date.timeComponents()
        XCTAssertNil(timeCompsNoSec.year, "timeComponents: year is not nil")
        XCTAssertNil(timeCompsNoSec.month, "timeComponents: month is not nil")
        XCTAssertNil(timeCompsNoSec.day, "timeComponents: day is not nil")
        XCTAssertEqual(timeCompsNoSec.hour, 14, "timeComponents: hour does not match")
        XCTAssertEqual(timeCompsNoSec.minute, 20, "timeComponents: minute does not match")
        XCTAssertNil(timeCompsNoSec.second, "timeComponents: second is not nil")
        
        let timeCompsWithSec = date.timeComponents(includeSeconds: true)
        XCTAssertNil(timeCompsWithSec.year, "timeComponents(includeSeconds: true): year is not nil")
        XCTAssertNil(timeCompsWithSec.month, "timeComponents(includeSeconds: true): month is not nil")
        XCTAssertNil(timeCompsWithSec.day, "timeComponents(includeSeconds: true): day is not nil")
        XCTAssertEqual(timeCompsWithSec.hour, 14, "timeComponents(includeSeconds: true): hour does not match")
        XCTAssertEqual(timeCompsWithSec.minute, 20, "timeComponents(includeSeconds: true): minute does not match")
        XCTAssertEqual(timeCompsWithSec.second, 12, "timeComponents(includeSeconds: true): second does not match")
    }
    
    func testDateWithTimeComponents() {
        guard
            let date = Date.dateFromComponents(day: 3, month: 10, year: 2010)
        else {
            XCTFail("dateFromComponents: returned nil")
            return
        }
        
        guard
            let dateWithTimeComponents = date.dateWithTimeComponents(hour: 12, minute: 10, second: 20)
        else {
            XCTFail("dateWithTimeComponents: returned nil")
            return
        }
        
        let dateComponents = dateWithTimeComponents.dateComponents()
        let timeComponents = dateWithTimeComponents.timeComponents(includeSeconds: true)
        XCTAssertEqual(dateComponents.year, 2010, "dateWithTimeComponents: year does not match")
        XCTAssertEqual(dateComponents.month, 10, "dateWithTimeComponents: month does not match")
        XCTAssertEqual(dateComponents.day, 3, "dateWithTimeComponents: day does not match")
        XCTAssertEqual(timeComponents.hour, 12, "dateWithTimeComponents: hour does not match")
        XCTAssertEqual(timeComponents.minute, 10, "dateWithTimeComponents: minute does not match")
        XCTAssertEqual(timeComponents.second, 20, "dateWithTimeComponents: second does not match")
    }
}
