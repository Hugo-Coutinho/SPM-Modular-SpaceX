//
//  HomeCompanySectionPresenterTests.swift
//  SpaceXTests
//
//  Created by hugo.coutinho on 16/12/21.
//  Copyright © 2021 . All rights reserved.
//

import XCTest
import Launch

class HomeCompanySectionPresenterTests: XCTestCase {

    //MARK: - DECLARATIONS -
    var companyDomainResult: HomeCompanySectionDomain?
    var isCompanyError: Bool = false
    private var expectedInfo: String = "SpaceX was founded by Elon Musk in 2002.\n\n It has now 7000 employees, 3 Company sites, and is valued at USD $27500000000.00"

    //MARK: - OVERRIDE TESTS FUNCTIONS -
    override func tearDown() {
        super.tearDown()
        self.companyDomainResult = nil
        self.isCompanyError = false
        self.expectedInfo = ""
    }


    func test_outputNotRetained() {
        // 1. GIVEN
        var outputSpy: HomeCompanySectionPresenterOutput? = HomeCompanySectionPresenterOutputSpy()
        let sut = makeSUT()

        // 2. WHEN
        sut.output = outputSpy
        outputSpy = nil

        // 3. THEN
        XCTAssertNil(sut.output, "output should have been deallocated. Potential memory leak!")
    }

    func test_PresenterNotRetained() {
        // 1. GIVEN
        var sut: HomeCompanySectionPresenter? = makeSUT()

        // 2. WHEN
        sut?.getInfo()
        weak var weakSUT = sut
        sut = nil

        // 3. THEN
        XCTAssertNil(weakSUT)
    }

    func test_handleSuccess_info() {
        // 1. GIVEN
        let sut = makeSUT()
        sut.output = self

        // 2. WHEN
        sut.getInfo()

        // 3. THEN
        XCTAssertNotNil(self.companyDomainResult)
        XCTAssertEqual(expectedInfo, self.companyDomainResult?.info)
    }

    func test_shouldHandleError_info() {
        // 1. GIVEN
        let sut = makeSUTErrorHandler()
        sut.output = self

        // 2. WHEN
        sut.getInfo()

        // 3. THEN
        XCTAssertNil(self.companyDomainResult)
        XCTAssertTrue(self.isCompanyError)
    }
}

// MARK: - MAKE SUT -
extension HomeCompanySectionPresenterTests: HomeCompanySectionPresenterOutput {
    func handleSuccess(domain: HomeCompanySectionDomain) {
        companyDomainResult = domain
    }

    func removeSection() {
        isCompanyError = true
    }
}

// MARK: - MAKE SUT -
extension HomeCompanySectionPresenterTests {
    private func makeSUT() -> HomeCompanySectionPresenter {
        let baseRequestSpy = BaseRequestSuccessHandlerSpy(service: .company)
        let service = HomeCompanySectionService(baseRequest: baseRequestSpy)
        let interactorSpy = HomeCompanySectionInteractor(service: service)
        let sut = HomeCompanySectionPresenter(input: interactorSpy)
        interactorSpy.output = sut
        return sut
    }

    private func makeSUTErrorHandler() -> HomeCompanySectionPresenter {
        let baseRequestSpy = BaseRequestErrorHandlerSpy()
        let service = HomeCompanySectionService(baseRequest: baseRequestSpy)
        let interactor = HomeCompanySectionInteractor(service: service)
        let sut = HomeCompanySectionPresenter(input: interactor)
        interactor.output = sut
        return sut
    }
}


