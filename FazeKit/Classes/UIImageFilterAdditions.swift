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
// UIImageFilterAdditions.swift
// FazeKit
//
// Created by swoolcock on 16/08/2016.
//

import Foundation
import CoreImage
import AVFoundation

public extension UIImage {
    var filters: ImageFilters { return ImageFilters(image: self) }

    struct Generators {
        @available(iOS 11, *)
        public static func attributedTextImage(inputText: NSAttributedString, inputScaleFactor: Float = 1) -> UIImage? {
            return CIFilter.attributedTextImageGenerator(inputText: inputText, inputScaleFactor: inputScaleFactor as NSNumber)?.outputUIImage
        }
        
        public enum AztecCodeCompactStyle {
            case compact
            case noncompact
            case automatic
            
            fileprivate var asNSNumber: NSNumber? {
                return self == .automatic ? nil : (self == .compact) as NSNumber
            }
        }
        
        @available(iOS 8, *)
        public static func aztecCode(inputMessage: Data, inputCorrectionLevel: Float = 23, inputLayers: Float, inputCompactStyle: AztecCodeCompactStyle = .automatic) -> UIImage? {
            return CIFilter.aztecCodeGenerator(inputMessage: inputMessage as NSData,
                                               inputCorrectionLevel: inputCorrectionLevel as NSNumber,
                                               inputLayers: inputLayers as NSNumber,
                                               inputCompactStyle: inputCompactStyle.asNSNumber)?.outputUIImage
        }
        
        @available(iOS 11, *)
        public static func barcode(inputBarcodeDescriptor: CIBarcodeDescriptor) -> UIImage? {
            return CIFilter.barcodeGenerator(inputBarcodeDescriptor: inputBarcodeDescriptor)?.outputUIImage
        }
        
        @available(iOS 5, *)
        public static func checkerboard(inputCenter: CGPoint = CGPoint(x: 150.0, y: 150.0), inputColor0: UIColor, inputColor1: UIColor, inputWidth: Float = 80, inputSharpness: Float = 1) -> UIImage? {
            return CIFilter.checkerboardGenerator(inputCenter: CIVector(cgPoint: inputCenter),
                                                  inputColor0: inputColor0.ciColor,
                                                  inputColor1: inputColor1.ciColor,
                                                  inputWidth: inputWidth as NSNumber,
                                                  inputSharpness: inputSharpness as NSNumber)?.outputUIImage
        }
        
        @available(iOS 8, *)
        public static func code128Barcode(inputMessage: Data, inputQuietSpace: Float = 7, inputBarcodeHeight: Float = 32) -> UIImage? {
            return CIFilter.code128BarcodeGenerator(inputMessage: inputMessage as NSData,
                                                    inputQuietSpace: inputQuietSpace as NSNumber,
                                                    inputBarcodeHeight: inputBarcodeHeight as NSNumber)?.outputUIImage
        }
        
        @available(iOS 5, *)
        public static func constantColor(inputColor: UIColor) -> UIImage? {
            return CIFilter.constantColorGenerator(inputColor: inputColor.ciColor)?.outputUIImage
        }
        
        @available(iOS 5, *)
        public static func gaussianGradient(inputCenter: CGPoint = CGPoint(x: 150.0, y: 150.0), inputColor0: UIColor, inputColor1: UIColor, inputRadius: Float = 300) -> UIImage? {
            return CIFilter.gaussianGradient(inputCenter: CIVector(cgPoint: inputCenter),
                                             inputColor0: inputColor0.ciColor,
                                             inputColor1: inputColor1.ciColor,
                                             inputRadius: inputRadius as NSNumber)?.outputUIImage
        }
        
        @available(iOS 10, *)
        public static func hueSaturationValueGradient(inputValue: Float = 1, inputRadius: Float = 300, inputSoftness: Float = 1, inputDither: Float = 1, inputColorSpace: CGColorSpace) -> UIImage? {
            return CIFilter.hueSaturationValueGradient(inputValue: inputValue as NSNumber,
                                                       inputRadius: inputRadius as NSNumber,
                                                       inputSoftness: inputSoftness as NSNumber,
                                                       inputDither: inputDither as NSNumber,
                                                       inputColorSpace: inputColorSpace)?.outputUIImage
        }
        
        @available(iOS 9, *)
        public static func lenticularHalo(inputCenter: CGPoint = CGPoint(x: 150.0, y: 150.0),
                                          inputColor: UIColor,
                                          inputHaloRadius: Float = 70,
                                          inputHaloWidth: Float = 87,
                                          inputHaloOverlap: Float = 0.77,
                                          inputStriationStrength: Float = 0.5,
                                          inputStriationContrast: Float = 1,
                                          inputTime: Float = 0) -> UIImage? {
            return CIFilter.lenticularHaloGenerator(inputCenter: CIVector(cgPoint: inputCenter),
                                                    inputColor: inputColor.ciColor,
                                                    inputHaloRadius: inputHaloRadius as NSNumber,
                                                    inputHaloWidth: inputHaloWidth as NSNumber,
                                                    inputHaloOverlap: inputHaloOverlap as NSNumber,
                                                    inputStriationStrength: inputStriationStrength as NSNumber,
                                                    inputStriationContrast: inputStriationContrast as NSNumber,
                                                    inputTime: inputTime as NSNumber)?.outputUIImage
        }
        
        @available(iOS 5, *)
        public static func linearGradient(inputPoint0: CGPoint = CGPoint(x: 0.0, y: 0.0), inputPoint1: CGPoint = CGPoint(x: 200.0, y: 200.0), inputColor0: UIColor, inputColor1: UIColor) -> UIImage? {
            return CIFilter.linearGradient(inputPoint0: CIVector(cgPoint: inputPoint0),
                                           inputPoint1: CIVector(cgPoint: inputPoint1),
                                           inputColor0: inputColor0.ciColor,
                                           inputColor1: inputColor1.ciColor)?.outputUIImage
        }
        
        public enum PDF417Compaction {
            case always
            case never
            case automatic
            
            fileprivate var asNSNumber: NSNumber? {
                return self == .automatic ? nil : (self == .always) as NSNumber
            }
        }
        
        @available(iOS 9, *)
        public static func pdf417Barcode(inputMessage: Data,
                                         inputMinWidth: Float,
                                         inputMaxWidth: Float,
                                         inputMinHeight: Float,
                                         inputMaxHeight: Float,
                                         inputDataColumns: Float,
                                         inputRows: Float,
                                         inputPreferredAspectRatio: Float,
                                         inputCompactionMode: Float,
                                         inputCompactStyle: AztecCodeCompactStyle,
                                         inputCorrectionLevel: Float,
                                         inputAlwaysSpecifyCompaction: PDF417Compaction = .automatic) -> UIImage? {
            return CIFilter.pdf417BarcodeGenerator(inputMessage: inputMessage as NSData,
                                                   inputMinWidth: inputMinWidth as NSNumber,
                                                   inputMaxWidth: inputMaxWidth as NSNumber,
                                                   inputMinHeight: inputMinHeight as NSNumber,
                                                   inputMaxHeight: inputMaxHeight as NSNumber,
                                                   inputDataColumns: inputDataColumns as NSNumber,
                                                   inputRows: inputRows as NSNumber,
                                                   inputPreferredAspectRatio: inputPreferredAspectRatio as NSNumber,
                                                   inputCompactionMode: inputCompactionMode as NSNumber,
                                                   inputCompactStyle: inputCompactStyle.asNSNumber,
                                                   inputCorrectionLevel: inputCorrectionLevel as NSNumber,
                                                   inputAlwaysSpecifyCompaction: inputAlwaysSpecifyCompaction.asNSNumber)?.outputUIImage
        }
        
        public enum QRCodeCorrectionLevel: String {
            case low = "L"
            case medium = "M"
            case quality = "Q"
            case high = "H"
        }
        
        @available(iOS 7, *)
        public static func qrCode(inputMessage: Data, inputCorrectionLevel: QRCodeCorrectionLevel = .medium) -> UIImage? {
            return CIFilter.qrCodeGenerator(inputMessage: inputMessage as NSData, inputCorrectionLevel: inputCorrectionLevel.rawValue as NSString)?.outputUIImage
        }
        
        @available(iOS 5, *)
        public static func radialGradient(inputCenter: CGPoint = CGPoint(x: 150.0, y: 150.0), inputRadius0: Float = 5, inputRadius1: Float = 100, inputColor0: UIColor, inputColor1: UIColor) -> UIImage? {
            return CIFilter.radialGradient(inputCenter: CIVector(cgPoint: inputCenter),
                                           inputRadius0: inputRadius0 as NSNumber,
                                           inputRadius1: inputRadius1 as NSNumber,
                                           inputColor0: inputColor0.ciColor,
                                           inputColor1: inputColor1.ciColor)?.outputUIImage
        }
        
        @available(iOS 6, *)
        public static func random() -> UIImage? {
            return CIFilter.randomGenerator()?.outputUIImage
        }
        
        @available(iOS 6, *)
        public static func smoothLinearGradient(inputPoint0: CGPoint = CGPoint(x: 0.0, y: 0.0), inputPoint1: CGPoint = CGPoint(x: 200.0, y: 200.0), inputColor0: UIColor, inputColor1: UIColor) -> UIImage? {
            return CIFilter.smoothLinearGradient(inputPoint0: CIVector(cgPoint: inputPoint0),
                                                 inputPoint1: CIVector(cgPoint: inputPoint1),
                                                 inputColor0: inputColor0.ciColor,
                                                 inputColor1: inputColor1.ciColor)?.outputUIImage
        }
        
        @available(iOS 6, *)
        public static func starShine(inputCenter: CGPoint = CGPoint(x: 150.0, y: 150.0),
                                     inputColor: UIColor,
                                     inputRadius: Float = 50,
                                     inputCrossScale: Float = 15,
                                     inputCrossAngle: Float = 0.6,
                                     inputCrossOpacity: Float = -2,
                                     inputCrossWidth: Float = 2.5,
                                     inputEpsilon: Float = -2) -> UIImage? {
            return CIFilter.starShineGenerator(inputCenter: CIVector(cgPoint: inputCenter),
                                               inputColor: inputColor.ciColor,
                                               inputRadius: inputRadius as NSNumber,
                                               inputCrossScale: inputCrossScale as NSNumber,
                                               inputCrossAngle: inputCrossAngle as NSNumber,
                                               inputCrossOpacity: inputCrossOpacity as NSNumber,
                                               inputCrossWidth: inputCrossWidth as NSNumber,
                                               inputEpsilon: inputEpsilon as NSNumber)?.outputUIImage
        }
        
        @available(iOS 5, *)
        public static func stripes(inputCenter: CGPoint = CGPoint(x: 150.0, y: 150.0), inputColor0: UIColor, inputColor1: UIColor, inputWidth: Float = 80, inputSharpness: Float = 1) -> UIImage? {
            return CIFilter.stripesGenerator(inputCenter: CIVector(cgPoint: inputCenter),
                                             inputColor0: inputColor0.ciColor,
                                             inputColor1: inputColor1.ciColor,
                                             inputWidth: inputWidth as NSNumber,
                                             inputSharpness: inputSharpness as NSNumber)?.outputUIImage
        }
        
        @available(iOS 9, *)
        public static func sunbeams(inputCenter: CGPoint = CGPoint(x: 150.0, y: 150.0),
                                    inputColor: UIColor,
                                    inputSunRadius: Float = 40,
                                    inputMaxStriationRadius: Float = 2.58,
                                    inputStriationStrength: Float = 0.5,
                                    inputStriationContrast: Float = 1.375,
                                    inputTime: Float = 0) -> UIImage? {
            return CIFilter.sunbeamsGenerator(inputCenter: CIVector(cgPoint: inputCenter),
                                              inputColor: inputColor.ciColor,
                                              inputSunRadius: inputSunRadius as NSNumber,
                                              inputMaxStriationRadius: inputMaxStriationRadius as NSNumber,
                                              inputStriationStrength: inputStriationStrength as NSNumber,
                                              inputStriationContrast: inputStriationContrast as NSNumber,
                                              inputTime: inputTime as NSNumber)?.outputUIImage
        }
        
        @available(iOS 11, *)
        public static func textImage(inputText: String, inputFontName: String = "HelveticaNeue", inputFontSize: Float = 12, inputScaleFactor: Float = 1) -> UIImage? {
            return CIFilter.textImageGenerator(inputText: inputText as NSString,
                                               inputFontName: inputFontName as NSString,
                                               inputFontSize: inputFontSize as NSNumber,
                                               inputScaleFactor: inputScaleFactor as NSNumber)?.outputUIImage
        }
    }
}

public struct ImageFilters {
    fileprivate let image: UIImage
    
    @available(iOS 8, *)
    public func accordionFoldTransition(inputTargetImage: UIImage, inputBottomHeight: Float = 0, inputNumberOfFolds: Float = 3, inputFoldShadowAmount: Float = 0.1, inputTime: Float = 0) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputTargetImage = inputTargetImage.ciImage else { return nil }
        return CIFilter.accordionFoldTransition(inputImage: inputImage,
                                                inputTargetImage: inputTargetImage,
                                                inputBottomHeight: inputBottomHeight as NSNumber,
                                                inputNumberOfFolds: inputNumberOfFolds as NSNumber,
                                                inputFoldShadowAmount: inputFoldShadowAmount as NSNumber,
                                                inputTime: inputTime as NSNumber)?.outputUIImage
    }
    
    @available(iOS 5, *)
    public func additionCompositing(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.additionCompositing(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 6, *)
    public func affineClamp(inputTransform: CGAffineTransform = CGAffineTransform(a: 1.0, b: 0.0, c: 0.0, d: 1.0, tx: 0.0, ty: 0.0)) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.affineClamp(inputImage: inputImage,
                                    inputTransform: NSValue(cgAffineTransform: inputTransform))?.outputUIImage
    }
    
    @available(iOS 6, *)
    public func affineTile(inputTransform: CGAffineTransform = CGAffineTransform(a: 1.0, b: 0.0, c: 0.0, d: 1.0, tx: 0.0, ty: 0.0)) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.affineTile(inputImage: inputImage,
                                   inputTransform: NSValue(cgAffineTransform: inputTransform))?.outputUIImage
    }
    
    @available(iOS 5, *)
    public func affineTransform(inputTransform: CGAffineTransform = CGAffineTransform(a: 1.0, b: 0.0, c: 0.0, d: 1.0, tx: 0.0, ty: 0.0)) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.affineTransform(inputImage: inputImage,
                                        inputTransform: NSValue(cgAffineTransform: inputTransform))?.outputUIImage
    }
    
    @available(iOS 9, *)
    public func areaAverage(inputExtent: CGRect = CGRect(x: 0.0, y: 0.0, width: 640.0, height: 80.0)) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.areaAverage(inputImage: inputImage, inputExtent: CIVector(cgRect: inputExtent))?.outputUIImage
    }
    
    @available(iOS 8, *)
    public func areaHistogram(inputExtent: CGRect = CGRect(x: 0.0, y: 0.0, width: 640.0, height: 80.0), inputScale: Float = 1, inputCount: Float = 64) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.areaHistogram(inputImage: inputImage,
                                      inputExtent: CIVector(cgRect: inputExtent),
                                      inputScale: inputScale as NSNumber,
                                      inputCount: inputCount as NSNumber)?.outputUIImage
    }
    
    @available(iOS 9, *)
    public func areaMaximum(inputExtent: CGRect = CGRect(x: 0.0, y: 0.0, width: 640.0, height: 80.0)) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.areaMaximum(inputImage: inputImage, inputExtent: CIVector(cgRect: inputExtent))?.outputUIImage
    }
    
    @available(iOS 9, *)
    public func areaMaximumAlpha(inputExtent: CGRect = CGRect(x: 0.0, y: 0.0, width: 640.0, height: 80.0)) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.areaMaximumAlpha(inputImage: inputImage, inputExtent: CIVector(cgRect: inputExtent))?.outputUIImage
    }
    
    @available(iOS 9, *)
    public func areaMinimum(inputExtent: CGRect = CGRect(x: 0.0, y: 0.0, width: 640.0, height: 80.0)) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.areaMinimum(inputImage: inputImage, inputExtent: CIVector(cgRect: inputExtent))?.outputUIImage
    }
    
    @available(iOS 9, *)
    public func areaMinimumAlpha(inputExtent: CGRect = CGRect(x: 0.0, y: 0.0, width: 640.0, height: 80.0)) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.areaMinimumAlpha(inputImage: inputImage, inputExtent: CIVector(cgRect: inputExtent))?.outputUIImage
    }
    
    @available(iOS 11, *)
    public func areaMinMaxRed(inputExtent: CGRect = CGRect(x: 0.0, y: 0.0, width: 640.0, height: 80.0)) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.areaMinMaxRed(inputImage: inputImage, inputExtent: CIVector(cgRect: inputExtent))?.outputUIImage
    }
    
    @available(iOS 6, *)
    public func barsSwipeTransition(inputTargetImage: UIImage, inputAngle: Float = Float.pi, inputWidth: Float = 30, inputBarOffset: Float = 10, inputTime: Float = 0) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputTargetImage = inputTargetImage.ciImage else { return nil }
        return CIFilter.barsSwipeTransition(inputImage: inputImage,
                                            inputTargetImage: inputTargetImage,
                                            inputAngle: inputAngle as NSNumber,
                                            inputWidth: inputWidth as NSNumber,
                                            inputBarOffset: inputBarOffset as NSNumber,
                                            inputTime: inputTime as NSNumber)?.outputUIImage
    }
    
    @available(iOS 11, *)
    public func bicubicScaleTransform(inputScale: Float = 1, inputAspectRatio: Float = 1, inputB: Float = 0, inputC: Float = 0.75) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.bicubicScaleTransform(inputImage: inputImage,
                                              inputScale: inputScale as NSNumber,
                                              inputAspectRatio: inputAspectRatio as NSNumber,
                                              inputB: inputB as NSNumber,
                                              inputC: inputC as NSNumber)?.outputUIImage
    }
    
    @available(iOS 7, *)
    public func blendWithAlphaMask(inputBackgroundImage: UIImage, inputMaskImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage, let inputMaskImage = inputMaskImage.ciImage else { return nil }
        return CIFilter.blendWithAlphaMask(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage, inputMaskImage: inputMaskImage)?.outputUIImage
    }
    
    @available(iOS 11, *)
    public func blendWithBlueMask(inputBackgroundImage: UIImage, inputMaskImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage, let inputMaskImage = inputMaskImage.ciImage else { return nil }
        return CIFilter.blendWithBlueMask(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage, inputMaskImage: inputMaskImage)?.outputUIImage
    }
    
    @available(iOS 6, *)
    public func blendWithMask(inputBackgroundImage: UIImage, inputMaskImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage, let inputMaskImage = inputMaskImage.ciImage else { return nil }
        return CIFilter.blendWithMask(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage, inputMaskImage: inputMaskImage)?.outputUIImage
    }
    
    @available(iOS 11, *)
    public func blendWithRedMask(inputBackgroundImage: UIImage, inputMaskImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage, let inputMaskImage = inputMaskImage.ciImage else { return nil }
        return CIFilter.blendWithRedMask(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage, inputMaskImage: inputMaskImage)?.outputUIImage
    }
    
    @available(iOS 6, *)
    public func bloom(inputRadius: Float = 10, inputIntensity: Float = 0.5) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.bloom(inputImage: inputImage, inputRadius: inputRadius as NSNumber, inputIntensity: inputIntensity as NSNumber)?.outputUIImage
    }
    
    @available(iOS 11, *)
    public func bokehBlur(inputRadius: Float = 20, inputRingAmount: Float = 0, inputRingSize: Float = 0.1, inputSoftness: Float = 1) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.bokehBlur(inputImage: inputImage,
                                  inputRadius: inputRadius as NSNumber,
                                  inputRingAmount: inputRingAmount as NSNumber,
                                  inputRingSize: inputRingSize as NSNumber,
                                  inputSoftness: inputSoftness as NSNumber)?.outputUIImage
    }
    
    @available(iOS 9, *)
    public func boxBlur(inputRadius: Float = 10) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.boxBlur(inputImage: inputImage, inputRadius: inputRadius as NSNumber)?.outputUIImage
    }
    
    @available(iOS 6, *)
    public func bumpDistortion(inputCenter: CGPoint = CGPoint(x: 150.0, y: 150.0), inputRadius: Float = 300, inputScale: Float = 0.5) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.bumpDistortion(inputImage: inputImage,
                                       inputCenter: CIVector(cgPoint: inputCenter),
                                       inputRadius: inputRadius as NSNumber,
                                       inputScale: inputScale as NSNumber)?.outputUIImage
    }
    
    @available(iOS 6, *)
    public func bumpDistortionLinear(inputCenter: CGPoint = CGPoint(x: 150.0, y: 150.0), inputRadius: Float = 300, inputAngle: Float = 0, inputScale: Float = 0.5) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.bumpDistortionLinear(inputImage: inputImage,
                                             inputCenter: CIVector(cgPoint: inputCenter),
                                             inputRadius: inputRadius as NSNumber,
                                             inputAngle: inputAngle as NSNumber,
                                             inputScale: inputScale as NSNumber)?.outputUIImage
    }
    
    @available(iOS 6, *)
    public func circleSplashDistortion(inputCenter: CGPoint = CGPoint(x: 150.0, y: 150.0), inputRadius: Float = 150) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.circleSplashDistortion(inputImage: inputImage,
                                               inputCenter: CIVector(cgPoint: inputCenter),
                                               inputRadius: inputRadius as NSNumber)?.outputUIImage
    }
    
    @available(iOS 6, *)
    public func circularScreen(inputCenter: CGPoint = CGPoint(x: 150.0, y: 150.0), inputWidth: Float = 6, inputSharpness: Float = 0.7) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.circularScreen(inputImage: inputImage,
                                       inputCenter: CIVector(cgPoint: inputCenter),
                                       inputWidth: inputWidth as NSNumber,
                                       inputSharpness: inputSharpness as NSNumber)?.outputUIImage
    }
    
    @available(iOS 9, *)
    public func circularWrap(inputCenter: CGPoint = CGPoint(x: 150.0, y: 150.0), inputRadius: Float = 150, inputAngle: Float = 0) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.circularWrap(inputImage: inputImage,
                                     inputCenter: CIVector(cgPoint: inputCenter),
                                     inputRadius: inputRadius as NSNumber,
                                     inputAngle: inputAngle as NSNumber)?.outputUIImage
    }
    
    @available(iOS 10, *)
    public func clamp(inputExtent: CGRect = CGRect(x: 0.0, y: 0.0, width: 640.0, height: 80.0)) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.clamp(inputImage: inputImage, inputExtent: CIVector(cgRect: inputExtent))?.outputUIImage
    }
    
    @available(iOS 9, *)
    public func cmykHalftone(inputCenter: CGPoint = CGPoint(x: 150.0, y: 150.0),
                             inputWidth: Float = 6,
                             inputAngle: Float = 0,
                             inputSharpness: Float = 0.7,
                             inputGCR: Float = 1,
                             inputUCR: Float = 0.5) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.cmykHalftone(inputImage: inputImage,
                                     inputCenter: CIVector(cgPoint: inputCenter),
                                     inputWidth: inputWidth as NSNumber,
                                     inputAngle: inputAngle as NSNumber,
                                     inputSharpness: inputSharpness as NSNumber,
                                     inputGCR: inputGCR as NSNumber,
                                     inputUCR: inputUCR as NSNumber)?.outputUIImage
    }
    
    @available(iOS 5, *)
    public func colorBlendMode(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.colorBlendMode(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 5, *)
    public func colorBurnBlendMode(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.colorBurnBlendMode(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 7, *)
    public func colorClamp(inputMinComponents: CIVector = CIVector(x: 0.0, y: 0.0, z: 0.0, w: 0.0),
                    inputMaxComponents: CIVector = CIVector(x: 1.0, y: 1.0, z: 1.0, w: 1.0)) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.colorClamp(inputImage: inputImage, inputMinComponents: inputMinComponents, inputMaxComponents: inputMaxComponents)?.outputUIImage
    }
    
    @available(iOS 5, *)
    public func colorControls(inputSaturation: Float = 1, inputBrightness: Float = 0, inputContrast: Float = 1) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.colorControls(inputImage: inputImage,
                                      inputSaturation: inputSaturation as NSNumber,
                                      inputBrightness: inputBrightness as NSNumber,
                                      inputContrast: inputContrast as NSNumber)?.outputUIImage
    }
    
    @available(iOS 7, *)
    public func colorCrossPolynomial(inputRedCoefficients: CIVector = CIVector(), inputGreenCoefficients: CIVector = CIVector(), inputBlueCoefficients: CIVector = CIVector()) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.colorCrossPolynomial(inputImage: inputImage,
                                             inputRedCoefficients: inputRedCoefficients,
                                             inputGreenCoefficients: inputGreenCoefficients,
                                             inputBlueCoefficients: inputBlueCoefficients)?.outputUIImage
    }
    
    @available(iOS 5, *)
    public func colorCube(inputCubeDimension: Float = 2, inputCubeData: Data) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.colorCube(inputImage: inputImage, inputCubeDimension: inputCubeDimension as NSNumber, inputCubeData: inputCubeData as NSData)?.outputUIImage
    }
    
    @available(iOS 11, *)
    public func colorCubesMixedWithMask(inputMaskImage: UIImage, inputCubeDimension: Float = 2, inputCube0Data: Data, inputCube1Data: Data, inputColorSpace: CGColorSpace) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputMaskImage = inputMaskImage.ciImage else { return nil }
        return CIFilter.colorCubesMixedWithMask(inputImage: inputImage,
                                                inputMaskImage: inputMaskImage,
                                                inputCubeDimension: inputCubeDimension as NSNumber,
                                                inputCube0Data: inputCube0Data as NSData,
                                                inputCube1Data: inputCube1Data as NSData,
                                                inputColorSpace: inputColorSpace)?.outputUIImage
    }
    
    @available(iOS 7, *)
    public func colorCubeWithColorSpace(inputCubeDimension: Float = 2, inputCubeData: Data, inputColorSpace: CGColorSpace) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.colorCubeWithColorSpace(inputImage: inputImage,
                                                inputCubeDimension: inputCubeDimension as NSNumber,
                                                inputCubeData: inputCubeData as NSData,
                                                inputColorSpace: inputColorSpace)?.outputUIImage
    }
    
    @available(iOS 11, *)
    public func colorCurves(inputCurvesData: Data, inputCurvesDomain: CGPoint = CGPoint(x: 0.0, y: 1.0), inputColorSpace: CGColorSpace) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.colorCurves(inputImage: inputImage, inputCurvesData: inputCurvesData as NSData, inputCurvesDomain: CIVector(cgPoint: inputCurvesDomain), inputColorSpace: inputColorSpace)?.outputUIImage
    }
    
    @available(iOS 5, *)
    public func colorDodgeBlendMode(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.colorDodgeBlendMode(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 5, *)
    public func colorInvert() -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.colorInvert(inputImage: inputImage)?.outputUIImage
    }
    
    @available(iOS 6, *)
    public func colorMap(inputGradientImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputGradientImage = inputGradientImage.ciImage else { return nil }
        return CIFilter.colorMap(inputImage: inputImage, inputGradientImage: inputGradientImage)?.outputUIImage
    }
    
    @available(iOS 5, *)
    public func colorMatrix(inputRVector: CIVector = CIVector(x: 1.0, y: 0.0, z: 0.0, w: 0.0),
                            inputGVector: CIVector = CIVector(x: 0.0, y: 1.0, z: 0.0, w: 0.0),
                            inputBVector: CIVector = CIVector(x: 0.0, y: 0.0, z: 1.0, w: 0.0),
                            inputAVector: CIVector = CIVector(x: 0.0, y: 0.0, z: 0.0, w: 1.0),
                            inputBiasVector: CIVector = CIVector(x: 0.0, y: 0.0, z: 0.0, w: 0.0)) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.colorMatrix(inputImage: inputImage,
                                    inputRVector: inputRVector,
                                    inputGVector: inputGVector,
                                    inputBVector: inputBVector,
                                    inputAVector: inputAVector,
                                    inputBiasVector: inputBiasVector)?.outputUIImage
    }
    
    @available(iOS 5, *)
    public func colorMonochrome(inputColor: UIColor = .white, inputIntensity: Float = 1) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.colorMonochrome(inputImage: inputImage, inputColor: inputColor.ciColor, inputIntensity: inputIntensity as NSNumber)?.outputUIImage
    }
    
    @available(iOS 7, *)
    public func colorPolynomial(inputRedCoefficients: CIVector = CIVector(x: 0.0, y: 1.0, z: 0.0, w: 0.0),
                                inputGreenCoefficients: CIVector = CIVector(x: 0.0, y: 1.0, z: 0.0, w: 0.0),
                                inputBlueCoefficients: CIVector = CIVector(x: 0.0, y: 1.0, z: 0.0, w: 0.0),
                                inputAlphaCoefficients: CIVector = CIVector(x: 0.0, y: 1.0, z: 0.0, w: 0.0)) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.colorPolynomial(inputImage: inputImage,
                                        inputRedCoefficients: inputRedCoefficients,
                                        inputGreenCoefficients: inputGreenCoefficients,
                                        inputBlueCoefficients: inputBlueCoefficients,
                                        inputAlphaCoefficients: inputAlphaCoefficients)?.outputUIImage
    }
    
    @available(iOS 6, *)
    public func colorPosterize(inputLevels: Float = 6) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.colorPosterize(inputImage: inputImage, inputLevels: inputLevels as NSNumber)?.outputUIImage
    }
    
    @available(iOS 9, *)
    public func columnAverage(inputExtent: CGRect = CGRect(x: 0.0, y: 0.0, width: 640.0, height: 80.0)) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.columnAverage(inputImage: inputImage, inputExtent: CIVector(cgRect: inputExtent))?.outputUIImage
    }
    
    @available(iOS 9, *)
    public func comicEffect() -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.comicEffect(inputImage: inputImage)?.outputUIImage
    }
    
    @available(iOS 7, *)
    public func convolution3X3(inputWeights: CIVector = CIVector(), inputBias: Float = 0) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.convolution3X3(inputImage: inputImage, inputWeights: inputWeights, inputBias: inputBias as NSNumber)?.outputUIImage
    }
    
    @available(iOS 7, *)
    public func convolution5X5(inputWeights: CIVector = CIVector(), inputBias: Float = 0) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.convolution5X5(inputImage: inputImage, inputWeights: inputWeights, inputBias: inputBias as NSNumber)?.outputUIImage
    }
    
    @available(iOS 9, *)
    public func convolution7X7(inputWeights: CIVector = CIVector(), inputBias: Float = 0) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.convolution7X7(inputImage: inputImage, inputWeights: inputWeights, inputBias: inputBias as NSNumber)?.outputUIImage
    }
    
    @available(iOS 7, *)
    public func convolution9Horizontal(inputWeights: CIVector = CIVector(), inputBias: Float = 0) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.convolution9Horizontal(inputImage: inputImage, inputWeights: inputWeights, inputBias: inputBias as NSNumber)?.outputUIImage
    }
    
    @available(iOS 7, *)
    public func convolution9Vertical(inputWeights: CIVector = CIVector(), inputBias: Float = 0) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.convolution9Vertical(inputImage: inputImage, inputWeights: inputWeights, inputBias: inputBias as NSNumber)?.outputUIImage
    }
    
    @available(iOS 6, *)
    public func copyMachineTransition(inputTargetImage: UIImage,
                                      inputExtent: CGRect = CGRect(x: 0.0, y: 0.0, width: 300.0, height: 300.0),
                                      inputColor: UIColor,
                                      inputTime: Float = 0,
                                      inputAngle: Float = 0,
                                      inputWidth: Float = 200,
                                      inputOpacity: Float = 1.3) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputTargetImage = inputTargetImage.ciImage else { return nil }
        return CIFilter.copyMachineTransition(inputImage: inputImage,
                                              inputTargetImage: inputTargetImage,
                                              inputExtent: CIVector(cgRect: inputExtent),
                                              inputColor: inputColor.ciColor,
                                              inputTime: inputTime as NSNumber,
                                              inputAngle: inputAngle as NSNumber,
                                              inputWidth: inputWidth as NSNumber,
                                              inputOpacity: inputOpacity as NSNumber)?.outputUIImage
    }
    
    @available(iOS 5, *)
    public func crop(inputRectangle: CGRect? = nil) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.crop(inputImage: inputImage,
                             inputRectangle: inputRectangle == nil ? nil : CIVector(cgRect: inputRectangle!))?.outputUIImage
    }
    
    @available(iOS 9, *)
    public func crystallize(inputRadius: Float = 20, inputCenter: CGPoint = CGPoint(x: 150.0, y: 150.0)) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.crystallize(inputImage: inputImage, inputRadius: inputRadius as NSNumber, inputCenter: CIVector(cgPoint: inputCenter))?.outputUIImage
    }
    
    @available(iOS 5, *)
    public func darkenBlendMode(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.darkenBlendMode(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 11, *)
    public func depthBlurEffect(inputDisparityImage: UIImage,
                                inputAperture: Float = 0,
                                inputLeftEyePositions: CIVector,
                                inputRightEyePositions: CIVector,
                                inputChinPositions: CIVector,
                                inputNosePositions: CIVector,
                                inputFocusRect: CGRect,
                                inputLumaNoiseScale: Float = 0,
                                inputScaleFactor: Float = 1,
                                inputCalibrationData: AVCameraCalibrationData,
                                inputAuxDataMetadata: [AnyHashable: Any]) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputDisparityImage = inputDisparityImage.ciImage else { return nil }
        return CIFilter.depthBlurEffect(inputImage: inputImage,
                                        inputDisparityImage: inputDisparityImage,
                                        inputAperture: inputAperture as NSNumber,
                                        inputLeftEyePositions: inputLeftEyePositions,
                                        inputRightEyePositions: inputRightEyePositions,
                                        inputChinPositions: inputChinPositions,
                                        inputNosePositions: inputNosePositions,
                                        inputFocusRect: CIVector(cgRect: inputFocusRect),
                                        inputLumaNoiseScale: inputLumaNoiseScale as NSNumber,
                                        inputScaleFactor: inputScaleFactor as NSNumber,
                                        inputCalibrationData: inputCalibrationData,
                                        inputAuxDataMetadata: inputAuxDataMetadata as NSDictionary)?.outputUIImage
    }
    
    @available(iOS 9, *)
    public func depthOfField(inputPoint0: CGPoint = CGPoint(x: 0.0, y: 300.0),
                             inputPoint1: CGPoint = CGPoint(x: 300.0, y: 300.0),
                             inputSaturation: Float = 1.5,
                             inputUnsharpMaskRadius: Float = 2.5,
                             inputUnsharpMaskIntensity: Float = 0.5,
                             inputRadius: Float = 6) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.depthOfField(inputImage: inputImage,
                                     inputPoint0: CIVector(cgPoint: inputPoint0),
                                     inputPoint1: CIVector(cgPoint: inputPoint1),
                                     inputSaturation: inputSaturation as NSNumber,
                                     inputUnsharpMaskRadius: inputUnsharpMaskRadius as NSNumber,
                                     inputUnsharpMaskIntensity: inputUnsharpMaskIntensity as NSNumber,
                                     inputRadius: inputRadius as NSNumber)?.outputUIImage
    }
    
    @available(iOS 11, *)
    public func depthToDisparity() -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.depthToDisparity(inputImage: inputImage)?.outputUIImage
    }
    
    @available(iOS 5, *)
    public func differenceBlendMode(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.differenceBlendMode(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 9, *)
    public func discBlur(inputRadius: Float = 8) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.discBlur(inputImage: inputImage, inputRadius: inputRadius as NSNumber)?.outputUIImage
    }
    
    @available(iOS 6, *)
    public func disintegrateWithMaskTransition(inputTargetImage: UIImage,
                                               inputMaskImage: UIImage,
                                               inputTime: Float = 0,
                                               inputShadowRadius: Float = 8,
                                               inputShadowDensity: Float = 0.65,
                                               inputShadowOffset: CGPoint = CGPoint(x: 0.0, y: -10.0)) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputTargetImage = inputTargetImage.ciImage, let inputMaskImage = inputMaskImage.ciImage else { return nil }
        return CIFilter.disintegrateWithMaskTransition(inputImage: inputImage,
                                                       inputTargetImage: inputTargetImage,
                                                       inputMaskImage: inputMaskImage,
                                                       inputTime: inputTime as NSNumber,
                                                       inputShadowRadius: inputShadowRadius as NSNumber,
                                                       inputShadowDensity: inputShadowDensity as NSNumber,
                                                       inputShadowOffset: CIVector(cgPoint: inputShadowOffset))?.outputUIImage
    }
    
    @available(iOS 11, *)
    public func disparityToDepth() -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.disparityToDepth(inputImage: inputImage)?.outputUIImage
    }
    
    @available(iOS 9, *)
    public func displacementDistortion(inputDisplacementImage: UIImage, inputScale: Float = 50) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputDisplacementImage = inputDisplacementImage.ciImage else { return nil }
        return CIFilter.displacementDistortion(inputImage: inputImage, inputDisplacementImage: inputDisplacementImage, inputScale: inputScale as NSNumber)?.outputUIImage
    }
    
    @available(iOS 6, *)
    public func dissolveTransition(inputTargetImage: UIImage, inputTime: Float = 0) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputTargetImage = inputTargetImage.ciImage else { return nil }
        return CIFilter.dissolveTransition(inputImage: inputImage, inputTargetImage: inputTargetImage, inputTime: inputTime as NSNumber)?.outputUIImage
    }
    
    @available(iOS 8, *)
    public func divideBlendMode(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.divideBlendMode(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 6, *)
    public func dotScreen(inputCenter: CGPoint = CGPoint(x: 150.0, y: 150.0),
                          inputAngle: Float = 0,
                          inputWidth: Float = 6,
                          inputSharpness: Float = 0.7) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.dotScreen(inputImage: inputImage,
                                  inputCenter: CIVector(cgPoint: inputCenter),
                                  inputAngle: inputAngle as NSNumber,
                                  inputWidth: inputWidth as NSNumber,
                                  inputSharpness: inputSharpness as NSNumber)?.outputUIImage
    }
    
    @available(iOS 9, *)
    public func droste(inputInsetPoint0: CGPoint = CGPoint(x: 200.0, y: 200.0),
                       inputInsetPoint1: CGPoint = CGPoint(x: 400.0, y: 400.0),
                       inputStrands: Float = 1,
                       inputPeriodicity: Float = 1,
                       inputRotation: Float = 0,
                       inputZoom: Float = 1) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.droste(inputImage: inputImage,
                               inputInsetPoint0: CIVector(cgPoint: inputInsetPoint0),
                               inputInsetPoint1: CIVector(cgPoint: inputInsetPoint1),
                               inputStrands: inputStrands as NSNumber,
                               inputPeriodicity: inputPeriodicity as NSNumber,
                               inputRotation: inputRotation as NSNumber,
                               inputZoom: inputZoom as NSNumber)?.outputUIImage
    }
    
    @available(iOS 10, *)
    public func edgePreserveUpsampleFilter(inputSmallImage: UIImage, inputSpatialSigma: Float = 3, inputLumaSigma: Float = 0.15) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputSmallImage = inputSmallImage.ciImage else { return nil }
        return CIFilter.edgePreserveUpsampleFilter(inputImage: inputImage,
                                                   inputSmallImage: inputSmallImage,
                                                   inputSpatialSigma: inputSpatialSigma as NSNumber,
                                                   inputLumaSigma: inputLumaSigma as NSNumber)?.outputUIImage
    }
    
    @available(iOS 9, *)
    public func edges(inputIntensity: Float = 1) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.edges(inputImage: inputImage, inputIntensity: inputIntensity as NSNumber)?.outputUIImage
    }
    
    @available(iOS 9, *)
    public func edgeWork(inputRadius: Float = 3) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.edgeWork(inputImage: inputImage, inputRadius: inputRadius as NSNumber)?.outputUIImage
    }
    
    @available(iOS 6, *)
    public func eightfoldReflectedTile(inputCenter: CGPoint = CGPoint(x: 150.0, y: 150.0), inputAngle: Float = 0, inputWidth: Float = 100) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.eightfoldReflectedTile(inputImage: inputImage,
                                               inputCenter: CIVector(cgPoint: inputCenter),
                                               inputAngle: inputAngle as NSNumber,
                                               inputWidth: inputWidth as NSNumber)?.outputUIImage
    }
    
    @available(iOS 5, *)
    public func exclusionBlendMode(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.exclusionBlendMode(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 5, *)
    public func exposureAdjust(inputEV: Float = 0) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.exposureAdjust(inputImage: inputImage, inputEV: inputEV as NSNumber)?.outputUIImage
    }
    
    @available(iOS 5, *)
    public func falseColor(inputColor0: UIColor, inputColor1: UIColor) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.falseColor(inputImage: inputImage, inputColor0: inputColor0.ciColor, inputColor1: inputColor1.ciColor)?.outputUIImage
    }
    
    @available(iOS 6, *)
    public func flashTransition(inputTargetImage: UIImage,
                                inputCenter: CGPoint = CGPoint(x: 150.0, y: 150.0),
                                inputExtent: CGRect = CGRect(x: 0.0, y: 0.0, width: 300.0, height: 300.0),
                                inputColor: UIColor,
                                inputTime: Float = 0,
                                inputMaxStriationRadius: Float = 2.58,
                                inputStriationStrength: Float = 0.5,
                                inputStriationContrast: Float = 1.375,
                                inputFadeThreshold: Float = 0.85) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputTargetImage = inputTargetImage.ciImage else { return nil }
        return CIFilter.flashTransition(inputImage: inputImage,
                                        inputTargetImage: inputTargetImage,
                                        inputCenter: CIVector(cgPoint: inputCenter),
                                        inputExtent: CIVector(cgRect: inputExtent),
                                        inputColor: inputColor.ciColor,
                                        inputTime: inputTime as NSNumber,
                                        inputMaxStriationRadius: inputMaxStriationRadius as NSNumber,
                                        inputStriationStrength: inputStriationStrength as NSNumber,
                                        inputStriationContrast: inputStriationContrast as NSNumber,
                                        inputFadeThreshold: inputFadeThreshold as NSNumber)?.outputUIImage
    }
    
    @available(iOS 6, *)
    public func fourfoldReflectedTile(inputCenter: CGPoint = CGPoint(x: 150.0, y: 150.0),
                                      inputAngle: Float = 0,
                                      inputWidth: Float = 100,
                                      inputAcuteAngle: Float = Float.pi / 2) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.fourfoldReflectedTile(inputImage: inputImage,
                                              inputCenter: CIVector(cgPoint: inputCenter),
                                              inputAngle: inputAngle as NSNumber,
                                              inputWidth: inputWidth as NSNumber,
                                              inputAcuteAngle: inputAcuteAngle as NSNumber)?.outputUIImage
    }
    
    @available(iOS 6, *)
    public func fourfoldRotatedTile(inputCenter: CGPoint = CGPoint(x: 150.0, y: 150.0), inputAngle: Float = 0, inputWidth: Float = 100) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.fourfoldRotatedTile(inputImage: inputImage,
                                            inputCenter: CIVector(cgPoint: inputCenter),
                                            inputAngle: inputAngle as NSNumber,
                                            inputWidth: inputWidth as NSNumber)?.outputUIImage
    }
    
    @available(iOS 6, *)
    public func fourfoldTranslatedTile(inputCenter: CGPoint = CGPoint(x: 150.0, y: 150.0), inputAngle: Float = 0, inputWidth: Float = 100, inputAcuteAngle: Float = Float.pi / 2) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.fourfoldTranslatedTile(inputImage: inputImage,
                                               inputCenter: CIVector(cgPoint: inputCenter),
                                               inputAngle: inputAngle as NSNumber,
                                               inputWidth: inputWidth as NSNumber,
                                               inputAcuteAngle: inputAcuteAngle as NSNumber)?.outputUIImage
    }
    
    @available(iOS 5, *)
    public func gammaAdjust(inputPower: Float = 1) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.gammaAdjust(inputImage: inputImage, inputPower: inputPower as NSNumber)?.outputUIImage
    }
    
    @available(iOS 6, *)
    public func gaussianBlur(inputRadius: Float = 10) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.gaussianBlur(inputImage: inputImage, inputRadius: inputRadius as NSNumber)?.outputUIImage
    }
    
    @available(iOS 8, *)
    public func glassDistortion(inputTexture: UIImage, inputCenter: CGPoint = CGPoint(x: 150.0, y: 150.0), inputScale: Float = 200) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputTexture = inputTexture.ciImage else { return nil }
        return CIFilter.glassDistortion(inputImage: inputImage,
                                        inputTexture: inputTexture,
                                        inputCenter: CIVector(cgPoint: inputCenter),
                                        inputScale: inputScale as NSNumber)?.outputUIImage
    }
    
    @available(iOS 9, *)
    public func glassLozenge(inputPoint0: CGPoint = CGPoint(x: 150.0, y: 150.0), inputPoint1: CGPoint = CGPoint(x: 350.0, y: 150.0), inputRadius: Float = 100, inputRefraction: Float = 1.7) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.glassLozenge(inputImage: inputImage,
                                     inputPoint0: CIVector(cgPoint: inputPoint0),
                                     inputPoint1: CIVector(cgPoint: inputPoint1),
                                     inputRadius: inputRadius as NSNumber,
                                     inputRefraction: inputRefraction as NSNumber)?.outputUIImage
    }
    
    @available(iOS 6, *)
    public func glideReflectedTile(inputCenter: CGPoint = CGPoint(x: 150.0, y: 150.0), inputAngle: Float = 0, inputWidth: Float = 100) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.glideReflectedTile(inputImage: inputImage,
                                           inputCenter: CIVector(cgPoint: inputCenter),
                                           inputAngle: inputAngle as NSNumber,
                                           inputWidth: inputWidth as NSNumber)?.outputUIImage
    }
    
    @available(iOS 6, *)
    public func gloom(inputRadius: Float = 10, inputIntensity: Float = 0.5) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.gloom(inputImage: inputImage, inputRadius: inputRadius as NSNumber, inputIntensity: inputIntensity as NSNumber)?.outputUIImage
    }
    
    @available(iOS 5, *)
    public func hardLightBlendMode(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.hardLightBlendMode(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 6, *)
    public func hatchedScreen(inputCenter: CGPoint = CGPoint(x: 150.0, y: 150.0), inputAngle: Float = 0, inputWidth: Float = 6, inputSharpness: Float = 0.7) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.hatchedScreen(inputImage: inputImage,
                                      inputCenter: CIVector(cgPoint: inputCenter),
                                      inputAngle: inputAngle as NSNumber,
                                      inputWidth: inputWidth as NSNumber,
                                      inputSharpness: inputSharpness as NSNumber)?.outputUIImage
    }
    
    @available(iOS 9, *)
    public func heightFieldFromMask(inputRadius: Float = 10) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.heightFieldFromMask(inputImage: inputImage, inputRadius: inputRadius as NSNumber)?.outputUIImage
    }
    
    @available(iOS 9, *)
    public func hexagonalPixellate(inputCenter: CGPoint = CGPoint(x: 150.0, y: 150.0), inputScale: Float = 8) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.hexagonalPixellate(inputImage: inputImage, inputCenter: CIVector(cgPoint: inputCenter), inputScale: inputScale as NSNumber)?.outputUIImage
    }
    
    @available(iOS 5, *)
    public func highlightShadowAdjust(inputRadius: Float = 0, inputShadowAmount: Float = 0, inputHighlightAmount: Float = 1) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.highlightShadowAdjust(inputImage: inputImage,
                                              inputRadius: inputRadius as NSNumber,
                                              inputShadowAmount: inputShadowAmount as NSNumber,
                                              inputHighlightAmount: inputHighlightAmount as NSNumber)?.outputUIImage
    }
    
    @available(iOS 8, *)
    public func histogramDisplayFilter(inputHeight: Float = 100, inputHighLimit: Float = 1, inputLowLimit: Float = 0) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.histogramDisplayFilter(inputImage: inputImage,
                                               inputHeight: inputHeight as NSNumber,
                                               inputHighLimit: inputHighLimit as NSNumber,
                                               inputLowLimit: inputLowLimit as NSNumber)?.outputUIImage
    }
    
    @available(iOS 6, *)
    public func holeDistortion(inputCenter: CGPoint = CGPoint(x: 150.0, y: 150.0), inputRadius: Float = 150) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.holeDistortion(inputImage: inputImage,
                                       inputCenter: CIVector(cgPoint: inputCenter),
                                       inputRadius: inputRadius as NSNumber)?.outputUIImage
    }
    
    @available(iOS 5, *)
    public func hueAdjust(inputAngle: Float = 0) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.hueAdjust(inputImage: inputImage, inputAngle: inputAngle as NSNumber)?.outputUIImage
    }
    
    @available(iOS 5, *)
    public func hueBlendMode(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.hueBlendMode(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 9, *)
    public func kaleidoscope(inputCount: Float = 6, inputCenter: CGPoint = CGPoint(x: 150.0, y: 150.0), inputAngle: Float = 0) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.kaleidoscope(inputImage: inputImage,
                                     inputCount: inputCount as NSNumber,
                                     inputCenter: CIVector(cgPoint: inputCenter),
                                     inputAngle: inputAngle as NSNumber)?.outputUIImage
    }
    
    @available(iOS 11, *)
    public func labDeltaE(inputImage2: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputImage2 = inputImage2.ciImage else { return nil }
        return CIFilter.labDeltaE(inputImage: inputImage, inputImage2: inputImage2)?.outputUIImage
    }
    
    @available(iOS 6, *)
    public func lanczosScaleTransform(inputScale: Float = 1, inputAspectRatio: Float = 1) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.lanczosScaleTransform(inputImage: inputImage,
                                              inputScale: inputScale as NSNumber,
                                              inputAspectRatio: inputAspectRatio as NSNumber)?.outputUIImage
    }
    
    @available(iOS 5, *)
    public func lightenBlendMode(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.lightenBlendMode(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 6, *)
    public func lightTunnel(inputCenter: CGPoint = CGPoint(x: 150.0, y: 150.0), inputRotation: Float = 0, inputRadius: Float = 100) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.lightTunnel(inputImage: inputImage,
                                    inputCenter: CIVector(cgPoint: inputCenter),
                                    inputRotation: inputRotation as NSNumber,
                                    inputRadius: inputRadius as NSNumber)?.outputUIImage
    }
    
    @available(iOS 8, *)
    public func linearBurnBlendMode(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.linearBurnBlendMode(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 8, *)
    public func linearDodgeBlendMode(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.linearDodgeBlendMode(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 7, *)
    public func linearToSRGBToneCurve() -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.linearToSRGBToneCurve(inputImage: inputImage)?.outputUIImage
    }
    
    @available(iOS 9, *)
    public func lineOverlay(inputNRNoiseLevel: Float = 0.07000000000000001, inputNRSharpness: Float = 0.71, inputEdgeIntensity: Float = 1, inputThreshold: Float = 0.1, inputContrast: Float = 50) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.lineOverlay(inputImage: inputImage,
                                    inputNRNoiseLevel: inputNRNoiseLevel as NSNumber,
                                    inputNRSharpness: inputNRSharpness as NSNumber,
                                    inputEdgeIntensity: inputEdgeIntensity as NSNumber,
                                    inputThreshold: inputThreshold as NSNumber,
                                    inputContrast: inputContrast as NSNumber)?.outputUIImage
    }
    
    @available(iOS 6, *)
    public func lineScreen(inputCenter: CGPoint = CGPoint(x: 150.0, y: 150.0), inputAngle: Float = 0, inputWidth: Float = 6, inputSharpness: Float = 0.7) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.lineScreen(inputImage: inputImage,
                                   inputCenter: CIVector(cgPoint: inputCenter),
                                   inputAngle: inputAngle as NSNumber,
                                   inputWidth: inputWidth as NSNumber,
                                   inputSharpness: inputSharpness as NSNumber)?.outputUIImage
    }
    
    @available(iOS 5, *)
    public func luminosityBlendMode(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.luminosityBlendMode(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 8, *)
    public func maskedVariableBlur(inputMask: UIImage, inputRadius: Float = 5) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputMask = inputMask.ciImage else { return nil }
        return CIFilter.maskedVariableBlur(inputImage: inputImage, inputMask: inputMask, inputRadius: inputRadius as NSNumber)?.outputUIImage
    }
    
    @available(iOS 6, *)
    public func maskToAlpha() -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.maskToAlpha(inputImage: inputImage)?.outputUIImage
    }
    
    @available(iOS 6, *)
    public func maximumComponent() -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.maximumComponent(inputImage: inputImage)?.outputUIImage
    }
    
    @available(iOS 5, *)
    public func maximumCompositing(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.maximumCompositing(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 9, *)
    public func medianFilter() -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.medianFilter(inputImage: inputImage)?.outputUIImage
    }
    
    @available(iOS 6, *)
    public func minimumComponent() -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.minimumComponent(inputImage: inputImage)?.outputUIImage
    }
    
    @available(iOS 5, *)
    public func minimumCompositing(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.minimumCompositing(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 6, *)
    public func modTransition(inputTargetImage: UIImage, inputCenter: CGPoint = CGPoint(x: 150.0, y: 150.0), inputTime: Float = 0, inputAngle: Float = 2, inputRadius: Float = 150, inputCompression: Float = 300) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputTargetImage = inputTargetImage.ciImage else { return nil }
        return CIFilter.modTransition(inputImage: inputImage,
                                      inputTargetImage: inputTargetImage,
                                      inputCenter: CIVector(cgPoint: inputCenter),
                                      inputTime: inputTime as NSNumber,
                                      inputAngle: inputAngle as NSNumber,
                                      inputRadius: inputRadius as NSNumber,
                                      inputCompression: inputCompression as NSNumber)?.outputUIImage
    }
    
    @available(iOS 11, *)
    public func morphologyGradient(inputRadius: Float = 5) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.morphologyGradient(inputImage: inputImage, inputRadius: inputRadius as NSNumber)?.outputUIImage
    }
    
    @available(iOS 11, *)
    public func morphologyMaximum(inputRadius: Float = 0) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.morphologyMaximum(inputImage: inputImage, inputRadius: inputRadius as NSNumber)?.outputUIImage
    }
    
    @available(iOS 11, *)
    public func morphologyMinimum(inputRadius: Float = 0) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.morphologyMinimum(inputImage: inputImage, inputRadius: inputRadius as NSNumber)?.outputUIImage
    }
    
    @available(iOS 8.3, *)
    public func motionBlur(inputRadius: Float = 20, inputAngle: Float = 0) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.motionBlur(inputImage: inputImage, inputRadius: inputRadius as NSNumber, inputAngle: inputAngle as NSNumber)?.outputUIImage
    }
    
    @available(iOS 5, *)
    public func multiplyBlendMode(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.multiplyBlendMode(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 5, *)
    public func multiplyCompositing(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.multiplyCompositing(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 10, *)
    public func ninePartStretched(inputBreakpoint0: CGPoint = CGPoint(x: 50.0, y: 50.0),
                                  inputBreakpoint1: CGPoint = CGPoint(x: 150.0, y: 150.0),
                                  inputGrowAmount: CGSize = CGSize(width: 100.0, height: 100.0)) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.ninePartStretched(inputImage: inputImage,
                                          inputBreakpoint0: CIVector(cgPoint: inputBreakpoint0),
                                          inputBreakpoint1: CIVector(cgPoint: inputBreakpoint1),
                                          inputGrowAmount: CIVector(x: inputGrowAmount.width, y: inputGrowAmount.height))?.outputUIImage
    }
    
    @available(iOS 10, *)
    public func ninePartTiled(inputBreakpoint0: CGPoint = CGPoint(x: 50.0, y: 50.0),
                              inputBreakpoint1: CGPoint = CGPoint(x: 150.0, y: 150.0),
                              inputGrowAmount: CGSize = CGSize(width: 100.0, height: 100.0),
                              inputFlipYTiles: Bool = true) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.ninePartTiled(inputImage: inputImage,
                                      inputBreakpoint0: CIVector(cgPoint: inputBreakpoint0),
                                      inputBreakpoint1: CIVector(cgPoint: inputBreakpoint1),
                                      inputGrowAmount: CIVector(x: inputGrowAmount.width, y: inputGrowAmount.height),
                                      inputFlipYTiles: inputFlipYTiles as NSNumber)?.outputUIImage
    }
    
    @available(iOS 9, *)
    public func noiseReduction(inputNoiseLevel: Float = 0.02, inputSharpness: Float = 0.4) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.noiseReduction(inputImage: inputImage,
                                       inputNoiseLevel: inputNoiseLevel as NSNumber,
                                       inputSharpness: inputSharpness as NSNumber)?.outputUIImage
    }
    
    @available(iOS 9, *)
    public func opTile(inputCenter: CGPoint = CGPoint(x: 150.0, y: 150.0), inputScale: Float = 2.8, inputAngle: Float = 0, inputWidth: Float = 65) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.opTile(inputImage: inputImage,
                               inputCenter: CIVector(cgPoint: inputCenter),
                               inputScale: inputScale as NSNumber,
                               inputAngle: inputAngle as NSNumber,
                               inputWidth: inputWidth as NSNumber)?.outputUIImage
    }
    
    @available(iOS 5, *)
    public func overlayBlendMode(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.overlayBlendMode(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 9, *)
    public func pageCurlTransition(inputTargetImage: UIImage,
                                   inputBacksideImage: UIImage,
                                   inputShadingImage: UIImage,
                                   inputExtent: CGRect = CGRect(x: 0.0, y: 0.0, width: 300.0, height: 300.0),
                                   inputTime: Float = 0,
                                   inputAngle: Float = 0,
                                   inputRadius: Float = 100) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputTargetImage = inputTargetImage.ciImage, let inputBacksideImage = inputBacksideImage.ciImage, let inputShadingImage = inputShadingImage.ciImage else { return nil }
        return CIFilter.pageCurlTransition(inputImage: inputImage,
                                           inputTargetImage: inputTargetImage,
                                           inputBacksideImage: inputBacksideImage,
                                           inputShadingImage: inputShadingImage,
                                           inputExtent: CIVector(cgRect: inputExtent),
                                           inputTime: inputTime as NSNumber,
                                           inputAngle: inputAngle as NSNumber,
                                           inputRadius: inputRadius as NSNumber)?.outputUIImage
    }
    
    @available(iOS 9, *)
    public func pageCurlWithShadowTransition(inputTargetImage: UIImage,
                                             inputBacksideImage: UIImage,
                                             inputExtent: CGRect = .zero,
                                             inputTime: Float = 0,
                                             inputAngle: Float = 0,
                                             inputRadius: Float = 100,
                                             inputShadowSize: Float = 0.5,
                                             inputShadowAmount: Float = 0.7,
                                             inputShadowExtent: CGRect = .zero) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputTargetImage = inputTargetImage.ciImage, let inputBacksideImage = inputBacksideImage.ciImage else { return nil }
        return CIFilter.pageCurlWithShadowTransition(inputImage: inputImage,
                                                     inputTargetImage: inputTargetImage,
                                                     inputBacksideImage: inputBacksideImage,
                                                     inputExtent: CIVector(cgRect: inputExtent),
                                                     inputTime: inputTime as NSNumber,
                                                     inputAngle: inputAngle as NSNumber,
                                                     inputRadius: inputRadius as NSNumber,
                                                     inputShadowSize: inputShadowSize as NSNumber,
                                                     inputShadowAmount: inputShadowAmount as NSNumber,
                                                     inputShadowExtent: CIVector(cgRect: inputShadowExtent))?.outputUIImage
    }
    
    @available(iOS 9, *)
    public func parallelogramTile(inputCenter: CGPoint = CGPoint(x: 150.0, y: 150.0), inputAngle: Float = 0, inputAcuteAngle: Float = Float.pi / 2, inputWidth: Float = 100) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.parallelogramTile(inputImage: inputImage,
                                          inputCenter: CIVector(cgPoint: inputCenter),
                                          inputAngle: inputAngle as NSNumber,
                                          inputAcuteAngle: inputAcuteAngle as NSNumber,
                                          inputWidth: inputWidth as NSNumber)?.outputUIImage
    }
    
    @available(iOS 8, *)
    public func perspectiveCorrection(inputTopLeft: CGPoint = CGPoint(x: 118.0, y: 484.0),
                                      inputTopRight: CGPoint = CGPoint(x: 646.0, y: 507.0),
                                      inputBottomRight: CGPoint = CGPoint(x: 548.0, y: 140.0),
                                      inputBottomLeft: CGPoint = CGPoint(x: 155.0, y: 153.0),
                                      inputCrop: Bool = true) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.perspectiveCorrection(inputImage: inputImage,
                                              inputTopLeft: CIVector(cgPoint: inputTopLeft),
                                              inputTopRight: CIVector(cgPoint: inputTopRight),
                                              inputBottomRight: CIVector(cgPoint: inputBottomRight),
                                              inputBottomLeft: CIVector(cgPoint: inputBottomLeft),
                                              inputCrop: inputCrop as NSNumber)?.outputUIImage
    }
    
    @available(iOS 6, *)
    public func perspectiveTile(inputTopLeft: CGPoint = CGPoint(x: 118.0, y: 484.0),
                                inputTopRight: CGPoint = CGPoint(x: 646.0, y: 507.0),
                                inputBottomRight: CGPoint = CGPoint(x: 548.0, y: 140.0),
                                inputBottomLeft: CGPoint = CGPoint(x: 155.0, y: 153.0)) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.perspectiveTile(inputImage: inputImage,
                                        inputTopLeft: CIVector(cgPoint: inputTopLeft),
                                        inputTopRight: CIVector(cgPoint: inputTopRight),
                                        inputBottomRight: CIVector(cgPoint: inputBottomRight),
                                        inputBottomLeft: CIVector(cgPoint: inputBottomLeft))?.outputUIImage
    }
    
    @available(iOS 6, *)
    public func perspectiveTransform(inputTopLeft: CGPoint = CGPoint(x: 118.0, y: 484.0),
                                     inputTopRight: CGPoint = CGPoint(x: 646.0, y: 507.0),
                                     inputBottomRight: CGPoint = CGPoint(x: 548.0, y: 140.0),
                                     inputBottomLeft: CGPoint = CGPoint(x: 155.0, y: 153.0)) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.perspectiveTransform(inputImage: inputImage,
                                             inputTopLeft: CIVector(cgPoint: inputTopLeft),
                                             inputTopRight: CIVector(cgPoint: inputTopRight),
                                             inputBottomRight: CIVector(cgPoint: inputBottomRight),
                                             inputBottomLeft: CIVector(cgPoint: inputBottomLeft))?.outputUIImage
    }
    
    @available(iOS 6, *)
    public func perspectiveTransformWithExtent(inputExtent: CGRect = CGRect(x: 0.0, y: 0.0, width: 300.0, height: 300.0),
                                               inputTopLeft: CGPoint = CGPoint(x: 118.0, y: 484.0),
                                               inputTopRight: CGPoint = CGPoint(x: 646.0, y: 507.0),
                                               inputBottomRight: CGPoint = CGPoint(x: 548.0, y: 140.0),
                                               inputBottomLeft: CGPoint = CGPoint(x: 155.0, y: 153.0)) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.perspectiveTransformWithExtent(inputImage: inputImage,
                                                       inputExtent: CIVector(cgRect: inputExtent),
                                                       inputTopLeft: CIVector(cgPoint: inputTopLeft),
                                                       inputTopRight: CIVector(cgPoint: inputTopRight),
                                                       inputBottomRight: CIVector(cgPoint: inputBottomRight),
                                                       inputBottomLeft: CIVector(cgPoint: inputBottomLeft))?.outputUIImage
    }
    
    @available(iOS 7, *)
    public func photoEffectChrome() -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.photoEffectChrome(inputImage: inputImage)?.outputUIImage
    }
    
    @available(iOS 7, *)
    public func photoEffectFade() -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.photoEffectFade(inputImage: inputImage)?.outputUIImage
    }
    
    @available(iOS 7, *)
    public func photoEffectInstant() -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.photoEffectInstant(inputImage: inputImage)?.outputUIImage
    }
    
    @available(iOS 7, *)
    public func photoEffectMono() -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.photoEffectMono(inputImage: inputImage)?.outputUIImage
    }
    
    @available(iOS 7, *)
    public func photoEffectNoir() -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.photoEffectNoir(inputImage: inputImage)?.outputUIImage
    }
    
    @available(iOS 7, *)
    public func photoEffectProcess() -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.photoEffectProcess(inputImage: inputImage)?.outputUIImage
    }
    
    @available(iOS 7, *)
    public func photoEffectTonal() -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.photoEffectTonal(inputImage: inputImage)?.outputUIImage
    }
    
    @available(iOS 7, *)
    public func photoEffectTransfer() -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.photoEffectTransfer(inputImage: inputImage)?.outputUIImage
    }
    
    @available(iOS 6, *)
    public func pinchDistortion(inputCenter: CGPoint = CGPoint(x: 150.0, y: 150.0), inputRadius: Float = 300, inputScale: Float = 0.5) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.pinchDistortion(inputImage: inputImage,
                                        inputCenter: CIVector(cgPoint: inputCenter),
                                        inputRadius: inputRadius as NSNumber,
                                        inputScale: inputScale as NSNumber)?.outputUIImage
    }
    
    @available(iOS 8, *)
    public func pinLightBlendMode(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.pinLightBlendMode(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 6, *)
    public func pixellate(inputCenter: CGPoint = CGPoint(x: 150.0, y: 150.0), inputScale: Float = 8) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.pixellate(inputImage: inputImage,
                                  inputCenter: CIVector(cgPoint: inputCenter),
                                  inputScale: inputScale as NSNumber)?.outputUIImage
    }
    
    @available(iOS 9, *)
    public func pointillize(inputRadius: Float = 20, inputCenter: CGPoint = CGPoint(x: 150.0, y: 150.0)) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.pointillize(inputImage: inputImage,
                                    inputRadius: inputRadius as NSNumber,
                                    inputCenter: CIVector(cgPoint: inputCenter))?.outputUIImage
    }
    
    @available(iOS 9, *)
    public func rippleTransition(inputTargetImage: UIImage,
                                 inputShadingImage: UIImage,
                                 inputCenter: CGPoint = CGPoint(x: 150.0, y: 150.0),
                                 inputExtent: CGRect = CGRect(x: 0.0, y: 0.0, width: 300.0, height: 300.0),
                                 inputTime: Float = 0,
                                 inputWidth: Float = 100,
                                 inputScale: Float = 50) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputTargetImage = inputTargetImage.ciImage, let inputShadingImage = inputShadingImage.ciImage else { return nil }
        return CIFilter.rippleTransition(inputImage: inputImage,
                                         inputTargetImage: inputTargetImage,
                                         inputShadingImage: inputShadingImage,
                                         inputCenter: CIVector(cgPoint: inputCenter),
                                         inputExtent: CIVector(cgRect: inputExtent),
                                         inputTime: inputTime as NSNumber,
                                         inputWidth: inputWidth as NSNumber,
                                         inputScale: inputScale as NSNumber)?.outputUIImage
    }
    
    @available(iOS 9, *)
    public func rowAverage(inputExtent: CGRect = CGRect(x: 0.0, y: 0.0, width: 640.0, height: 80.0)) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.rowAverage(inputImage: inputImage, inputExtent: CIVector(cgRect: inputExtent))?.outputUIImage
    }
    
    @available(iOS 5, *)
    public func saturationBlendMode(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.saturationBlendMode(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 5, *)
    public func screenBlendMode(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.screenBlendMode(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 5, *)
    public func sepiaTone(inputIntensity: Float = 1) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.sepiaTone(inputImage: inputImage, inputIntensity: inputIntensity as NSNumber)?.outputUIImage
    }
    
    @available(iOS 9, *)
    public func shadedMaterial(inputShadingImage: UIImage, inputScale: Float = 10) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputShadingImage = inputShadingImage.ciImage else { return nil }
        return CIFilter.shadedMaterial(inputImage: inputImage, inputShadingImage: inputShadingImage, inputScale: inputScale as NSNumber)?.outputUIImage
    }
    
    @available(iOS 6, *)
    public func sharpenLuminance(inputSharpness: Float = 0.4, inputRadius: Float = 1.69) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.sharpenLuminance(inputImage: inputImage, inputSharpness: inputSharpness as NSNumber, inputRadius: inputRadius as NSNumber)?.outputUIImage
    }
    
    @available(iOS 6, *)
    public func sixfoldReflectedTile(inputCenter: CGPoint = CGPoint(x: 150.0, y: 150.0), inputAngle: Float = 0, inputWidth: Float = 100) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.sixfoldReflectedTile(inputImage: inputImage,
                                             inputCenter: CIVector(cgPoint: inputCenter),
                                             inputAngle: inputAngle as NSNumber,
                                             inputWidth: inputWidth as NSNumber)?.outputUIImage
    }
    
    @available(iOS 6, *)
    public func sixfoldRotatedTile(inputCenter: CGPoint = CGPoint(x: 150.0, y: 150.0), inputAngle: Float = 0, inputWidth: Float = 100) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.sixfoldRotatedTile(inputImage: inputImage,
                                           inputCenter: CIVector(cgPoint: inputCenter),
                                           inputAngle: inputAngle as NSNumber,
                                           inputWidth: inputWidth as NSNumber)?.outputUIImage
    }
    
    @available(iOS 5, *)
    public func softLightBlendMode(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.softLightBlendMode(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 5, *)
    public func sourceAtopCompositing(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.sourceAtopCompositing(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 5, *)
    public func sourceInCompositing(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.sourceInCompositing(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 5, *)
    public func sourceOutCompositing(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.sourceOutCompositing(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 5, *)
    public func sourceOverCompositing(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.sourceOverCompositing(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 9, *)
    public func spotColor(inputCenterColor1: UIColor,
                          inputReplacementColor1: UIColor,
                          inputCloseness1: Float = 0.22,
                          inputContrast1: Float = 0.98,
                          inputCenterColor2: UIColor,
                          inputReplacementColor2: UIColor,
                          inputCloseness2: Float = 0.15,
                          inputContrast2: Float = 0.98,
                          inputCenterColor3: UIColor,
                          inputReplacementColor3: UIColor,
                          inputCloseness3: Float = 0.5,
                          inputContrast3: Float = 0.99) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.spotColor(inputImage: inputImage,
                                  inputCenterColor1: inputCenterColor1.ciColor,
                                  inputReplacementColor1: inputReplacementColor1.ciColor,
                                  inputCloseness1: inputCloseness1 as NSNumber,
                                  inputContrast1: inputContrast1 as NSNumber,
                                  inputCenterColor2: inputCenterColor2.ciColor,
                                  inputReplacementColor2: inputReplacementColor2.ciColor,
                                  inputCloseness2: inputCloseness2 as NSNumber,
                                  inputContrast2: inputContrast2 as NSNumber,
                                  inputCenterColor3: inputCenterColor3.ciColor,
                                  inputReplacementColor3: inputReplacementColor3.ciColor,
                                  inputCloseness3: inputCloseness3 as NSNumber,
                                  inputContrast3: inputContrast3 as NSNumber)?.outputUIImage
    }
    
    @available(iOS 9, *)
    public func spotLight(inputLightPosition: CIVector = CIVector(x: 400.0, y: 600.0, z: 150.0),
                          inputLightPointsAt: CIVector = CIVector(x: 200.0, y: 200.0, z: 0.0),
                          inputBrightness: Float = 3,
                          inputConcentration: Float = 0.1,
                          inputColor: UIColor) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.spotLight(inputImage: inputImage,
                                  inputLightPosition: inputLightPosition,
                                  inputLightPointsAt: inputLightPointsAt,
                                  inputBrightness: inputBrightness as NSNumber,
                                  inputConcentration: inputConcentration as NSNumber,
                                  inputColor: inputColor.ciColor)?.outputUIImage
    }
    
    @available(iOS 7, *)
    public func srgbToneCurveToLinear() -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.srgbToneCurveToLinear(inputImage: inputImage)?.outputUIImage
    }
    
    
    @available(iOS 5, *)
    public func straightenFilter(inputAngle: Float = 0) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.straightenFilter(inputImage: inputImage, inputAngle: inputAngle as NSNumber)?.outputUIImage
    }
    
    @available(iOS 9, *)
    public func stretchCrop(inputSize: CGSize = CGSize(width: 1280.0, height: 720.0), inputCropAmount: Float = 0.25, inputCenterStretchAmount: Float = 0.25) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.stretchCrop(inputImage: inputImage,
                                    inputSize: CIVector(x: inputSize.width, y: inputSize.height),
                                    inputCropAmount: inputCropAmount as NSNumber,
                                    inputCenterStretchAmount: inputCenterStretchAmount as NSNumber)?.outputUIImage
    }
    
    @available(iOS 8, *)
    public func subtractBlendMode(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.subtractBlendMode(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 6, *)
    public func swipeTransition(inputTargetImage: UIImage,
                                inputExtent: CGRect = CGRect(x: 0.0, y: 0.0, width: 300.0, height: 300.0),
                                inputColor: UIColor,
                                inputTime: Float = 0,
                                inputAngle: Float = 0,
                                inputWidth: Float = 300,
                                inputOpacity: Float = 0) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputTargetImage = inputTargetImage.ciImage else { return nil }
        return CIFilter.swipeTransition(inputImage: inputImage,
                                        inputTargetImage: inputTargetImage,
                                        inputExtent: CIVector(cgRect: inputExtent),
                                        inputColor: inputColor.ciColor,
                                        inputTime: inputTime as NSNumber,
                                        inputAngle: inputAngle as NSNumber,
                                        inputWidth: inputWidth as NSNumber,
                                        inputOpacity: inputOpacity as NSNumber)?.outputUIImage
    }
    
    @available(iOS 5, *)
    public func temperatureAndTint(inputNeutral: CIVector = CIVector(x: 6500.0, y: 0.0), inputTargetNeutral: CIVector = CIVector(x: 6500.0, y: 0.0)) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.temperatureAndTint(inputImage: inputImage, inputNeutral: inputNeutral, inputTargetNeutral: inputTargetNeutral)?.outputUIImage
    }
    
    @available(iOS 10, *)
    public func thermal() -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.thermal(inputImage: inputImage)?.outputUIImage
    }
    
    @available(iOS 5, *)
    public func toneCurve(inputPoint0: CGPoint = CGPoint(x: 0.0, y: 0.0),
                          inputPoint1: CGPoint = CGPoint(x: 0.25, y: 0.25),
                          inputPoint2: CGPoint = CGPoint(x: 0.5, y: 0.5),
                          inputPoint3: CGPoint = CGPoint(x: 0.75, y: 0.75),
                          inputPoint4: CGPoint = CGPoint(x: 1.0, y: 1.0)) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.toneCurve(inputImage: inputImage,
                                  inputPoint0: CIVector(cgPoint: inputPoint0),
                                  inputPoint1: CIVector(cgPoint: inputPoint1),
                                  inputPoint2: CIVector(cgPoint: inputPoint2),
                                  inputPoint3: CIVector(cgPoint: inputPoint3),
                                  inputPoint4: CIVector(cgPoint: inputPoint4))?.outputUIImage
    }
    
    @available(iOS 9, *)
    public func torusLensDistortion(inputCenter: CGPoint = CGPoint(x: 150.0, y: 150.0), inputRadius: Float = 160, inputWidth: Float = 80, inputRefraction: Float = 1.7) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.torusLensDistortion(inputImage: inputImage,
                                            inputCenter: CIVector(cgPoint: inputCenter),
                                            inputRadius: inputRadius as NSNumber,
                                            inputWidth: inputWidth as NSNumber,
                                            inputRefraction: inputRefraction as NSNumber)?.outputUIImage
    }
    
    @available(iOS 6, *)
    public func triangleKaleidoscope(inputPoint: CGPoint = CGPoint(x: 150.0, y: 150.0), inputSize: Float = 700, inputRotation: Float = 5.924285296593801, inputDecay: Float = 0.85) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.triangleKaleidoscope(inputImage: inputImage,
                                             inputPoint: CIVector(cgPoint: inputPoint),
                                             inputSize: inputSize as NSNumber,
                                             inputRotation: inputRotation as NSNumber,
                                             inputDecay: inputDecay as NSNumber)?.outputUIImage
    }
    
    @available(iOS 9, *)
    public func triangleTile(inputCenter: CGPoint = CGPoint(x: 150.0, y: 150.0), inputAngle: Float = 0, inputWidth: Float = 100) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.triangleTile(inputImage: inputImage,
                                     inputCenter: CIVector(cgPoint: inputCenter),
                                     inputAngle: inputAngle as NSNumber,
                                     inputWidth: inputWidth as NSNumber)?.outputUIImage
    }
    
    @available(iOS 6, *)
    public func twelvefoldReflectedTile(inputCenter: CGPoint = CGPoint(x: 150.0, y: 150.0), inputAngle: Float = 0, inputWidth: Float = 100) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.twelvefoldReflectedTile(inputImage: inputImage,
                                                inputCenter: CIVector(cgPoint: inputCenter),
                                                inputAngle: inputAngle as NSNumber,
                                                inputWidth: inputWidth as NSNumber)?.outputUIImage
    }
    
    @available(iOS 5, *)
    public func twirlDistortion(inputCenter: CGPoint = CGPoint(x: 150.0, y: 150.0), inputRadius: Float = 300, inputAngle: Float = Float.pi) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.twirlDistortion(inputImage: inputImage,
                                        inputCenter: CIVector(cgPoint: inputCenter),
                                        inputRadius: inputRadius as NSNumber,
                                        inputAngle: inputAngle as NSNumber)?.outputUIImage
    }
    
    @available(iOS 6, *)
    public func unsharpMask(inputRadius: Float = 2.5, inputIntensity: Float = 0.5) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.unsharpMask(inputImage: inputImage, inputRadius: inputRadius as NSNumber, inputIntensity: inputIntensity as NSNumber)?.outputUIImage
    }
    
    @available(iOS 5, *)
    public func vibrance(inputAmount: Float = 0) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.vibrance(inputImage: inputImage, inputAmount: inputAmount as NSNumber)?.outputUIImage
    }
    
    @available(iOS 5, *)
    public func vignette(inputIntensity: Float = 0, inputRadius: Float = 1) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.vignette(inputImage: inputImage, inputIntensity: inputIntensity as NSNumber, inputRadius: inputRadius as NSNumber)?.outputUIImage
    }
    
    @available(iOS 7, *)
    public func vignetteEffect(inputCenter: CGPoint = CGPoint(x: 150.0, y: 150.0), inputRadius: Float = 150, inputIntensity: Float = 1, inputFalloff: Float = 0.5) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.vignetteEffect(inputImage: inputImage,
                                       inputCenter: CIVector(cgPoint: inputCenter),
                                       inputRadius: inputRadius as NSNumber,
                                       inputIntensity: inputIntensity as NSNumber,
                                       inputFalloff: inputFalloff as NSNumber)?.outputUIImage
    }
    
    @available(iOS 6, *)
    public func vortexDistortion(inputCenter: CGPoint = CGPoint(x: 150.0, y: 150.0), inputRadius: Float = 300, inputAngle: Float = 56.54866776461628) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.vortexDistortion(inputImage: inputImage,
                                         inputCenter: CIVector(cgPoint: inputCenter),
                                         inputRadius: inputRadius as NSNumber,
                                         inputAngle: inputAngle as NSNumber)?.outputUIImage
    }
    
    @available(iOS 5, *)
    public func whitePointAdjust(inputColor: UIColor) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.whitePointAdjust(inputImage: inputImage, inputColor: inputColor.ciColor)?.outputUIImage
    }
    
    @available(iOS 10, *)
    public func xray() -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.xray(inputImage: inputImage)?.outputUIImage
    }
    
    @available(iOS 8.3, *)
    public func zoomBlur(inputCenter: CGPoint = CGPoint(x: 150.0, y: 150.0), inputAmount: Float = 20) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.zoomBlur(inputImage: inputImage,
                                 inputCenter: CIVector(cgPoint: inputCenter),
                                 inputAmount: inputAmount as NSNumber)?.outputUIImage
    }
}
