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
// UIDeviceAdditions.swift
// FazeKit
//
// Created by swoolcock on 16/08/2016.
//

import UIKit

public extension UIDevice {
    public static func isPad() -> Bool {
        return UIDevice.currentDevice().userInterfaceIdiom == .Pad
    }
    
    public static func is3_5Inch() -> Bool {
        return !isPad() && UIScreen.screenMaxLength == UIScreen.maxLength3_5Inch
    }
    
    public static func is4Inch() -> Bool {
        return !isPad() && UIScreen.screenMaxLength == UIScreen.maxLength4Inch
    }
    
    public static func is4_7Inch() -> Bool {
        return !isPad() && UIScreen.screenMaxLength == UIScreen.maxLength4_7Inch
    }
    
    public static func is5_5Inch() -> Bool {
        return !isPad() && UIScreen.screenMaxLength == UIScreen.maxLength5_5Inch
    }
    
    public static func isSimulator() -> Bool {
        #if (arch(i386) || arch(x86_64)) && (os(iOS) || os(watchOS) || os(tvOS))
            return true
        #else
            return false
        #endif
    }
    
    public static func isJailbroken() -> Bool {
        #if (arch(i386) || arch(x86_64)) && (os(iOS) || os(watchOS) || os(tvOS))
            return false
        #else
            let filenames = ["/Applications/Cydia.app", "/Library/MobileSubstrate/MobileSubstrate.dylib", "/bin/bash", "/usr/sbin/sshd", "/etc/apt", "/usr/bin/ssh"]
            let fileManager = NSFileManager.defaultManager()
            guard filenames.firstMatch({fileManager.fileExistsAtPath($0)}) == nil else { return true }
            guard url = NSURL(string: "cydia://package/com.example.package") else { return false }
            return UIApplication.sharedApplication().canOpenURL(url)
        #endif
    }
}
