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
// DateComponentAdditions.swift
// FazeKit
//
// Created by swoolcock on 12/08/2016.
//

import Foundation

public extension DateComponents {
    init(datePortion: DateComponents) {
        self.init(year: datePortion.year, month: datePortion.month, day: datePortion.day)
    }
    
    init(timePortion: DateComponents, includeSeconds: Bool = true, includeNanoseconds: Bool = false) {
        self.init(hour: timePortion.hour,
                  minute: timePortion.minute,
                  second: includeSeconds ? timePortion.second : nil,
                  nanosecond: includeNanoseconds ? timePortion.nanosecond : nil)
    }
    
    init(datePortion: DateComponents, timePortion: DateComponents, includeSeconds: Bool = true, includeNanoseconds: Bool = false) {
        self.init(year: datePortion.year,
                  month: datePortion.month,
                  day: datePortion.day,
                  hour: timePortion.hour,
                  minute: timePortion.minute,
                  second: includeSeconds ? timePortion.second : nil,
                  nanosecond: includeNanoseconds ? timePortion.nanosecond : nil)
    }
    
    private static func comparePairs(pairs: [(Int?, Int?)]) -> ComparisonResult {
        for pair in pairs {
            if pair.0 == nil && pair.1 != nil {
                return .orderedAscending
            }
            if pair.0 != nil && pair.1 == nil {
                return .orderedDescending
            }
            if let lhs = pair.0, let rhs = pair.1 {
                if lhs > rhs { return .orderedAscending }
                if lhs < rhs { return .orderedDescending }
            }
        }
        return .orderedSame
    }
    
    func compareDatePortion(_ other: DateComponents) -> ComparisonResult {
        let pairs = [(other.year, self.year),
                     (other.month, self.month),
                     (other.day, self.day)]
        return DateComponents.comparePairs(pairs: pairs)
    }
    
    func compareTimePortion(_ other: DateComponents, includeSeconds: Bool = true, includeNanoseconds: Bool = false) -> ComparisonResult {
        var pairs = [(other.hour, self.hour),
                     (other.minute, self.minute)]
        if includeSeconds {
            pairs.append((other.second, self.second))
        }
        if includeNanoseconds {
            pairs.append((other.nanosecond, self.nanosecond))
        }
        return DateComponents.comparePairs(pairs: pairs)
    }
    
    func compare(_ other: DateComponents, includeSeconds: Bool = true, includeNanoseconds: Bool = false) -> ComparisonResult {
        var pairs = [(other.year, self.year),
                     (other.month, self.month),
                     (other.day, self.day),
                     (other.hour, self.hour),
                     (other.minute, self.minute)]
        if includeSeconds {
            pairs.append((other.second, self.second))
        }
        if includeNanoseconds {
            pairs.append((other.nanosecond, self.nanosecond))
        }
        return DateComponents.comparePairs(pairs: pairs)
    }
}

public func +(lhs: DateComponents, rhs: DateComponents) -> DateComponents {
    var comp = DateComponents()
    if lhs.day != nil || rhs.day != nil {
        comp.day = (lhs.day ?? 0) + (rhs.day ?? 0)
    }
    if lhs.month != nil || rhs.month != nil {
        comp.month = (lhs.month ?? 0) + (rhs.month ?? 0)
    }
    if lhs.year != nil || rhs.year != nil {
        comp.year = (lhs.year ?? 0) + (rhs.year ?? 0)
    }
    if lhs.hour != nil || rhs.hour != nil {
        comp.hour = (lhs.hour ?? 0) + (rhs.hour ?? 0)
    }
    if lhs.minute != nil || rhs.minute != nil {
        comp.minute = (lhs.minute ?? 0) + (rhs.minute ?? 0)
    }
    if lhs.second != nil || rhs.second != nil {
        comp.second = (lhs.second ?? 0) + (rhs.second ?? 0)
    }
    if lhs.nanosecond != nil || rhs.nanosecond != nil {
        comp.nanosecond = (lhs.nanosecond ?? 0) + (rhs.nanosecond ?? 0)
    }
    return comp
}

public func -(lhs: DateComponents, rhs: DateComponents) -> DateComponents {
    var comp = DateComponents()
    if lhs.day != nil || rhs.day != nil {
        comp.day = (lhs.day ?? 0) - (rhs.day ?? 0)
    }
    if lhs.month != nil || rhs.month != nil {
        comp.month = (lhs.month ?? 0) - (rhs.month ?? 0)
    }
    if lhs.year != nil || rhs.year != nil {
        comp.year = (lhs.year ?? 0) - (rhs.year ?? 0)
    }
    if lhs.hour != nil || rhs.hour != nil {
        comp.hour = (lhs.hour ?? 0) - (rhs.hour ?? 0)
    }
    if lhs.minute != nil || rhs.minute != nil {
        comp.minute = (lhs.minute ?? 0) - (rhs.minute ?? 0)
    }
    if lhs.second != nil || rhs.second != nil {
        comp.second = (lhs.second ?? 0) - (rhs.second ?? 0)
    }
    if lhs.nanosecond != nil || rhs.nanosecond != nil {
        comp.nanosecond = (lhs.nanosecond ?? 0) - (rhs.nanosecond ?? 0)
    }
    return comp
}

public func *(lhs: DateComponents, rhs: Double) -> DateComponents {
    var comp = DateComponents()
    if lhs.day != nil {
        comp.day = Int(Double(lhs.day!) * rhs)
    }
    if lhs.month != nil {
        comp.month = Int(Double(lhs.month!) * rhs)
    }
    if lhs.year != nil {
        comp.year = Int(Double(lhs.year!) * rhs)
    }
    if lhs.hour != nil {
        comp.hour = Int(Double(lhs.hour!) * rhs)
    }
    if lhs.minute != nil {
        comp.minute = Int(Double(lhs.minute!) * rhs)
    }
    if lhs.second != nil {
        comp.second = Int(Double(lhs.second!) * rhs)
    }
    if lhs.nanosecond != nil {
        comp.nanosecond = Int(Double(lhs.nanosecond!) * rhs)
    }
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
