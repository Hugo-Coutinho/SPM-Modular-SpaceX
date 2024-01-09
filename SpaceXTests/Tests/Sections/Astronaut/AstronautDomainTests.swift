//
//  AstronautDomainTests.swift
//  SpaceXTests
//
//  Created by Hugo Coutinho on 2024-01-06.
//

import XCTest
import Astronaut

class AstronautDomainTests: XCTestCase {

    private var sut: AstronautDomain?
    private var presenter: AstronautPresenterInput?

    // MARK: - OVERRIDE TESTS FUNCTIONS -
    override func setUp() {
        super.setUp()
        self.presenter = makeSUT()
        self.presenter?.getAstronauts()
    }

    override func tearDown() {
        super.tearDown()
        self.sut = nil
        self.presenter = nil
    }

    func test_shouldMatchURLStrings() {
        // 1. GIVEN
        let firstAbsolutString = "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/astronaut_images/marcos2520pontes_image_20181201212435.jpg"
        let secondAbsolutString = "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/astronaut_images/victor_correa_h_image_20220911034635.png"

        // 2. WHEN

        // 3. THEN
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut?.astronauts.count, 2)
        XCTAssertEqual(sut?.astronauts.first?.profile.absoluteString, firstAbsolutString)
        XCTAssertEqual(sut?.astronauts[1].profile.absoluteString, secondAbsolutString)
    }

    func test_shouldMatchNames() {
        // 1. GIVEN
        let firstAstronaut = "Marcos Pontes"
        let secondAstronaut = "Victor Correa Hespanha"

        // 2. WHEN

        // 3. THEN
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut?.astronauts.count, 2)
        XCTAssertEqual(sut?.astronauts.first?.name, firstAstronaut)
        XCTAssertEqual(sut?.astronauts[1].name, secondAstronaut)
    }
}

// MARK: - ASTRONAUT OUTPUT -
extension AstronautDomainTests: AstronautPresenterOutput {
    func handleSuccess(domain: AstronautDomain) {
        sut = domain
    }
    func removeSection() {
        sut = nil
    }
}

// MARK: - MAKE SUT -
extension AstronautDomainTests {
    private func makeSUT() -> AstronautPresenter {
        let baseRequestSpy = BaseRequestSuccessHandlerSpy(service: .astronaut)
        let serviceSpy = AstronautService(baseRequest: baseRequestSpy)
        let interactor = AstronautInteractor(service: serviceSpy)
        let presenter = AstronautPresenter(input: interactor)
        presenter.output = self
        interactor.output = presenter
        return presenter
    }
}
