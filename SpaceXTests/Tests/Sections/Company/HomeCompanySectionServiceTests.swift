//
//  HomeCompanySectionServiceTests.swift
//  SpaceXTests
//
//  Created by hugo.coutinho on 16/12/21.
//  Copyright © 2021 . All rights reserved.
//

import XCTest
import Company

class HomeCompanySectionServiceTests: XCTestCase {
    func test_ServiceNotRetained() {
        // 1. GIVEN
        var sut: CompanyInteractor? = makeSUT()

        // 2. WHEN
        sut?.getInfo()
        weak var weakSUT = sut
        sut = nil

        // 3. THEN
        XCTAssertNil(weakSUT)
    }
}

// MARK: - MAKE SUT -
extension HomeCompanySectionServiceTests {
    private func makeSUT() -> CompanyInteractor {
        let baseRequestSpy = BaseRequestSuccessHandlerSpy(service: .company)
        let service = CompanyService(baseRequest: baseRequestSpy)
        return CompanyInteractor(service: service)
    }
}
