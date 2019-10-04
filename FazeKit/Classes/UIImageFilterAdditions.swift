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
        static func attributedTextImage(inputText: NSAttributedString, inputScaleFactor: Float = 1) -> UIImage? {
            return CIFilter.attributedTextImageGenerator(inputText: inputText, inputScaleFactor: inputScaleFactor as NSNumber)?.outputUIImage
        }
        
        enum AztecCodeCompactStyle {
            case compact
            case noncompact
            case automatic
            
            fileprivate var asNSNumber: NSNumber? {
                return self == .automatic ? nil : (self == .compact) as NSNumber
            }
        }
        
        @available(iOS 8, *)
        static func aztecCode(inputMessage: Data, inputCorrectionLevel: Float = 23, inputLayers: Float, inputCompactStyle: AztecCodeCompactStyle = .automatic) -> UIImage? {
            return CIFilter.aztecCodeGenerator(inputMessage: inputMessage as NSData,
                                               inputCorrectionLevel: inputCorrectionLevel as NSNumber,
                                               inputLayers: inputLayers as NSNumber,
                                               inputCompactStyle: inputCompactStyle.asNSNumber)?.outputUIImage
        }
        
        @available(iOS 11, *)
        static func barcode(inputBarcodeDescriptor: CIBarcodeDescriptor) -> UIImage? {
            return CIFilter.barcodeGenerator(inputBarcodeDescriptor: inputBarcodeDescriptor)?.outputUIImage
        }
        
        @available(iOS 5, *)
        static func checkerboard(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputColor0: UIColor, inputColor1: UIColor, inputWidth: Float = 80, inputSharpness: Float = 1) -> UIImage? {
            return CIFilter.checkerboardGenerator(inputCenter: inputCenter,
                                                  inputColor0: inputColor0.ciColor,
                                                  inputColor1: inputColor1.ciColor,
                                                  inputWidth: inputWidth as NSNumber,
                                                  inputSharpness: inputSharpness as NSNumber)?.outputUIImage
        }
        
        @available(iOS 8, *)
        static func code128Barcode(inputMessage: Data, inputQuietSpace: Float = 7, inputBarcodeHeight: Float = 32) -> UIImage? {
            return CIFilter.code128BarcodeGenerator(inputMessage: inputMessage as NSData,
                                                    inputQuietSpace: inputQuietSpace as NSNumber,
                                                    inputBarcodeHeight: inputBarcodeHeight as NSNumber)?.outputUIImage
        }
        
        @available(iOS 5, *)
        static func constantColor(inputColor: UIColor) -> UIImage? {
            return CIFilter.constantColorGenerator(inputColor: inputColor.ciColor)?.outputUIImage
        }
        
        @available(iOS 5, *)
        static func gaussianGradient(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputColor0: UIColor, inputColor1: UIColor, inputRadius: Float = 300) -> UIImage? {
            return CIFilter.gaussianGradient(inputCenter: inputCenter, inputColor0: inputColor0.ciColor, inputColor1: inputColor1.ciColor, inputRadius: inputRadius as NSNumber)?.outputUIImage
        }
        
        @available(iOS 10, *)
        static func hueSaturationValueGradient(inputValue: Float = 1, inputRadius: Float = 300, inputSoftness: Float = 1, inputDither: Float = 1, inputColorSpace: CGColorSpace) -> UIImage? {
            return CIFilter.hueSaturationValueGradient(inputValue: inputValue as NSNumber,
                                                       inputRadius: inputRadius as NSNumber,
                                                       inputSoftness: inputSoftness as NSNumber,
                                                       inputDither: inputDither as NSNumber,
                                                       inputColorSpace: inputColorSpace)?.outputUIImage
        }
        
        @available(iOS 9, *)
        static func lenticularHalo(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0),
                                   inputColor: UIColor,
                                   inputHaloRadius: Float = 70,
                                   inputHaloWidth: Float = 87,
                                   inputHaloOverlap: Float = 0.77,
                                   inputStriationStrength: Float = 0.5,
                                   inputStriationContrast: Float = 1,
                                   inputTime: Float = 0) -> UIImage? {
            return CIFilter.lenticularHaloGenerator(inputCenter: inputCenter,
                                                    inputColor: inputColor.ciColor,
                                                    inputHaloRadius: inputHaloRadius as NSNumber,
                                                    inputHaloWidth: inputHaloWidth as NSNumber,
                                                    inputHaloOverlap: inputHaloOverlap as NSNumber,
                                                    inputStriationStrength: inputStriationStrength as NSNumber,
                                                    inputStriationContrast: inputStriationContrast as NSNumber,
                                                    inputTime: inputTime as NSNumber)?.outputUIImage
        }
        
        @available(iOS 5, *)
        static func linearGradient(inputPoint0: CIVector = CIVector(x: 0.0, y: 0.0), inputPoint1: CIVector = CIVector(x: 200.0, y: 200.0), inputColor0: UIColor, inputColor1: UIColor) -> UIImage? {
            return CIFilter.linearGradient(inputPoint0: inputPoint0, inputPoint1: inputPoint1, inputColor0: inputColor0.ciColor, inputColor1: inputColor1.ciColor)?.outputUIImage
        }
        
        enum PDF417Compaction {
            case always
            case never
            case automatic
            
            fileprivate var asNSNumber: NSNumber? {
                return self == .automatic ? nil : (self == .always) as NSNumber
            }
        }
        
        @available(iOS 9, *)
        static func pdf417Barcode(inputMessage: Data,
                                  inputMinWidth: Float,
                                  inputMaxWidth: Float,
                                  inputMinHeight: Float,
                                  inputMaxHeight: Float,
                                  inputDataColumns: Float,
                                  inputRows: Float,
                                  inputPreferredAspectRatio: Float,
                                  inputCompactionMode: Float,
                                  inputCompactStyle: Float,
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
                                                   inputCompactStyle: inputCompactStyle as NSNumber,
                                                   inputCorrectionLevel: inputCorrectionLevel as NSNumber,
                                                   inputAlwaysSpecifyCompaction: inputAlwaysSpecifyCompaction.asNSNumber)?.outputUIImage
        }
        
        enum QRCodeCorrectionLevel: String {
            case low = "L"
            case medium = "M"
            case quality = "Q"
            case high = "H"
        }
        
        @available(iOS 7, *)
        static func qrCode(inputMessage: Data, inputCorrectionLevel: QRCodeCorrectionLevel = .medium) -> UIImage? {
            return CIFilter.qrCodeGenerator(inputMessage: inputMessage as NSData, inputCorrectionLevel: inputCorrectionLevel.rawValue as NSString)?.outputUIImage
        }
        
        @available(iOS 5, *)
        static func radialGradient(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputRadius0: Float = 5, inputRadius1: Float = 100, inputColor0: UIColor, inputColor1: UIColor) -> UIImage? {
            return CIFilter.radialGradient(inputCenter: inputCenter,
                                           inputRadius0: inputRadius0 as NSNumber,
                                           inputRadius1: inputRadius1 as NSNumber,
                                           inputColor0: inputColor0.ciColor,
                                           inputColor1: inputColor1.ciColor)?.outputUIImage
        }
        
        @available(iOS 6, *)
        static func random() -> UIImage? {
            return CIFilter.randomGenerator()?.outputUIImage
        }
        
        @available(iOS 6, *)
        static func smoothLinearGradient(inputPoint0: CIVector = CIVector(x: 0.0, y: 0.0), inputPoint1: CIVector = CIVector(x: 200.0, y: 200.0), inputColor0: UIColor, inputColor1: UIColor) -> UIImage? {
            return CIFilter.smoothLinearGradient(inputPoint0: inputPoint0, inputPoint1: inputPoint1, inputColor0: inputColor0.ciColor, inputColor1: inputColor1.ciColor)?.outputUIImage
        }
        
        @available(iOS 6, *)
        static func starShine(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0),
                              inputColor: UIColor,
                              inputRadius: Float = 50,
                              inputCrossScale: Float = 15,
                              inputCrossAngle: Float = 0.6,
                              inputCrossOpacity: Float = -2,
                              inputCrossWidth: Float = 2.5,
                              inputEpsilon: Float = -2) -> UIImage? {
            return CIFilter.starShineGenerator(inputCenter: inputCenter,
                                               inputColor: inputColor.ciColor,
                                               inputRadius: inputRadius as NSNumber,
                                               inputCrossScale: inputCrossScale as NSNumber,
                                               inputCrossAngle: inputCrossAngle as NSNumber,
                                               inputCrossOpacity: inputCrossOpacity as NSNumber,
                                               inputCrossWidth: inputCrossWidth as NSNumber,
                                               inputEpsilon: inputEpsilon as NSNumber)?.outputUIImage
        }
        
        @available(iOS 5, *)
        static func stripes(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputColor0: UIColor, inputColor1: UIColor, inputWidth: Float = 80, inputSharpness: Float = 1) -> UIImage? {
            return CIFilter.stripesGenerator(inputCenter: inputCenter,
                                             inputColor0: inputColor0.ciColor,
                                             inputColor1: inputColor1.ciColor,
                                             inputWidth: inputWidth as NSNumber,
                                             inputSharpness: inputSharpness as NSNumber)?.outputUIImage
        }
        
        @available(iOS 9, *)
        static func sunbeams(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0),
                             inputColor: UIColor,
                             inputSunRadius: Float = 40,
                             inputMaxStriationRadius: Float = 2.58,
                             inputStriationStrength: Float = 0.5,
                             inputStriationContrast: Float = 1.375,
                             inputTime: Float = 0) -> UIImage? {
            return CIFilter.sunbeamsGenerator(inputCenter: inputCenter,
                                              inputColor: inputColor.ciColor,
                                              inputSunRadius: inputSunRadius as NSNumber,
                                              inputMaxStriationRadius: inputMaxStriationRadius as NSNumber,
                                              inputStriationStrength: inputStriationStrength as NSNumber,
                                              inputStriationContrast: inputStriationContrast as NSNumber,
                                              inputTime: inputTime as NSNumber)?.outputUIImage
        }
        
        @available(iOS 11, *)
        static func textImage(inputText: String, inputFontName: String = "HelveticaNeue", inputFontSize: Float = 12, inputScaleFactor: Float = 1) -> UIImage? {
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
    func accordionFoldTransition(inputTargetImage: UIImage, inputBottomHeight: Float = 0, inputNumberOfFolds: Float = 3, inputFoldShadowAmount: Float = 0.1, inputTime: Float = 0) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputTargetImage = inputTargetImage.ciImage else { return nil }
        return CIFilter.accordionFoldTransition(inputImage: inputImage,
                                                inputTargetImage: inputTargetImage,
                                                inputBottomHeight: inputBottomHeight as NSNumber,
                                                inputNumberOfFolds: inputNumberOfFolds as NSNumber,
                                                inputFoldShadowAmount: inputFoldShadowAmount as NSNumber,
                                                inputTime: inputTime as NSNumber)?.outputUIImage
    }
    
    @available(iOS 5, *)
    func additionCompositing(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.additionCompositing(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func affineClamp(inputTransform: NSValue = NSValue(cgAffineTransform: CGAffineTransform(a: 1.0, b: 0.0, c: 0.0, d: 1.0, tx: 0.0, ty: 0.0))) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.affineClamp(inputImage: inputImage, inputTransform: inputTransform)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func affineTile(inputTransform: NSValue = NSValue(cgAffineTransform: CGAffineTransform(a: 1.0, b: 0.0, c: 0.0, d: 1.0, tx: 0.0, ty: 0.0))) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.affineTile(inputImage: inputImage, inputTransform: inputTransform)?.outputUIImage
    }
    
    @available(iOS 5, *)
    func affineTransform(inputTransform: NSValue = NSValue(cgAffineTransform: CGAffineTransform(a: 1.0, b: 0.0, c: 0.0, d: 1.0, tx: 0.0, ty: 0.0))) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.affineTransform(inputImage: inputImage, inputTransform: inputTransform)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func areaAverage(inputExtent: CIVector = CIVector(x: 0.0, y: 0.0, z: 640.0, w: 80.0)) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.areaAverage(inputImage: inputImage, inputExtent: inputExtent)?.outputUIImage
    }
    
    @available(iOS 8, *)
    func areaHistogram(inputExtent: CIVector = CIVector(x: 0.0, y: 0.0, z: 640.0, w: 80.0), inputScale: Float = 1, inputCount: Float = 64) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.areaHistogram(inputImage: inputImage, inputExtent: inputExtent, inputScale: inputScale as NSNumber, inputCount: inputCount as NSNumber)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func areaMaximum(inputExtent: CIVector = CIVector(x: 0.0, y: 0.0, z: 640.0, w: 80.0)) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.areaMaximum(inputImage: inputImage, inputExtent: inputExtent)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func areaMaximumAlpha(inputExtent: CIVector = CIVector(x: 0.0, y: 0.0, z: 640.0, w: 80.0)) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.areaMaximumAlpha(inputImage: inputImage, inputExtent: inputExtent)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func areaMinimum(inputExtent: CIVector = CIVector(x: 0.0, y: 0.0, z: 640.0, w: 80.0)) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.areaMinimum(inputImage: inputImage, inputExtent: inputExtent)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func areaMinimumAlpha(inputExtent: CIVector = CIVector(x: 0.0, y: 0.0, z: 640.0, w: 80.0)) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.areaMinimumAlpha(inputImage: inputImage, inputExtent: inputExtent)?.outputUIImage
    }
    
    @available(iOS 11, *)
    func areaMinMaxRed(inputExtent: CIVector = CIVector(x: 0.0, y: 0.0, z: 640.0, w: 80.0)) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.areaMinMaxRed(inputImage: inputImage, inputExtent: inputExtent)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func barsSwipeTransition(inputTargetImage: UIImage, inputAngle: Float = 3.141592653589793, inputWidth: Float = 30, inputBarOffset: Float = 10, inputTime: Float = 0) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputTargetImage = inputTargetImage.ciImage else { return nil }
        return CIFilter.barsSwipeTransition(inputImage: inputImage,
                                            inputTargetImage: inputTargetImage,
                                            inputAngle: inputAngle as NSNumber,
                                            inputWidth: inputWidth as NSNumber,
                                            inputBarOffset: inputBarOffset as NSNumber,
                                            inputTime: inputTime as NSNumber)?.outputUIImage
    }
    
    @available(iOS 11, *)
    func bicubicScaleTransform(inputScale: Float = 1, inputAspectRatio: Float = 1, inputB: Float = 0, inputC: Float = 0.75) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.bicubicScaleTransform(inputImage: inputImage,
                                              inputScale: inputScale as NSNumber,
                                              inputAspectRatio: inputAspectRatio as NSNumber,
                                              inputB: inputB as NSNumber,
                                              inputC: inputC as NSNumber)?.outputUIImage
    }
    
    @available(iOS 7, *)
    func blendWithAlphaMask(inputBackgroundImage: UIImage, inputMaskImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage, let inputMaskImage = inputMaskImage.ciImage else { return nil }
        return CIFilter.blendWithAlphaMask(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage, inputMaskImage: inputMaskImage)?.outputUIImage
    }
    
    @available(iOS 11, *)
    func blendWithBlueMask(inputBackgroundImage: UIImage, inputMaskImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage, let inputMaskImage = inputMaskImage.ciImage else { return nil }
        return CIFilter.blendWithBlueMask(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage, inputMaskImage: inputMaskImage)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func blendWithMask(inputBackgroundImage: UIImage, inputMaskImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage, let inputMaskImage = inputMaskImage.ciImage else { return nil }
        return CIFilter.blendWithMask(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage, inputMaskImage: inputMaskImage)?.outputUIImage
    }
    
    @available(iOS 11, *)
    func blendWithRedMask(inputBackgroundImage: UIImage, inputMaskImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage, let inputMaskImage = inputMaskImage.ciImage else { return nil }
        return CIFilter.blendWithRedMask(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage, inputMaskImage: inputMaskImage)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func bloom(inputRadius: Float = 10, inputIntensity: Float = 0.5) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.bloom(inputImage: inputImage, inputRadius: inputRadius as NSNumber, inputIntensity: inputIntensity as NSNumber)?.outputUIImage
    }
    
    @available(iOS 11, *)
    func bokehBlur(inputRadius: Float = 20, inputRingAmount: Float = 0, inputRingSize: Float = 0.1, inputSoftness: Float = 1) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.bokehBlur(inputImage: inputImage,
                                  inputRadius: inputRadius as NSNumber,
                                  inputRingAmount: inputRingAmount as NSNumber,
                                  inputRingSize: inputRingSize as NSNumber,
                                  inputSoftness: inputSoftness as NSNumber)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func boxBlur(inputRadius: Float = 10) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.boxBlur(inputImage: inputImage, inputRadius: inputRadius as NSNumber)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func bumpDistortion(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputRadius: Float = 300, inputScale: Float = 0.5) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.bumpDistortion(inputImage: inputImage, inputCenter: inputCenter, inputRadius: inputRadius as NSNumber, inputScale: inputScale as NSNumber)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func bumpDistortionLinear(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputRadius: Float = 300, inputAngle: Float = 0, inputScale: Float = 0.5) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.bumpDistortionLinear(inputImage: inputImage,
                                             inputCenter: inputCenter,
                                             inputRadius: inputRadius as NSNumber,
                                             inputAngle: inputAngle as NSNumber,
                                             inputScale: inputScale as NSNumber)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func circleSplashDistortion(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputRadius: Float = 150) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.circleSplashDistortion(inputImage: inputImage, inputCenter: inputCenter, inputRadius: inputRadius as NSNumber)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func circularScreen(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputWidth: Float = 6, inputSharpness: Float = 0.7) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.circularScreen(inputImage: inputImage,
                                       inputCenter: inputCenter,
                                       inputWidth: inputWidth as NSNumber,
                                       inputSharpness: inputSharpness as NSNumber)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func circularWrap(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputRadius: Float = 150, inputAngle: Float = 0) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.circularWrap(inputImage: inputImage,
                                     inputCenter: inputCenter,
                                     inputRadius: inputRadius as NSNumber,
                                     inputAngle: inputAngle as NSNumber)?.outputUIImage
    }
    
    @available(iOS 10, *)
    func clamp(inputExtent: CIVector = CIVector(x: 0.0, y: 0.0, z: 640.0, w: 80.0)) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.clamp(inputImage: inputImage, inputExtent: inputExtent)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func cmykHalftone(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputWidth: Float = 6, inputAngle: Float = 0, inputSharpness: Float = 0.7, inputGCR: Float = 1, inputUCR: Float = 0.5) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.cmykHalftone(inputImage: inputImage,
                                     inputCenter: inputCenter,
                                     inputWidth: inputWidth as NSNumber,
                                     inputAngle: inputAngle as NSNumber,
                                     inputSharpness: inputSharpness as NSNumber,
                                     inputGCR: inputGCR as NSNumber,
                                     inputUCR: inputUCR as NSNumber)?.outputUIImage
    }
    
    @available(iOS 5, *)
    func colorBlendMode(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.colorBlendMode(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 5, *)
    func colorBurnBlendMode(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.colorBurnBlendMode(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 7, *)
    func colorClamp(inputMinComponents: CIVector = CIVector(x: 0.0, y: 0.0, z: 0.0, w: 0.0), inputMaxComponents: CIVector = CIVector(x: 1.0, y: 1.0, z: 1.0, w: 1.0)) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.colorClamp(inputImage: inputImage, inputMinComponents: inputMinComponents, inputMaxComponents: inputMaxComponents)?.outputUIImage
    }
    
    @available(iOS 5, *)
    func colorControls(inputSaturation: Float = 1, inputBrightness: Float = 0, inputContrast: Float = 1) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.colorControls(inputImage: inputImage,
                                      inputSaturation: inputSaturation as NSNumber,
                                      inputBrightness: inputBrightness as NSNumber,
                                      inputContrast: inputContrast as NSNumber)?.outputUIImage
    }
    
    @available(iOS 7, *)
    func colorCrossPolynomial(inputRedCoefficients: CIVector = CIVector(), inputGreenCoefficients: CIVector = CIVector(), inputBlueCoefficients: CIVector = CIVector()) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.colorCrossPolynomial(inputImage: inputImage,
                                             inputRedCoefficients: inputRedCoefficients,
                                             inputGreenCoefficients: inputGreenCoefficients,
                                             inputBlueCoefficients: inputBlueCoefficients)?.outputUIImage
    }
    
    @available(iOS 5, *)
    func colorCube(inputCubeDimension: Float = 2, inputCubeData: Data) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.colorCube(inputImage: inputImage, inputCubeDimension: inputCubeDimension as NSNumber, inputCubeData: inputCubeData as NSData)?.outputUIImage
    }
    
    @available(iOS 11, *)
    func colorCubesMixedWithMask(inputMaskImage: UIImage, inputCubeDimension: Float = 2, inputCube0Data: Data, inputCube1Data: Data, inputColorSpace: CGColorSpace) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputMaskImage = inputMaskImage.ciImage else { return nil }
        return CIFilter.colorCubesMixedWithMask(inputImage: inputImage,
                                                inputMaskImage: inputMaskImage,
                                                inputCubeDimension: inputCubeDimension as NSNumber,
                                                inputCube0Data: inputCube0Data as NSData,
                                                inputCube1Data: inputCube1Data as NSData,
                                                inputColorSpace: inputColorSpace)?.outputUIImage
    }
    
    @available(iOS 7, *)
    func colorCubeWithColorSpace(inputCubeDimension: Float = 2, inputCubeData: Data, inputColorSpace: CGColorSpace) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.colorCubeWithColorSpace(inputImage: inputImage,
                                                inputCubeDimension: inputCubeDimension as NSNumber,
                                                inputCubeData: inputCubeData as NSData,
                                                inputColorSpace: inputColorSpace)?.outputUIImage
    }
    
    @available(iOS 11, *)
    func colorCurves(inputCurvesData: Data, inputCurvesDomain: CIVector = CIVector(x: 0.0, y: 1.0), inputColorSpace: CGColorSpace) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.colorCurves(inputImage: inputImage, inputCurvesData: inputCurvesData as NSData, inputCurvesDomain: inputCurvesDomain, inputColorSpace: inputColorSpace)?.outputUIImage
    }
    
    @available(iOS 5, *)
    func colorDodgeBlendMode(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.colorDodgeBlendMode(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 5, *)
    func colorInvert() -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.colorInvert(inputImage: inputImage)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func colorMap(inputGradientImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputGradientImage = inputGradientImage.ciImage else { return nil }
        return CIFilter.colorMap(inputImage: inputImage, inputGradientImage: inputGradientImage)?.outputUIImage
    }
    
    @available(iOS 5, *)
    func colorMatrix(inputRVector: CIVector = CIVector(x: 1.0, y: 0.0, z: 0.0, w: 0.0), inputGVector: CIVector = CIVector(x: 0.0, y: 1.0, z: 0.0, w: 0.0), inputBVector: CIVector = CIVector(x: 0.0, y: 0.0, z: 1.0, w: 0.0), inputAVector: CIVector = CIVector(x: 0.0, y: 0.0, z: 0.0, w: 1.0), inputBiasVector: CIVector = CIVector(x: 0.0, y: 0.0, z: 0.0, w: 0.0)) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.colorMatrix(inputImage: inputImage, inputRVector: inputRVector, inputGVector: inputGVector, inputBVector: inputBVector, inputAVector: inputAVector, inputBiasVector: inputBiasVector)?.outputUIImage
    }
    
    @available(iOS 5, *)
    func colorMonochrome(inputColor: UIColor, inputIntensity: Float = 1) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.colorMonochrome(inputImage: inputImage, inputColor: inputColor.ciColor, inputIntensity: inputIntensity as NSNumber)?.outputUIImage
    }
    
    @available(iOS 7, *)
    func colorPolynomial(inputRedCoefficients: CIVector = CIVector(x: 0.0, y: 1.0, z: 0.0, w: 0.0),
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
    func colorPosterize(inputLevels: Float = 6) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.colorPosterize(inputImage: inputImage, inputLevels: inputLevels as NSNumber)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func columnAverage(inputExtent: CIVector = CIVector(x: 0.0, y: 0.0, z: 640.0, w: 80.0)) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.columnAverage(inputImage: inputImage, inputExtent: inputExtent)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func comicEffect() -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.comicEffect(inputImage: inputImage)?.outputUIImage
    }
    
    @available(iOS 7, *)
    func convolution3X3(inputWeights: CIVector = CIVector(), inputBias: Float = 0) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.convolution3X3(inputImage: inputImage, inputWeights: inputWeights, inputBias: inputBias as NSNumber)?.outputUIImage
    }
    
    @available(iOS 7, *)
    func convolution5X5(inputWeights: CIVector = CIVector(), inputBias: Float = 0) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.convolution5X5(inputImage: inputImage, inputWeights: inputWeights, inputBias: inputBias as NSNumber)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func convolution7X7(inputWeights: CIVector = CIVector(), inputBias: Float = 0) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.convolution7X7(inputImage: inputImage, inputWeights: inputWeights, inputBias: inputBias as NSNumber)?.outputUIImage
    }
    
    @available(iOS 7, *)
    func convolution9Horizontal(inputWeights: CIVector = CIVector(), inputBias: Float = 0) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.convolution9Horizontal(inputImage: inputImage, inputWeights: inputWeights, inputBias: inputBias as NSNumber)?.outputUIImage
    }
    
    @available(iOS 7, *)
    func convolution9Vertical(inputWeights: CIVector = CIVector(), inputBias: Float = 0) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.convolution9Vertical(inputImage: inputImage, inputWeights: inputWeights, inputBias: inputBias as NSNumber)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func copyMachineTransition(inputTargetImage: UIImage,
                               inputExtent: CIVector = CIVector(x: 0.0, y: 0.0, z: 300.0, w: 300.0),
                               inputColor: UIColor,
                               inputTime: Float = 0,
                               inputAngle: Float = 0,
                               inputWidth: Float = 200,
                               inputOpacity: Float = 1.3) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputTargetImage = inputTargetImage.ciImage else { return nil }
        return CIFilter.copyMachineTransition(inputImage: inputImage,
                                              inputTargetImage: inputTargetImage,
                                              inputExtent: inputExtent,
                                              inputColor: inputColor.ciColor,
                                              inputTime: inputTime as NSNumber,
                                              inputAngle: inputAngle as NSNumber,
                                              inputWidth: inputWidth as NSNumber,
                                              inputOpacity: inputOpacity as NSNumber)?.outputUIImage
    }
    
    @available(iOS 5, *)
    func crop(inputRectangle: CIVector? = nil) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.crop(inputImage: inputImage, inputRectangle: inputRectangle)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func crystallize(inputRadius: Float = 20, inputCenter: CIVector = CIVector(x: 150.0, y: 150.0)) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.crystallize(inputImage: inputImage, inputRadius: inputRadius as NSNumber, inputCenter: inputCenter)?.outputUIImage
    }
    
    @available(iOS 5, *)
    func darkenBlendMode(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.darkenBlendMode(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 11, *)
    func depthBlurEffect(inputDisparityImage: UIImage,
                         inputAperture: Float = 0,
                         inputLeftEyePositions: CIVector,
                         inputRightEyePositions: CIVector,
                         inputChinPositions: CIVector,
                         inputNosePositions: CIVector,
                         inputFocusRect: CIVector,
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
                                        inputFocusRect: inputFocusRect,
                                        inputLumaNoiseScale: inputLumaNoiseScale as NSNumber,
                                        inputScaleFactor: inputScaleFactor as NSNumber,
                                        inputCalibrationData: inputCalibrationData,
                                        inputAuxDataMetadata: inputAuxDataMetadata as NSDictionary)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func depthOfField(inputPoint0: CIVector = CIVector(x: 0.0, y: 300.0),
                      inputPoint1: CIVector = CIVector(x: 300.0, y: 300.0),
                      inputSaturation: Float = 1.5,
                      inputUnsharpMaskRadius: Float = 2.5,
                      inputUnsharpMaskIntensity: Float = 0.5,
                      inputRadius: Float = 6) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.depthOfField(inputImage: inputImage,
                                     inputPoint0: inputPoint0,
                                     inputPoint1: inputPoint1,
                                     inputSaturation: inputSaturation as NSNumber,
                                     inputUnsharpMaskRadius: inputUnsharpMaskRadius as NSNumber,
                                     inputUnsharpMaskIntensity: inputUnsharpMaskIntensity as NSNumber,
                                     inputRadius: inputRadius as NSNumber)?.outputUIImage
    }
    
    @available(iOS 11, *)
    func depthToDisparity() -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.depthToDisparity(inputImage: inputImage)?.outputUIImage
    }
    
    @available(iOS 5, *)
    func differenceBlendMode(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.differenceBlendMode(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func discBlur(inputRadius: Float = 8) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.discBlur(inputImage: inputImage, inputRadius: inputRadius as NSNumber)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func disintegrateWithMaskTransition(inputTargetImage: UIImage,
                                        inputMaskImage: UIImage,
                                        inputTime: Float = 0,
                                        inputShadowRadius: Float = 8,
                                        inputShadowDensity: Float = 0.65,
                                        inputShadowOffset: CIVector = CIVector(x: 0.0, y: -10.0)) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputTargetImage = inputTargetImage.ciImage, let inputMaskImage = inputMaskImage.ciImage else { return nil }
        return CIFilter.disintegrateWithMaskTransition(inputImage: inputImage,
                                                       inputTargetImage: inputTargetImage,
                                                       inputMaskImage: inputMaskImage,
                                                       inputTime: inputTime as NSNumber,
                                                       inputShadowRadius: inputShadowRadius as NSNumber,
                                                       inputShadowDensity: inputShadowDensity as NSNumber,
                                                       inputShadowOffset: inputShadowOffset)?.outputUIImage
    }
    
    @available(iOS 11, *)
    func disparityToDepth() -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.disparityToDepth(inputImage: inputImage)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func displacementDistortion(inputDisplacementImage: UIImage, inputScale: Float = 50) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputDisplacementImage = inputDisplacementImage.ciImage else { return nil }
        return CIFilter.displacementDistortion(inputImage: inputImage, inputDisplacementImage: inputDisplacementImage, inputScale: inputScale as NSNumber)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func dissolveTransition(inputTargetImage: UIImage, inputTime: Float = 0) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputTargetImage = inputTargetImage.ciImage else { return nil }
        return CIFilter.dissolveTransition(inputImage: inputImage, inputTargetImage: inputTargetImage, inputTime: inputTime as NSNumber)?.outputUIImage
    }
    
    @available(iOS 8, *)
    func divideBlendMode(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.divideBlendMode(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func dotScreen(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0),
                   inputAngle: Float = 0,
                   inputWidth: Float = 6,
                   inputSharpness: Float = 0.7) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.dotScreen(inputImage: inputImage,
                                  inputCenter: inputCenter,
                                  inputAngle: inputAngle as NSNumber,
                                  inputWidth: inputWidth as NSNumber,
                                  inputSharpness: inputSharpness as NSNumber)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func droste(inputInsetPoint0: CIVector = CIVector(x: 200.0, y: 200.0),
                inputInsetPoint1: CIVector = CIVector(x: 400.0, y: 400.0),
                inputStrands: Float = 1,
                inputPeriodicity: Float = 1,
                inputRotation: Float = 0,
                inputZoom: Float = 1) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.droste(inputImage: inputImage,
                               inputInsetPoint0: inputInsetPoint0,
                               inputInsetPoint1: inputInsetPoint1,
                               inputStrands: inputStrands as NSNumber,
                               inputPeriodicity: inputPeriodicity as NSNumber,
                               inputRotation: inputRotation as NSNumber,
                               inputZoom: inputZoom as NSNumber)?.outputUIImage
    }
    
    @available(iOS 10, *)
    func edgePreserveUpsampleFilter(inputSmallImage: UIImage, inputSpatialSigma: Float = 3, inputLumaSigma: Float = 0.15) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputSmallImage = inputSmallImage.ciImage else { return nil }
        return CIFilter.edgePreserveUpsampleFilter(inputImage: inputImage,
                                                   inputSmallImage: inputSmallImage,
                                                   inputSpatialSigma: inputSpatialSigma as NSNumber,
                                                   inputLumaSigma: inputLumaSigma as NSNumber)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func edges(inputIntensity: Float = 1) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.edges(inputImage: inputImage, inputIntensity: inputIntensity as NSNumber)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func edgeWork(inputRadius: Float = 3) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.edgeWork(inputImage: inputImage, inputRadius: inputRadius as NSNumber)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func eightfoldReflectedTile(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputAngle: Float = 0, inputWidth: Float = 100) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.eightfoldReflectedTile(inputImage: inputImage, inputCenter: inputCenter, inputAngle: inputAngle as NSNumber, inputWidth: inputWidth as NSNumber)?.outputUIImage
    }
    
    @available(iOS 5, *)
    func exclusionBlendMode(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.exclusionBlendMode(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 5, *)
    func exposureAdjust(inputEV: Float = 0) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.exposureAdjust(inputImage: inputImage, inputEV: inputEV as NSNumber)?.outputUIImage
    }
    
    @available(iOS 5, *)
    func falseColor(inputColor0: UIColor, inputColor1: UIColor) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.falseColor(inputImage: inputImage, inputColor0: inputColor0.ciColor, inputColor1: inputColor1.ciColor)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func flashTransition(inputTargetImage: UIImage,
                         inputCenter: CIVector = CIVector(x: 150.0, y: 150.0),
                         inputExtent: CIVector = CIVector(x: 0.0, y: 0.0, z: 300.0, w: 300.0),
                         inputColor: UIColor,
                         inputTime: Float = 0,
                         inputMaxStriationRadius: Float = 2.58,
                         inputStriationStrength: Float = 0.5,
                         inputStriationContrast: Float = 1.375,
                         inputFadeThreshold: Float = 0.85) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputTargetImage = inputTargetImage.ciImage else { return nil }
        return CIFilter.flashTransition(inputImage: inputImage,
                                        inputTargetImage: inputTargetImage,
                                        inputCenter: inputCenter,
                                        inputExtent: inputExtent,
                                        inputColor: inputColor.ciColor,
                                        inputTime: inputTime as NSNumber,
                                        inputMaxStriationRadius: inputMaxStriationRadius as NSNumber,
                                        inputStriationStrength: inputStriationStrength as NSNumber,
                                        inputStriationContrast: inputStriationContrast as NSNumber,
                                        inputFadeThreshold: inputFadeThreshold as NSNumber)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func fourfoldReflectedTile(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0),
                               inputAngle: Float = 0,
                               inputWidth: Float = 100,
                               inputAcuteAngle: Float = 1.570796326794897) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.fourfoldReflectedTile(inputImage: inputImage,
                                              inputCenter: inputCenter,
                                              inputAngle: inputAngle as NSNumber,
                                              inputWidth: inputWidth as NSNumber,
                                              inputAcuteAngle: inputAcuteAngle as NSNumber)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func fourfoldRotatedTile(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputAngle: Float = 0, inputWidth: Float = 100) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.fourfoldRotatedTile(inputImage: inputImage, inputCenter: inputCenter, inputAngle: inputAngle as NSNumber, inputWidth: inputWidth as NSNumber)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func fourfoldTranslatedTile(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputAngle: Float = 0, inputWidth: Float = 100, inputAcuteAngle: Float = 1.570796326794897) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.fourfoldTranslatedTile(inputImage: inputImage,
                                               inputCenter: inputCenter,
                                               inputAngle: inputAngle as NSNumber,
                                               inputWidth: inputWidth as NSNumber,
                                               inputAcuteAngle: inputAcuteAngle as NSNumber)?.outputUIImage
    }
    
    @available(iOS 5, *)
    func gammaAdjust(inputPower: Float = 1) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.gammaAdjust(inputImage: inputImage, inputPower: inputPower as NSNumber)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func gaussianBlur(inputRadius: Float = 10) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.gaussianBlur(inputImage: inputImage, inputRadius: inputRadius as NSNumber)?.outputUIImage
    }
    
    @available(iOS 8, *)
    func glassDistortion(inputTexture: UIImage, inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputScale: Float = 200) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputTexture = inputTexture.ciImage else { return nil }
        return CIFilter.glassDistortion(inputImage: inputImage, inputTexture: inputTexture, inputCenter: inputCenter, inputScale: inputScale as NSNumber)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func glassLozenge(inputPoint0: CIVector = CIVector(x: 150.0, y: 150.0), inputPoint1: CIVector = CIVector(x: 350.0, y: 150.0), inputRadius: Float = 100, inputRefraction: Float = 1.7) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.glassLozenge(inputImage: inputImage,
                                     inputPoint0: inputPoint0,
                                     inputPoint1: inputPoint1,
                                     inputRadius: inputRadius as NSNumber,
                                     inputRefraction: inputRefraction as NSNumber)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func glideReflectedTile(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputAngle: Float = 0, inputWidth: Float = 100) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.glideReflectedTile(inputImage: inputImage, inputCenter: inputCenter, inputAngle: inputAngle as NSNumber, inputWidth: inputWidth as NSNumber)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func gloom(inputRadius: Float = 10, inputIntensity: Float = 0.5) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.gloom(inputImage: inputImage, inputRadius: inputRadius as NSNumber, inputIntensity: inputIntensity as NSNumber)?.outputUIImage
    }
    
    @available(iOS 5, *)
    func hardLightBlendMode(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.hardLightBlendMode(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func hatchedScreen(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputAngle: Float = 0, inputWidth: Float = 6, inputSharpness: Float = 0.7) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.hatchedScreen(inputImage: inputImage,
                                      inputCenter: inputCenter,
                                      inputAngle: inputAngle as NSNumber,
                                      inputWidth: inputWidth as NSNumber,
                                      inputSharpness: inputSharpness as NSNumber)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func heightFieldFromMask(inputRadius: Float = 10) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.heightFieldFromMask(inputImage: inputImage, inputRadius: inputRadius as NSNumber)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func hexagonalPixellate(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputScale: Float = 8) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.hexagonalPixellate(inputImage: inputImage, inputCenter: inputCenter, inputScale: inputScale as NSNumber)?.outputUIImage
    }
    
    @available(iOS 5, *)
    func highlightShadowAdjust(inputRadius: Float = 0, inputShadowAmount: Float = 0, inputHighlightAmount: Float = 1) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.highlightShadowAdjust(inputImage: inputImage,
                                              inputRadius: inputRadius as NSNumber,
                                              inputShadowAmount: inputShadowAmount as NSNumber,
                                              inputHighlightAmount: inputHighlightAmount as NSNumber)?.outputUIImage
    }
    
    @available(iOS 8, *)
    func histogramDisplayFilter(inputHeight: Float = 100, inputHighLimit: Float = 1, inputLowLimit: Float = 0) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.histogramDisplayFilter(inputImage: inputImage,
                                               inputHeight: inputHeight as NSNumber,
                                               inputHighLimit: inputHighLimit as NSNumber,
                                               inputLowLimit: inputLowLimit as NSNumber)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func holeDistortion(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputRadius: Float = 150) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.holeDistortion(inputImage: inputImage,
                                       inputCenter: inputCenter,
                                       inputRadius: inputRadius as NSNumber)?.outputUIImage
    }
    
    @available(iOS 5, *)
    func hueAdjust(inputAngle: Float = 0) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.hueAdjust(inputImage: inputImage, inputAngle: inputAngle as NSNumber)?.outputUIImage
    }
    
    @available(iOS 5, *)
    func hueBlendMode(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.hueBlendMode(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func kaleidoscope(inputCount: Float = 6, inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputAngle: Float = 0) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.kaleidoscope(inputImage: inputImage,
                                     inputCount: inputCount as NSNumber,
                                     inputCenter: inputCenter,
                                     inputAngle: inputAngle as NSNumber)?.outputUIImage
    }
    
    @available(iOS 11, *)
    func labDeltaE(inputImage2: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputImage2 = inputImage2.ciImage else { return nil }
        return CIFilter.labDeltaE(inputImage: inputImage, inputImage2: inputImage2)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func lanczosScaleTransform(inputScale: Float = 1, inputAspectRatio: Float = 1) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.lanczosScaleTransform(inputImage: inputImage,
                                              inputScale: inputScale as NSNumber,
                                              inputAspectRatio: inputAspectRatio as NSNumber)?.outputUIImage
    }
    
    @available(iOS 5, *)
    func lightenBlendMode(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.lightenBlendMode(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func lightTunnel(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputRotation: Float = 0, inputRadius: Float = 100) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.lightTunnel(inputImage: inputImage,
                                    inputCenter: inputCenter,
                                    inputRotation: inputRotation as NSNumber,
                                    inputRadius: inputRadius as NSNumber)?.outputUIImage
    }
    
    @available(iOS 8, *)
    func linearBurnBlendMode(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.linearBurnBlendMode(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 8, *)
    func linearDodgeBlendMode(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.linearDodgeBlendMode(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 7, *)
    func linearToSRGBToneCurve() -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.linearToSRGBToneCurve(inputImage: inputImage)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func lineOverlay(inputNRNoiseLevel: Float = 0.07000000000000001, inputNRSharpness: Float = 0.71, inputEdgeIntensity: Float = 1, inputThreshold: Float = 0.1, inputContrast: Float = 50) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.lineOverlay(inputImage: inputImage,
                                    inputNRNoiseLevel: inputNRNoiseLevel as NSNumber,
                                    inputNRSharpness: inputNRSharpness as NSNumber,
                                    inputEdgeIntensity: inputEdgeIntensity as NSNumber,
                                    inputThreshold: inputThreshold as NSNumber,
                                    inputContrast: inputContrast as NSNumber)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func lineScreen(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputAngle: Float = 0, inputWidth: Float = 6, inputSharpness: Float = 0.7) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.lineScreen(inputImage: inputImage,
                                   inputCenter: inputCenter,
                                   inputAngle: inputAngle as NSNumber,
                                   inputWidth: inputWidth as NSNumber,
                                   inputSharpness: inputSharpness as NSNumber)?.outputUIImage
    }
    
    @available(iOS 5, *)
    func luminosityBlendMode(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.luminosityBlendMode(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 8, *)
    func maskedVariableBlur(inputMask: UIImage, inputRadius: Float = 5) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputMask = inputMask.ciImage else { return nil }
        return CIFilter.maskedVariableBlur(inputImage: inputImage, inputMask: inputMask, inputRadius: inputRadius as NSNumber)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func maskToAlpha() -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.maskToAlpha(inputImage: inputImage)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func maximumComponent() -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.maximumComponent(inputImage: inputImage)?.outputUIImage
    }
    
    @available(iOS 5, *)
    func maximumCompositing(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.maximumCompositing(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func medianFilter() -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.medianFilter(inputImage: inputImage)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func minimumComponent() -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.minimumComponent(inputImage: inputImage)?.outputUIImage
    }
    
    @available(iOS 5, *)
    func minimumCompositing(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.minimumCompositing(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func modTransition(inputTargetImage: UIImage, inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputTime: Float = 0, inputAngle: Float = 2, inputRadius: Float = 150, inputCompression: Float = 300) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputTargetImage = inputTargetImage.ciImage else { return nil }
        return CIFilter.modTransition(inputImage: inputImage,
                                      inputTargetImage: inputTargetImage,
                                      inputCenter: inputCenter,
                                      inputTime: inputTime as NSNumber,
                                      inputAngle: inputAngle as NSNumber,
                                      inputRadius: inputRadius as NSNumber,
                                      inputCompression: inputCompression as NSNumber)?.outputUIImage
    }
    
    @available(iOS 11, *)
    func morphologyGradient(inputRadius: Float = 5) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.morphologyGradient(inputImage: inputImage, inputRadius: inputRadius as NSNumber)?.outputUIImage
    }
    
    @available(iOS 11, *)
    func morphologyMaximum(inputRadius: Float = 0) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.morphologyMaximum(inputImage: inputImage, inputRadius: inputRadius as NSNumber)?.outputUIImage
    }
    
    @available(iOS 11, *)
    func morphologyMinimum(inputRadius: Float = 0) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.morphologyMinimum(inputImage: inputImage, inputRadius: inputRadius as NSNumber)?.outputUIImage
    }
    
    @available(iOS 8.3, *)
    func motionBlur(inputRadius: Float = 20, inputAngle: Float = 0) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.motionBlur(inputImage: inputImage, inputRadius: inputRadius as NSNumber, inputAngle: inputAngle as NSNumber)?.outputUIImage
    }
    
    @available(iOS 5, *)
    func multiplyBlendMode(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.multiplyBlendMode(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 5, *)
    func multiplyCompositing(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.multiplyCompositing(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 10, *)
    func ninePartStretched(inputBreakpoint0: CIVector = CIVector(x: 50.0, y: 50.0), inputBreakpoint1: CIVector = CIVector(x: 150.0, y: 150.0), inputGrowAmount: CIVector = CIVector(x: 100.0, y: 100.0)) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.ninePartStretched(inputImage: inputImage, inputBreakpoint0: inputBreakpoint0, inputBreakpoint1: inputBreakpoint1, inputGrowAmount: inputGrowAmount)?.outputUIImage
    }
    
    @available(iOS 10, *)
    func ninePartTiled(inputBreakpoint0: CIVector = CIVector(x: 50.0, y: 50.0),
                       inputBreakpoint1: CIVector = CIVector(x: 150.0, y: 150.0),
                       inputGrowAmount: CIVector = CIVector(x: 100.0, y: 100.0),
                       inputFlipYTiles: Bool = true) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.ninePartTiled(inputImage: inputImage,
                                      inputBreakpoint0: inputBreakpoint0,
                                      inputBreakpoint1: inputBreakpoint1,
                                      inputGrowAmount: inputGrowAmount,
                                      inputFlipYTiles: inputFlipYTiles as NSNumber)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func noiseReduction(inputNoiseLevel: Float = 0.02, inputSharpness: Float = 0.4) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.noiseReduction(inputImage: inputImage,
                                       inputNoiseLevel: inputNoiseLevel as NSNumber,
                                       inputSharpness: inputSharpness as NSNumber)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func opTile(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputScale: Float = 2.8, inputAngle: Float = 0, inputWidth: Float = 65) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.opTile(inputImage: inputImage,
                               inputCenter: inputCenter,
                               inputScale: inputScale as NSNumber,
                               inputAngle: inputAngle as NSNumber,
                               inputWidth: inputWidth as NSNumber)?.outputUIImage
    }
    
    @available(iOS 5, *)
    func overlayBlendMode(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.overlayBlendMode(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func pageCurlTransition(inputTargetImage: UIImage,
                            inputBacksideImage: UIImage,
                            inputShadingImage: UIImage,
                            inputExtent: CIVector = CIVector(x: 0.0, y: 0.0, z: 300.0, w: 300.0),
                            inputTime: Float = 0,
                            inputAngle: Float = 0,
                            inputRadius: Float = 100) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputTargetImage = inputTargetImage.ciImage, let inputBacksideImage = inputBacksideImage.ciImage, let inputShadingImage = inputShadingImage.ciImage else { return nil }
        return CIFilter.pageCurlTransition(inputImage: inputImage,
                                           inputTargetImage: inputTargetImage,
                                           inputBacksideImage: inputBacksideImage,
                                           inputShadingImage: inputShadingImage,
                                           inputExtent: inputExtent,
                                           inputTime: inputTime as NSNumber,
                                           inputAngle: inputAngle as NSNumber,
                                           inputRadius: inputRadius as NSNumber)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func pageCurlWithShadowTransition(inputTargetImage: UIImage,
                                      inputBacksideImage: UIImage,
                                      inputExtent: CIVector = CIVector(x: 0.0, y: 0.0, z: 0.0, w: 0.0),
                                      inputTime: Float = 0,
                                      inputAngle: Float = 0,
                                      inputRadius: Float = 100,
                                      inputShadowSize: Float = 0.5,
                                      inputShadowAmount: Float = 0.7,
                                      inputShadowExtent: CIVector = CIVector(x: 0.0, y: 0.0, z: 0.0, w: 0.0)) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputTargetImage = inputTargetImage.ciImage, let inputBacksideImage = inputBacksideImage.ciImage else { return nil }
        return CIFilter.pageCurlWithShadowTransition(inputImage: inputImage,
                                                     inputTargetImage: inputTargetImage,
                                                     inputBacksideImage: inputBacksideImage,
                                                     inputExtent: inputExtent,
                                                     inputTime: inputTime as NSNumber,
                                                     inputAngle: inputAngle as NSNumber,
                                                     inputRadius: inputRadius as NSNumber,
                                                     inputShadowSize: inputShadowSize as NSNumber,
                                                     inputShadowAmount: inputShadowAmount as NSNumber,
                                                     inputShadowExtent: inputShadowExtent)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func parallelogramTile(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputAngle: Float = 0, inputAcuteAngle: Float = Float.pi / 2, inputWidth: Float = 100) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.parallelogramTile(inputImage: inputImage,
                                          inputCenter: inputCenter,
                                          inputAngle: inputAngle as NSNumber,
                                          inputAcuteAngle: inputAcuteAngle as NSNumber,
                                          inputWidth: inputWidth as NSNumber)?.outputUIImage
    }
    
    @available(iOS 8, *)
    func perspectiveCorrection(inputTopLeft: CIVector = CIVector(x: 118.0, y: 484.0),
                               inputTopRight: CIVector = CIVector(x: 646.0, y: 507.0),
                               inputBottomRight: CIVector = CIVector(x: 548.0, y: 140.0),
                               inputBottomLeft: CIVector = CIVector(x: 155.0, y: 153.0),
                               inputCrop: Bool = true) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.perspectiveCorrection(inputImage: inputImage,
                                              inputTopLeft: inputTopLeft,
                                              inputTopRight: inputTopRight,
                                              inputBottomRight: inputBottomRight,
                                              inputBottomLeft: inputBottomLeft,
                                              inputCrop: inputCrop as NSNumber)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func perspectiveTile(inputTopLeft: CIVector = CIVector(x: 118.0, y: 484.0),
                         inputTopRight: CIVector = CIVector(x: 646.0, y: 507.0),
                         inputBottomRight: CIVector = CIVector(x: 548.0, y: 140.0),
                         inputBottomLeft: CIVector = CIVector(x: 155.0, y: 153.0)) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.perspectiveTile(inputImage: inputImage, inputTopLeft: inputTopLeft, inputTopRight: inputTopRight, inputBottomRight: inputBottomRight, inputBottomLeft: inputBottomLeft)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func perspectiveTransform(inputTopLeft: CIVector = CIVector(x: 118.0, y: 484.0),
                              inputTopRight: CIVector = CIVector(x: 646.0, y: 507.0),
                              inputBottomRight: CIVector = CIVector(x: 548.0, y: 140.0),
                              inputBottomLeft: CIVector = CIVector(x: 155.0, y: 153.0)) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.perspectiveTransform(inputImage: inputImage, inputTopLeft: inputTopLeft, inputTopRight: inputTopRight, inputBottomRight: inputBottomRight, inputBottomLeft: inputBottomLeft)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func perspectiveTransformWithExtent(inputExtent: CIVector = CIVector(x: 0.0, y: 0.0, z: 300.0, w: 300.0),
                                        inputTopLeft: CIVector = CIVector(x: 118.0, y: 484.0),
                                        inputTopRight: CIVector = CIVector(x: 646.0, y: 507.0),
                                        inputBottomRight: CIVector = CIVector(x: 548.0, y: 140.0),
                                        inputBottomLeft: CIVector = CIVector(x: 155.0, y: 153.0)) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.perspectiveTransformWithExtent(inputImage: inputImage,
                                                       inputExtent: inputExtent,
                                                       inputTopLeft: inputTopLeft,
                                                       inputTopRight: inputTopRight,
                                                       inputBottomRight: inputBottomRight,
                                                       inputBottomLeft: inputBottomLeft)?.outputUIImage
    }
    
    @available(iOS 7, *)
    func photoEffectChrome() -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.photoEffectChrome(inputImage: inputImage)?.outputUIImage
    }
    
    @available(iOS 7, *)
    func photoEffectFade() -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.photoEffectFade(inputImage: inputImage)?.outputUIImage
    }
    
    @available(iOS 7, *)
    func photoEffectInstant() -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.photoEffectInstant(inputImage: inputImage)?.outputUIImage
    }
    
    @available(iOS 7, *)
    func photoEffectMono() -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.photoEffectMono(inputImage: inputImage)?.outputUIImage
    }
    
    @available(iOS 7, *)
    func photoEffectNoir() -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.photoEffectNoir(inputImage: inputImage)?.outputUIImage
    }
    
    @available(iOS 7, *)
    func photoEffectProcess() -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.photoEffectProcess(inputImage: inputImage)?.outputUIImage
    }
    
    @available(iOS 7, *)
    func photoEffectTonal() -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.photoEffectTonal(inputImage: inputImage)?.outputUIImage
    }
    
    @available(iOS 7, *)
    func photoEffectTransfer() -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.photoEffectTransfer(inputImage: inputImage)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func pinchDistortion(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputRadius: Float = 300, inputScale: Float = 0.5) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.pinchDistortion(inputImage: inputImage, inputCenter: inputCenter, inputRadius: inputRadius as NSNumber, inputScale: inputScale as NSNumber)?.outputUIImage
    }
    
    @available(iOS 8, *)
    func pinLightBlendMode(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.pinLightBlendMode(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func pixellate(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputScale: Float = 8) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.pixellate(inputImage: inputImage, inputCenter: inputCenter, inputScale: inputScale as NSNumber)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func pointillize(inputRadius: Float = 20, inputCenter: CIVector = CIVector(x: 150.0, y: 150.0)) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.pointillize(inputImage: inputImage, inputRadius: inputRadius as NSNumber, inputCenter: inputCenter)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func rippleTransition(inputTargetImage: UIImage,
                          inputShadingImage: UIImage,
                          inputCenter: CIVector = CIVector(x: 150.0, y: 150.0),
                          inputExtent: CIVector = CIVector(x: 0.0, y: 0.0, z: 300.0, w: 300.0),
                          inputTime: Float = 0,
                          inputWidth: Float = 100,
                          inputScale: Float = 50) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputTargetImage = inputTargetImage.ciImage, let inputShadingImage = inputShadingImage.ciImage else { return nil }
        return CIFilter.rippleTransition(inputImage: inputImage,
                                         inputTargetImage: inputTargetImage,
                                         inputShadingImage: inputShadingImage,
                                         inputCenter: inputCenter,
                                         inputExtent: inputExtent,
                                         inputTime: inputTime as NSNumber,
                                         inputWidth: inputWidth as NSNumber,
                                         inputScale: inputScale as NSNumber)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func rowAverage(inputExtent: CIVector = CIVector(x: 0.0, y: 0.0, z: 640.0, w: 80.0)) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.rowAverage(inputImage: inputImage, inputExtent: inputExtent)?.outputUIImage
    }
    
    @available(iOS 5, *)
    func saturationBlendMode(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.saturationBlendMode(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 5, *)
    func screenBlendMode(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.screenBlendMode(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 5, *)
    func sepiaTone(inputIntensity: Float = 1) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.sepiaTone(inputImage: inputImage, inputIntensity: inputIntensity as NSNumber)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func shadedMaterial(inputShadingImage: UIImage, inputScale: Float = 10) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputShadingImage = inputShadingImage.ciImage else { return nil }
        return CIFilter.shadedMaterial(inputImage: inputImage, inputShadingImage: inputShadingImage, inputScale: inputScale as NSNumber)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func sharpenLuminance(inputSharpness: Float = 0.4, inputRadius: Float = 1.69) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.sharpenLuminance(inputImage: inputImage, inputSharpness: inputSharpness as NSNumber, inputRadius: inputRadius as NSNumber)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func sixfoldReflectedTile(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputAngle: Float = 0, inputWidth: Float = 100) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.sixfoldReflectedTile(inputImage: inputImage,
                                             inputCenter: inputCenter,
                                             inputAngle: inputAngle as NSNumber,
                                             inputWidth: inputWidth as NSNumber)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func sixfoldRotatedTile(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputAngle: Float = 0, inputWidth: Float = 100) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.sixfoldRotatedTile(inputImage: inputImage,
                                           inputCenter: inputCenter,
                                           inputAngle: inputAngle as NSNumber,
                                           inputWidth: inputWidth as NSNumber)?.outputUIImage
    }
    
    @available(iOS 5, *)
    func softLightBlendMode(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.softLightBlendMode(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 5, *)
    func sourceAtopCompositing(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.sourceAtopCompositing(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 5, *)
    func sourceInCompositing(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.sourceInCompositing(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 5, *)
    func sourceOutCompositing(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.sourceOutCompositing(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 5, *)
    func sourceOverCompositing(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.sourceOverCompositing(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func spotColor(inputCenterColor1: UIColor,
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
    func spotLight(inputLightPosition: CIVector = CIVector(x: 400.0, y: 600.0, z: 150.0),
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
    func srgbToneCurveToLinear() -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.srgbToneCurveToLinear(inputImage: inputImage)?.outputUIImage
    }
    
    
    @available(iOS 5, *)
    func straightenFilter(inputAngle: Float = 0) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.straightenFilter(inputImage: inputImage, inputAngle: inputAngle as NSNumber)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func stretchCrop(inputSize: CIVector = CIVector(x: 1280.0, y: 720.0), inputCropAmount: Float = 0.25, inputCenterStretchAmount: Float = 0.25) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.stretchCrop(inputImage: inputImage,
                                    inputSize: inputSize,
                                    inputCropAmount: inputCropAmount as NSNumber,
                                    inputCenterStretchAmount: inputCenterStretchAmount as NSNumber)?.outputUIImage
    }
    
    @available(iOS 8, *)
    func subtractBlendMode(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.subtractBlendMode(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func swipeTransition(inputTargetImage: UIImage,
                         inputExtent: CIVector = CIVector(x: 0.0, y: 0.0, z: 300.0, w: 300.0),
                         inputColor: UIColor,
                         inputTime: Float = 0,
                         inputAngle: Float = 0,
                         inputWidth: Float = 300,
                         inputOpacity: Float = 0) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputTargetImage = inputTargetImage.ciImage else { return nil }
        return CIFilter.swipeTransition(inputImage: inputImage,
                                        inputTargetImage: inputTargetImage,
                                        inputExtent: inputExtent,
                                        inputColor: inputColor.ciColor,
                                        inputTime: inputTime as NSNumber,
                                        inputAngle: inputAngle as NSNumber,
                                        inputWidth: inputWidth as NSNumber,
                                        inputOpacity: inputOpacity as NSNumber)?.outputUIImage
    }
    
    @available(iOS 5, *)
    func temperatureAndTint(inputNeutral: CIVector = CIVector(x: 6500.0, y: 0.0), inputTargetNeutral: CIVector = CIVector(x: 6500.0, y: 0.0)) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.temperatureAndTint(inputImage: inputImage, inputNeutral: inputNeutral, inputTargetNeutral: inputTargetNeutral)?.outputUIImage
    }
    
    @available(iOS 10, *)
    func thermal() -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.thermal(inputImage: inputImage)?.outputUIImage
    }
    
    @available(iOS 5, *)
    func toneCurve(inputPoint0: CIVector = CIVector(x: 0.0, y: 0.0),
                   inputPoint1: CIVector = CIVector(x: 0.25, y: 0.25),
                   inputPoint2: CIVector = CIVector(x: 0.5, y: 0.5),
                   inputPoint3: CIVector = CIVector(x: 0.75, y: 0.75),
                   inputPoint4: CIVector = CIVector(x: 1.0, y: 1.0)) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.toneCurve(inputImage: inputImage,
                                  inputPoint0: inputPoint0,
                                  inputPoint1: inputPoint1,
                                  inputPoint2: inputPoint2,
                                  inputPoint3: inputPoint3,
                                  inputPoint4: inputPoint4)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func torusLensDistortion(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputRadius: Float = 160, inputWidth: Float = 80, inputRefraction: Float = 1.7) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.torusLensDistortion(inputImage: inputImage,
                                            inputCenter: inputCenter,
                                            inputRadius: inputRadius as NSNumber,
                                            inputWidth: inputWidth as NSNumber,
                                            inputRefraction: inputRefraction as NSNumber)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func triangleKaleidoscope(inputPoint: CIVector = CIVector(x: 150.0, y: 150.0), inputSize: Float = 700, inputRotation: Float = 5.924285296593801, inputDecay: Float = 0.85) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.triangleKaleidoscope(inputImage: inputImage,
                                             inputPoint: inputPoint,
                                             inputSize: inputSize as NSNumber,
                                             inputRotation: inputRotation as NSNumber,
                                             inputDecay: inputDecay as NSNumber)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func triangleTile(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputAngle: Float = 0, inputWidth: Float = 100) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.triangleTile(inputImage: inputImage,
                                     inputCenter: inputCenter,
                                     inputAngle: inputAngle as NSNumber,
                                     inputWidth: inputWidth as NSNumber)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func twelvefoldReflectedTile(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputAngle: Float = 0, inputWidth: Float = 100) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.twelvefoldReflectedTile(inputImage: inputImage,
                                                inputCenter: inputCenter,
                                                inputAngle: inputAngle as NSNumber,
                                                inputWidth: inputWidth as NSNumber)?.outputUIImage
    }
    
    @available(iOS 5, *)
    func twirlDistortion(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputRadius: Float = 300, inputAngle: Float = 3.141592653589793) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.twirlDistortion(inputImage: inputImage,
                                        inputCenter: inputCenter,
                                        inputRadius: inputRadius as NSNumber,
                                        inputAngle: inputAngle as NSNumber)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func unsharpMask(inputRadius: Float = 2.5, inputIntensity: Float = 0.5) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.unsharpMask(inputImage: inputImage, inputRadius: inputRadius as NSNumber, inputIntensity: inputIntensity as NSNumber)?.outputUIImage
    }
    
    @available(iOS 5, *)
    func vibrance(inputAmount: Float = 0) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.vibrance(inputImage: inputImage, inputAmount: inputAmount as NSNumber)?.outputUIImage
    }
    
    @available(iOS 5, *)
    func vignette(inputIntensity: Float = 0, inputRadius: Float = 1) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.vignette(inputImage: inputImage, inputIntensity: inputIntensity as NSNumber, inputRadius: inputRadius as NSNumber)?.outputUIImage
    }
    
    @available(iOS 7, *)
    func vignetteEffect(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputRadius: Float = 150, inputIntensity: Float = 1, inputFalloff: Float = 0.5) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.vignetteEffect(inputImage: inputImage,
                                       inputCenter: inputCenter,
                                       inputRadius: inputRadius as NSNumber,
                                       inputIntensity: inputIntensity as NSNumber,
                                       inputFalloff: inputFalloff as NSNumber)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func vortexDistortion(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputRadius: Float = 300, inputAngle: Float = 56.54866776461628) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.vortexDistortion(inputImage: inputImage,
                                         inputCenter: inputCenter,
                                         inputRadius: inputRadius as NSNumber,
                                         inputAngle: inputAngle as NSNumber)?.outputUIImage
    }
    
    @available(iOS 5, *)
    func whitePointAdjust(inputColor: UIColor) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.whitePointAdjust(inputImage: inputImage, inputColor: inputColor.ciColor)?.outputUIImage
    }
    
    @available(iOS 10, *)
    func xray() -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.xray(inputImage: inputImage)?.outputUIImage
    }
    
    @available(iOS 8.3, *)
    func zoomBlur(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputAmount: Float = 20) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.zoomBlur(inputImage: inputImage, inputCenter: inputCenter, inputAmount: inputAmount as NSNumber)?.outputUIImage
    }
}
