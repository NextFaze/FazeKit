//
//  EmailTests.swift
//  FazeKit_Tests
//
//  Created by Ric Santos on 27/7/2023.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import XCTest
import FazeKit

final class EmailTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInvalidEmails() throws {
        var invalidEmail = "invalid@gmil.com"
        var result = ResourceUtils.isInvalidEmailDomainWithSuggestion(emailAddress: invalidEmail)
        XCTAssertTrue(result.0)
        XCTAssertEqual(result.1, "invalid@gmail.com")
        print("Suggestion for \(invalidEmail) is \(String(describing: result.1))")
        
        invalidEmail = "invalid@ynail.com"
        result = ResourceUtils.isInvalidEmailDomainWithSuggestion(emailAddress: invalidEmail)
        XCTAssertTrue(result.0)
        XCTAssertEqual(result.1, "invalid@gmail.com")
        print("Suggestion for \(invalidEmail) is \(result.1 ?? "-")")

        let invalidEmails = [
            "invalid@ayhoo.com",
            "invalid@gamali.com",
            "invalid@gamil.com",
            "invalid@gamail.com",
            "invalid@gmil.co",
            "invalid@gmil.com",
            "invalid@gmila.com",
            "invalid@gmile.com",
            "invalid@gmali.com",
            "invalid@gmill.com",
            "invalid@gmll.com",
            "invalid@gmakl.com",
            "invalid@gmil.com.br",
            "invalid@hotmqil.com",
            "invalid@hotmaiil.com",
            "invalid@outllok.com",
            "invalid@otmail.com",
            "invalid@ynail.com",
            ]
        for invalidEmail in invalidEmails {
            result = ResourceUtils.isInvalidEmailDomainWithSuggestion(emailAddress: invalidEmail)
            XCTAssertTrue(result.0, "🔥 Expectd invalid result for \(invalidEmail)")
            print("Suggestion for \(invalidEmail) is \(result.1 ?? "-")")
        }
    }
}
