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

public extension Data {
    /// Returns a Base-64 URL-safe encoded string.
    ///
    /// - parameter options: The options to use for the encoding. Default value is `[]`.
    /// - returns: The Base-64 URL-safe encoded string.
    func base64URLEncodedString(options: Data.Base64EncodingOptions = []) -> String {
        base64EncodedString()
            .replacingOccurrences(of: "/", with: "_")
            .replacingOccurrences(of: "+", with: "-")
            .replacingOccurrences(of: "=", with: "")
    }
    
    /// Initialize a `Data` from a Base-64 URL encoded String using the given options.
    ///
    /// Returns nil when the input is not recognized as valid Base-64.
    /// - parameter base64URLString: The string to parse.
    /// - parameter options: Encoding options. Default value is `[]`.
    init?(base64URLEncoded base64URLString: String, options: Data.Base64DecodingOptions = []) {
        var base64Encoded = base64URLString
            .replacingOccurrences(of: "_", with: "/")
            .replacingOccurrences(of: "-", with: "+")
        
        // Pad the string with "=" signs until the string's length is a multiple of 4.
        while !base64Encoded.count.isMultiple(of: 4) {
            base64Encoded.append("=")
        }
        
        self.init(base64Encoded: base64Encoded, options: options)
    }
}
