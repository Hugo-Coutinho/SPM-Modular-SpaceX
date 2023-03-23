//
//  HomeCompanySectionInteractorTests.swift
//  SpaceXTests
//
//  Created by hugo.coutinho on 16/12/21.
//  Copyright © 2021 . All rights reserved.
//

import XCTest
import Company

class CompanyInteractorTests: XCTestCase {

    // MARK: - DECLARATIONS -
    var infoEntityResult: InfoEntity?
    var isCompanyError: Bool = false
    private var expectedFounder: String = "Elon Musk"

    // MARK: - OVERRIDE TESTS FUNCTIONS -
    override func tearDown() {
        super.tearDown()
        self.infoEntityResult = nil
        self.isCompanyError = false
        self.expectedFounder = ""
    }

    func test_outputNotRetained() {
        // 1. GIVEN
        var outputSpy: CompanyInteractorOutput? = CompanyInteractorOutputSpy()
        let sut = makeSUT()

        // 2. WHEN
        sut.output = outputSpy
        outputSpy = nil

        // 3. THEN
        XCTAssertNil(sut.output, "output should have been deallocated. Potential memory leak!")
    }

    func test_interactorNotRetained() {
        // 1. GIVEN
        var sut: CompanyInteractor? = makeSUT()

        // 2. WHEN
        sut?.getInfo()
        weak var sutWeak = sut
        sut = nil

        // 3. THEN
        XCTAssertNil(sutWeak)
    }

    func test_shouldHandleSuccess_info() {
        // 1. GIVEN
        let sut = makeSUT()
        sut.output = self

        // 2. WHEN
        sut.getInfo()

        // 3. THEN
        XCTAssertNotNil(self.infoEntityResult)
        XCTAssertEqual(expectedFounder, self.infoEntityResult?.founder)
    }

    func test_shouldHandleError_info() {
        // 1. GIVEN
        let sut = makeSUTErrorHandler()
        sut.output = self

        // 2. WHEN
        sut.getInfo()

        // 3. THEN
        XCTAssertTrue(self.isCompanyError)
    }
}

// MARK: - OUTPUT -
extension CompanyInteractorTests: CompanyInteractorOutput {
    func handleSuccess(info: InfoEntity) {
        infoEntityResult = info
    }

    func removeSection() {
        infoEntityResult = nil
        isCompanyError = true
    }
}

// MARK: - MAKE SUT -
extension CompanyInteractorTests {
    private func makeSUT() -> CompanyInteractor {
        let baseRequestSpy = BaseRequestSuccessHandlerSpy(service: .company)
        let serviceSpy = CompanyService(baseRequest: baseRequestSpy)
        return CompanyInteractor(service: serviceSpy)
    }

    private func makeSUTErrorHandler() -> CompanyInteractor {
        let baseRequestSpy = BaseRequestErrorHandlerSpy()
        let service = CompanyService(baseRequest: baseRequestSpy)
        return CompanyInteractor(service: service)
    }
}
