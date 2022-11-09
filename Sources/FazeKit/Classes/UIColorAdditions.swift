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
// UIColorAdditions.swift
// Pods
//
// Created by Ricardo Santos on 30/11/2016.
//
//

import UIKit

public extension UIColor {
    var redInt: Int {
        var red: CGFloat = 0
        self.getRed(&red, green: nil, blue: nil, alpha: nil)
        return Int(red * 255)
    }
    
    var greenInt: Int {
        var green: CGFloat = 0
        self.getRed(nil, green: &green, blue: nil, alpha: nil)
        return Int(green * 255)
    }
    
    var blueInt: Int {
        var blue: CGFloat = 0
        self.getRed(nil, green: nil, blue: &blue, alpha: nil)
        return Int(blue * 255)
    }
    
    var alphaInt: Int {
        var alpha: CGFloat = 0
        self.getRed(nil, green: nil, blue: nil, alpha: &alpha)
        return Int(alpha * 255)
    }
    
    var rgba: (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        guard self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) else { return (0, 0, 0, 0) }
        return (red, green, blue, alpha)
    }
    
    var rgbaInt: (r: Int, g: Int, b: Int, a: Int) {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        guard self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) else { return (0, 0, 0, 0) }
        return (Int(red * 255), Int(green * 255), Int(blue * 255), Int(alpha * 255))
    }
    
    convenience init(redInt: Int, greenInt: Int, blueInt: Int, alpha: CGFloat) {
        self.init(red: CGFloat(redInt)/255.0, green: CGFloat(greenInt)/255.0, blue: CGFloat(blueInt)/255.0, alpha: alpha)
    }
    
    // adapted from: https://gist.github.com/arshad/de147c42d7b3063ef7bc
    convenience init(hexString: String, alpha: Double = 1.0) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let r, g, b: UInt32
        switch hex.count {
        case 3: // RGB (12-bit)
            (r, g, b) = ((int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (r, g, b) = (int >> 16, int >> 8 & 0xFF, int & 0xFF)
        default:
            (r, g, b) = (1, 1, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(255 * alpha) / 255)
    }
    
    var hexStringRGB: String {
        let rgbaInt = self.rgbaInt
        return String(format: "%02x%02x%02x", rgbaInt.r, rgbaInt.g, rgbaInt.b)
    }
    
    var hexStringARGB: String {
        let rgbaInt = self.rgbaInt
        return String(format: "%02x%02x%02x%02x", rgbaInt.a, rgbaInt.r, rgbaInt.g, rgbaInt.b)
    }
    
    var htmlStringRGB: String {
        return "#" + self.hexStringRGB
    }
    
    var htmlStringARGB: String {
        return "#" + self.hexStringARGB
    }
    
    convenience init(source: String, minBrightness: CGFloat = 0.66, maxBrightness: CGFloat = 1.0) {
        guard !source.isEmpty, let md5 = source.md5() else {
            self.init(red: 0, green: 0, blue: 0, alpha: 1)
            return
        }
        self.init(md5: md5, minBrightness: minBrightness, maxBrightness: maxBrightness)
    }
    
    convenience init(md5: String, minBrightness: CGFloat = 0.66, maxBrightness: CGFloat = 1.0) {
        let mid = md5.index(md5.startIndex, offsetBy: md5.count / 2)
        let firstHalf = md5[md5.startIndex..<mid]
        let secondHalf = md5[mid..<md5.endIndex]
        let firstHash = abs(firstHalf.hashValue % 100)
        let secondHash = abs(secondHalf.hashValue % 100)
        let hue = CGFloat(firstHash) / 100.0
        let brightness: CGFloat = minBrightness + (maxBrightness - minBrightness) * CGFloat(secondHash) / 100.0
        self.init(hue: hue, saturation: 0.8, brightness: brightness, alpha: 1.0)
    }
    
    class var random: UIColor {
        return UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0)
    } 
}
