//
//  LaunchDetailsServiceTests.swift
//  SpaceXTests
//
//  Created by Hugo on 23/09/2022.
//

import Foundation

import XCTest
import Launch

class LaunchDetailsServiceTests: XCTestCase {
    func test_ServiceNotRetained() {
        // 1. GIVEN
        var sut: LaunchDetailsInteractor? = makeSUT()

        // 2. WHEN
        sut?.getDetails(flightNumber: 0)
        weak var weakSUT = sut
        sut = nil

        // 3. THEN
        XCTAssertNil(weakSUT)
    }
}

// MARK: - MAKE SUT -
extension LaunchDetailsServiceTests {
    private func makeSUT() -> LaunchDetailsInteractor {
        let baseRequestSpy = BaseRequestSuccessHandlerSpy(service: .launchDetails)
        let service = LaunchDetailsService(baseRequest: baseRequestSpy)
        return LaunchDetailsInteractor(service: service)
    }
}



