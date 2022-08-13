//
//  HomeLaunchSectionBuilder.swift
//  SpaceX
//
//  Created by hugo.coutinho on 16/12/21.
//  Copyright © 2021 . All rights reserved.
//

import Foundation
import Network

public final class HomeLaunchSectionBuilder: HomeLaunchSectionBuilderInput {

    // MARK: - CONSTRUCTOR -
    public init(){}

    public func make(output: HomeLaunchSectionOutput) -> HomeLaunchSection {
        let section = HomeLaunchSection()
        let presenter = makePresenter(section: section)
        section.presenter = presenter
        section.delegate = output
        section.output = output
        section.startSection()
        return section
    }
}

// MARK: - AUX METHODS -
extension HomeLaunchSectionBuilder {
    // MARK: - PRESENTER BUILDER -
    private func makePresenter(section: HomeLaunchSection) -> HomeLaunchSectionPresenter {
        let service = HomeLaunchSectionService(baseRequest: BaseRequest())
        let interactor = HomeLaunchSectionInteractor(service: service)
        let presenter = HomeLaunchSectionPresenter(input: interactor)
        interactor.output = presenter
        presenter.output = section
        return presenter
    }
}

