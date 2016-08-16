import UIKit
import XCTest
import FazeKit

class Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSetOrigin() {
        let width: CGFloat = 10.0
        let height: CGFloat = 20.0
        let newX: CGFloat = 50.0
        let newY: CGFloat = 150.0
        
        let view = UIView(frame: CGRectMake(0.0, 0.0, width, height))
        view.origin = CGPointMake(newX, newY)
        
        XCTAssertEqual(view.origin.x, newX, "origin.x is not as expected")
        XCTAssertEqual(view.x, newX, "x is not as expected")
        XCTAssertEqual(view.left, newX, "left is not as expected")
        
        XCTAssertEqual(view.origin.y, newY, "origin.y is not as expected")
        XCTAssertEqual(view.y, newY, "y is not as expected")
        XCTAssertEqual(view.top, newY, "top is not as expected")
        
        XCTAssertEqual(view.width, width, "width is not as expected")
        XCTAssertEqual(view.height, height, "height is not as expected")
    }
    
    func testSetX() {
        let width: CGFloat = 10.0
        let height: CGFloat = 20.0
        let newX: CGFloat = 50.0
        
        let view = UIView(frame: CGRectMake(0.0, 0.0, width, height))
        view.x = newX
        
        XCTAssertEqual(view.origin.x, newX, "origin.x is not as expected")
        XCTAssertEqual(CGRectGetMinX(view.frame), newX, "minX is not as expected")
        
        XCTAssertEqual(view.width, width, "width is not as expected")
        XCTAssertEqual(view.height, height, "height is not as expected")
    }

    func testSetY() {
        let width: CGFloat = 10.0
        let height: CGFloat = 20.0
        let newY: CGFloat = 50.0
        
        let view = UIView(frame: CGRectMake(0.0, 0.0, width, height))
        view.y = newY
        
        XCTAssertEqual(view.origin.y, newY, "origin.y is not as expected")
        XCTAssertEqual(CGRectGetMinY(view.frame), newY, "minY is not as expected")
        
        XCTAssertEqual(view.width, width, "width is not as expected")
        XCTAssertEqual(view.height, height, "height is not as expected")
    }
    
    func testSetLeft() {
        let width: CGFloat = 10.0
        let height: CGFloat = 20.0
        let newLeft: CGFloat = 50.0
        
        let view = UIView(frame: CGRectMake(0.0, 0.0, width, height))
        view.left = newLeft
        
        XCTAssertEqual(view.left, newLeft, "left is not as expected")
        XCTAssertEqual(CGRectGetMinX(view.frame), newLeft, "minX is not as expected")
        
        XCTAssertEqual(view.width, width, "width is not as expected")
        XCTAssertEqual(view.height, height, "height is not as expected")
    }
    
    func testSetRight() {
        let width: CGFloat = 10.0
        let height: CGFloat = 20.0
        let newRight: CGFloat = 50.0
        
        let view = UIView(frame: CGRectMake(0.0, 0.0, width, height))
        view.right = newRight
        
        XCTAssertEqual(view.right, newRight, "right is not as expected")
        XCTAssertEqual(CGRectGetMaxX(view.frame), newRight, "maxX is not as expected")
        
        XCTAssertEqual(view.width, width, "width is not as expected")
        XCTAssertEqual(view.height, height, "height is not as expected")
    }
    
    func testSetTop() {
        let width: CGFloat = 10.0
        let height: CGFloat = 20.0
        let newTop: CGFloat = 50.0
        
        let view = UIView(frame: CGRectMake(0.0, 0.0, width, height))
        view.top = newTop
        
        XCTAssertEqual(view.top, newTop, "top is not as expected")
        XCTAssertEqual(CGRectGetMinY(view.frame), newTop, "minY is not as expected")
        
        XCTAssertEqual(view.width, width, "width is not as expected")
        XCTAssertEqual(view.height, height, "height is not as expected")
    }
    
    func testSetBottom() {
        let width: CGFloat = 10.0
        let height: CGFloat = 20.0
        let newBottom: CGFloat = 50.0
        
        let view = UIView(frame: CGRectMake(0.0, 0.0, width, height))
        view.bottom = newBottom
        
        XCTAssertEqual(view.bottom, newBottom, "bottom is not as expected")
        XCTAssertEqual(CGRectGetMaxY(view.frame), newBottom, "maxY is not as expected")
        
        XCTAssertEqual(view.width, width, "width is not as expected")
        XCTAssertEqual(view.height, height, "height is not as expected")
    }
    
    func testSetCenterX() {
        let width: CGFloat = 10.0
        let height: CGFloat = 20.0
        let newCenterX: CGFloat = 50.0
        
        let view = UIView(frame: CGRectMake(0.0, 0.0, width, height))
        view.centerX = newCenterX
        
        XCTAssertEqual(view.centerX, newCenterX, "centerX is not as expected")
        XCTAssertEqual(CGRectGetMidX(view.frame), newCenterX, "midX is not as expected")
        
        XCTAssertEqual(view.width, width, "width is not as expected")
        XCTAssertEqual(view.height, height, "height is not as expected")
    }
    
    func testSetCenterY() {
        let width: CGFloat = 10.0
        let height: CGFloat = 20.0
        let newCenterY: CGFloat = 50.0
        
        let view = UIView(frame: CGRectMake(0.0, 0.0, width, height))
        view.centerY = newCenterY
        
        XCTAssertEqual(view.centerY, newCenterY, "centerY is not as expected")
        XCTAssertEqual(CGRectGetMidY(view.frame), newCenterY, "midY is not as expected")
        
        XCTAssertEqual(view.width, width, "width is not as expected")
        XCTAssertEqual(view.height, height, "height is not as expected")
    }
}
