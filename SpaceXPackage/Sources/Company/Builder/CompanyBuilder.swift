//
//  HomeCompanySectionSectionBuilder.swift
//  SpaceX
//
//  Created by hugo.coutinho on 16/12/21.
//  Copyright © 2021 . All rights reserved.
//

import UIKit
import UIComponent
import Network

public final class CompanyBuilder: CompanyBuilderInput {

    // MARK: - CONSTRUCTOR -
    public init(){}

    public func make() -> UIView {
        let widget = CompanyWidget()
        let presenter = makePresenter(widget: widget)
        widget.presenter = presenter
        widget.setupInfo()
        return widget
    }
}

// MARK: - AUX METHODS -
extension CompanyBuilder {
    // MARK: - PRESENTER BUILDER -
    private func makePresenter(widget: CompanyWidget) -> CompanyPresenter {
        let service = CompanyService(baseRequest: BaseRequest())
        let interactor = CompanyInteractor(service: service)
        let presenter = CompanyPresenter(input: interactor)
        interactor.output = presenter
        presenter.output = widget
        return presenter
    }
}

