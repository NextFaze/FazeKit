//
//  AnyAdditions.swift
//  FazeKit
//
//  Created by Shane Woolcock on 4/10/19.
//

import Foundation

public extension Optional where Wrapped == Any {
    var isNumber: Bool {
        guard case let .some(wrapped) = self else { return false }
        return wrapped is Int || wrapped is Float || wrapped is Double
    }
    
    var floatValue: Float? {
        guard case let .some(wrapped) = self, self.isNumber else { return nil }
        return (wrapped as? NSNumber)?.floatValue
    }
    
    var doubleValue: Double? {
        guard case let .some(wrapped) = self, self.isNumber else { return nil }
        return (wrapped as? NSNumber)?.doubleValue
    }
    
    var intValue: Int? {
        guard case let .some(wrapped) = self, self.isNumber else { return nil }
        return (wrapped as? NSNumber)?.intValue
    }
    
    var boolValue: Bool? {
        guard case let .some(wrapped) = self, !self.isNumber else { return nil }
        return wrapped as? Bool
    }
    
    var boolNumberValue: Bool? {
        guard case let .some(wrapped) = self else { return nil }
        return wrapped as? Bool ?? (wrapped as? NSNumber)?.boolValue
    }
    
    var stringValue: String? {
        guard case let .some(wrapped) = self, !self.isNumber else { return nil }
        return wrapped as? String
    }
    
    var dictValue: [String: Any]? {
        guard case let .some(wrapped) = self, !self.isNumber else { return nil }
        return wrapped as? [String: Any]
    }
    
    var arrayValue: [Any]? {
        guard case let .some(wrapped) = self, !self.isNumber else { return nil }
        return wrapped as? [Any]
    }
    
    var dateValue: Date? {
        guard case let .some(wrapped) = self else { return nil }
        return wrapped as? Date
    }
    
    func cast<T>(_ type: T.Type = T.self) -> T? {
        guard case let .some(wrapped) = self else { return nil }
        return wrapped as? T
    }
}
