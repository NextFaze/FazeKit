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
    
    func testIntegration() {
        IntegrationTest.printConfirmation()
        XCTAssert(true, "Integration test failed")
    }
    
    func testChangingOrigin() {
        let width: CGFloat = 10.0
        let height: CGFloat = 20.0
        let view = UIView(frame: CGRectMake(0.0, 0.0, width, height))
        let newX: CGFloat = 50.0
        let newY: CGFloat = 150.0
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
    
    // TODO: complete test cases
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
