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
// NSDateAdditions.swift
// FazeKit
//
// Created by swoolcock on 12/08/2016.
//

import Foundation

public extension NSDate {
    public func timeComponents(includeSeconds includeSeconds: Bool = false) -> NSDateComponents {
        var units: NSCalendarUnit = [NSCalendarUnit.Hour, NSCalendarUnit.Minute]
        if includeSeconds {
            units = [NSCalendarUnit.Hour, NSCalendarUnit.Minute, NSCalendarUnit.Second]
        }
        return NSCalendar.currentCalendar().components(units, fromDate: self)
    }
    
    public func dateComponents() -> NSDateComponents {
        let units: NSCalendarUnit = [.Year, .Month, .Day, .Weekday]
        return NSCalendar.currentCalendar().components(units, fromDate: self)
    }
    
    public static func dateFromComponents(day day: Int = 0, month: Int = 0, year: Int = 0, hour: Int = 0, minute: Int = 0, second: Int = 0, nanosecond: Int = 0) -> NSDate? {
        let components = NSDateComponents()
        components.day = day
        components.month = month
        components.year = year
        components.hour = hour
        components.minute = minute
        components.second = second
        components.nanosecond = nanosecond
        return NSCalendar.currentCalendar().dateFromComponents(components)
    }
    
    public func dateWithTimeComponents(hour hour: Int, minute: Int, second: Int = 0, nanosecond: Int = 0) -> NSDate? {
        let components = NSCalendar.currentCalendar().components([.Year, .Month, .Day], fromDate: self)
        components.hour = hour
        components.minute = minute
        components.second = second
        components.nanosecond = nanosecond
        return NSCalendar.currentCalendar().dateFromComponents(components)
    }
    
    public func stringWithFormat(format: String) -> String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = format
        formatter.locale = NSLocale.currentLocale()
        return formatter.stringFromDate(self)
    }
}

public func >(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.timeIntervalSinceDate(rhs) > 0
}

public func <(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.timeIntervalSinceDate(rhs) < 0
}

public func >=(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.timeIntervalSinceDate(rhs) >= 0
}

public func <=(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.timeIntervalSinceDate(rhs) <= 0
}

public func ==(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.timeIntervalSinceDate(rhs) == 0
}
