//
//  ResourceUtils.swift
//  FazeKit
//
//  Created by Shane Woolcock on 27/9/19.
//

import Foundation

public enum FileType {
    case png
    case jpg
    case video
    case pdf
    case plist
    case json
    case text
    case unknown
    
    init(extension: String) {
        switch `extension` {
        case "pdf":
            self = .pdf
        case "jpg":
            self = .jpg
        case "png":
            self = .png
        case "mov", "m4v", "avi", "mp4", "mpg", "mpeg":
            self = .video
        case "plist":
            self = .plist
        case "txt":
            self = .text
        case "json":
            self = .json
        default:
            self = .unknown
        }
    }
}

public struct ResourceUtils {
    public static func determineFileType(filename: String) -> FileType {
        let ext = (filename as NSString).pathExtension.lowercased()
        return FileType(extension: ext)
    }
    
    public static var documentPath: String? {
        let paths = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)
        return paths.first
    }
    
    public static var imagesPath: String? {
        guard let documentsDirectory = self.documentPath else { return nil }
        (documentsDirectory as NSString).appendingPathComponent("photos")
        try? FileManager.default.createDirectory(atPath: documentsDirectory, withIntermediateDirectories: true, attributes: nil)
        return documentsDirectory
    }
    
    public static func saveImage(_ image: UIImage, filename: String) {
        guard let docPath = self.imagesPath else { return }
        let filePath = (docPath as NSString).appendingPathComponent(filename)
        switch self.determineFileType(filename: filename) {
        case .png:
            try? UIImagePNGRepresentation(image)?.write(to: URL(fileURLWithPath: filePath), options: .atomicWrite)
        case .jpg:
            try? UIImageJPEGRepresentation(image, 1)?.write(to: URL(fileURLWithPath: filePath), options: .atomicWrite)
        default:
            print("Image save failed, use PNG or JPG")
        }
    }
    
    public static func loadImage(filename: String) -> UIImage? {
        guard let imagesPath = self.imagesPath else { return nil }
        let fullImagePath = (imagesPath as NSString).appendingPathComponent(filename)
        return UIImage(contentsOfFile: fullImagePath)
    }
    
    @discardableResult
    public static func deleteImage(filename: String) -> Bool {
        guard let imagesPath = self.imagesPath else { return false }
        let filePath = (imagesPath as NSString).appendingPathComponent(filename)
        
        do {
            try FileManager.default.removeItem(atPath: filePath)
            return true
        } catch {
            print(error)
        }
        return false
    }
    
    public static func fileExistsInMainBundle(_ filename: String, ofType fileExtension: String) -> Bool {
        return Bundle.main.path(forResource: filename, ofType: fileExtension) != nil
    }
    
    public static func arrayFromFile(_ filename: String) -> [String]? {
        let shortened = (filename as NSString).deletingPathExtension
        let fileExtension = (filename as NSString).pathExtension
        guard let path = Bundle.main.path(forResource: shortened, ofType: fileExtension) else { return nil }
        do {
            let contents = try String(contentsOfFile: path)
            return contents.components(separatedBy: "\n")
        } catch {
            print(error)
        }
        return nil
    }
    
    public static func isValidEmailAddress(_ emailAddress: String, stricterFilter: Bool = true) -> Bool {
        // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
        let stricterFilterString = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let laxString = ".+@.+\\.[A-Za-z]{2}[A-Za-z]*"
        let emailRegex = stricterFilter ? stricterFilterString : laxString
        let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return predicate.evaluate(with: emailAddress)
    }
}
