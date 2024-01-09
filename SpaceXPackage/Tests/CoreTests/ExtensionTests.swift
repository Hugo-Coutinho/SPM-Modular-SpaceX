//
//  File.swift
//
//
//  Created by Hugo Coutinho on 2024-01-08.
//

import XCTest
import Core

class ExtensionTests: XCTestCase {
    func test_shouldReturn_FirstTwoNames() {
        // GIVEN
        let expected = "Hugo Oliveira"

        // THEN
        XCTAssertEqual("Hugo Oliveira Coutinho".extractFirstTwoNames(), expected)
    }

    func test_shouldReturn_FullName() {
        // GIVEN
        let expected = "Hugo Coutinho"

        // THEN
        XCTAssertEqual("Hugo Coutinho".extractFirstTwoNames(), expected)
    }

    func test_shouldReturn_FirstName() {
        // GIVEN
        let expected = "Robert"

        // THEN
        XCTAssertEqual("Robert D. Junior".extractFirstTwoNames(), expected)
    }

    func test_shouldReturn_NameWithoutHyphen() {
        // GIVEN
        let expected = "David Saint"

        // THEN
        XCTAssertEqual("David Saint-Jacquire".extractFirstTwoNames(), expected)
    }
}
