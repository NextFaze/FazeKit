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
    
    public func contains(s: String) -> Bool {
        return self.rangeOfString(s) != nil
    }
    
    public func replace(target: String, withString: String) -> String {
        return self.stringByReplacingOccurrencesOfString(target, withString: withString, options: NSStringCompareOptions.LiteralSearch, range: nil)
    }
    
    public subscript(i: Int) -> Character {
        return self[self.startIndex.advancedBy(i)]
    }
    
    public subscript(r: Range<Int>) -> String {
        let startIndex = self.startIndex.advancedBy(max(0, r.startIndex))
        let endIndex = self.startIndex.advancedBy(min(self.length, r.endIndex))
        return self[startIndex..<endIndex]
    }
    
    public func rangeFromNSRange(nsRange: NSRange) -> Range<String.Index>? {
        let from16 = utf16.startIndex.advancedBy(nsRange.location, limit: utf16.endIndex)
        let to16 = from16.advancedBy(nsRange.length, limit: utf16.endIndex)
        if let from = String.Index(from16, within: self),
            let to = String.Index(to16, within: self) {
            return from ..< to
        }
        return nil
    }
    
    public func substring(startIndex: Int, length: Int) -> String {
        let start = self.startIndex.advancedBy(startIndex)
        let end = start.advancedBy(length)
        return self.substringWithRange(start..<end)
    }
    
    public func indexOf(target: String) -> Int? {
        guard let range = self.rangeOfString(target) else { return nil }
        return self.startIndex.distanceTo(range.startIndex)
    }
    
    public func indexOf(target: String, startIndex: Int) -> Int? {
        let startRange = self.startIndex.advancedBy(startIndex)
        guard let range = self.rangeOfString(target, options: NSStringCompareOptions.LiteralSearch, range: startRange..<self.endIndex)
            else { return nil }
        return self.startIndex.distanceTo(range.startIndex)
    }
    
    public func lastIndexOf(target: String) -> Int? {
        guard let range: Range<Index> = self.rangeOfString(target, options: .BackwardsSearch) else { return nil }
        return self.startIndex.distanceTo(range.startIndex)
    }
    
    public func isMatch(regex: String, options: NSRegularExpressionOptions) -> Bool {
        do {
            let exp = try NSRegularExpression(pattern: regex, options: options)
            return exp.numberOfMatchesInString(self, options: [], range: NSMakeRange(0, self.length)) > 0
        } catch {
            return false
        }
    }
    
    public func getMatches(regex: String, options: NSRegularExpressionOptions) -> [String] {
        do {
            let exp = try NSRegularExpression(pattern: regex, options: options)
            let nsString = self as NSString
            let results = exp.matchesInString(self, options: [], range: NSMakeRange(0, self.length))
            return results.map{nsString.substringWithRange($0.range)}
        } catch {
            return []
        }
    }
    
    public func trim() -> String {
        return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
    }
}
