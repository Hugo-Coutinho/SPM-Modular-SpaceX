//
//  HomeCompanySectionPresenterTests.swift
//  SpaceXTests
//
//  Created by hugo.coutinho on 16/12/21.
//  Copyright © 2021 . All rights reserved.
//

import XCTest
import Company

class CompanyPresenterTests: XCTestCase {

    // MARK: - DECLARATIONS -
    var companyDomainResult: CompanyDomain?
    var isCompanyError: Bool = false
    private var expectedInfo: String = ["SpaceX was founded by Elon Musk in 2002.\n\nIt has now 7000 employees, ",
                                        "3 Company sites, and is valued at USD $27500000000.00"].joined()

    // MARK: - OVERRIDE TESTS FUNCTIONS -
    override func tearDown() {
        super.tearDown()
        self.companyDomainResult = nil
        self.isCompanyError = false
        self.expectedInfo = ""
    }

    func test_outputNotRetained() {
        // 1. GIVEN
        var outputSpy: CompanyPresenterOutput? = CompanyPresenterOutputSpy()
        let sut = makeSUT()

        // 2. WHEN
        sut.output = outputSpy
        outputSpy = nil

        // 3. THEN
        XCTAssertNil(sut.output, "output should have been deallocated. Potential memory leak!")
    }

    func test_PresenterNotRetained() {
        // 1. GIVEN
        var sut: CompanyPresenter? = makeSUT()

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
extension CompanyPresenterTests: CompanyPresenterOutput {
    func handleSuccess(domain: CompanyDomain) {
        companyDomainResult = domain
    }

    func removeSection() {
        isCompanyError = true
    }
}

// MARK: - MAKE SUT -
extension CompanyPresenterTests {
    private func makeSUT() -> CompanyPresenter {
        let baseRequestSpy = BaseRequestSuccessHandlerSpy(service: .company)
        let service = CompanyService(baseRequest: baseRequestSpy)
        let interactorSpy = CompanyInteractor(service: service)
        let sut = CompanyPresenter(input: interactorSpy)
        interactorSpy.output = sut
        return sut
    }

    private func makeSUTErrorHandler() -> CompanyPresenter {
        let baseRequestSpy = BaseRequestErrorHandlerSpy()
        let service = CompanyService(baseRequest: baseRequestSpy)
        let interactor = CompanyInteractor(service: service)
        let sut = CompanyPresenter(input: interactor)
        interactor.output = sut
        return sut
    }
}
