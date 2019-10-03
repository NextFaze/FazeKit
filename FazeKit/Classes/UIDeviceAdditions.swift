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
    static func isPad() -> Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
    
    static func is3_5Inch() -> Bool {
        return !isPad() && UIScreen.screenMaxLength == UIScreen.maxLength3_5Inch
    }
    
    static func is4Inch() -> Bool {
        return !isPad() && UIScreen.screenMaxLength == UIScreen.maxLength4Inch
    }
    
    static func is4_7Inch() -> Bool {
        return !isPad() && UIScreen.screenMaxLength == UIScreen.maxLength4_7Inch
    }
    
    static func is5_5Inch() -> Bool {
        return !isPad() && UIScreen.screenMaxLength == UIScreen.maxLength5_5Inch
    }
    
    static func is5_8Inch() -> Bool {
        return !isPad() && UIScreen.screenMaxLength == UIScreen.maxLength5_8Inch
    }
    
    static func is6_1Inch() -> Bool {
        return !isPad() && UIScreen.screenMaxLength == UIScreen.maxLength6_1Inch && UIScreen.main.scale == 2
    }
    
    static func is6_5Inch() -> Bool {
        return !isPad() && UIScreen.screenMaxLength == UIScreen.maxLength6_5Inch && UIScreen.main.scale == 3
    }
    
    static func isSmallPhone() -> Bool {
        return is3_5Inch() || is4Inch()
    }
    
    static func isSimulator() -> Bool {
        #if targetEnvironment(simulator)
            return true
        #else
            return false
        #endif
    }
    
    static func isJailbroken() -> Bool {
        #if targetEnvironment(simulator)
            return false
        #else
            let filenames = ["/Applications/Cydia.app", "/Library/MobileSubstrate/MobileSubstrate.dylib", "/bin/bash", "/usr/sbin/sshd", "/etc/apt", "/usr/bin/ssh"]
            let fileManager = Foundation.FileManager.default
            if filenames.first(where: {fileManager.fileExists(atPath: $0)}) != nil {
                return true
            }
            guard let url = URL(string: "cydia://package/com.example.package") else { return false }
            return UIApplication.shared.canOpenURL(url)
        #endif
    }
    
    static func isTwitterAvailable() -> Bool {
        return NSClassFromString("TWTweetComposeViewController") != nil
    }
    
    static func isSocialAvailable() -> Bool {
        return NSClassFromString("SLComposeViewController") != nil
    }
    
    static func isPirated() -> Bool {
        // http://thwart-ipa-cracks.blogspot.com/2008/11/detection.html
        return Bundle.main.infoDictionary?.keys.contains("SignerIdentity") ?? false
    }
}
