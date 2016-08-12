//
//  UIViewAdditions.swift
//  FazeKit
//

import UIKit

public extension UIView {
    public var x: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            self.frame = CGRectMake(newValue, self.frame.origin.y, self.frame.size.width, self.frame.size.height)
        }
    }
    
    public var y: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            self.frame = CGRectMake(self.frame.origin.x, newValue, self.frame.size.width, self.frame.size.height)
        }
    }
    
    public var left: CGFloat {
        get {
            return self.x
        }
        set {
            self.x = newValue
        }
    }
    
    public var right: CGFloat {
        get {
            return self.frame.origin.x + self.frame.size.width
        }
        set {
            self.frame = CGRectMake(newValue - self.frame.size.width, self.frame.origin.y, self.frame.size.width, self.frame.size.height)
        }
    }
    
    public var top: CGFloat {
        get {
            return self.y
        }
        set {
            self.y = newValue
        }
    }
    
    public var bottom: CGFloat {
        get {
            return self.frame.origin.y + self.frame.size.height
        }
        set {
            self.frame = CGRectMake(self.frame.origin.x, newValue - self.frame.size.height, self.frame.size.width, self.frame.size.height)
        }
    }
    
    public var centerX: CGFloat {
        get {
            return self.frame.origin.x + self.frame.size.width/2.0
        }
        set {
            self.x = newValue - self.frame.size.width/2.0
        }
    }
    
    public var centerY: CGFloat {
        get {
            return self.frame.origin.y + self.frame.size.height/2.0
        }
        set {
            self.y = newValue - self.frame.size.height/2.0
        }
    }
    
    public var width: CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, newValue, self.frame.size.height)
        }
    }
    
    public var height: CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, newValue)
        }
    }
    
    public var origin: CGPoint {
        get {
            return self.frame.origin
        }
        set {
            self.frame.origin = newValue
        }
    }
    
    public var size: CGSize {
        get {
            return self.frame.size
        }
        set {
            self.frame.size = newValue
        }
    }
    
    public var aspect: CGFloat {
        get {
            return self.width/self.height
        }
    }
}
