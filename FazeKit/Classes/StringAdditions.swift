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
// StringAdditions.swift
// FazeKit
//
// Created by swoolcock on 12/08/2016.
//

// gist: https://gist.github.com/albertbori/0faf7de867d96eb83591
// stackoverflow: http://stackoverflow.com/questions/27570910/swift-fast-low-level-string-lastindexof
public extension String {
    public var length: Int {
        return self.characters.count
    }
    
    public func contains(_ s: String) -> Bool {
        return self.range(of: s) != nil
    }
    
    public func replace(_ target: String, withString: String) -> String {
        return self.replacingOccurrences(of: target, with: withString, options: NSString.CompareOptions.literal, range: nil)
    }
    
    public subscript(i: Int) -> Character {
        return self[self.characters.index(self.startIndex, offsetBy: i)]
    }
    
    public subscript(r: Range<Int>) -> String {
        let startIndex = self.characters.index(self.startIndex, offsetBy: max(0, r.lowerBound))
        let endIndex = self.characters.index(self.startIndex, offsetBy: min(self.length, r.upperBound))
        return String(self[startIndex..<endIndex])
    }
    
    public func rangeFromNSRange(_ nsRange: NSRange) -> Range<String.Index>? {
        let from16 = utf16.index(utf16.startIndex, offsetBy: nsRange.location, limitedBy: utf16.endIndex) ?? utf16.endIndex
        let to16 = utf16.index(from16, offsetBy: nsRange.length, limitedBy: utf16.endIndex) ?? utf16.endIndex
        if let from = String.Index(from16, within: self),
            let to = String.Index(to16, within: self) {
            return from ..< to
        }
        return nil
    }
    
    public func substring(_ startIndex: Int, length: Int) -> String {
        let start = self.characters.index(self.startIndex, offsetBy: startIndex)
        let end = self.characters.index(start, offsetBy: length)
        return self.substring(with: start..<end)
    }
    
    public func indexOf(_ target: String) -> Int? {
        guard let range = self.range(of: target) else { return nil }
        return self.characters.distance(from: self.startIndex, to: range.lowerBound)
    }
    
    public func indexOf(_ target: String, startIndex: Int) -> Int? {
        let startRange = self.characters.index(self.startIndex, offsetBy: startIndex)
        guard let range = self.range(of: target, options: NSString.CompareOptions.literal, range: startRange..<self.endIndex)
            else { return nil }
        return self.characters.distance(from: self.startIndex, to: range.lowerBound)
    }
    
    public func lastIndexOf(_ target: String) -> Int? {
        guard let range: Range<Index> = self.range(of: target, options: .backwards) else { return nil }
        return self.characters.distance(from: self.startIndex, to: range.lowerBound)
    }
    
    public func isMatch(_ regex: String, options: NSRegularExpression.Options) -> Bool {
        do {
            let exp = try NSRegularExpression(pattern: regex, options: options)
            return exp.numberOfMatches(in: self, options: [], range: NSMakeRange(0, self.length)) > 0
        } catch {
            return false
        }
    }
    
    public func getMatches(_ regex: String, options: NSRegularExpression.Options) -> [String] {
        do {
            let exp = try NSRegularExpression(pattern: regex, options: options)
            let nsString = self as NSString
            let results = exp.matches(in: self, options: [], range: NSMakeRange(0, self.length))
            return results.map{nsString.substring(with: $0.range)}
        } catch {
            return []
        }
    }
    
    public func trim() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
}
