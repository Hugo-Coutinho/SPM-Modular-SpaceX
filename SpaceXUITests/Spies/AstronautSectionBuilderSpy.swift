//
//  AstronautSectionBuilderSpy.swift
//  SpaceXUITests
//
//  Created by Hugo Coutinho on 2024-01-06.
//

import Foundation
import Astronaut

final class AstronautSectionBuilderSpy: AstronautBuilderInput {
    func make() -> AstronautWidget {
        let widget = AstronautWidget()
        let presenter = makePresenter(widget: widget)
        widget.presenter = presenter
        widget.setupAstronauts()
        return widget
    }
}

// MARK: - ASSISTANT METHODS -
extension AstronautSectionBuilderSpy {
    // MARK: - PRESENTER BUILDER -
    private func makePresenter(widget: AstronautWidget) -> AstronautPresenter {
        let service = AstronautService(baseRequest: BaseRequestSuccessHandlerSpy(service: .astronaut))
        let interactor = AstronautInteractor(service: service)
        let presenter = AstronautPresenter(input: interactor)
        interactor.output = presenter
        presenter.output = widget
        return presenter
    }
}

