//
//  HomeCompanySectionBuilderSpy.swift
//  KIFSpaceXTests
//
//  Created by hugo.coutinho on 02/02/22.
//

import Foundation
import Company

final class HomeCompanySectionBuilderSpy: CompanyBuilderInput {
    func make() -> CompanyWidget {
        let widget = CompanyWidget()
        let presenter = makePresenter(widget: widget)
        widget.presenter = presenter
        widget.setupInfo()
        return widget
    }
}

// MARK: - AUX METHODS -
extension HomeCompanySectionBuilderSpy {
    // MARK: - PRESENTER BUILDER -
    private func makePresenter(widget: CompanyWidget) -> CompanyPresenter {
        let service = CompanyService(baseRequest: BaseRequestSuccessHandlerSpy(service: .company))
        let interactor = CompanyInteractor(service: service)
        let presenter = CompanyPresenter(input: interactor)
        interactor.output = presenter
        presenter.output = widget
        return presenter
    }
}

