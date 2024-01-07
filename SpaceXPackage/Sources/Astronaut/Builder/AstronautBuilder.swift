//
//  HomeCompanySectionSectionBuilder.swift
//  SpaceX
//
//  Created by hugo.coutinho on 16/12/21.
//  Copyright © 2021 . All rights reserved.
//

import UIKit
import UIComponent
import HGNetworkLayer

public final class AstronautBuilder: AstronautBuilderInput {

    // MARK: - CONSTRUCTOR -
    public init() {}

    public func make() -> AstronautWidget {
        let widget = AstronautWidget()
        let presenter = makePresenter(widget: widget)
        widget.presenter = presenter
        widget.setupAstronauts()
        return widget
    }
}

// MARK: - AUX METHODS -
extension AstronautBuilder {
    // MARK: - PRESENTER BUILDER -
    private func makePresenter(widget: AstronautWidget) -> AstronautPresenter {
        let service = AstronautService(baseRequest: BaseRequest())
        let interactor = AstronautInteractor(service: service)
        let presenter = AstronautPresenter(input: interactor)
        interactor.output = presenter
        presenter.output = widget
        return presenter
    }
}
