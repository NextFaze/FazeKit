//
//  NSAttributedStringAdditions.swift
//  FazeKit
//
//  Created by Shane Woolcock on 10/10/19.
//

import Foundation

public extension NSAttributedString {
    func height(withConstrainedWidth width: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, context: nil)
        
        return ceil(boundingBox.height)
    }
    
    func width(withConstrainedHeight height: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, context: nil)
        
        return ceil(boundingBox.width)
    }
    
    // https://medium.com/@rwbutler/trimming-nsattributedstring-b8c1e58ac0a
    func trimmingCharacters(in characterSet: CharacterSet) -> NSAttributedString {
        guard let result = self.mutableCopy() as? NSMutableAttributedString else { fatalError() }
        while let range = result.string.rangeOfCharacter(from: characterSet), range.lowerBound == result.string.startIndex {
            let length = result.string.distance(from: range.lowerBound, to: range.upperBound)
            result.deleteCharacters(in: NSRange(location: 0, length: length))
        }
        while let range = result.string.rangeOfCharacter(from: characterSet, options: .backwards), range.upperBound == result.string.endIndex {
            let location = result.string.distance(from: result.string.startIndex, to: range.lowerBound)
            let length = result.string.distance(from: range.lowerBound, to: range.upperBound)
            result.deleteCharacters(in: NSRange(location: location, length: length))
        }
        return result
    }
}

public extension Array where Element: NSAttributedString {
    func joined(separator: String = ",") -> NSAttributedString {
        return self.joined(attributedSeparator: NSAttributedString(string: separator))
    }
    
    func joined(attributedSeparator: NSAttributedString) -> NSAttributedString {
        guard !self.isEmpty else { return NSAttributedString() }
        let attr = NSMutableAttributedString()
        for (offset, element) in self.enumerated() {
            if offset > 0 {
                attr.append(attributedSeparator)
            }
            attr.append(element)
        }
        return attr
    }
}
