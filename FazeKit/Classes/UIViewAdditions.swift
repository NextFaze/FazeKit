//
//  UIViewAdditions.swift
//  FazeKit
//

import UIKit

extension UIView {
    var top: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            self.frame = CGRectMake(self.frame.origin.x, newValue, self.frame.size.width, self.frame.size.height)
        }
    }
    
    var left: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            self.frame = CGRectMake(newValue, self.frame.origin.y, self.frame.size.width, self.frame.size.height)
        }
    }
    
    var bottom: CGFloat {
        get {
            return self.frame.origin.y + self.frame.size.height
        }
        set {
            self.frame = CGRectMake(self.frame.origin.x, newValue - self.frame.size.height, self.frame.size.width, self.frame.size.height)
        }
    }
    
    var right: CGFloat {
        get {
            return self.frame.origin.x + self.frame.size.width
        }
        set {
            self.frame = CGRectMake(newValue - self.frame.size.width, self.frame.origin.y, self.frame.size.width, self.frame.size.height)
        }
    }
    
    var centerX: CGFloat {
        get {
            return self.frame.origin.x + self.frame.size.width/2.0
        }
        set {
            self.left = newValue - self.frame.size.width/2.0
        }
    }
    
    var centerY: CGFloat {
        get {
            return self.frame.origin.y + self.frame.size.height/2.0
        }
        set {
            self.top = newValue - self.frame.size.height/2.0
        }
    }
    
    var width: CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, newValue, self.frame.size.height)
        }
    }
    
    var height: CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, newValue)
        }
    }
    
    var size: CGSize {
        get {
            return self.frame.size
        }
        set {
            self.frame.size = newValue
        }
    }
    
    var rounded: Bool {
        get {
            return self.layer.cornerRadius != 0
        }
        set {
            self.layer.cornerRadius = newValue ? 10.0 : 0.0
            self.clipsToBounds = newValue
        }
    }
}
