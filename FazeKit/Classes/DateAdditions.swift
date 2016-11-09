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
// DateAdditions.swift
// FazeKit
//
// Created by swoolcock on 12/08/2016.
//

import Foundation

public extension Date {
    public func timeComponents(includeSeconds: Bool = false) -> DateComponents {
        var units: NSCalendar.Unit = [NSCalendar.Unit.hour, NSCalendar.Unit.minute]
        if includeSeconds {
            units = [NSCalendar.Unit.hour, NSCalendar.Unit.minute, NSCalendar.Unit.second]
        }
        return (Calendar.current as NSCalendar).components(units, from: self)
    }
    
    public func dateComponents() -> DateComponents {
        let units: NSCalendar.Unit = [.year, .month, .day, .weekday]
        return (Calendar.current as NSCalendar).components(units, from: self)
    }
    
    public static func dateFromComponents(day: Int? = nil,
                                          month: Int? = nil,
                                          year: Int? = nil,
                                          hour: Int? = nil,
                                          minute: Int? = nil,
                                          second: Int? = nil,
                                          nanosecond: Int? = nil) -> Date? {
        var components = DateComponents()
        components.day = day
        components.month = month
        components.year = year
        components.hour = hour
        components.minute = minute
        components.second = second
        components.nanosecond = nanosecond
        return Calendar.current.date(from: components)
    }
    
    public func dateWithTimeComponents(hour: Int? = 0,
                                       minute: Int? = 0,
                                       second: Int? = nil,
                                       nanosecond: Int? = nil) -> Date? {
        var components = (Calendar.current as NSCalendar).components([.year, .month, .day], from: self)
        components.hour = hour
        components.minute = minute
        components.second = second
        components.nanosecond = nanosecond
        return Calendar.current.date(from: components)
    }
    
    public func stringWithFormat(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale.current
        return formatter.string(from: self)
    }
}
