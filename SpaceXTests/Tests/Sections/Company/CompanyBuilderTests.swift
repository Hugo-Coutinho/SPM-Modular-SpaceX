//
//  HomeBuilderSectionBuilderTests.swift
//  SpaceXTests
//
//  Created by hugo.coutinho on 18/12/21.
//  Copyright © 2021 . All rights reserved.
//

import XCTest
import Company
import UIComponent

class CompanyBuilderTests: XCTestCase {
    func test_shouldMakeNotNilLayers() {
        // 1. GIVEN
        let builder = CompanyBuilder()
        let widget = builder.make()
        let baseRequest = widget.presenter?.input.service.baseRequest
        let service = widget.presenter?.input.service
        let interactor = widget.presenter?.input
        let presenter = widget.presenter

        // 2. WHEN

        // 3. THEN
        XCTAssertNotNil(baseRequest)
        XCTAssertNotNil(service)
        XCTAssertNotNil(interactor)
        XCTAssertNotNil(presenter)
    }

    func test_shouldMakeNotNilOutputs() {
        // 1. GIVEN
        let builder = CompanyBuilder()
        let widget = builder.make()
        let interactorOutput = widget.presenter?.input.output
        let presenterOutput = widget.presenter?.output

        // 2. WHEN

        // 3. THEN
        XCTAssertNotNil(interactorOutput)
        XCTAssertNotNil(presenterOutput)
    }
}
