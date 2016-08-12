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
// UIViewAdditions.swift
// FazeKit
//
// Created by rsantos on 12/08/2016.
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
            return self.height == 0 ? 0 : (self.width / self.height)
        }
    }
}
