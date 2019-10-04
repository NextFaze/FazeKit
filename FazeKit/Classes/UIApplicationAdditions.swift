//
//  UIApplicationAdditions.swift
//  FazeKit
//
//  Created by Shane Woolcock on 3/10/19.
//

import Foundation

private var activityCount: Int = 0

public extension UIApplication {
    static func incrementNetworkActivityIndicator() {
        DispatchQueue.main.async {
            activityCount += 1
            self.shared.isNetworkActivityIndicatorVisible = true
        }
    }
    
    static func decrementNetworkActivityIndicator() {
        DispatchQueue.main.async {
            activityCount = max(0, activityCount - 1)
            self.shared.isNetworkActivityIndicatorVisible = activityCount > 0
        }
    }
    
    static var appVersionString: String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? ""
    }
    
    static var appBuildString: String {
        return Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as? String ?? ""
    }
    
    static var appBuildNumber: Int {
        return Int(self.appBuildString) ?? 0
    }
    
    static var semanticVersionString: String {
        return "\(self.appVersionString).\(self.appBuildString)"
    }
    
    static var versionBuildString: String {
        let version = self.appVersionString, build = self.appBuildString
        return version == build ? "v\(version)" : "v\(version) (\(build))"
    }
    
    static var bundleIdentifier: String {
        return Bundle.main.bundleIdentifier ?? ""
    }
    
    static let isRunningUnitTests: Bool = {
        let env = ProcessInfo.processInfo.environment
        return env.keys.contains(where: { $0.starts(with: "XCTest") })
    }()
}
