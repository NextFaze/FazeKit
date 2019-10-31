import XCTest
@testable import FazeKit

final class FazeKitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(FazeKit().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
