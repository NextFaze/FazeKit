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
// UIImageAdditions.swift
// FazeKit
//
// Created by swoolcock on 11/11/2016.
//

import Foundation
import UIKit

extension UIImage {
    public static func coloredImage(color: UIColor, size: CGSize? = nil) -> UIImage? {
        let size = size ?? CGSize(width: 1.0, height: 1.0)
        
        UIGraphicsBeginImageContext(size)
        guard let currentContext = UIGraphicsGetCurrentContext() else { return nil }
        
        currentContext.setFillColor(color.cgColor)
        currentContext.fill(CGRect(x: 0, y: 0, width: size.width, height: size.height))
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
    public func imageByScalingAndRotating(maxSize: CGFloat) -> UIImage? {
        guard let imageRef = self.cgImage else { return nil }
        let width: CGFloat = CGFloat(imageRef.width)
        let height: CGFloat = CGFloat(imageRef.height)
        var transform: CGAffineTransform
        var bounds = CGRect(x: 0, y: 0, width: width, height: height)
        
        if width > maxSize || height > maxSize {
            let ratio = width / height
            if ratio > 1 {
                bounds.size.width = maxSize
                bounds.size.height = bounds.size.width / ratio
            } else {
                bounds.size.height = maxSize
                bounds.size.width = bounds.size.height * ratio
            }
        }
        
        let scaleRatio = bounds.size.width / width
        let imageSize = CGSize(width: imageRef.width, height: imageRef.height)
        let orientation = self.imageOrientation
        
        switch orientation {
        case .up: // EXIF = 1
            transform = CGAffineTransform()
            
        case .upMirrored: // EXIF = 2
            transform = CGAffineTransform(translationX: imageSize.width, y: 0).scaledBy(x: -1, y: 1)
            
        case .down: // EXIF = 3
            transform = CGAffineTransform(translationX: imageSize.width, y: imageSize.height).rotated(by: CGFloat(M_PI))
            
        case .downMirrored: // EXIF = 4
            transform = CGAffineTransform(translationX: 0, y: imageSize.height).scaledBy(x: 1, y: -1)
            
        case .leftMirrored: // EXIF = 5
            let boundsHeight = bounds.size.height
            bounds.size.height = bounds.size.width
            bounds.size.width = boundsHeight
            transform = CGAffineTransform(translationX: imageSize.height, y: imageSize.width).scaledBy(x: -1, y: 1).rotated(by: CGFloat(3.0 * M_PI / 2.0))
            
        case .left: // EXIF = 6
            let boundsHeight = bounds.size.height
            bounds.size.height = bounds.size.width
            bounds.size.width = boundsHeight
            transform = CGAffineTransform(translationX: 0, y: imageSize.width).rotated(by: CGFloat(3.0 * M_PI / 2.0))
            
        case .rightMirrored: // EXIF = 7
            let boundsHeight = bounds.size.height
            bounds.size.height = bounds.size.width
            bounds.size.width = boundsHeight
            transform = CGAffineTransform(scaleX: -1, y: 1).rotated(by: CGFloat(M_PI / 2.0))
            
        case .right: // EXIF = 8
            let boundsHeight = bounds.size.height
            bounds.size.height = bounds.size.width
            bounds.size.width = boundsHeight
            transform = CGAffineTransform(translationX: imageSize.height, y: 0).rotated(by: CGFloat(M_PI / 2.0))
        }
        
        UIGraphicsBeginImageContext(bounds.size)
        guard let context = UIGraphicsGetCurrentContext() else {
            // TODO: throw error
            return nil
        }
        
        if orientation == .right || orientation == .left {
            context.scaleBy(x: -scaleRatio, y: scaleRatio)
            context.translateBy(x: -height, y: 0)
        } else {
            context.scaleBy(x: scaleRatio, y: -scaleRatio)
            context.translateBy(x: 0, y: -height)
        }
        
        context.concatenate(transform)
        
        context.draw(imageRef, in: CGRect(x: 0, y: 0, width: width, height: height))
        let imageCopy = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return imageCopy
    }
}
