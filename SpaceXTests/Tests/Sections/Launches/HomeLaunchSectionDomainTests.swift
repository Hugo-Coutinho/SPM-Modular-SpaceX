//
//  HomeLaunchSectionDomainTests.swift
//  SpaceXTests
//
//  Created by hugo.coutinho on 16/12/21.
//  Copyright © 2021 . All rights reserved.
//

import XCTest
import Core
import Launch

class HomeLaunchSectionDomainTests: XCTestCase {

    private lazy var dateHelper = DateHelper()
    private var sut: HomeLaunchSectionDomain?
    private var presenter: HomeLaunchSectionPresenterInput?
    
    //MARK: - OVERRIDE TESTS FUNCTIONS -
    override func setUp() {
        super.setUp()
        self.presenter = makeSUT()
        self.presenter?.getLaunch(offSet: 0)
    }

    override func tearDown() {
        super.tearDown()
        self.sut = nil
        self.presenter = nil
    }

    func test_shouldMatchDate() {
        // 1. GIVEN
        let expected = "2006/03/24 - 10:30 PM"

        // 2. WHEN

        // 3. THEN
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut?.launches.first?.date, expected)
    }

    func test_fields_notEmpty() {
        // 1. GIVEN

        // 2. WHEN

        // 3. THEN
        XCTAssertNotNil(sut)
        XCTAssertNotEqual(sut?.launches.first?.missionName, "")
        XCTAssertNotEqual(sut?.launches.first?.date, "")
        XCTAssertNotEqual(sut?.launches.first?.rocket, "")
        XCTAssertNotEqual(sut?.launches.first?.launchYear, "")
        XCTAssertFalse(sut!.launches.first!.isLaunchSuccess)
        XCTAssertNotEqual(sut?.launches.first?.imageURL.absoluteString, "")
        XCTAssertNotEqual(sut?.launches.first?.articleURL.absoluteString, "")
    }

    func test_shouldMatchRocket() {
        // 1. GIVEN
        let expected = "Falcon 1 / Merlin A"

        // 2. WHEN

        // 3. THEN
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut?.launches.first?.rocket, expected)
    }

    func test_shouldMatchDays_withSince() {
        // 1. GIVEN
        let currentDateAsString = dateHelper.getDateString(date: Date())
        let expected = "\(currentDateAsString) - 2006/03/24"

        // 2. WHEN


        // 3. THEN
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut?.launches.first?.days, expected)
    }

    func test_shouldMatchDays_withFromNow() {
        // 1. GIVEN
        let currentDateAsString = dateHelper.getDateString(date: Date())
        let expected = "2023/04/10 - \(currentDateAsString)"

        // 2. WHEN
        let result = sut?.launches.first(where: { $0.missionName.elementsEqual("DemoSat") })

        // 3. THEN
        XCTAssertNotNil(result)
        XCTAssertEqual(result?.days, expected)
    }

    func test_shouldMatchDaysDesc_withFromNow() {
        // 1. GIVEN
        let launchDateAsString = "2023-04-10T04:00:00.000Z"
        let launchDate = dateHelper.fromUTCToDate(dateString: launchDateAsString) ?? Date()
        let dayExpected = "\(abs(dateHelper.numberOfDaysBetween(launchDate, and: Date())))"
        let expected = "\(dayExpected) days\n from now:"

        // 2. WHEN
        let result = sut?.launches.first(where: { $0.missionName.elementsEqual("DemoSat") })

        // 3. THEN
        XCTAssertNotNil(result)
        XCTAssertEqual(result?.daysDescription, expected)
    }

    func test_shouldMatchDaysDesc_withSinceNow() {
        // 1. GIVEN
        let launchDateAsString = "2006-03-24T22:30:00.000Z"
        let launchDate = dateHelper.fromUTCToDate(dateString: launchDateAsString) ?? Date()
        let dayExpected = "\(abs(dateHelper.numberOfDaysBetween(launchDate, and: Date())))"
        let expected = "\(dayExpected) days\n since now:"

        // 2. WHEN
        let result = sut?.launches.first(where: { $0.missionName.elementsEqual("Falconzin Sat") })

        // 3. THEN
        XCTAssertNotNil(result)
        XCTAssertEqual(result?.daysDescription, expected)
    }

    func test_shouldFilter_2007Launches() {
        // 1. GIVEN
        let expected = "2007"
        let expectedName = "CRS-1"

        // 2. WHEN
        sut?.getLaunchesFilteredBy(text: expected)

        // 3. THEN
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut?.launches.count, 2)
        XCTAssertEqual(sut?.launches.first?.launchYear, expected)
        XCTAssertEqual(sut?.launches[1].missionName, expectedName)
    }

    func test_shouldSortYear_ascendingOrder() {
        // 1. GIVEN
        let firstItemExpected = "2006"
        let secondThirdItemsExpected = "2007"
        let fourthFifthItemExpected = "2008"
        let sixthItemExpected = "2009"


        // 2. WHEN
        sut?.getLaunchesAscendingOrder()

        // 3. THEN
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut?.launches.count, 9)
        XCTAssertEqual(sut?.launches.first?.launchYear, firstItemExpected)
        XCTAssertEqual(sut?.launches[1].launchYear, secondThirdItemsExpected)
        XCTAssertEqual(sut?.launches[2].launchYear, secondThirdItemsExpected)
        XCTAssertEqual(sut?.launches[3].launchYear, fourthFifthItemExpected)
        XCTAssertEqual(sut?.launches[4].launchYear, fourthFifthItemExpected)
        XCTAssertEqual(sut?.launches[5].launchYear, sixthItemExpected)
    }

    func test_shouldSortYear_descendingOrder() {
        // 1. GIVEN
        let firstItemExpected = "2012"
        let secondThirdItemsExpected = "2010"
        let fourthItemExpected = "2009"

        // 2. WHEN
        sut?.getLaunchesDescendingOrder()

        // 3. THEN
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut?.launches.count, 9)
        XCTAssertEqual(sut?.launches.first?.launchYear, firstItemExpected)
        XCTAssertEqual(sut?.launches[1].launchYear, secondThirdItemsExpected)
        XCTAssertEqual(sut?.launches[2].launchYear, secondThirdItemsExpected)
        XCTAssertEqual(sut?.launches[3].launchYear, fourthItemExpected)
    }

}

extension HomeLaunchSectionDomainTests: HomeLaunchSectionPresenterOutput {
    func handleSuccess(domain: Launch.HomeLaunchSectionDomain) {
        sut = domain
    }
    
    func removeSection() {
        sut = nil
    }
}

// MARK: - MAKE SUT -
extension HomeLaunchSectionDomainTests {
    private func makeSUT() -> HomeLaunchSectionPresenter {
        let baseRequestSpy = BaseRequestSuccessHandlerSpy(service: .launch)
        let serviceSpy = HomeLaunchSectionService(baseRequest: baseRequestSpy)
        let interactor = HomeLaunchSectionInteractor(service: serviceSpy)
        let presenter = HomeLaunchSectionPresenter(input: interactor)
        presenter.output = self
        interactor.output = presenter
        return presenter
    }
}

