//
//  CodableAdditionsTests.swift
//  FazeKit_Example
//
//  Created by Shane Woolcock on 11/10/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import FazeKit
import XCTest

class CodableAdditionsTests: XCTestCase {
    func testDecodeDict() {
        let source: [String: Any] = ["dict": ["string": "value",
                                              "double": 1.5,
                                              "bool": true,
                                              "dict": ["Foo": "Bar"],
                                              "array": [1, "a", true, [1, 2]]],
                                     "array": [1, ["foo": "bar"]]]
        guard let data = try? JSONSerialization.data(withJSONObject: source, options: []) else {
            XCTFail("Couldn't serialise test data")
            return
        }
        
        let decoder = JSONDecoder()
        guard let decoded = try? decoder.decode(TestStruct.self, from: data) else {
            XCTFail("Couldn't decode test data")
            return
        }
        
        XCTAssertEqual(decoded.dict.count, 5, "Expected 5 key/value pairs in dict")
        XCTAssertEqual(decoded.array.count, 2, "Expected 2 values in array")
        XCTAssertEqual(decoded.dict["string"] as? String, "value", "Didn't read the string value from dict")
        XCTAssertEqual(decoded.dict["double"] as? Double, 1.5, "Didn't read the double value from dict")
        XCTAssertEqual(decoded.dict["bool"] as? Bool, true, "Didn't read the bool value from dict")
        XCTAssertEqual(decoded.dict["dict"] as? [String: String], ["Foo": "Bar"], "Didn't read the dict value from dict")
        
        guard let array = decoded.dict["array"] as? [Any], array.count == 4 else {
            XCTFail("Didn't read the array value from dict")
            return
        }
        
        XCTAssertEqual(array[0] as? Double, 1, "Didn't read the double value from subarray")
        XCTAssertEqual(array[1] as? String, "a", "Didn't read the string value from subarray")
        XCTAssertEqual(array[2] as? Bool, true, "Didn't read the bool value from subarray")
        XCTAssertEqual(array[3] as? [Double], [1, 2], "Didn't read the array value from subarray")
        XCTAssertEqual(decoded.array[0] as? Double, 1, "Didn't read the double value from array")
        XCTAssertEqual(decoded.array[1] as? [String: String], ["foo": "bar"], "Didn't read the dict value from array")
    }
    
    @available(iOS 11.0, *)
    func testEncodeDict() {
        let target: [String: Any] = ["dict": ["string": "value",
                                              "double": 1.5,
                                              "bool": true,
                                              "dict": ["Foo": "Bar"],
                                              "array": [1, "a", true, [1, 2]]],
                                     "array": [1, ["foo": "bar"]]]
        guard let data = try? JSONSerialization.data(withJSONObject: target, options: JSONSerialization.WritingOptions.sortedKeys) else {
            XCTFail("Couldn't serialise test data")
            return
        }
        
        let source = TestStruct(all: target)
        let encoder = JSONEncoder()
        encoder.outputFormatting = .sortedKeys
        guard let encoded = try? encoder.encode(source) else {
            XCTFail("Couldn't encode test data")
            return
        }
        
        guard let output = String(data: encoded, encoding: .utf8), let expected = String(data: data, encoding: .utf8) else {
            XCTFail("Couldn't convert data to string")
            return
        }
        
        XCTAssertEqual(output, expected, "Encoded data did not match source")
    }
}

private struct TestStruct: Codable {
    enum CodingKeys: String, CodingKey {
        case dict
        case array
    }
    
    var dict: [String: Any]
    var array: [Any]
    
    init(all: [String: Any]) {
        self.dict = all["dict"] as? [String: Any] ?? [:]
        self.array = all["array"] as? [Any] ?? []
    }
    
    init(dict: [String: Any], array: [Any]) {
        self.dict = dict
        self.array = array
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.dict = try values.decode([String: Any].self, forKey: .dict)
        self.array = try values.decode([Any].self, forKey: .array)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.dict, forKey: .dict)
        try container.encode(self.array, forKey: .array)
    }
}
