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
// Contains a partial port of http://vocaro.com/trevor/blog/2009/10/12/resize-a-uiimage-the-right-way/
// https://gist.github.com/bgreenlee/c81b169cfb8337ce5140
// Updated for Swift 4+
//

import Foundation
import UIKit
import CoreGraphics

public extension UIImage {
    static func coloredImage(color: UIColor, size: CGSize? = nil) -> UIImage? {
        let size = size ?? CGSize(width: 1.0, height: 1.0)
        
        UIGraphicsBeginImageContext(size)
        guard let currentContext = UIGraphicsGetCurrentContext() else { return nil }
        
        currentContext.setFillColor(color.cgColor)
        currentContext.fill(CGRect(x: 0, y: 0, width: size.width, height: size.height))
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
    @available(*, deprecated, message: "Use resizedImage(newSize:, quality:) instead")
    func imageByScalingAndRotating(maxSize: CGFloat) -> UIImage? {
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
            transform = CGAffineTransform(translationX: imageSize.width, y: imageSize.height).rotated(by: CGFloat(Double.pi))
            
        case .downMirrored: // EXIF = 4
            transform = CGAffineTransform(translationX: 0, y: imageSize.height).scaledBy(x: 1, y: -1)
            
        case .leftMirrored: // EXIF = 5
            let boundsHeight = bounds.size.height
            bounds.size.height = bounds.size.width
            bounds.size.width = boundsHeight
            transform = CGAffineTransform(translationX: imageSize.height, y: imageSize.width).scaledBy(x: -1, y: 1).rotated(by: CGFloat(3.0 * Double.pi / 2.0))
            
        case .left: // EXIF = 6
            let boundsHeight = bounds.size.height
            bounds.size.height = bounds.size.width
            bounds.size.width = boundsHeight
            transform = CGAffineTransform(translationX: 0, y: imageSize.width).rotated(by: CGFloat(3.0 * Double.pi / 2.0))
            
        case .rightMirrored: // EXIF = 7
            let boundsHeight = bounds.size.height
            bounds.size.height = bounds.size.width
            bounds.size.width = boundsHeight
            transform = CGAffineTransform(scaleX: -1, y: 1).rotated(by: CGFloat(Double.pi / 2.0))
            
        case .right: // EXIF = 8
            let boundsHeight = bounds.size.height
            bounds.size.height = bounds.size.width
            bounds.size.width = boundsHeight
            transform = CGAffineTransform(translationX: imageSize.height, y: 0).rotated(by: CGFloat(Double.pi / 2.0))
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
    
    var aspect: CGFloat {
        return self.size.height == 0 ? 1 : self.size.width / self.size.height
    }
}

// UIImage+Alpha
// http://vocaro.com/trevor/blog/wp-content/uploads/2009/10/UIImage+Alpha.m
public extension UIImage {
    // Returns true if the image has an alpha layer
    func hasAlpha() -> Bool {
        guard let alpha = self.cgImage?.alphaInfo else { return false }
        return alpha == .first || alpha == .last || alpha == .premultipliedFirst || alpha == .premultipliedLast
    }
    
    // Returns a copy of the given image, adding an alpha channel if it doesn't already have one
    func imageWithAlpha() -> UIImage? {
        if self.hasAlpha() {
            return self
        }
        
        guard let imageRef = self.cgImage, let colorSpace = imageRef.colorSpace else { return nil }
        let width = imageRef.width
        let height = imageRef.height
        
        // The bitsPerComponent and bitmapInfo values are hard-coded to prevent an "unsupported parameter combination" error
        guard let offscreenContext = CGContext(data: nil,
                                               width: width,
                                               height: height,
                                               bitsPerComponent: 8,
                                               bytesPerRow: 0,
                                               space: colorSpace,
                                               bitmapInfo: CGImageAlphaInfo.premultipliedFirst.rawValue)
            else { return nil }
        
        // Draw the image into the context and retrieve the new image, which will now have an alpha layer
        offscreenContext.draw(imageRef, in: CGRect(x: 0, y: 0, width: CGFloat(width), height: CGFloat(height)))
        
        guard let imageRefWithAlpha = offscreenContext.makeImage() else { return nil }
        return UIImage(cgImage: imageRefWithAlpha)
    }
    
    // Creates a mask that makes the outer edges transparent and everything else opaque
    // The size must include the entire mask (opaque part + transparent border)
    // The caller is responsible for releasing the returned reference by calling CGImageRelease
    private func newBorderMask(borderSize: UInt, size: CGSize) -> CGImage? {
        let colorSpace = CGColorSpaceCreateDeviceGray()
        
        // Build a context that's the same dimensions as the new size
        guard let maskContext = CGContext(data: nil,
                                          width: Int(size.width),
                                          height: Int(size.height),
                                          bitsPerComponent: 8,
                                          bytesPerRow: 0,
                                          space: colorSpace,
                                          bitmapInfo: CGImageAlphaInfo.premultipliedFirst.rawValue)
            else { return nil }
        
        // Start with a mask that's entirely transparent
        maskContext.setFillColor(UIColor.black.cgColor)
        maskContext.fill(CGRect(x: 0, y: 0, width: size.width, height: size.height))
        
        // Make the inner part (within the border) opaque
        maskContext.setFillColor(UIColor.white.cgColor)
        maskContext.fill(CGRect(x: CGFloat(borderSize), y: CGFloat(borderSize), width: size.width - CGFloat(borderSize) * 2.0, height: size.height - CGFloat(borderSize) * 2.0))
        
        // Get an image of the context
        return maskContext.makeImage()
    }
    
    // Returns a copy of the image with a transparent border of the given size added around its edges.
    // If the image has no alpha layer, one will be added to it.
    func transparentBorderImage(borderSize: UInt) -> UIImage? {
        // If the image does not have an alpha layer, add one
        guard let image = self.imageWithAlpha(), let cgImage = self.cgImage, let colorSpace = cgImage.colorSpace else { return nil }
        let newRect = CGRect(x: 0, y: 0, width: image.size.width + CGFloat(borderSize) * 2.0, height: image.size.height + CGFloat(borderSize) * 2.0)
        
        // Build a context that's the same dimensions as the new size
        guard let bitmap = CGContext(data: nil,
                                     width: Int(newRect.size.width),
                                     height: Int(newRect.size.height),
                                     bitsPerComponent: cgImage.bitsPerComponent,
                                     bytesPerRow: 0,
                                     space: colorSpace,
                                     bitmapInfo: cgImage.bitmapInfo.rawValue)
            else { return nil }
        
        // Draw the image in the center of the context, leaving a gap around the edges
        let imageLocation = CGRect(x: CGFloat(borderSize), y: CGFloat(borderSize), width: image.size.width, height: image.size.height)
        bitmap.draw(cgImage, in: imageLocation)
        
        // Create a mask to make the border transparent, and combine it with the image
        guard let borderImageRef = bitmap.makeImage(), let maskImageRef = self.newBorderMask(borderSize: borderSize, size: newRect.size) else { return nil }
        guard let transparentBorderImageRef = borderImageRef.masking(maskImageRef) else { return nil }
        
        return UIImage(cgImage: transparentBorderImageRef)
    }
    
    // Adds a rectangular path to the given context and rounds its corners by the given extents
    // Original author: BjÃ¶rn SÃ¥llarp. Used with permission. See: http://blog.sallarp.com/iphone-uiimage-round-corners/
    private func addRoundedRectToPath(rect: CGRect, context: CGContext, ovalWidth: CGFloat, ovalHeight: CGFloat) {
        if (ovalWidth == 0 || ovalHeight == 0) {
            context.addRect(rect)
            return
        }
        context.saveGState()
        
        context.translateBy(x: rect.minX, y: rect.minY)
        context.scaleBy(x: ovalWidth, y: ovalHeight)
        
        let fw = rect.width / ovalWidth
        let fh = rect.height / ovalHeight
        context.move(to: CGPoint(x: fw, y: fh / 2))
        context.addArc(tangent1End: CGPoint(x: fw, y: fh), tangent2End: CGPoint(x: fw / 2, y: fh), radius: 1)
        context.addArc(tangent1End: CGPoint(x: 0, y: fh), tangent2End: CGPoint(x: 0, y: fh / 2), radius: 1)
        context.addArc(tangent1End: CGPoint(x: 0, y: 0), tangent2End: CGPoint(x: fw / 2, y: 0), radius: 1)
        context.addArc(tangent1End: CGPoint(x: fw, y: 0), tangent2End: CGPoint(x: fw, y: fh / 2), radius: 1)
        context.closePath()
        context.restoreGState()
    }
}

// UIImage+RoundedCorner
// http://vocaro.com/trevor/blog/wp-content/uploads/2009/10/UIImage+RoundedCorner.m
public extension UIImage {
    // Creates a copy of this image with rounded corners
    // If borderSize is non-zero, a transparent border of the given size will also be added
    // Original author: BjÃ¶rn SÃ¥llarp. Used with permission. See: http://blog.sallarp.com/iphone-uiimage-round-corners/
    func roundedCornerImage(cornerSize:Int, borderSize: Int) -> UIImage? {
        // If the image does not have an alpha layer, add one
        guard let image = imageWithAlpha(), let cgImage = image.cgImage, let colorSpace = cgImage.colorSpace else { return nil }
        // Build a context that's the same dimensions as the new size
        guard let context = CGContext(data: nil,
                                      width: Int(image.size.width),
                                      height: Int(image.size.height),
                                      bitsPerComponent: cgImage.bitsPerComponent,
                                      bytesPerRow: 0,
                                      space: colorSpace,
                                      bitmapInfo: cgImage.bitmapInfo.rawValue)
            else { return nil }
        
        // Create a clipping path with rounded corners
        context.beginPath()
        self.addRoundedRectToPath(rect: CGRect(x: CGFloat(borderSize),
                                               y: CGFloat(borderSize),
                                               width: image.size.width - CGFloat(borderSize) * 2.0,
                                               height: image.size.height - CGFloat(borderSize) * 2.0),
                                  context: context,
                                  ovalWidth: CGFloat(cornerSize),
                                  ovalHeight: CGFloat(cornerSize))
        context.closePath()
        context.clip()
        
        // Draw the image to the context; the clipping path will make anything outside the rounded rect transparent
        context.draw(cgImage, in: CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height))
        
        // Create a CGImage from the context
        guard let clippedImage = context.makeImage() else { return nil }
        return UIImage(cgImage: clippedImage)
    }
}

// UIImage+Resize
// http://vocaro.com/trevor/blog/wp-content/uploads/2009/10/UIImage+Resize.m
public extension UIImage {
    // Returns a rescaled copy of the image, taking into account its orientation
    // The image will be scaled disproportionately if necessary to fit the bounds specified by the parameter
    func resizedImage(newSize: CGSize, quality: CGInterpolationQuality = .default) -> UIImage? {
        let drawTransposed: Bool
        switch self.imageOrientation {
        case .left, .leftMirrored, .right, .rightMirrored:
            drawTransposed = true
        default:
            drawTransposed = false
        }
        
        return self.resizedImage(newSize: newSize, transform: self.transformForOrientation(newSize: newSize), transpose: drawTransposed, quality: quality)
    }
    
    
    // Returns a copy of the image that has been transformed using the given affine transform and scaled to the new size
    // The new image's orientation will be UIImageOrientationUp, regardless of the current image's orientation
    // If the new size is not integral, it will be rounded up
    private func resizedImage(newSize: CGSize, transform: CGAffineTransform, transpose: Bool, quality: CGInterpolationQuality) -> UIImage? {
        let newRect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height).integral
        let transposedRect = CGRect(x: 0, y: 0, width: newRect.size.height, height: newRect.size.width)
        guard let imageRef = self.cgImage, let colorSpace = imageRef.colorSpace else { return nil }
        
        // Build a context that's the same dimensions as the new size
        guard let bitmap = CGContext(data: nil,
                                     width: Int(newRect.size.width),
                                     height: Int(newRect.size.height),
                                     bitsPerComponent: imageRef.bitsPerComponent,
                                     bytesPerRow: 0,
                                     space: colorSpace,
                                     bitmapInfo: imageRef.bitmapInfo.rawValue)
            else { return nil }
        
        // Rotate and/or flip the image if required by its orientation
        bitmap.concatenate(transform)
        
        // Set the quality level to use when rescaling
        bitmap.interpolationQuality = quality
        
        // Draw into the context; this scales the image
        bitmap.draw(imageRef, in: transpose ? transposedRect : newRect)
        
        // Get the resized image from the context and a UIImage
        guard let newImageRef = bitmap.makeImage() else { return nil }
        return UIImage(cgImage: newImageRef)
    }
    
    // Returns a copy of this image that is cropped to the given bounds.
    // The bounds will be adjusted using CGRectIntegral.
    // This method ignores the image's imageOrientation setting.
    func croppedImage(bounds: CGRect) -> UIImage? {
        guard let newImage = self.cgImage?.cropping(to: bounds) else { return nil }
        return UIImage(cgImage: newImage)
    }
    
    // Returns a copy of this image that is squared to the thumbnail size.
    // If transparentBorder is non-zero, a transparent border of the given size will be added around the edges of the thumbnail. (Adding a transparent border of at least one pixel in size has the side-effect of antialiasing the edges of the image when rotating it using Core Animation.)
    func thumbnailImage(thumbnailSize: Int, borderSize: Int, cornerRadius: Int, quality: CGInterpolationQuality) -> UIImage? {
        guard let resizedImage = self.resizedImageWithContentMode(contentMode: .scaleAspectFill,
                                                                  bounds: CGSize(width: CGFloat(thumbnailSize), height: CGFloat(thumbnailSize)),
                                                                  quality: quality)
            else { return nil }
            
        // Crop out any part of the image that's larger than the thumbnail size
        // The cropped rect must be centered on the resized image
        // Round the origin points so that the size isn't altered when CGRectIntegral is later invoked
        let cropRect = CGRect(x: round((resizedImage.size.width - CGFloat(thumbnailSize)) / 2),
                              y: round((resizedImage.size.height - CGFloat(thumbnailSize)) / 2),
                              width: CGFloat(thumbnailSize), height: CGFloat(thumbnailSize))
        
        guard let croppedImage = resizedImage.croppedImage(bounds: cropRect),
            let transparentBorderImage = (borderSize > 0 ? croppedImage.transparentBorderImage(borderSize: UInt(borderSize)) : croppedImage)
            else { return nil }
        
        return transparentBorderImage.roundedCornerImage(cornerSize: cornerRadius, borderSize: borderSize)
    }
    
    // Resizes the image according to the given content mode, taking into account the image's orientation
    func resizedImageWithContentMode(contentMode: UIViewContentMode, bounds: CGSize, quality: CGInterpolationQuality) -> UIImage? {
        let horizontalRatio = bounds.width / self.size.width
        let verticalRatio = bounds.height / self.size.height
        let ratio: CGFloat
        
        switch contentMode {
        case .scaleAspectFill:
            ratio = max(horizontalRatio, verticalRatio)
        case .scaleAspectFit:
            ratio = min(horizontalRatio, verticalRatio)
        default:
            fatalError(String(format: "Unsupported content mode: %d", contentMode.rawValue))
        }
        
        let newSize = CGSize(width: self.size.width * ratio, height: self.size.height * ratio)
        return self.resizedImage(newSize: newSize, quality: quality)
    }
    
    // Returns an affine transform that takes into account the image orientation when drawing a scaled image
    func transformForOrientation(newSize: CGSize) -> CGAffineTransform {
        var transform: CGAffineTransform = .identity
        
        switch (self.imageOrientation) {
        case .down, .downMirrored: // EXIF = 3, 4
            transform = transform.translatedBy(x: newSize.width, y: newSize.height).rotated(by: .pi)
        case .left, .leftMirrored: // EXIF = 6, 5
            transform = transform.translatedBy(x: newSize.width, y: 0).rotated(by: .pi / 2)
        case .right, .rightMirrored: // EXIF = 8, 7
            transform = transform.translatedBy(x: 0, y: newSize.height).rotated(by: .pi / -2)
        default:
            break
        }
        
        switch (self.imageOrientation) {
        case .upMirrored, .downMirrored: // EXIF = 2, 4
            transform = transform.translatedBy(x: newSize.width, y: 0).scaledBy(x: -1, y: 1)
        case .leftMirrored, .rightMirrored:  // EXIF = 5, 7
            transform = transform.translatedBy(x: newSize.height, y: 0).scaledBy(x: -1, y: 1)
        default:
            break
        }
        
        return transform
    }
}
