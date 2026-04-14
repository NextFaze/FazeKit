//
//  DisposableTests.swift
//  FazeKit_Example
//
//  Created by Shane Woolcock on 3/10/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import XCTest
import FazeKit

class DisposableTests: XCTestCase {
    func testUsing() {
        let testObject = TestObject()
        using(testObject) { object in
            print("Asserting that object is not disposed within using")
            XCTAssertFalse(object.isDisposed, "Object was incorrectly disposed within using")
        }
        print("Asserting that object is disposed after using")
        XCTAssertTrue(testObject.isDisposed, "Object was not disposed after using")
    }
    
    func testOptionalUsing() {
        var testObject: TestObject?
        
        var wasExecuted: Bool = false
        using(testObject) { object in
            wasExecuted = true
            print("Asserting that object is nil")
            XCTAssertNil(object, "object was not nil")
        }
        print("Asserting that using(nil) was still executed")
        XCTAssertTrue(wasExecuted, "using(nil) was not executed")
        
        testObject = TestObject()
        using(testObject) { object in
            print("Asserting that object is not nil")
            XCTAssertNotNil(object, "object was nil")
            
            print("Asserting that object is not disposed within using")
            XCTAssertFalse(object?.isDisposed ?? false, "Object was incorrectly disposed within using")
        }
        
        print("Asserting that object is disposed after using")
        XCTAssertTrue(testObject?.isDisposed ?? false, "Object was not disposed after using")
    }
}

private class TestObject: Disposable {
    var isDisposed: Bool = false
    
    func dispose() {
        self.isDisposed = true
    }
}
