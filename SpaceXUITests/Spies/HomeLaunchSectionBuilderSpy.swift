//
//  HomeLaunchBuilderSpy.swift
//  KIFSpaceXTests
//
//  Created by hugo.coutinho on 02/02/22.
//

import Foundation
import SpaceX
import Launch
import Network

final class HomeLaunchSectionBuilderSpy: HomeLaunchSectionBuilderInput {
    func make(with type: LaunchType = .all, output: HomeLaunchSectionOutput) -> HomeLaunchSection {
        let section = HomeLaunchSection()
        let presenter = makePresenter(with: type, section: section)
        section.launchType = type
        section.presenter = presenter
        section.delegate = output
        section.output = output
        section.startSection()
        return section
    }
}

// MARK: - AUX METHODS -
extension HomeLaunchSectionBuilderSpy {
    // MARK: - PRESENTER BUILDER -
    private func makePresenter(with type: LaunchType,
                               section: HomeLaunchSection) -> HomeLaunchSectionPresenter {
        let service = HomeLaunchSectionService(baseRequest: BaseRequestSuccessHandlerSpy(service: .launch),
                                               launchType: type)
        let interactor = HomeLaunchSectionInteractor(service: service)
        let presenter = HomeLaunchSectionPresenter(input: interactor)
        interactor.output = presenter
        presenter.output = section
        return presenter
    }
}
