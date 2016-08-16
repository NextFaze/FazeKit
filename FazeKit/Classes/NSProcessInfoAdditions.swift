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
// NSProcessInfoAdditions.swift
// FazeKit
//
// Created by swoolcock on 16/08/2016.
//

import Foundation

public func ==(lhs: NSOperatingSystemVersion, rhs: (Int, Int, Int)) -> Bool {
    return lhs.majorVersion == rhs.0 && lhs.minorVersion == rhs.1 && lhs.patchVersion == rhs.2
}

public func !=(lhs: NSOperatingSystemVersion, rhs: (Int, Int, Int)) -> Bool {
    return lhs.majorVersion != rhs.0 || lhs.minorVersion != rhs.1 || lhs.patchVersion != rhs.2
}

public func >(lhs: NSOperatingSystemVersion, rhs: (Int, Int, Int)) -> Bool {
    return lhs.majorVersion > rhs.0 || lhs.minorVersion > rhs.1 || lhs.patchVersion > rhs.2
}

public func <(lhs: NSOperatingSystemVersion, rhs: (Int, Int, Int)) -> Bool {
    return lhs.majorVersion < rhs.0 || lhs.minorVersion < rhs.1 || lhs.patchVersion < rhs.2
}

public func >=(lhs: NSOperatingSystemVersion, rhs: (Int, Int, Int)) -> Bool {
    return !(lhs < rhs)
}

public func <=(lhs: NSOperatingSystemVersion, rhs: (Int, Int, Int)) -> Bool {
    return !(lhs > rhs)
}
