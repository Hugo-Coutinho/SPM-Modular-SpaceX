//
//  AstronautPresenterTests.swift
//  SpaceXTests
//
//  Created by Hugo Coutinho on 2024-01-05.
//

import XCTest
import Astronaut

class AstronautPresenterTests: XCTestCase {

    // MARK: - DECLARATIONS -
    var astronautDomainResult: AstronautDomain?
    var isAstronautError: Bool = false
    private lazy var expectedProfileImage: String = "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/astronaut_images/marcos2520pontes_image_20181201212435.jpg"

    // MARK: - OVERRIDE TESTS FUNCTIONS -
    override func tearDown() {
        super.tearDown()
        self.astronautDomainResult = nil
        self.isAstronautError = false
        self.expectedProfileImage = ""
    }

    func test_outputNotRetained() {
        // 1. GIVEN
        var outputSpy: AstronautPresenterOutput? = AstronautPresenterOutputSpy()
        let sut = makeSUT()

        // 2. WHEN
        sut.output = outputSpy
        outputSpy = nil

        // 3. THEN
        XCTAssertNil(sut.output, "output should have been deallocated. Potential memory leak!")
    }

    func test_PresenterNotRetained() {
        // 1. GIVEN
        var sut: AstronautPresenter? = makeSUT()

        // 2. WHEN
        sut?.getAstronauts()
        weak var weakSUT = sut
        sut = nil

        // 3. THEN
        XCTAssertNil(weakSUT)
    }

    func test_handleSuccess_astronauts() {
        // 1. GIVEN
        let sut = makeSUT()
        sut.output = self

        // 2. WHEN
        sut.getAstronauts()

        // 3. THEN
        XCTAssertNotNil(self.astronautDomainResult)
        XCTAssertEqual(2, self.astronautDomainResult?.profiles.count)
        XCTAssertEqual(self.expectedProfileImage, self.astronautDomainResult?.profiles.first?.absoluteString)
    }

    func test_shouldHandleError_astronauts() {
        // 1. GIVEN
        let sut = makeSUTErrorHandler()
        sut.output = self

        // 2. WHEN
        sut.getAstronauts()

        // 3. THEN
        XCTAssertNil(self.astronautDomainResult)
        XCTAssertTrue(self.isAstronautError)
    }
}

// MARK: - MAKE SUT -
extension AstronautPresenterTests: AstronautPresenterOutput {
    func handleSuccess(domain: AstronautDomain) {
        astronautDomainResult = domain
    }

    func removeSection() {
        isAstronautError = true
    }
}

// MARK: - MAKE SUT -
extension AstronautPresenterTests {
    private func makeSUT() -> AstronautPresenter {
        let baseRequestSpy = BaseRequestSuccessHandlerSpy(service: .astronaut)
        let service = AstronautService(baseRequest: baseRequestSpy)
        let interactorSpy = AstronautInteractor(service: service)
        let sut = AstronautPresenter(input: interactorSpy)
        interactorSpy.output = sut
        return sut
    }

    private func makeSUTErrorHandler() -> AstronautPresenter {
        let baseRequestSpy = BaseRequestErrorHandlerSpy()
        let service = AstronautService(baseRequest: baseRequestSpy)
        let interactor = AstronautInteractor(service: service)
        let sut = AstronautPresenter(input: interactor)
        interactor.output = sut
        return sut
    }
}
