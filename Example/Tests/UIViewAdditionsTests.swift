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
    
    func testChangingOrigin() {
        // This is an example of a functional test case.
        let width: CGFloat = 10.0
        let height: CGFloat = 20.0
        let view = UIView(frame: CGRectMake(0.0, 0.0, width, height))
        let targetOrigin = CGPointMake(50.0, 150.0)
        //view.origin = targetOrigin
        
        // TODO: assert origin has updated and size has not changed
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
