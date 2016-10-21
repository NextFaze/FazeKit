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
// NSDateComponentAdditions.swift
// FazeKit
//
// Created by swoolcock on 12/08/2016.
//

import Foundation

public extension DateComponents {
    public init(day: Int, month: Int, year: Int) {
        self.init()
        self.day = day
        self.month = month
        self.year = year
        self.hour = 0
        self.minute = 0
        self.second = 0
        self.nanosecond = 0
    }
    
    public init(hour: Int, minute: Int, second: Int = 0, nanosecond: Int = 0) {
        self.init()
        self.day = 0
        self.month = 0
        self.year = 0
        self.hour = hour
        self.minute = minute
        self.second = second
        self.nanosecond = nanosecond
    }
    
    public init(day: Int, month: Int, year: Int, hour: Int, minute: Int, second: Int = 0, nanosecond: Int = 0) {
        self.init()
        self.day = day
        self.month = month
        self.year = year
        self.hour = hour
        self.minute = minute
        self.second = second
        self.nanosecond = nanosecond
    }
    
    public init(datePortion: DateComponents) {
        self.init(day: datePortion.day!, month: datePortion.month!, year: datePortion.year!)
    }
    
    public init(timePortion: DateComponents, includeSeconds: Bool = true, includeNanoseconds: Bool = false) {
        self.init(hour: timePortion.hour, minute: timePortion.minute, second: includeSeconds ? timePortion.second : 0, nanosecond: includeNanoseconds ? timePortion.nanosecond : 0)
    }
    
    public init(datePortion: DateComponents, timePortion: DateComponents, includeSeconds: Bool = true, includeNanoseconds: Bool = false) {
        self.init(day: datePortion.day!, month: datePortion.month!, year: datePortion.year!, hour: timePortion.hour!, minute: timePortion.minute!, second: includeSeconds ? timePortion.second! : 0, nanosecond: includeNanoseconds ? timePortion.nanosecond! : 0)
    }
    
    public func compareDatePortion(_ other: DateComponents) -> ComparisonResult {
        if other.year! > self.year! { return .orderedAscending }
        if other.year! < self.year! { return .orderedDescending }
        if other.month! > self.month! { return .orderedAscending }
        if other.month! < self.month! { return .orderedDescending }
        if other.day! > self.day! { return .orderedAscending }
        if other.day! < self.day! { return .orderedDescending }
        return .orderedSame
    }
    
    public func compareTimePortion(_ other: DateComponents, includeSeconds: Bool = true, includeNanoseconds: Bool = false) -> ComparisonResult {
        if other.hour! > self.hour! { return .orderedAscending }
        if other.hour! < self.hour! { return .orderedDescending }
        if other.minute! > self.minute! { return .orderedAscending }
        if other.minute! < self.minute! { return .orderedDescending }
        if includeSeconds {
            if other.second! > self.second! { return .orderedAscending }
            if other.second! < self.second! { return .orderedDescending }
        }
        if includeNanoseconds {
            if other.nanosecond! > self.nanosecond! { return .orderedAscending }
            if other.nanosecond! < self.nanosecond! { return .orderedDescending }
        }
        return .orderedSame
    }
    
    public func compare(_ other: DateComponents, includeSeconds: Bool = true, includeNanoseconds: Bool = false) -> ComparisonResult {
        if other.year! > self.year! { return .orderedAscending }
        if other.year! < self.year! { return .orderedDescending }
        if other.month! > self.month! { return .orderedAscending }
        if other.month! < self.month! { return .orderedDescending }
        if other.day! > self.day! { return .orderedAscending }
        if other.day! < self.day! { return .orderedDescending }
        if other.hour! > self.hour! { return .orderedAscending }
        if other.hour! < self.hour! { return .orderedDescending }
        if other.minute! > self.minute! { return .orderedAscending }
        if other.minute! < self.minute! { return .orderedDescending }
        if includeSeconds {
            if other.second! > self.second! { return .orderedAscending }
            if other.second! < self.second! { return .orderedDescending }
        }
        if includeNanoseconds {
            if other.nanosecond! > self.nanosecond! { return .orderedAscending }
            if other.nanosecond! < self.nanosecond! { return .orderedDescending }
        }
        return .orderedSame
    }
}

public func +(lhs: DateComponents, rhs: DateComponents) -> DateComponents {
    var comp = DateComponents()
    comp.day = lhs.day! + rhs.day!
    comp.month = lhs.month! + rhs.month!
    comp.year = lhs.year! + rhs.year!
    comp.hour = lhs.hour! + rhs.hour!
    comp.minute = lhs.minute! + rhs.minute!
    comp.second = lhs.second! + rhs.second!
    comp.nanosecond = lhs.nanosecond! + rhs.nanosecond!
    return comp
}

public func -(lhs: DateComponents, rhs: DateComponents) -> DateComponents {
    var comp = DateComponents()
    comp.day = lhs.day! - rhs.day!
    comp.month = lhs.month! - rhs.month!
    comp.year = lhs.year! - rhs.year!
    comp.hour = lhs.hour! - rhs.hour!
    comp.minute = lhs.minute! - rhs.minute!
    comp.second = lhs.second! - rhs.second!
    comp.nanosecond = lhs.nanosecond! - rhs.nanosecond!
    return comp
}

public func *(lhs: DateComponents, rhs: Double) -> DateComponents {
    var comp = DateComponents()
    comp.day = Int(Double(lhs.day!) * rhs)
    comp.month = Int(Double(lhs.month!) * rhs)
    comp.year = Int(Double(lhs.year!) * rhs)
    comp.hour = Int(Double(lhs.hour!) * rhs)
    comp.minute = Int(Double(lhs.minute!) * rhs)
    comp.second = Int(Double(lhs.second!) * rhs)
    comp.nanosecond = Int(Double(lhs.nanosecond!) * rhs)
    return comp
}

public func *(lhs: Double, rhs: DateComponents) -> DateComponents {
    return rhs * lhs
}

public func /(lhs: DateComponents, rhs: Double) -> DateComponents {
    return lhs * (1 / rhs)
}

public func >(lhs: DateComponents, rhs: DateComponents) -> Bool {
    return lhs.compare(rhs, includeSeconds: true, includeNanoseconds: true) == .orderedAscending
}

public func <(lhs: DateComponents, rhs: DateComponents) -> Bool {
    return lhs.compare(rhs, includeSeconds: true, includeNanoseconds: true) == .orderedDescending
}

public func >=(lhs: DateComponents, rhs: DateComponents) -> Bool {
    return lhs.compare(rhs, includeSeconds: true, includeNanoseconds: true) != .orderedDescending
}

public func <=(lhs: DateComponents, rhs: DateComponents) -> Bool {
    return lhs.compare(rhs, includeSeconds: true, includeNanoseconds: true) != .orderedAscending
}

public func ==(lhs: DateComponents, rhs: DateComponents) -> Bool {
    return lhs.compare(rhs, includeSeconds: true, includeNanoseconds: true) == .orderedSame
}
