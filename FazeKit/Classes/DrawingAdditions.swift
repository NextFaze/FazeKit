//
//  DrawingAdditions.swift
//  FazeKit
//
//  Created by Shane Woolcock on 10/10/19.
//

import Foundation

public extension UIImage {
    static func usingContext(size: CGSize = CGSize(width: 1, height: 1), execute: (CGContext) -> Void) -> UIImage? {
        UIGraphicsBeginImageContext(size)
        defer { UIGraphicsEndImageContext() }
        guard let currentContext = UIGraphicsGetCurrentContext() else { return nil }
        execute(currentContext)
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}

public extension CGContext {
    func pushed(execute: () -> Void) {
        UIGraphicsPushContext(self)
        defer { UIGraphicsPopContext() }
        execute()
    }
}
