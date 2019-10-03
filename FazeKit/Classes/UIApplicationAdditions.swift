//
//  UIApplicationAdditions.swift
//  FazeKit
//
//  Created by Shane Woolcock on 3/10/19.
//

import Foundation

private var activityCount: Int = 0

extension UIApplication {
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
}
