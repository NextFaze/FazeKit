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
// UIViewAdditionsTests.swift
// FazeKit
//
// Created by rsantos on 12/08/2016.
//

import UIKit
import XCTest
import FazeKit

class UIViewAdditionsTests: XCTestCase {
    let width: CGFloat = 10.0
    let height: CGFloat = 20.0
    var view: UIView = UIView()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: width, height: height))
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testX() {
        let newX: CGFloat = 50.0
        view.x = newX
        
        XCTAssertEqual(view.origin.x, newX, "origin.x is not as expected")
        XCTAssertEqual(view.frame.minX, newX, "minX is not as expected")
        
        XCTAssertEqual(view.width, width, "width is not as expected")
        XCTAssertEqual(view.height, height, "height is not as expected")
    }

    func testY() {
        let newY: CGFloat = 50.0
        view.y = newY
        
        XCTAssertEqual(view.origin.y, newY, "origin.y is not as expected")
        XCTAssertEqual(view.frame.minY, newY, "minY is not as expected")
        
        XCTAssertEqual(view.width, width, "width is not as expected")
        XCTAssertEqual(view.height, height, "height is not as expected")
    }
    
    func testLeft() {
        let newLeft: CGFloat = 50.0
        view.left = newLeft
        
        XCTAssertEqual(view.left, newLeft, "left is not as expected")
        XCTAssertEqual(view.frame.minX, newLeft, "minX is not as expected")
        
        XCTAssertEqual(view.width, width, "width is not as expected")
        XCTAssertEqual(view.height, height, "height is not as expected")
    }
    
    func testRight() {
        let newRight: CGFloat = 50.0
        view.right = newRight
        
        XCTAssertEqual(view.right, newRight, "right is not as expected")
        XCTAssertEqual(view.frame.maxX, newRight, "maxX is not as expected")
        
        XCTAssertEqual(view.width, width, "width is not as expected")
        XCTAssertEqual(view.height, height, "height is not as expected")
    }
    
    func testTop() {
        let newTop: CGFloat = 50.0
        view.top = newTop
        
        XCTAssertEqual(view.top, newTop, "top is not as expected")
        XCTAssertEqual(view.frame.minY, newTop, "minY is not as expected")
        
        XCTAssertEqual(view.width, width, "width is not as expected")
        XCTAssertEqual(view.height, height, "height is not as expected")
    }
    
    func testBottom() {
        let newBottom: CGFloat = 50.0
        view.bottom = newBottom
        
        XCTAssertEqual(view.bottom, newBottom, "bottom is not as expected")
        XCTAssertEqual(view.frame.maxY, newBottom, "maxY is not as expected")
        
        XCTAssertEqual(view.width, width, "width is not as expected")
        XCTAssertEqual(view.height, height, "height is not as expected")
    }
    
    func testCenterX() {
        let newCenterX: CGFloat = 50.0
        view.centerX = newCenterX
        
        XCTAssertEqual(view.centerX, newCenterX, "centerX is not as expected")
        XCTAssertEqual(view.frame.midX, newCenterX, "midX is not as expected")
        
        XCTAssertEqual(view.width, width, "width is not as expected")
        XCTAssertEqual(view.height, height, "height is not as expected")
    }
    
    func testCenterY() {
        let newCenterY: CGFloat = 50.0
        view.centerY = newCenterY
        
        XCTAssertEqual(view.centerY, newCenterY, "centerY is not as expected")
        XCTAssertEqual(view.frame.midY, newCenterY, "midY is not as expected")
        
        XCTAssertEqual(view.width, width, "width is not as expected")
        XCTAssertEqual(view.height, height, "height is not as expected")
    }
    
    func testOrigin() {
        let newX: CGFloat = 50.0
        let newY: CGFloat = 150.0
        
        view.origin = CGPoint(x: newX, y: newY)
        
        XCTAssertEqual(view.origin.x, newX, "origin.x is not as expected")
        XCTAssertEqual(view.x, newX, "x is not as expected")
        XCTAssertEqual(view.left, newX, "left is not as expected")
        
        XCTAssertEqual(view.origin.y, newY, "origin.y is not as expected")
        XCTAssertEqual(view.y, newY, "y is not as expected")
        XCTAssertEqual(view.top, newY, "top is not as expected")
        
        XCTAssertEqual(view.width, width, "width is not as expected")
        XCTAssertEqual(view.height, height, "height is not as expected")
    }
    
    func testSize() {
        let newWidth: CGFloat = 50.0
        let newHeight: CGFloat = 100.0
        
        view.size = CGSize(width: newWidth, height: newHeight)
        
        XCTAssertEqual(view.width, newWidth, "width is not as expected")
        XCTAssertEqual(view.height, newHeight, "height is not as expected")
    }
    
    func testAspect() {
        let newWidth: CGFloat = 50.0
        let newHeight: CGFloat = 100.0
        
        view.size = CGSize(width: newWidth, height: newHeight)
        
        XCTAssertEqual(view.aspect, newWidth/newHeight, "aspect is not as expected")
    }
}
