//
//  DateHelpTests.swift
//  SpaceXTests
//
//  Created by hugo.coutinho on 17/12/21.
//  Copyright © 2021 . All rights reserved.
//


import XCTest
import Core

class DateHelperTests: XCTestCase {

    //MARK: - DECLARATIONS -
    var helper: DateHelper!

    //MARK: - OVERRIDE TESTS FUNCTIONS -
    override func setUp() {
        super.setUp()
        helper = DateHelper()
    }
    func test_shouldReturn_stringDate() {
        // GIVEN
        let expectedDate = helper.fromUTCToDate(dateString: "2018-04-10T04:00:00.000Z")
        let expectedStringDate = "2018/04/10"

        // THEN
        XCTAssertNotNil(expectedDate)
        XCTAssertEqual(helper.getDateString(date: expectedDate!), expectedStringDate)
    }

    func test_shouldReturn_positiveNumberOfDaysBetween() {
        // GIVEN
        let from = helper.fromUTCToDate(dateString: "2018-04-10T04:00:00.000Z")
        let to = helper.fromUTCToDate(dateString: "2018-04-30T04:00:00.000Z")
        let expectedNumberOfDays = 20

        // THEN
        XCTAssertNotNil(from)
        XCTAssertNotNil(to)
        XCTAssertEqual(helper.numberOfDaysBetween(from!, and: to!), expectedNumberOfDays)
    }
    
    func test_shouldReturn_negativeNumberOfDaysBetween() {
        // GIVEN
        let from = helper.fromUTCToDate(dateString: "2019-04-10T04:00:00.000Z")
        let to = helper.fromUTCToDate(dateString: "2018-04-30T04:00:00.000Z")
        let expectedNumberOfDays = -345

        // THEN
        XCTAssertNotNil(from)
        XCTAssertNotNil(to)
        XCTAssertEqual(helper.numberOfDaysBetween(from!, and: to!), expectedNumberOfDays)
    }
    
    func test_shouldReturn_zero() {
        // GIVEN
        let from = helper.fromUTCToDate(dateString: "2019-04-10T04:00:00.000Z")
        let to = helper.fromUTCToDate(dateString: "2019-04-10T04:00:00.000Z")
        let expectedNumberOfDays = 0

        // THEN
        XCTAssertNotNil(from)
        XCTAssertNotNil(to)
        XCTAssertEqual(helper.numberOfDaysBetween(from!, and: to!), expectedNumberOfDays)
    }

    func test_shouldReturn_UTCDayFormatted() {
        // GIVEN
        let expected = "2018/04/10 - 5:00 AM"

        // THEN
        XCTAssertEqual(helper.getUTCDayFormatted(dateString: "2018-04-10T04:00:00.000Z"), expected)
    }

    func test_shouldReturn_DateToUTC() {
        // GIVEN
        let expected = "2018-04-10T04:00:00.000Z"
        let date = helper.fromUTCToDate(dateString: expected)

        // THEN
        XCTAssertNotNil(date)
        XCTAssertEqual(helper.fromDateToUTC(date: date!), expected)
    }
    
    func test_shouldReturn_numberOfDaysNegative() {
        // GIVEN
        let expected = false
        let mockDate = "2018-04-10T04:00:00.000Z"
        let date = helper.fromUTCToDate(dateString: mockDate)

        // THEN
        XCTAssertNotNil(date)
        XCTAssertEqual(helper.isUpcomingDate(launchDate: date!), expected)
    }
    
    func test_shouldReturn_numberOfDaysPositive() {
        // GIVEN
        let expected = true
        let mockDate = "2050-04-10T04:00:00.000Z"
        let date = helper.fromUTCToDate(dateString: mockDate)

        // THEN
        XCTAssertNotNil(date)
        XCTAssertEqual(helper.isUpcomingDate(launchDate: date!), expected)
    }

}
