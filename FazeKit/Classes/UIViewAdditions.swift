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
    var x: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            self.frame.origin.x = newValue
        }
    }
    
    var y: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            self.frame.origin.y = newValue
        }
    }
    
    var left: CGFloat {
        get {
            return self.x
        }
        set {
            self.x = newValue
        }
    }
    
    var right: CGFloat {
        get {
            return self.x + self.width
        }
        set {
            self.x = newValue - self.width
        }
    }
    
    var top: CGFloat {
        get {
            return self.y
        }
        set {
            self.y = newValue
        }
    }
    
    var bottom: CGFloat {
        get {
            return self.y + self.height
        }
        set {
            self.y = newValue - self.height
        }
    }
    
    var centerX: CGFloat {
        get {
            return self.x + self.width/2.0
        }
        set {
            self.x = newValue - self.width/2.0
        }
    }
    
    var centerY: CGFloat {
        get {
            return self.y + self.height/2.0
        }
        set {
            self.y = newValue - self.height/2.0
        }
    }
    
    var width: CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            self.frame.size.width = newValue
        }
    }
    
    var height: CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            self.frame.size.height = newValue
        }
    }
    
    var origin: CGPoint {
        get {
            return self.frame.origin
        }
        set {
            self.frame.origin = newValue
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
    
    var aspect: CGFloat {
        get {
            return self.height == 0 ? 0 : (self.width / self.height)
        }
    }
}
