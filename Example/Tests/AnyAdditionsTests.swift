//
//  AnyAdditionsTests.swift
//  FazeKit_Example
//
//  Created by Shane Woolcock on 11/10/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import FazeKit
import XCTest

class AnyAdditionsTests: XCTestCase {
    func testAnyCasting() {
        let testDict: [String: Any] = ["foo": "bar"]
        let testArray: [Any] = [1, 2, 3]
        
        self.performCastTests(1, ["int", "double", "float", "boolNumber"])
        self.performCastTests(1.5, ["int", "double", "float", "boolNumber"])
        self.performCastTests(true, ["bool", "boolNumber"])
        self.performCastTests(false, ["bool", "boolNumber"])
        self.performCastTests(Date(), ["date"])
        self.performCastTests(testDict, ["dict"])
        self.performCastTests(testArray, ["array"])
    }
    
    private func performCastTests(_ value: Any, _ validTypes: [String]) {
        let opt: Any? = value
        self.performCastTest(value, opt.stringValue, "string", validTypes)
        self.performCastTest(value, opt.floatValue, "float", validTypes)
        self.performCastTest(value, opt.doubleValue, "double", validTypes)
        self.performCastTest(value, opt.intValue, "int", validTypes)
        self.performCastTest(value, opt.boolValue, "bool", validTypes)
        self.performCastTest(value, opt.dictValue, "dict", validTypes)
        self.performCastTest(value, opt.arrayValue, "array", validTypes)
        self.performCastTest(value, opt.boolNumberValue, "boolNumber", validTypes)
        self.performCastTest(value, opt.dateValue, "date", validTypes)
    }
    
    private func performCastTest(_ value: Any, _ eval: Any?, _ type: String, _ validTypes: [String]) {
        let desc = String(describing: value)
        XCTAssertEqual(eval != nil, validTypes.contains(type), eval != nil ? "Evaluated \(desc) to \(type) when it shouldn't have" : "Didn't evaluate \(desc) to \(type) when it should have")
    }
}
