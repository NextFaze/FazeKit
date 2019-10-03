//
//  DataAdditions.swift
//  FazeKit
//
//  Created by Shane Woolcock on 2/10/19.
//

import Foundation
import CommonCrypto

public extension Data {
    func md5() -> String {
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        var digest = [UInt8](repeating: 0, count: digestLen)
        let count = self.count
        self.withUnsafeBytes { bytes -> Void in
            CC_MD5(bytes, CC_LONG(count), &digest)
        }
        let hash = NSMutableString()
        digest.forEach { hash.appendFormat("%02x", $0) }
        return String(format: hash as String)
    }
    
    func hex() -> String {
        let str = NSMutableString()
        self.forEach { str.appendFormat("%02x", $0) }
        return String(format: str as String)
    }
}
