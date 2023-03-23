//
//  HomeBuilderSpy.swift
//  KIFSpaceXTests
//
//  Created by hugo.coutinho on 04/02/22.
//

import Foundation
import Launch

final class LaunchBuilderSpy: LaunchBuilderInput {
    func make(with type: LaunchType = .all) -> LaunchViewController {
        let launchViewController = LaunchViewController()
        launchViewController.homeSections = [
            HomeLaunchSectionBuilderSpy().make(output: launchViewController)
        ]
        return launchViewController
    }
}
