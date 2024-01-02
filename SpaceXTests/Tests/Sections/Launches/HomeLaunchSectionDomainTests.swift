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
    // MARK: - OVERRIDE TESTS FUNCTIONS -
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
        let expected = "1957/10/04"

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
        XCTAssert(sut!.launches.first!.isLaunchSuccess)
        XCTAssertNotEqual(sut?.launches.first?.imageURL.absoluteString, "")
        XCTAssertNotEqual(sut?.launches.first?.articleURL.absoluteString, "")
    }

    func test_shouldMatchRocket() {
        // 1. GIVEN
        let expected = "Sputnik 8K74PS"

        // 2. WHEN

        // 3. THEN
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut?.launches.first?.rocket, expected)
    }

    func test_shouldFilter_2007Launches() {
        // 1. GIVEN
        let yearExpected = "1957"
        let expected = "1957/10/04"
        let expectedName = "Sputnik 2"

        // 2. WHEN
        sut?.getLaunchesFilteredBy(text: yearExpected)

        // 3. THEN
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut?.launches.count, 3)
        XCTAssertEqual(sut?.launches.first?.date, expected)
        XCTAssertEqual(sut?.launches[1].missionName, expectedName)
    }

    func test_shouldSortYear_ascendingOrder() {
        // 1. GIVEN
        let firstYearExpected = "1957/10/04"
        let secondYearExpected = "1958/02/01"
        let thirdDateExpected = "1958/08/25"

        // 2. WHEN
        sut?.getLaunchesAscendingOrder()

        // 3. THEN
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut?.launches.count, 20)
        XCTAssertEqual(sut?.launches.first?.date, firstYearExpected)
        XCTAssertEqual(sut?.launches[3].date, secondYearExpected)
        XCTAssertEqual(sut?.launches.last?.date, thirdDateExpected)
    }

    func test_shouldSortYear_descendingOrder() {
        // 1. GIVEN
        let firstYearExpected = "1958/08/25"
        let secondYearExpected = "1957/12/06"
        let thirdYearExpected = "1957/10/04"

        // 2. WHEN
        sut?.getLaunchesDescendingOrder()

        // 3. THEN
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut?.launches.count, 20)
        XCTAssertEqual(sut?.launches.first?.date, firstYearExpected)
        XCTAssertEqual(sut?.launches[17].date, secondYearExpected)
        XCTAssertEqual(sut?.launches.last?.date, thirdYearExpected)
    }

    func test_shouldFormatteSite() {
        let expected = "Baikonur Cosmodrome, Republic of Kazakhstan"

        // 2. WHEN

        // 3. THEN
        XCTAssertEqual(sut?.launches.first?.siteName, expected)
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
