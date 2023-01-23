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
            try? image.pngData()?.write(to: URL(fileURLWithPath: filePath), options: .atomicWrite)
        case .jpg:
            try? image.jpegData(compressionQuality: 1)?.write(to: URL(fileURLWithPath: filePath), options: .atomicWrite)
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
    
    public static func isInvalidEmailDomain(emailAddress: String) -> Bool {
        return self.isInvalidEmailDomainWithSuggestion(emailAddress: emailAddress).0
    }
    
    // Checks the suffix of an email address, eg `foo@gmol.com` and returns a
    // tuple of (invalid, suggestion) where the suggestion is the fixed email address
    public static func isInvalidEmailDomainWithSuggestion(emailAddress: String) -> (Bool, String?) {
        let invalidDomains = [
            ("@ail.com", "@aol.com"),
            ("@gamail.com", "@gmail.com"),
            ("@gamil.com", "@gmail.com"),
            ("@gimail.com", "@gmail.com"),
            ("@gmaail.com", "@gmail.com"),
            ("@gmai.com", "@gmail.com"),
            ("@gmaiil.com", "@gmail.com"),
            ("@gmaik.com", "@gmail.com"),
            ("@gmail.cm", "@gmail.com"),
            ("@gmail.co", "@gmail.com"),
            ("@gmail.co.uk", "@gmail.com"),
            ("@gmail.com.br", "@gmail.com"),
            ("@gmail.con", "@gmail.com"),
            ("@gmail.fr", "@gmail.com"),
            ("@gmaill.com", "@gmail.com"),
            ("@gmaio.com", "@gmail.com"),
            ("@gmakl.com", "@gmail.com"),
            ("@gmal.com", "@gmail.com"),
            ("@gmaol.com", "@gmail.com"),
            ("@gmaul.com", "@gmail.com"),
            ("@gmeil.com", "@gmail.com"),
            ("@gmial.com", "@gmail.com"),
            ("@gmil.com", "@gmail.com"),
            ("@gnail.com", "@gmail.com"),
            ("@hitmail.com", "@hotmail.com"),
            ("@homail.com", "@hotmail.com"),
            ("@hormail.com", "@hotmail.com"),
            ("@hotamil.com", "@hotmail.com"),
            ("@hotmai.com", "@hotmail.com"),
            ("@hotmail.con", "@hotmail.com"),
            ("@hotmal.com", "@hotmail.com"),
            ("@hotmil.com", "@hotmail.com"),
            ("@hotmsil.com", "@hotmail.com"),
            ("@hotnail.com", "@hotmail.com"),
            ("@hoymail.com", "@hotmail.com"),
            ("@hptmail.com", "@hotmail.com"),
            ("@htmail.com", "@hotmail.com"),
            ("@icloid.com", "@icloud.com"),
            ("@jotmail.com", "@hotmail.com"),
            ("@ovi.com", "@aol.com"),
            ("@tahoo.com", "@yahoo.com"),
            ("@yaahoo.com", "@yahoo.com"),
            ("@yaboo.com", "@yahoo.com"),
            ("@yahho.com", "@yahoo.com"),
            ("@yaho.com", "@yahoo.com"),
            ("@yahoo.co", "@yahoo.com"),
            ("@yahoo.con", "@yahoo.com"),
            ("@yahooo.com", "@yahoo.com"),
            ("@yajoo.com", "@yahoo.com"),
            ("@yanoo.com", "@yahoo.com"),
            ("@yhaoo.com", "@yahoo.com"),
            ("@yhoo.com", "@yahoo.com"),
            ("@yshoo.com", "@yahoo.com"),
        ]
        for (domain, suggestedDomain) in invalidDomains {
            if emailAddress.hasSuffix(domain) {
                let suggestion = emailAddress.replacingOccurrences(of: domain, with: suggestedDomain)
                return (true, suggestion)
            }
        }
        return (false, nil)
    }
}
