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
        static func attributedTextImage(inputText: NSAttributedString, inputScaleFactor: NSNumber = 1) -> UIImage? {
            return CIFilter.attributedTextImageGenerator(inputText: inputText, inputScaleFactor: inputScaleFactor)?.outputUIImage
        }
        
        @available(iOS 8, *)
        static func aztecCode(inputMessage: NSData, inputCorrectionLevel: NSNumber = 23, inputLayers: NSNumber, inputCompactStyle: NSNumber) -> UIImage? {
            return CIFilter.aztecCodeGenerator(inputMessage: inputMessage, inputCorrectionLevel: inputCorrectionLevel, inputLayers: inputLayers, inputCompactStyle: inputCompactStyle)?.outputUIImage
        }
        
        @available(iOS 11, *)
        static func barcode(inputBarcodeDescriptor: CIBarcodeDescriptor) -> UIImage? {
            return CIFilter.barcodeGenerator(inputBarcodeDescriptor: inputBarcodeDescriptor)?.outputUIImage
        }
        
        @available(iOS 5, *)
        static func checkerboard(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputColor0: CIColor, inputColor1: CIColor, inputWidth: NSNumber = 80, inputSharpness: NSNumber = 1) -> UIImage? {
            return CIFilter.checkerboardGenerator(inputCenter: inputCenter, inputColor0: inputColor0, inputColor1: inputColor1, inputWidth: inputWidth, inputSharpness: inputSharpness)?.outputUIImage
        }
        
        @available(iOS 8, *)
        static func code128Barcode(inputMessage: NSData, inputQuietSpace: NSNumber = 7, inputBarcodeHeight: NSNumber = 32) -> UIImage? {
            return CIFilter.code128BarcodeGenerator(inputMessage: inputMessage, inputQuietSpace: inputQuietSpace, inputBarcodeHeight: inputBarcodeHeight)?.outputUIImage
        }
        
        @available(iOS 5, *)
        static func constantColor(inputColor: UIColor) -> UIImage? {
            return CIFilter.constantColorGenerator(inputColor: inputColor.ciColor)?.outputUIImage
        }
        
        @available(iOS 5, *)
        static func gaussianGradient(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputColor0: CIColor, inputColor1: CIColor, inputRadius: NSNumber = 300) -> UIImage? {
            return CIFilter.gaussianGradient(inputCenter: inputCenter, inputColor0: inputColor0, inputColor1: inputColor1, inputRadius: inputRadius)?.outputUIImage
        }
        
        @available(iOS 10, *)
        static func hueSaturationValueGradient(inputValue: NSNumber = 1, inputRadius: NSNumber = 300, inputSoftness: NSNumber = 1, inputDither: NSNumber = 1, inputColorSpace: NSObject) -> UIImage? {
            return CIFilter.hueSaturationValueGradient(inputValue: inputValue, inputRadius: inputRadius, inputSoftness: inputSoftness, inputDither: inputDither, inputColorSpace: inputColorSpace)?.outputUIImage
        }
        
        @available(iOS 9, *)
        static func lenticularHalo(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputColor: CIColor, inputHaloRadius: NSNumber = 70, inputHaloWidth: NSNumber = 87, inputHaloOverlap: NSNumber = 0.77, inputStriationStrength: NSNumber = 0.5, inputStriationContrast: NSNumber = 1, inputTime: NSNumber = 0) -> UIImage? {
            return CIFilter.lenticularHaloGenerator(inputCenter: inputCenter,
                                                    inputColor: inputColor,
                                                    inputHaloRadius: inputHaloRadius,
                                                    inputHaloWidth: inputHaloWidth,
                                                    inputHaloOverlap: inputHaloOverlap,
                                                    inputStriationStrength: inputStriationStrength,
                                                    inputStriationContrast: inputStriationContrast,
                                                    inputTime: inputTime)?.outputUIImage
        }
        
        @available(iOS 5, *)
        static func linearGradient(inputPoint0: CIVector = CIVector(x: 0.0, y: 0.0), inputPoint1: CIVector = CIVector(x: 200.0, y: 200.0), inputColor0: CIColor, inputColor1: CIColor) -> UIImage? {
            return CIFilter.linearGradient(inputPoint0: inputPoint0, inputPoint1: inputPoint1, inputColor0: inputColor0, inputColor1: inputColor1)?.outputUIImage
        }
        
        @available(iOS 9, *)
        static func pdf417Barcode(inputMessage: NSData, inputMinWidth: NSNumber, inputMaxWidth: NSNumber, inputMinHeight: NSNumber, inputMaxHeight: NSNumber, inputDataColumns: NSNumber, inputRows: NSNumber, inputPreferredAspectRatio: NSNumber, inputCompactionMode: NSNumber, inputCompactStyle: NSNumber, inputCorrectionLevel: NSNumber, inputAlwaysSpecifyCompaction: NSNumber) -> UIImage? {
            return CIFilter.pdf417BarcodeGenerator(inputMessage: inputMessage,
                                                   inputMinWidth: inputMinWidth,
                                                   inputMaxWidth: inputMaxWidth,
                                                   inputMinHeight: inputMinHeight,
                                                   inputMaxHeight: inputMaxHeight,
                                                   inputDataColumns: inputDataColumns,
                                                   inputRows: inputRows,
                                                   inputPreferredAspectRatio: inputPreferredAspectRatio,
                                                   inputCompactionMode: inputCompactionMode,
                                                   inputCompactStyle: inputCompactStyle,
                                                   inputCorrectionLevel: inputCorrectionLevel,
                                                   inputAlwaysSpecifyCompaction: inputAlwaysSpecifyCompaction)?.outputUIImage
        }
        
        @available(iOS 7, *)
        static func qrCode(inputMessage: NSData, inputCorrectionLevel: NSString = "M") -> UIImage? {
            return CIFilter.qrCodeGenerator(inputMessage: inputMessage, inputCorrectionLevel: inputCorrectionLevel)?.outputUIImage
        }
        
        @available(iOS 5, *)
        static func radialGradient(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputRadius0: NSNumber = 5, inputRadius1: NSNumber = 100, inputColor0: CIColor, inputColor1: CIColor) -> UIImage? {
            return CIFilter.radialGradient(inputCenter: inputCenter, inputRadius0: inputRadius0, inputRadius1: inputRadius1, inputColor0: inputColor0, inputColor1: inputColor1)?.outputUIImage
        }
        
        @available(iOS 6, *)
        static func random() -> UIImage? {
            return CIFilter.randomGenerator()?.outputUIImage
        }
        
        @available(iOS 6, *)
        static func smoothLinearGradient(inputPoint0: CIVector = CIVector(x: 0.0, y: 0.0), inputPoint1: CIVector = CIVector(x: 200.0, y: 200.0), inputColor0: CIColor, inputColor1: CIColor) -> UIImage? {
            return CIFilter.smoothLinearGradient(inputPoint0: inputPoint0, inputPoint1: inputPoint1, inputColor0: inputColor0, inputColor1: inputColor1)?.outputUIImage
        }
        
        @available(iOS 6, *)
        static func starShine(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputColor: CIColor, inputRadius: NSNumber = 50, inputCrossScale: NSNumber = 15, inputCrossAngle: NSNumber = 0.6, inputCrossOpacity: NSNumber = -2, inputCrossWidth: NSNumber = 2.5, inputEpsilon: NSNumber = -2) -> UIImage? {
            return CIFilter.starShineGenerator(inputCenter: inputCenter,
                                               inputColor: inputColor,
                                               inputRadius: inputRadius,
                                               inputCrossScale: inputCrossScale,
                                               inputCrossAngle: inputCrossAngle,
                                               inputCrossOpacity: inputCrossOpacity,
                                               inputCrossWidth: inputCrossWidth,
                                               inputEpsilon: inputEpsilon)?.outputUIImage
        }
        
        @available(iOS 5, *)
        static func stripes(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputColor0: CIColor, inputColor1: CIColor, inputWidth: NSNumber = 80, inputSharpness: NSNumber = 1) -> UIImage? {
            return CIFilter.stripesGenerator(inputCenter: inputCenter,
                                             inputColor0: inputColor0,
                                             inputColor1: inputColor1,
                                             inputWidth: inputWidth,
                                             inputSharpness: inputSharpness)?.outputUIImage
        }
        
        @available(iOS 9, *)
        static func sunbeams(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputColor: CIColor, inputSunRadius: NSNumber = 40, inputMaxStriationRadius: NSNumber = 2.58, inputStriationStrength: NSNumber = 0.5, inputStriationContrast: NSNumber = 1.375, inputTime: NSNumber = 0) -> UIImage? {
            return CIFilter.sunbeamsGenerator(inputCenter: inputCenter,
                                              inputColor: inputColor,
                                              inputSunRadius: inputSunRadius,
                                              inputMaxStriationRadius: inputMaxStriationRadius,
                                              inputStriationStrength: inputStriationStrength,
                                              inputStriationContrast: inputStriationContrast,
                                              inputTime: inputTime)?.outputUIImage
        }
        
        @available(iOS 11, *)
        static func textImage(inputText: NSString, inputFontName: NSString = "HelveticaNeue", inputFontSize: NSNumber = 12, inputScaleFactor: NSNumber = 1) -> UIImage? {
            return CIFilter.textImageGenerator(inputText: inputText,
                                               inputFontName: inputFontName,
                                               inputFontSize: inputFontSize,
                                               inputScaleFactor: inputScaleFactor)?.outputUIImage
        }
    }
}

public struct ImageFilters {
    fileprivate let image: UIImage
    
    @available(iOS 8, *)
    func accordionFoldTransition(inputTargetImage: UIImage, inputBottomHeight: NSNumber = 0, inputNumberOfFolds: NSNumber = 3, inputFoldShadowAmount: NSNumber = 0.1, inputTime: NSNumber = 0) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputTargetImage = inputTargetImage.ciImage else { return nil }
        return CIFilter.accordionFoldTransition(inputImage: inputImage,
                                                inputTargetImage: inputTargetImage,
                                                inputBottomHeight: inputBottomHeight,
                                                inputNumberOfFolds: inputNumberOfFolds,
                                                inputFoldShadowAmount: inputFoldShadowAmount,
                                                inputTime: inputTime)?.outputUIImage
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
    func areaHistogram(inputExtent: CIVector = CIVector(x: 0.0, y: 0.0, z: 640.0, w: 80.0), inputScale: NSNumber = 1, inputCount: NSNumber = 64) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.areaHistogram(inputImage: inputImage, inputExtent: inputExtent, inputScale: inputScale, inputCount: inputCount)?.outputUIImage
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
    func barsSwipeTransition(inputTargetImage: UIImage, inputAngle: NSNumber = 3.141592653589793, inputWidth: NSNumber = 30, inputBarOffset: NSNumber = 10, inputTime: NSNumber = 0) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputTargetImage = inputTargetImage.ciImage else { return nil }
        return CIFilter.barsSwipeTransition(inputImage: inputImage,
                                            inputTargetImage: inputTargetImage,
                                            inputAngle: inputAngle,
                                            inputWidth: inputWidth,
                                            inputBarOffset: inputBarOffset,
                                            inputTime: inputTime)?.outputUIImage
    }
    
    @available(iOS 11, *)
    func bicubicScaleTransform(inputScale: NSNumber = 1, inputAspectRatio: NSNumber = 1, inputB: NSNumber = 0, inputC: NSNumber = 0.75) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.bicubicScaleTransform(inputImage: inputImage, inputScale: inputScale, inputAspectRatio: inputAspectRatio, inputB: inputB, inputC: inputC)?.outputUIImage
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
    func bloom(inputRadius: NSNumber = 10, inputIntensity: NSNumber = 0.5) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.bloom(inputImage: inputImage, inputRadius: inputRadius, inputIntensity: inputIntensity)?.outputUIImage
    }
    
    @available(iOS 11, *)
    func bokehBlur(inputRadius: NSNumber = 20, inputRingAmount: NSNumber = 0, inputRingSize: NSNumber = 0.1, inputSoftness: NSNumber = 1) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.bokehBlur(inputImage: inputImage, inputRadius: inputRadius, inputRingAmount: inputRingAmount, inputRingSize: inputRingSize, inputSoftness: inputSoftness)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func boxBlur(inputRadius: NSNumber = 10) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.boxBlur(inputImage: inputImage, inputRadius: inputRadius)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func bumpDistortion(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputRadius: NSNumber = 300, inputScale: NSNumber = 0.5) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.bumpDistortion(inputImage: inputImage, inputCenter: inputCenter, inputRadius: inputRadius, inputScale: inputScale)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func bumpDistortionLinear(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputRadius: NSNumber = 300, inputAngle: NSNumber = 0, inputScale: NSNumber = 0.5) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.bumpDistortionLinear(inputImage: inputImage, inputCenter: inputCenter, inputRadius: inputRadius, inputAngle: inputAngle, inputScale: inputScale)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func circleSplashDistortion(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputRadius: NSNumber = 150) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.circleSplashDistortion(inputImage: inputImage, inputCenter: inputCenter, inputRadius: inputRadius)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func circularScreen(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputWidth: NSNumber = 6, inputSharpness: NSNumber = 0.7) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.circularScreen(inputImage: inputImage, inputCenter: inputCenter, inputWidth: inputWidth, inputSharpness: inputSharpness)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func circularWrap(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputRadius: NSNumber = 150, inputAngle: NSNumber = 0) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.circularWrap(inputImage: inputImage, inputCenter: inputCenter, inputRadius: inputRadius, inputAngle: inputAngle)?.outputUIImage
    }
    
    @available(iOS 10, *)
    func clamp(inputExtent: CIVector = CIVector(x: 0.0, y: 0.0, z: 640.0, w: 80.0)) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.clamp(inputImage: inputImage, inputExtent: inputExtent)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func cmykHalftone(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputWidth: NSNumber = 6, inputAngle: NSNumber = 0, inputSharpness: NSNumber = 0.7, inputGCR: NSNumber = 1, inputUCR: NSNumber = 0.5) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.cmykHalftone(inputImage: inputImage, inputCenter: inputCenter, inputWidth: inputWidth, inputAngle: inputAngle, inputSharpness: inputSharpness, inputGCR: inputGCR, inputUCR: inputUCR)?.outputUIImage
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
    func colorControls(inputSaturation: NSNumber = 1, inputBrightness: NSNumber = 0, inputContrast: NSNumber = 1) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.colorControls(inputImage: inputImage, inputSaturation: inputSaturation, inputBrightness: inputBrightness, inputContrast: inputContrast)?.outputUIImage
    }
    
    @available(iOS 7, *)
    func colorCrossPolynomial(inputRedCoefficients: CIVector = CIVector(), inputGreenCoefficients: CIVector = CIVector(), inputBlueCoefficients: CIVector = CIVector()) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.colorCrossPolynomial(inputImage: inputImage, inputRedCoefficients: inputRedCoefficients, inputGreenCoefficients: inputGreenCoefficients, inputBlueCoefficients: inputBlueCoefficients)?.outputUIImage
    }
    
    @available(iOS 5, *)
    func colorCube(inputCubeDimension: NSNumber = 2, inputCubeData: NSData) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.colorCube(inputImage: inputImage, inputCubeDimension: inputCubeDimension, inputCubeData: inputCubeData)?.outputUIImage
    }
    
    @available(iOS 11, *)
    func colorCubesMixedWithMask(inputMaskImage: UIImage, inputCubeDimension: NSNumber = 2, inputCube0Data: NSData, inputCube1Data: NSData, inputColorSpace: NSObject) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputMaskImage = inputMaskImage.ciImage else { return nil }
        return CIFilter.colorCubesMixedWithMask(inputImage: inputImage,
                                                inputMaskImage: inputMaskImage,
                                                inputCubeDimension: inputCubeDimension,
                                                inputCube0Data: inputCube0Data,
                                                inputCube1Data: inputCube1Data,
                                                inputColorSpace: inputColorSpace)?.outputUIImage
    }
    
    @available(iOS 7, *)
    func colorCubeWithColorSpace(inputCubeDimension: NSNumber = 2, inputCubeData: NSData, inputColorSpace: NSObject) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.colorCubeWithColorSpace(inputImage: inputImage, inputCubeDimension: inputCubeDimension, inputCubeData: inputCubeData, inputColorSpace: inputColorSpace)?.outputUIImage
    }
    
    @available(iOS 11, *)
    func colorCurves(inputCurvesData: NSData, inputCurvesDomain: CIVector = CIVector(x: 0.0, y: 1.0), inputColorSpace: NSObject) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.colorCurves(inputImage: inputImage, inputCurvesData: inputCurvesData, inputCurvesDomain: inputCurvesDomain, inputColorSpace: inputColorSpace)?.outputUIImage
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
    func colorMonochrome(inputColor: UIColor, inputIntensity: NSNumber = 1) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.colorMonochrome(inputImage: inputImage, inputColor: inputColor.ciColor, inputIntensity: inputIntensity)?.outputUIImage
    }
    
    @available(iOS 7, *)
    func colorPolynomial(inputRedCoefficients: CIVector = CIVector(x: 0.0, y: 1.0, z: 0.0, w: 0.0), inputGreenCoefficients: CIVector = CIVector(x: 0.0, y: 1.0, z: 0.0, w: 0.0), inputBlueCoefficients: CIVector = CIVector(x: 0.0, y: 1.0, z: 0.0, w: 0.0), inputAlphaCoefficients: CIVector = CIVector(x: 0.0, y: 1.0, z: 0.0, w: 0.0)) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.colorPolynomial(inputImage: inputImage,
                                        inputRedCoefficients: inputRedCoefficients,
                                        inputGreenCoefficients: inputGreenCoefficients,
                                        inputBlueCoefficients: inputBlueCoefficients,
                                        inputAlphaCoefficients: inputAlphaCoefficients)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func colorPosterize(inputLevels: NSNumber = 6) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.colorPosterize(inputImage: inputImage, inputLevels: inputLevels)?.outputUIImage
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
    func convolution3X3(inputWeights: CIVector = CIVector(), inputBias: NSNumber = 0) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.convolution3X3(inputImage: inputImage, inputWeights: inputWeights, inputBias: inputBias)?.outputUIImage
    }
    
    @available(iOS 7, *)
    func convolution5X5(inputWeights: CIVector = CIVector(), inputBias: NSNumber = 0) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.convolution5X5(inputImage: inputImage, inputWeights: inputWeights, inputBias: inputBias)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func convolution7X7(inputWeights: CIVector = CIVector(), inputBias: NSNumber = 0) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.convolution7X7(inputImage: inputImage, inputWeights: inputWeights, inputBias: inputBias)?.outputUIImage
    }
    
    @available(iOS 7, *)
    func convolution9Horizontal(inputWeights: CIVector = CIVector(), inputBias: NSNumber = 0) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.convolution9Horizontal(inputImage: inputImage, inputWeights: inputWeights, inputBias: inputBias)?.outputUIImage
    }
    
    @available(iOS 7, *)
    func convolution9Vertical(inputWeights: CIVector = CIVector(), inputBias: NSNumber = 0) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.convolution9Vertical(inputImage: inputImage, inputWeights: inputWeights, inputBias: inputBias)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func copyMachineTransition(inputTargetImage: UIImage, inputExtent: CIVector = CIVector(x: 0.0, y: 0.0, z: 300.0, w: 300.0), inputColor: UIColor, inputTime: NSNumber = 0, inputAngle: NSNumber = 0, inputWidth: NSNumber = 200, inputOpacity: NSNumber = 1.3) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputTargetImage = inputTargetImage.ciImage else { return nil }
        return CIFilter.copyMachineTransition(inputImage: inputImage,
                                              inputTargetImage: inputTargetImage,
                                              inputExtent: inputExtent,
                                              inputColor: inputColor.ciColor,
                                              inputTime: inputTime,
                                              inputAngle: inputAngle,
                                              inputWidth: inputWidth,
                                              inputOpacity: inputOpacity)?.outputUIImage
    }
    
    @available(iOS 5, *)
    func crop(inputRectangle: CIVector? = nil) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.crop(inputImage: inputImage, inputRectangle: inputRectangle)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func crystallize(inputRadius: NSNumber = 20, inputCenter: CIVector = CIVector(x: 150.0, y: 150.0)) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.crystallize(inputImage: inputImage, inputRadius: inputRadius, inputCenter: inputCenter)?.outputUIImage
    }
    
    @available(iOS 5, *)
    func darkenBlendMode(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.darkenBlendMode(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 11, *)
    func depthBlurEffect(inputDisparityImage: UIImage, inputAperture: NSNumber = 0, inputLeftEyePositions: CIVector, inputRightEyePositions: CIVector, inputChinPositions: CIVector, inputNosePositions: CIVector, inputFocusRect: CIVector, inputLumaNoiseScale: NSNumber = 0, inputScaleFactor: NSNumber = 1, inputCalibrationData: AVCameraCalibrationData, inputAuxDataMetadata: NSDictionary) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputDisparityImage = inputDisparityImage.ciImage else { return nil }
        return CIFilter.depthBlurEffect(inputImage: inputImage,
                                        inputDisparityImage: inputDisparityImage,
                                        inputAperture: inputAperture,
                                        inputLeftEyePositions: inputLeftEyePositions,
                                        inputRightEyePositions: inputRightEyePositions,
                                        inputChinPositions: inputChinPositions,
                                        inputNosePositions: inputNosePositions,
                                        inputFocusRect: inputFocusRect,
                                        inputLumaNoiseScale: inputLumaNoiseScale,
                                        inputScaleFactor: inputScaleFactor,
                                        inputCalibrationData: inputCalibrationData,
                                        inputAuxDataMetadata: inputAuxDataMetadata)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func depthOfField(inputPoint0: CIVector = CIVector(x: 0.0, y: 300.0), inputPoint1: CIVector = CIVector(x: 300.0, y: 300.0), inputSaturation: NSNumber = 1.5, inputUnsharpMaskRadius: NSNumber = 2.5, inputUnsharpMaskIntensity: NSNumber = 0.5, inputRadius: NSNumber = 6) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.depthOfField(inputImage: inputImage,
                                     inputPoint0: inputPoint0,
                                     inputPoint1: inputPoint1,
                                     inputSaturation: inputSaturation,
                                     inputUnsharpMaskRadius: inputUnsharpMaskRadius,
                                     inputUnsharpMaskIntensity: inputUnsharpMaskIntensity,
                                     inputRadius: inputRadius)?.outputUIImage
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
    func discBlur(inputRadius: NSNumber = 8) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.discBlur(inputImage: inputImage, inputRadius: inputRadius)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func disintegrateWithMaskTransition(inputTargetImage: UIImage, inputMaskImage: UIImage, inputTime: NSNumber = 0, inputShadowRadius: NSNumber = 8, inputShadowDensity: NSNumber = 0.65, inputShadowOffset: CIVector = CIVector(x: 0.0, y: -10.0)) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputTargetImage = inputTargetImage.ciImage, let inputMaskImage = inputMaskImage.ciImage else { return nil }
        return CIFilter.disintegrateWithMaskTransition(inputImage: inputImage,
                                                       inputTargetImage: inputTargetImage,
                                                       inputMaskImage: inputMaskImage,
                                                       inputTime: inputTime,
                                                       inputShadowRadius: inputShadowRadius,
                                                       inputShadowDensity: inputShadowDensity,
                                                       inputShadowOffset: inputShadowOffset)?.outputUIImage
    }
    
    @available(iOS 11, *)
    func disparityToDepth() -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.disparityToDepth(inputImage: inputImage)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func displacementDistortion(inputDisplacementImage: UIImage, inputScale: NSNumber = 50) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputDisplacementImage = inputDisplacementImage.ciImage else { return nil }
        return CIFilter.displacementDistortion(inputImage: inputImage, inputDisplacementImage: inputDisplacementImage, inputScale: inputScale)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func dissolveTransition(inputTargetImage: UIImage, inputTime: NSNumber = 0) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputTargetImage = inputTargetImage.ciImage else { return nil }
        return CIFilter.dissolveTransition(inputImage: inputImage, inputTargetImage: inputTargetImage, inputTime: inputTime)?.outputUIImage
    }
    
    @available(iOS 8, *)
    func divideBlendMode(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.divideBlendMode(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func dotScreen(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputAngle: NSNumber = 0, inputWidth: NSNumber = 6, inputSharpness: NSNumber = 0.7) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.dotScreen(inputImage: inputImage, inputCenter: inputCenter, inputAngle: inputAngle, inputWidth: inputWidth, inputSharpness: inputSharpness)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func droste(inputInsetPoint0: CIVector = CIVector(x: 200.0, y: 200.0), inputInsetPoint1: CIVector = CIVector(x: 400.0, y: 400.0), inputStrands: NSNumber = 1, inputPeriodicity: NSNumber = 1, inputRotation: NSNumber = 0, inputZoom: NSNumber = 1) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.droste(inputImage: inputImage,
                               inputInsetPoint0: inputInsetPoint0,
                               inputInsetPoint1: inputInsetPoint1,
                               inputStrands: inputStrands,
                               inputPeriodicity: inputPeriodicity,
                               inputRotation: inputRotation,
                               inputZoom: inputZoom)?.outputUIImage
    }
    
    @available(iOS 10, *)
    func edgePreserveUpsampleFilter(inputSmallImage: UIImage, inputSpatialSigma: NSNumber = 3, inputLumaSigma: NSNumber = 0.15) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputSmallImage = inputSmallImage.ciImage else { return nil }
        return CIFilter.edgePreserveUpsampleFilter(inputImage: inputImage, inputSmallImage: inputSmallImage, inputSpatialSigma: inputSpatialSigma, inputLumaSigma: inputLumaSigma)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func edges(inputIntensity: NSNumber = 1) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.edges(inputImage: inputImage, inputIntensity: inputIntensity)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func edgeWork(inputRadius: NSNumber = 3) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.edgeWork(inputImage: inputImage, inputRadius: inputRadius)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func eightfoldReflectedTile(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputAngle: NSNumber = 0, inputWidth: NSNumber = 100) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.eightfoldReflectedTile(inputImage: inputImage, inputCenter: inputCenter, inputAngle: inputAngle, inputWidth: inputWidth)?.outputUIImage
    }
    
    @available(iOS 5, *)
    func exclusionBlendMode(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.exclusionBlendMode(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 5, *)
    func exposureAdjust(inputEV: NSNumber = 0) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.exposureAdjust(inputImage: inputImage, inputEV: inputEV)?.outputUIImage
    }
    
    @available(iOS 5, *)
    func falseColor(inputColor0: CIColor, inputColor1: CIColor) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.falseColor(inputImage: inputImage, inputColor0: inputColor0, inputColor1: inputColor1)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func flashTransition(inputTargetImage: UIImage, inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputExtent: CIVector = CIVector(x: 0.0, y: 0.0, z: 300.0, w: 300.0), inputColor: CIColor, inputTime: NSNumber = 0, inputMaxStriationRadius: NSNumber = 2.58, inputStriationStrength: NSNumber = 0.5, inputStriationContrast: NSNumber = 1.375, inputFadeThreshold: NSNumber = 0.85) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputTargetImage = inputTargetImage.ciImage else { return nil }
        return CIFilter.flashTransition(inputImage: inputImage,
                                        inputTargetImage: inputTargetImage,
                                        inputCenter: inputCenter,
                                        inputExtent: inputExtent,
                                        inputColor: inputColor,
                                        inputTime: inputTime,
                                        inputMaxStriationRadius: inputMaxStriationRadius,
                                        inputStriationStrength: inputStriationStrength,
                                        inputStriationContrast: inputStriationContrast,
                                        inputFadeThreshold: inputFadeThreshold)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func fourfoldReflectedTile(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputAngle: NSNumber = 0, inputWidth: NSNumber = 100, inputAcuteAngle: NSNumber = 1.570796326794897) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.fourfoldReflectedTile(inputImage: inputImage, inputCenter: inputCenter, inputAngle: inputAngle, inputWidth: inputWidth, inputAcuteAngle: inputAcuteAngle)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func fourfoldRotatedTile(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputAngle: NSNumber = 0, inputWidth: NSNumber = 100) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.fourfoldRotatedTile(inputImage: inputImage, inputCenter: inputCenter, inputAngle: inputAngle, inputWidth: inputWidth)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func fourfoldTranslatedTile(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputAngle: NSNumber = 0, inputWidth: NSNumber = 100, inputAcuteAngle: NSNumber = 1.570796326794897) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.fourfoldTranslatedTile(inputImage: inputImage, inputCenter: inputCenter, inputAngle: inputAngle, inputWidth: inputWidth, inputAcuteAngle: inputAcuteAngle)?.outputUIImage
    }
    
    @available(iOS 5, *)
    func gammaAdjust(inputPower: NSNumber = 1) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.gammaAdjust(inputImage: inputImage, inputPower: inputPower)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func gaussianBlur(inputRadius: NSNumber = 10) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.gaussianBlur(inputImage: inputImage, inputRadius: inputRadius)?.outputUIImage
    }
    
    @available(iOS 8, *)
    func glassDistortion(inputTexture: UIImage, inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputScale: NSNumber = 200) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputTexture = inputTexture.ciImage else { return nil }
        return CIFilter.glassDistortion(inputImage: inputImage, inputTexture: inputTexture, inputCenter: inputCenter, inputScale: inputScale)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func glassLozenge(inputPoint0: CIVector = CIVector(x: 150.0, y: 150.0), inputPoint1: CIVector = CIVector(x: 350.0, y: 150.0), inputRadius: NSNumber = 100, inputRefraction: NSNumber = 1.7) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.glassLozenge(inputImage: inputImage, inputPoint0: inputPoint0, inputPoint1: inputPoint1, inputRadius: inputRadius, inputRefraction: inputRefraction)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func glideReflectedTile(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputAngle: NSNumber = 0, inputWidth: NSNumber = 100) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.glideReflectedTile(inputImage: inputImage, inputCenter: inputCenter, inputAngle: inputAngle, inputWidth: inputWidth)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func gloom(inputRadius: NSNumber = 10, inputIntensity: NSNumber = 0.5) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.gloom(inputImage: inputImage, inputRadius: inputRadius, inputIntensity: inputIntensity)?.outputUIImage
    }
    
    @available(iOS 5, *)
    func hardLightBlendMode(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.hardLightBlendMode(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func hatchedScreen(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputAngle: NSNumber = 0, inputWidth: NSNumber = 6, inputSharpness: NSNumber = 0.7) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.hatchedScreen(inputImage: inputImage, inputCenter: inputCenter, inputAngle: inputAngle, inputWidth: inputWidth, inputSharpness: inputSharpness)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func heightFieldFromMask(inputRadius: NSNumber = 10) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.heightFieldFromMask(inputImage: inputImage, inputRadius: inputRadius)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func hexagonalPixellate(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputScale: NSNumber = 8) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.hexagonalPixellate(inputImage: inputImage, inputCenter: inputCenter, inputScale: inputScale)?.outputUIImage
    }
    
    @available(iOS 5, *)
    func highlightShadowAdjust(inputRadius: NSNumber = 0, inputShadowAmount: NSNumber = 0, inputHighlightAmount: NSNumber = 1) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.highlightShadowAdjust(inputImage: inputImage, inputRadius: inputRadius, inputShadowAmount: inputShadowAmount, inputHighlightAmount: inputHighlightAmount)?.outputUIImage
    }
    
    @available(iOS 8, *)
    func histogramDisplayFilter(inputHeight: NSNumber = 100, inputHighLimit: NSNumber = 1, inputLowLimit: NSNumber = 0) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.histogramDisplayFilter(inputImage: inputImage, inputHeight: inputHeight, inputHighLimit: inputHighLimit, inputLowLimit: inputLowLimit)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func holeDistortion(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputRadius: NSNumber = 150) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.holeDistortion(inputImage: inputImage, inputCenter: inputCenter, inputRadius: inputRadius)?.outputUIImage
    }
    
    @available(iOS 5, *)
    func hueAdjust(inputAngle: NSNumber = 0) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.hueAdjust(inputImage: inputImage, inputAngle: inputAngle)?.outputUIImage
    }
    
    @available(iOS 5, *)
    func hueBlendMode(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.hueBlendMode(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func kaleidoscope(inputCount: NSNumber = 6, inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputAngle: NSNumber = 0) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.kaleidoscope(inputImage: inputImage, inputCount: inputCount, inputCenter: inputCenter, inputAngle: inputAngle)?.outputUIImage
    }
    
    @available(iOS 11, *)
    func labDeltaE(inputImage2: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputImage2 = inputImage2.ciImage else { return nil }
        return CIFilter.labDeltaE(inputImage: inputImage, inputImage2: inputImage2)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func lanczosScaleTransform(inputScale: NSNumber = 1, inputAspectRatio: NSNumber = 1) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.lanczosScaleTransform(inputImage: inputImage, inputScale: inputScale, inputAspectRatio: inputAspectRatio)?.outputUIImage
    }
    
    @available(iOS 5, *)
    func lightenBlendMode(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.lightenBlendMode(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func lightTunnel(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputRotation: NSNumber = 0, inputRadius: NSNumber = 100) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.lightTunnel(inputImage: inputImage, inputCenter: inputCenter, inputRotation: inputRotation, inputRadius: inputRadius)?.outputUIImage
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
    func lineOverlay(inputNRNoiseLevel: NSNumber = 0.07000000000000001, inputNRSharpness: NSNumber = 0.71, inputEdgeIntensity: NSNumber = 1, inputThreshold: NSNumber = 0.1, inputContrast: NSNumber = 50) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.lineOverlay(inputImage: inputImage, inputNRNoiseLevel: inputNRNoiseLevel, inputNRSharpness: inputNRSharpness, inputEdgeIntensity: inputEdgeIntensity, inputThreshold: inputThreshold, inputContrast: inputContrast)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func lineScreen(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputAngle: NSNumber = 0, inputWidth: NSNumber = 6, inputSharpness: NSNumber = 0.7) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.lineScreen(inputImage: inputImage, inputCenter: inputCenter, inputAngle: inputAngle, inputWidth: inputWidth, inputSharpness: inputSharpness)?.outputUIImage
    }
    
    @available(iOS 5, *)
    func luminosityBlendMode(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.luminosityBlendMode(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 8, *)
    func maskedVariableBlur(inputMask: UIImage, inputRadius: NSNumber = 5) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputMask = inputMask.ciImage else { return nil }
        return CIFilter.maskedVariableBlur(inputImage: inputImage, inputMask: inputMask, inputRadius: inputRadius)?.outputUIImage
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
    func modTransition(inputTargetImage: UIImage, inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputTime: NSNumber = 0, inputAngle: NSNumber = 2, inputRadius: NSNumber = 150, inputCompression: NSNumber = 300) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputTargetImage = inputTargetImage.ciImage else { return nil }
        return CIFilter.modTransition(inputImage: inputImage, inputTargetImage: inputTargetImage, inputCenter: inputCenter, inputTime: inputTime, inputAngle: inputAngle, inputRadius: inputRadius, inputCompression: inputCompression)?.outputUIImage
    }
    
    @available(iOS 11, *)
    func morphologyGradient(inputRadius: NSNumber = 5) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.morphologyGradient(inputImage: inputImage, inputRadius: inputRadius)?.outputUIImage
    }
    
    @available(iOS 11, *)
    func morphologyMaximum(inputRadius: NSNumber = 0) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.morphologyMaximum(inputImage: inputImage, inputRadius: inputRadius)?.outputUIImage
    }
    
    @available(iOS 11, *)
    func morphologyMinimum(inputRadius: NSNumber = 0) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.morphologyMinimum(inputImage: inputImage, inputRadius: inputRadius)?.outputUIImage
    }
    
    @available(iOS 8.3, *)
    func motionBlur(inputRadius: NSNumber = 20, inputAngle: NSNumber = 0) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.motionBlur(inputImage: inputImage, inputRadius: inputRadius, inputAngle: inputAngle)?.outputUIImage
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
    func ninePartTiled(inputBreakpoint0: CIVector = CIVector(x: 50.0, y: 50.0), inputBreakpoint1: CIVector = CIVector(x: 150.0, y: 150.0), inputGrowAmount: CIVector = CIVector(x: 100.0, y: 100.0), inputFlipYTiles: NSNumber = 1) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.ninePartTiled(inputImage: inputImage, inputBreakpoint0: inputBreakpoint0, inputBreakpoint1: inputBreakpoint1, inputGrowAmount: inputGrowAmount, inputFlipYTiles: inputFlipYTiles)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func noiseReduction(inputNoiseLevel: NSNumber = 0.02, inputSharpness: NSNumber = 0.4) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.noiseReduction(inputImage: inputImage, inputNoiseLevel: inputNoiseLevel, inputSharpness: inputSharpness)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func opTile(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputScale: NSNumber = 2.8, inputAngle: NSNumber = 0, inputWidth: NSNumber = 65) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.opTile(inputImage: inputImage, inputCenter: inputCenter, inputScale: inputScale, inputAngle: inputAngle, inputWidth: inputWidth)?.outputUIImage
    }
    
    @available(iOS 5, *)
    func overlayBlendMode(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.overlayBlendMode(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func pageCurlTransition(inputTargetImage: UIImage, inputBacksideImage: UIImage, inputShadingImage: UIImage, inputExtent: CIVector = CIVector(x: 0.0, y: 0.0, z: 300.0, w: 300.0), inputTime: NSNumber = 0, inputAngle: NSNumber = 0, inputRadius: NSNumber = 100) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputTargetImage = inputTargetImage.ciImage, let inputBacksideImage = inputBacksideImage.ciImage, let inputShadingImage = inputShadingImage.ciImage else { return nil }
        return CIFilter.pageCurlTransition(inputImage: inputImage,
                                           inputTargetImage: inputTargetImage,
                                           inputBacksideImage: inputBacksideImage,
                                           inputShadingImage: inputShadingImage,
                                           inputExtent: inputExtent,
                                           inputTime: inputTime,
                                           inputAngle: inputAngle,
                                           inputRadius: inputRadius)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func pageCurlWithShadowTransition(inputTargetImage: UIImage, inputBacksideImage: UIImage, inputExtent: CIVector = CIVector(x: 0.0, y: 0.0, z: 0.0, w: 0.0), inputTime: NSNumber = 0, inputAngle: NSNumber = 0, inputRadius: NSNumber = 100, inputShadowSize: NSNumber = 0.5, inputShadowAmount: NSNumber = 0.7, inputShadowExtent: CIVector = CIVector(x: 0.0, y: 0.0, z: 0.0, w: 0.0)) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputTargetImage = inputTargetImage.ciImage, let inputBacksideImage = inputBacksideImage.ciImage else { return nil }
        return CIFilter.pageCurlWithShadowTransition(inputImage: inputImage,
                                                     inputTargetImage: inputTargetImage,
                                                     inputBacksideImage: inputBacksideImage,
                                                     inputExtent: inputExtent,
                                                     inputTime: inputTime,
                                                     inputAngle: inputAngle,
                                                     inputRadius: inputRadius,
                                                     inputShadowSize: inputShadowSize,
                                                     inputShadowAmount: inputShadowAmount,
                                                     inputShadowExtent: inputShadowExtent)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func parallelogramTile(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputAngle: NSNumber = 0, inputAcuteAngle: NSNumber = 1.570796326794897, inputWidth: NSNumber = 100) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.parallelogramTile(inputImage: inputImage, inputCenter: inputCenter, inputAngle: inputAngle, inputAcuteAngle: inputAcuteAngle, inputWidth: inputWidth)?.outputUIImage
    }
    
    @available(iOS 8, *)
    func perspectiveCorrection(inputTopLeft: CIVector = CIVector(x: 118.0, y: 484.0), inputTopRight: CIVector = CIVector(x: 646.0, y: 507.0), inputBottomRight: CIVector = CIVector(x: 548.0, y: 140.0), inputBottomLeft: CIVector = CIVector(x: 155.0, y: 153.0), inputCrop: NSNumber = 1) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.perspectiveCorrection(inputImage: inputImage, inputTopLeft: inputTopLeft, inputTopRight: inputTopRight, inputBottomRight: inputBottomRight, inputBottomLeft: inputBottomLeft, inputCrop: inputCrop)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func perspectiveTile(inputTopLeft: CIVector = CIVector(x: 118.0, y: 484.0), inputTopRight: CIVector = CIVector(x: 646.0, y: 507.0), inputBottomRight: CIVector = CIVector(x: 548.0, y: 140.0), inputBottomLeft: CIVector = CIVector(x: 155.0, y: 153.0)) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.perspectiveTile(inputImage: inputImage, inputTopLeft: inputTopLeft, inputTopRight: inputTopRight, inputBottomRight: inputBottomRight, inputBottomLeft: inputBottomLeft)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func perspectiveTransform(inputTopLeft: CIVector = CIVector(x: 118.0, y: 484.0), inputTopRight: CIVector = CIVector(x: 646.0, y: 507.0), inputBottomRight: CIVector = CIVector(x: 548.0, y: 140.0), inputBottomLeft: CIVector = CIVector(x: 155.0, y: 153.0)) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.perspectiveTransform(inputImage: inputImage, inputTopLeft: inputTopLeft, inputTopRight: inputTopRight, inputBottomRight: inputBottomRight, inputBottomLeft: inputBottomLeft)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func perspectiveTransformWithExtent(inputExtent: CIVector = CIVector(x: 0.0, y: 0.0, z: 300.0, w: 300.0), inputTopLeft: CIVector = CIVector(x: 118.0, y: 484.0), inputTopRight: CIVector = CIVector(x: 646.0, y: 507.0), inputBottomRight: CIVector = CIVector(x: 548.0, y: 140.0), inputBottomLeft: CIVector = CIVector(x: 155.0, y: 153.0)) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.perspectiveTransformWithExtent(inputImage: inputImage, inputExtent: inputExtent, inputTopLeft: inputTopLeft, inputTopRight: inputTopRight, inputBottomRight: inputBottomRight, inputBottomLeft: inputBottomLeft)?.outputUIImage
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
    func pinchDistortion(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputRadius: NSNumber = 300, inputScale: NSNumber = 0.5) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.pinchDistortion(inputImage: inputImage, inputCenter: inputCenter, inputRadius: inputRadius, inputScale: inputScale)?.outputUIImage
    }
    
    @available(iOS 8, *)
    func pinLightBlendMode(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.pinLightBlendMode(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func pixellate(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputScale: NSNumber = 8) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.pixellate(inputImage: inputImage, inputCenter: inputCenter, inputScale: inputScale)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func pointillize(inputRadius: NSNumber = 20, inputCenter: CIVector = CIVector(x: 150.0, y: 150.0)) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.pointillize(inputImage: inputImage, inputRadius: inputRadius, inputCenter: inputCenter)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func rippleTransition(inputTargetImage: UIImage, inputShadingImage: UIImage, inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputExtent: CIVector = CIVector(x: 0.0, y: 0.0, z: 300.0, w: 300.0), inputTime: NSNumber = 0, inputWidth: NSNumber = 100, inputScale: NSNumber = 50) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputTargetImage = inputTargetImage.ciImage, let inputShadingImage = inputShadingImage.ciImage else { return nil }
        return CIFilter.rippleTransition(inputImage: inputImage,
                                         inputTargetImage: inputTargetImage,
                                         inputShadingImage: inputShadingImage,
                                         inputCenter: inputCenter,
                                         inputExtent: inputExtent,
                                         inputTime: inputTime,
                                         inputWidth: inputWidth,
                                         inputScale: inputScale)?.outputUIImage
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
    func sepiaTone(inputIntensity: NSNumber = 1) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.sepiaTone(inputImage: inputImage, inputIntensity: inputIntensity)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func shadedMaterial(inputShadingImage: UIImage, inputScale: NSNumber = 10) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputShadingImage = inputShadingImage.ciImage else { return nil }
        return CIFilter.shadedMaterial(inputImage: inputImage, inputShadingImage: inputShadingImage, inputScale: inputScale)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func sharpenLuminance(inputSharpness: NSNumber = 0.4, inputRadius: NSNumber = 1.69) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.sharpenLuminance(inputImage: inputImage, inputSharpness: inputSharpness, inputRadius: inputRadius)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func sixfoldReflectedTile(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputAngle: NSNumber = 0, inputWidth: NSNumber = 100) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.sixfoldReflectedTile(inputImage: inputImage, inputCenter: inputCenter, inputAngle: inputAngle, inputWidth: inputWidth)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func sixfoldRotatedTile(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputAngle: NSNumber = 0, inputWidth: NSNumber = 100) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.sixfoldRotatedTile(inputImage: inputImage, inputCenter: inputCenter, inputAngle: inputAngle, inputWidth: inputWidth)?.outputUIImage
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
    func spotColor(inputCenterColor1: CIColor, inputReplacementColor1: CIColor, inputCloseness1: NSNumber = 0.22, inputContrast1: NSNumber = 0.98, inputCenterColor2: CIColor, inputReplacementColor2: CIColor, inputCloseness2: NSNumber = 0.15, inputContrast2: NSNumber = 0.98, inputCenterColor3: CIColor, inputReplacementColor3: CIColor, inputCloseness3: NSNumber = 0.5, inputContrast3: NSNumber = 0.99) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.spotColor(inputImage: inputImage,
                                  inputCenterColor1: inputCenterColor1,
                                  inputReplacementColor1: inputReplacementColor1,
                                  inputCloseness1: inputCloseness1,
                                  inputContrast1: inputContrast1,
                                  inputCenterColor2: inputCenterColor2,
                                  inputReplacementColor2: inputReplacementColor2,
                                  inputCloseness2: inputCloseness2,
                                  inputContrast2: inputContrast2,
                                  inputCenterColor3: inputCenterColor3,
                                  inputReplacementColor3: inputReplacementColor3,
                                  inputCloseness3: inputCloseness3,
                                  inputContrast3: inputContrast3)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func spotLight(inputLightPosition: CIVector = CIVector(x: 400.0, y: 600.0, z: 150.0), inputLightPointsAt: CIVector = CIVector(x: 200.0, y: 200.0, z: 0.0), inputBrightness: NSNumber = 3, inputConcentration: NSNumber = 0.1, inputColor: CIColor) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.spotLight(inputImage: inputImage, inputLightPosition: inputLightPosition, inputLightPointsAt: inputLightPointsAt, inputBrightness: inputBrightness, inputConcentration: inputConcentration, inputColor: inputColor)?.outputUIImage
    }
    
    @available(iOS 7, *)
    func srgbToneCurveToLinear() -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.srgbToneCurveToLinear(inputImage: inputImage)?.outputUIImage
    }
    
    
    @available(iOS 5, *)
    func straightenFilter(inputAngle: NSNumber = 0) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.straightenFilter(inputImage: inputImage, inputAngle: inputAngle)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func stretchCrop(inputSize: CIVector = CIVector(x: 1280.0, y: 720.0), inputCropAmount: NSNumber = 0.25, inputCenterStretchAmount: NSNumber = 0.25) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.stretchCrop(inputImage: inputImage, inputSize: inputSize, inputCropAmount: inputCropAmount, inputCenterStretchAmount: inputCenterStretchAmount)?.outputUIImage
    }
    
    @available(iOS 8, *)
    func subtractBlendMode(inputBackgroundImage: UIImage) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputBackgroundImage = inputBackgroundImage.ciImage else { return nil }
        return CIFilter.subtractBlendMode(inputImage: inputImage, inputBackgroundImage: inputBackgroundImage)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func swipeTransition(inputTargetImage: UIImage, inputExtent: CIVector = CIVector(x: 0.0, y: 0.0, z: 300.0, w: 300.0), inputColor: CIColor, inputTime: NSNumber = 0, inputAngle: NSNumber = 0, inputWidth: NSNumber = 300, inputOpacity: NSNumber = 0) -> UIImage? {
        guard let inputImage = self.image.ciImage, let inputTargetImage = inputTargetImage.ciImage else { return nil }
        return CIFilter.swipeTransition(inputImage: inputImage,
                                        inputTargetImage: inputTargetImage,
                                        inputExtent: inputExtent,
                                        inputColor: inputColor,
                                        inputTime: inputTime,
                                        inputAngle: inputAngle,
                                        inputWidth: inputWidth,
                                        inputOpacity: inputOpacity)?.outputUIImage
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
    func toneCurve(inputPoint0: CIVector = CIVector(x: 0.0, y: 0.0), inputPoint1: CIVector = CIVector(x: 0.25, y: 0.25), inputPoint2: CIVector = CIVector(x: 0.5, y: 0.5), inputPoint3: CIVector = CIVector(x: 0.75, y: 0.75), inputPoint4: CIVector = CIVector(x: 1.0, y: 1.0)) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.toneCurve(inputImage: inputImage,
                                  inputPoint0: inputPoint0,
                                  inputPoint1: inputPoint1,
                                  inputPoint2: inputPoint2,
                                  inputPoint3: inputPoint3,
                                  inputPoint4: inputPoint4)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func torusLensDistortion(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputRadius: NSNumber = 160, inputWidth: NSNumber = 80, inputRefraction: NSNumber = 1.7) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.torusLensDistortion(inputImage: inputImage, inputCenter: inputCenter, inputRadius: inputRadius, inputWidth: inputWidth, inputRefraction: inputRefraction)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func triangleKaleidoscope(inputPoint: CIVector = CIVector(x: 150.0, y: 150.0), inputSize: NSNumber = 700, inputRotation: NSNumber = 5.924285296593801, inputDecay: NSNumber = 0.85) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.triangleKaleidoscope(inputImage: inputImage, inputPoint: inputPoint, inputSize: inputSize, inputRotation: inputRotation, inputDecay: inputDecay)?.outputUIImage
    }
    
    @available(iOS 9, *)
    func triangleTile(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputAngle: NSNumber = 0, inputWidth: NSNumber = 100) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.triangleTile(inputImage: inputImage, inputCenter: inputCenter, inputAngle: inputAngle, inputWidth: inputWidth)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func twelvefoldReflectedTile(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputAngle: NSNumber = 0, inputWidth: NSNumber = 100) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.twelvefoldReflectedTile(inputImage: inputImage, inputCenter: inputCenter, inputAngle: inputAngle, inputWidth: inputWidth)?.outputUIImage
    }
    
    @available(iOS 5, *)
    func twirlDistortion(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputRadius: NSNumber = 300, inputAngle: NSNumber = 3.141592653589793) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.twirlDistortion(inputImage: inputImage, inputCenter: inputCenter, inputRadius: inputRadius, inputAngle: inputAngle)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func unsharpMask(inputRadius: NSNumber = 2.5, inputIntensity: NSNumber = 0.5) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.unsharpMask(inputImage: inputImage, inputRadius: inputRadius, inputIntensity: inputIntensity)?.outputUIImage
    }
    
    @available(iOS 5, *)
    func vibrance(inputAmount: NSNumber = 0) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.vibrance(inputImage: inputImage, inputAmount: inputAmount)?.outputUIImage
    }
    
    @available(iOS 5, *)
    func vignette(inputIntensity: NSNumber = 0, inputRadius: NSNumber = 1) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.vignette(inputImage: inputImage, inputIntensity: inputIntensity, inputRadius: inputRadius)?.outputUIImage
    }
    
    @available(iOS 7, *)
    func vignetteEffect(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputRadius: NSNumber = 150, inputIntensity: NSNumber = 1, inputFalloff: NSNumber = 0.5) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.vignetteEffect(inputImage: inputImage, inputCenter: inputCenter, inputRadius: inputRadius, inputIntensity: inputIntensity, inputFalloff: inputFalloff)?.outputUIImage
    }
    
    @available(iOS 6, *)
    func vortexDistortion(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputRadius: NSNumber = 300, inputAngle: NSNumber = 56.54866776461628) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.vortexDistortion(inputImage: inputImage, inputCenter: inputCenter, inputRadius: inputRadius, inputAngle: inputAngle)?.outputUIImage
    }
    
    @available(iOS 5, *)
    func whitePointAdjust(inputColor: CIColor) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.whitePointAdjust(inputImage: inputImage, inputColor: inputColor)?.outputUIImage
    }
    
    @available(iOS 10, *)
    func xray() -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.xray(inputImage: inputImage)?.outputUIImage
    }
    
    @available(iOS 8.3, *)
    func zoomBlur(inputCenter: CIVector = CIVector(x: 150.0, y: 150.0), inputAmount: NSNumber = 20) -> UIImage? {
        guard let inputImage = self.image.ciImage else { return nil }
        return CIFilter.zoomBlur(inputImage: inputImage, inputCenter: inputCenter, inputAmount: inputAmount)?.outputUIImage
    }
}
