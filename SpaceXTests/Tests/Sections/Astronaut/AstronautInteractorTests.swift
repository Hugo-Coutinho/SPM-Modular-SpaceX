//
//  AstronautInteractorTests.swift
//  SpaceXTests
//
//  Created by Hugo Coutinho on 2024-01-05.
//

import XCTest
import Astronaut

class AstronautInteractorTests: XCTestCase {

    // MARK: - DECLARATIONS -
    var astronautEntityResult: AstronautsEntity?
    var isAstronautError: Bool = false
    private var expectedProfileImage: String = "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/astronaut_images/marcos2520pontes_image_20181201212435.jpg"

    // MARK: - OVERRIDE TESTS FUNCTIONS -
    override func tearDown() {
        super.tearDown()
        self.astronautEntityResult = nil
        self.isAstronautError = false
        self.expectedProfileImage = ""
    }

    func test_outputNotRetained() {
        // 1. GIVEN
        var outputSpy: AstronautInteractorOutput? = AstronautInteractorOutputSpy()
        let sut = makeSUT()

        // 2. WHEN
        sut.output = outputSpy
        outputSpy = nil

        // 3. THEN
        XCTAssertNil(sut.output, "output should have been deallocated. Potential memory leak!")
    }

    func test_interactorNotRetained() {
        // 1. GIVEN
        var sut: AstronautInteractor? = makeSUT()

        // 2. WHEN
        sut?.getAstronauts()
        weak var sutWeak = sut
        sut = nil

        // 3. THEN
        XCTAssertNil(sutWeak)
    }

    func test_shouldHandleSuccess_astronaut() {
        // 1. GIVEN
        let sut = makeSUT()
        sut.output = self

        // 2. WHEN
        sut.getAstronauts()

        // 3. THEN
        XCTAssertNotNil(self.astronautEntityResult)
        XCTAssertEqual(expectedProfileImage, self.astronautEntityResult?.first?.profileImage)
    }

    func test_shouldHandleError_astronaut() {
        // 1. GIVEN
        let sut = makeSUTErrorHandler()
        sut.output = self

        // 2. WHEN
        sut.getAstronauts()

        // 3. THEN
        XCTAssertTrue(self.isAstronautError)
    }
}

// MARK: - OUTPUT -
extension AstronautInteractorTests: AstronautInteractorOutput {
    func handleSuccess(astronauts: AstronautsEntity) {
        astronautEntityResult = astronauts
    }

    func removeSection() {
        astronautEntityResult = nil
        isAstronautError = true
    }
}

// MARK: - MAKE SUT -
extension AstronautInteractorTests {
    private func makeSUT() -> AstronautInteractor {
        let baseRequestSpy = BaseRequestSuccessHandlerSpy(service: .astronaut)
        let serviceSpy = AstronautService(baseRequest: baseRequestSpy)
        return AstronautInteractor(service: serviceSpy)
    }

    private func makeSUTErrorHandler() -> AstronautInteractor {
        let baseRequestSpy = BaseRequestErrorHandlerSpy()
        let service = AstronautService(baseRequest: baseRequestSpy)
        return AstronautInteractor(service: service)
    }
}
