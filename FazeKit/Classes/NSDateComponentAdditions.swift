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

public extension NSDateComponents {
    public convenience init(day: Int, month: Int, year: Int) {
        self.init()
        self.day = day
        self.month = month
        self.year = year
        self.hour = 0
        self.minute = 0
        self.second = 0
        self.nanosecond = 0
    }
    
    public convenience init(hour: Int, minute: Int, second: Int = 0, nanosecond: Int = 0) {
        self.init()
        self.day = 0
        self.month = 0
        self.year = 0
        self.hour = hour
        self.minute = minute
        self.second = second
        self.nanosecond = nanosecond
    }
    
    public convenience init(day: Int, month: Int, year: Int, hour: Int, minute: Int, second: Int = 0, nanosecond: Int = 0) {
        self.init()
        self.day = day
        self.month = month
        self.year = year
        self.hour = hour
        self.minute = minute
        self.second = second
        self.nanosecond = nanosecond
    }
    
    public convenience init(datePortion: NSDateComponents) {
        self.init(day: datePortion.day, month: datePortion.month, year: datePortion.year)
    }
    
    public convenience init(timePortion: NSDateComponents, includeSeconds: Bool = true, includeNanoseconds: Bool = false) {
        self.init(hour: timePortion.hour, minute: timePortion.minute, second: includeSeconds ? timePortion.second : 0, nanosecond: includeNanoseconds ? timePortion.nanosecond : 0)
    }
    
    public convenience init(datePortion: NSDateComponents, timePortion: NSDateComponents, includeSeconds: Bool = true, includeNanoseconds: Bool = false) {
        self.init(day: datePortion.day, month: datePortion.month, year: datePortion.year, hour: timePortion.hour, minute: timePortion.minute, second: includeSeconds ? timePortion.second : 0, nanosecond: includeNanoseconds ? timePortion.nanosecond : 0)
    }
    
    public func compareDatePortion(other: NSDateComponents) -> NSComparisonResult {
        if other.year > self.year { return .OrderedAscending }
        if other.year < self.year { return .OrderedDescending }
        if other.month > self.month { return .OrderedAscending }
        if other.month < self.month { return .OrderedDescending }
        if other.day > self.day { return .OrderedAscending }
        if other.day < self.day { return .OrderedDescending }
        return .OrderedSame
    }
    
    public func compareTimePortion(other: NSDateComponents, includeSeconds: Bool = true, includeNanoseconds: Bool = false) -> NSComparisonResult {
        if other.hour > self.hour { return .OrderedAscending }
        if other.hour < self.hour { return .OrderedDescending }
        if other.minute > self.minute { return .OrderedAscending }
        if other.minute < self.minute { return .OrderedDescending }
        if includeSeconds {
            if other.second > self.second { return .OrderedAscending }
            if other.second < self.second { return .OrderedDescending }
        }
        if includeNanoseconds {
            if other.nanosecond > self.nanosecond { return .OrderedAscending }
            if other.nanosecond < self.nanosecond { return .OrderedDescending }
        }
        return .OrderedSame
    }
    
    public func compare(other: NSDateComponents, includeSeconds: Bool = true, includeNanoseconds: Bool = false) -> NSComparisonResult {
        if other.year > self.year { return .OrderedAscending }
        if other.year < self.year { return .OrderedDescending }
        if other.month > self.month { return .OrderedAscending }
        if other.month < self.month { return .OrderedDescending }
        if other.day > self.day { return .OrderedAscending }
        if other.day < self.day { return .OrderedDescending }
        if other.hour > self.hour { return .OrderedAscending }
        if other.hour < self.hour { return .OrderedDescending }
        if other.minute > self.minute { return .OrderedAscending }
        if other.minute < self.minute { return .OrderedDescending }
        if includeSeconds {
            if other.second > self.second { return .OrderedAscending }
            if other.second < self.second { return .OrderedDescending }
        }
        if includeNanoseconds {
            if other.nanosecond > self.nanosecond { return .OrderedAscending }
            if other.nanosecond < self.nanosecond { return .OrderedDescending }
        }
        return .OrderedSame
    }
}

public func +(lhs: NSDateComponents, rhs: NSDateComponents) -> NSDateComponents {
    let comp = NSDateComponents()
    comp.day = lhs.day + rhs.day
    comp.month = lhs.month + rhs.month
    comp.year = lhs.year + rhs.year
    comp.hour = lhs.hour + rhs.hour
    comp.minute = lhs.minute + rhs.minute
    comp.second = lhs.second + rhs.second
    comp.nanosecond = lhs.nanosecond + rhs.nanosecond
    return comp
}

public func -(lhs: NSDateComponents, rhs: NSDateComponents) -> NSDateComponents {
    let comp = NSDateComponents()
    comp.day = lhs.day - rhs.day
    comp.month = lhs.month - rhs.month
    comp.year = lhs.year - rhs.year
    comp.hour = lhs.hour - rhs.hour
    comp.minute = lhs.minute - rhs.minute
    comp.second = lhs.second - rhs.second
    comp.nanosecond = lhs.nanosecond - rhs.nanosecond
    return comp
}

public func *(lhs: NSDateComponents, rhs: Double) -> NSDateComponents {
    let comp = NSDateComponents()
    comp.day = Int(Double(lhs.day) * rhs)
    comp.month = Int(Double(lhs.month) * rhs)
    comp.year = Int(Double(lhs.year) * rhs)
    comp.hour = Int(Double(lhs.hour) * rhs)
    comp.minute = Int(Double(lhs.minute) * rhs)
    comp.second = Int(Double(lhs.second) * rhs)
    comp.nanosecond = Int(Double(lhs.nanosecond) * rhs)
    return comp
}

public func *(lhs: Double, rhs: NSDateComponents) -> NSDateComponents {
    return rhs * lhs
}

public func /(lhs: NSDateComponents, rhs: Double) -> NSDateComponents {
    return lhs * (1 / rhs)
}

public func >(lhs: NSDateComponents, rhs: NSDateComponents) -> Bool {
    return lhs.compare(rhs, includeSeconds: true, includeNanoseconds: true) == .OrderedAscending
}

public func <(lhs: NSDateComponents, rhs: NSDateComponents) -> Bool {
    return lhs.compare(rhs, includeSeconds: true, includeNanoseconds: true) == .OrderedDescending
}

public func >=(lhs: NSDateComponents, rhs: NSDateComponents) -> Bool {
    return lhs.compare(rhs, includeSeconds: true, includeNanoseconds: true) != .OrderedDescending
}

public func <=(lhs: NSDateComponents, rhs: NSDateComponents) -> Bool {
    return lhs.compare(rhs, includeSeconds: true, includeNanoseconds: true) != .OrderedAscending
}

public func ==(lhs: NSDateComponents, rhs: NSDateComponents) -> Bool {
    return lhs.compare(rhs, includeSeconds: true, includeNanoseconds: true) == .OrderedSame
}
