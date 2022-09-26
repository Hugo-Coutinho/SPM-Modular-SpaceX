//
//  LaunchDetailsInteractorTests.swift
//  SpaceXTests
//
//  Created by Hugo on 26/09/2022.
//

import XCTest
import Launch

class LaunchDetailsInteractorTests: XCTestCase {

    //MARK: - DECLARATIONS -
    var launchEntity: LaunchEntity?
    var launchEntityResult: LaunchEntity?
    var isLaunchError: Bool = false
    var expectedMissionName: String = "Merah Putih"

    //MARK: - OVERRIDE TESTS FUNCTIONS -
    override func setUp() {
        super.setUp()
        launchEntity = LaunchEntity(missionName: expectedMissionName)
    }

    override func tearDown() {
        super.tearDown()
        self.launchEntity = nil
        self.launchEntityResult = nil
        self.isLaunchError = false
    }

    func test_outputNotRetained() {
        // 1. GIVEN
        var outputSpy: LaunchDetailsInteractorOutputSpy? = LaunchDetailsInteractorOutputSpy()
        let sut = makeSUT()

        // 2. WHEN
        sut.output = outputSpy
        outputSpy = nil

        // 3. THEN
        XCTAssertNil(sut.output, "output should have been deallocated. Potential memory leak!")
    }

    func test_interactorNotRetained() {
        // 1. GIVEN
        var sut: LaunchDetailsInteractor? = makeSUT()

        // 2. WHEN
        sut?.getDetails(flightNumber: 0)
        weak var sutWeak = sut
        sut = nil

        // 3. THEN
        XCTAssertNil(sutWeak)
    }

    func test_shouldHandleSuccess_Launch() {
        // 1. GIVEN
        let sut = makeSUT()
        sut.output = self

        // 2. WHEN
        sut.getDetails(flightNumber: 0)

        // 3. THEN
        XCTAssertNotNil(self.launchEntity)
        XCTAssertNotNil(self.launchEntityResult)
        assert(self.launchEntity?.missionName == self.launchEntityResult?.missionName)
    }

    func test_shouldHandleError_Launch() {
        // 1. GIVEN
        let sut = makeSUTErrorHandler()
        sut.output = self

        // 2. WHEN
        sut.getDetails(flightNumber: 0)

        // 3. THEN
        XCTAssertTrue(self.isLaunchError)
    }
}

// MARK: - OUTPUT -
extension LaunchDetailsInteractorTests: LaunchDetailsInteractorOutput {
    func handleSuccess(launch: LaunchEntity) {
        launchEntityResult = launch
    }

    func removeSection() {
        launchEntityResult = nil
        isLaunchError = true
    }
}

// MARK: - MAKE SUT -
extension LaunchDetailsInteractorTests {
    private func makeSUT() -> LaunchDetailsInteractor {
        let baseRequestSpy = BaseRequestSuccessHandlerSpy(service: .launchDetails)
        let serviceSpy = LaunchDetailsService(baseRequest: baseRequestSpy)
        return LaunchDetailsInteractor(service: serviceSpy)
    }

    private func makeSUTErrorHandler() -> LaunchDetailsInteractor {
        let baseRequestSpy = BaseRequestErrorHandlerSpy()
        let service = LaunchDetailsService(baseRequest: baseRequestSpy)
        return LaunchDetailsInteractor(service: service)
    }
}

