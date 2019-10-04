//
//  CodableAdditions.swift
//  FazeKit
//
//  Created by Shane Woolcock on 4/10/19.
//

import Foundation
import UIKit

// Taken from: https://stackoverflow.com/questions/44603248/how-to-decode-a-property-with-type-of-json-dictionary-in-swift-4-decodable-proto

public struct JSONCodingKeys: CodingKey {
    public var stringValue: String
    
    public init?(stringValue: String) {
        self.stringValue = stringValue
    }
    
    public var intValue: Int?
    
    public init?(intValue: Int) {
        self.init(stringValue: "\(intValue)")
        self.intValue = intValue
    }
}

public extension KeyedDecodingContainer {
    func decode(_ type: [String: Any].Type, forKey key: K) throws -> [String: Any] {
        let container = try self.nestedContainer(keyedBy: JSONCodingKeys.self, forKey: key)
        return try container.decode(type)
    }
    
    func decodeIfPresent(_ type: [String: Any].Type, forKey key: K) throws -> [String: Any]? {
        guard self.contains(key) else {
            return nil
        }
        guard try self.decodeNil(forKey: key) == false else {
            return nil
        }
        return try self.decode(type, forKey: key)
    }
    
    func decode(_ type: [Any].Type, forKey key: K) throws -> [Any] {
        var container = try self.nestedUnkeyedContainer(forKey: key)
        return try container.decode(type)
    }
    
    func decodeIfPresent(_ type: [Any].Type, forKey key: K) throws -> [Any]? {
        guard self.contains(key) else {
            return nil
        }
        guard try self.decodeNil(forKey: key) == false else {
            return nil
        }
        return try self.decode(type, forKey: key)
    }
    
    func decode(_ type: [String: Any].Type) throws -> [String: Any] {
        var dictionary = [String: Any]()
        for key in self.allKeys {
            if let boolValue = try? self.decode(Bool.self, forKey: key) {
                dictionary[key.stringValue] = boolValue
            } else if let stringValue = try? self.decode(String.self, forKey: key) {
                dictionary[key.stringValue] = stringValue
            } else if let intValue = try? self.decode(Int.self, forKey: key) {
                dictionary[key.stringValue] = intValue
            } else if let doubleValue = try? self.decode(Double.self, forKey: key) {
                dictionary[key.stringValue] = doubleValue
            } else if let nestedDictionary = try? self.decode([String: Any].self, forKey: key) {
                dictionary[key.stringValue] = nestedDictionary
            } else if let nestedArray = try? self.decode([Any].self, forKey: key) {
                dictionary[key.stringValue] = nestedArray
            }
        }
        return dictionary
    }
}

public extension UnkeyedDecodingContainer {
    mutating func decode(_ type: [Any].Type) throws -> [Any] {
        var array: [Any] = []
        while self.isAtEnd == false {
            // See if the current value in the JSON array is `null` first and prevent infite recursion with nested arrays.
            if try self.decodeNil() {
                continue
            } else if let value = try? self.decode(Bool.self) {
                array.append(value)
            } else if let value = try? self.decode(Double.self) {
                array.append(value)
            } else if let value = try? self.decode(Int.self) {
                array.append(value)
            } else if let value = try? self.decode(String.self) {
                array.append(value)
            } else if let nestedDictionary = try? self.decode([String: Any].self) {
                array.append(nestedDictionary)
            } else if var nestedContainer = try? self.nestedUnkeyedContainer(), let nestedArray = try? nestedContainer.decode([Any].self) {
                array.append(nestedArray)
            }
        }
        return array
    }
    
    mutating func decode(_ type: [String: Any].Type) throws -> [String: Any] {
        let nestedContainer = try self.nestedContainer(keyedBy: JSONCodingKeys.self)
        return try nestedContainer.decode(type)
    }
}

// extra convenience funcs

public extension KeyedDecodingContainer {
    func decode(_ type: UIColor.Type, forKey key: K) throws -> UIColor {
        let colorString = try self.decode(String.self, forKey: key)
        return UIColor(hexString: colorString)
    }
    
    func decodeIfPresent(_ type: UIColor.Type, forKey key: K) throws -> UIColor? {
        guard let colorString = try self.decodeIfPresent(String.self, forKey: key) else { return nil }
        return UIColor(hexString: colorString)
    }
    
    func decodeEnum<T: RawRepresentable>(_ type: T.Type, forKey key: K) throws -> T where T.RawValue == String {
        let stringValue = try self.decode(String.self, forKey: key)
        guard let enumValue = T(rawValue: stringValue) else {
            throw DecodingError.dataCorruptedError(forKey: key, in: self, debugDescription: "Unknown enum case \(String(describing: T.self)).\(stringValue)")
        }
        return enumValue
    }
    
    func decodeEnumIfPresent<T: RawRepresentable>(_ type: T.Type, forKey key: K) throws -> T? where T.RawValue == String {
        guard let stringValue = try self.decodeIfPresent(String.self, forKey: key) else { return nil }
        guard let enumValue = T(rawValue: stringValue) else {
            throw DecodingError.dataCorruptedError(forKey: key, in: self, debugDescription: "Unknown enum case \(String(describing: T.self)).\(stringValue)")
        }
        return enumValue
    }
    
    func decodeEnum<T: RawRepresentable>(_ type: T.Type, forKey key: K) throws -> T where T.RawValue == Int {
        let intValue = try self.decode(Int.self, forKey: key)
        guard let enumValue = T(rawValue: intValue) else {
            throw DecodingError.dataCorruptedError(forKey: key, in: self, debugDescription: "Unknown enum case \(String(describing: T.self)).\(intValue)")
        }
        return enumValue
    }
    
    func decodeEnumIfPresent<T: RawRepresentable>(_ type: T.Type, forKey key: K) throws -> T? where T.RawValue == Int {
        guard let intValue = try self.decodeIfPresent(Int.self, forKey: key) else { return nil }
        guard let enumValue = T(rawValue: intValue) else {
            throw DecodingError.dataCorruptedError(forKey: key, in: self, debugDescription: "Unknown enum case \(String(describing: T.self)).\(intValue)")
        }
        return enumValue
    }
}

public extension KeyedEncodingContainer {
    mutating func encode(_ value: UIColor, forKey key: K) throws {
        try self.encode(value.hexStringRGB, forKey: key)
    }
    
    mutating func encodeIfPresent(_ value: UIColor?, forKey key: K) throws {
        try self.encodeIfPresent(value?.hexStringRGB, forKey: key)
    }
    
    mutating func encodeEnum<T: RawRepresentable>(_ value: T, forKey key: K) throws where T.RawValue == String {
        try self.encode(value.rawValue, forKey: key)
    }
    
    mutating func encodeEnumIfPresent<T: RawRepresentable>(_ value: T?, forKey key: K) throws where T.RawValue == String {
        try self.encodeIfPresent(value?.rawValue, forKey: key)
    }
    
    mutating func encodeEnum<T: RawRepresentable>(_ value: T, forKey key: K) throws where T.RawValue == Int {
        try self.encode(value.rawValue, forKey: key)
    }
    
    mutating func encodeEnumIfPresent<T: RawRepresentable>(_ value: T?, forKey key: K) throws where T.RawValue == Int {
        try self.encodeIfPresent(value?.rawValue, forKey: key)
    }
    
    mutating func encode(_ value: [String: Any], forKey key: K) throws {
        var container = self.nestedContainer(keyedBy: JSONCodingKeys.self, forKey: key)
        try encodeDict(value, into: &container)
    }
    
    mutating func encodeIfPresent(_ value: [String: Any]?, forKey key: K) throws {
        guard let value = value else { return }
        try self.encode(value, forKey: key)
    }
    
    mutating func encode(_ value: [Any], forKey key: K) throws {
        var container = self.nestedUnkeyedContainer(forKey: key)
        try container.encode(value)
    }
    
    mutating func encodeIfPresent(_ value: [Any]?, forKey key: K) throws {
        guard let value = value else { return }
        try self.encode(value, forKey: key)
    }
}

public extension UnkeyedEncodingContainer {
    mutating func encode(_ value: [Any]) throws {
        try value.forEach { element in
            guard element as Any? != nil else { return }
            switch element {
            case let element as Bool:
                try self.encode(element)
            case let element as Double:
                try self.encode(element)
            case let element as Int:
                try self.encode(element)
            case let element as String:
                try self.encode(element)
            case let element as [String: Any]:
                try self.encode(element)
            case let element as [Any]:
                var nestedContainer = self.nestedUnkeyedContainer()
                try nestedContainer.encode(element)
            default:
                break
            }
        }
    }
    
    mutating func encode(_ value: [String: Any]) throws {
        var nestedContainer = self.nestedContainer(keyedBy: JSONCodingKeys.self)
        try encodeDict(value, into: &nestedContainer)
    }
}

private func encodeDict(_ value: [String: Any], into container: inout KeyedEncodingContainer<JSONCodingKeys>) throws {
    try value.forEach { (key, val) in
        guard let key = JSONCodingKeys(stringValue: key) else { return }
        switch val {
        case let val as Bool:
            try container.encode(val, forKey: key)
        case let val as Double:
            try container.encode(val, forKey: key)
        case let val as Int:
            try container.encode(val, forKey: key)
        case let val as String:
            try container.encode(val, forKey: key)
        case let val as [String: Any]:
            try container.encode(val, forKey: key)
        case let val as [Any]:
            var nestedContainer = container.nestedUnkeyedContainer(forKey: key)
            try nestedContainer.encode(val)
        default:
            break
        }
    }
}
