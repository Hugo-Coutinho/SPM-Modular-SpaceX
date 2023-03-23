//
//  HomeBuilder.swift
//  SpaceX
//
//  Created by hugo.coutinho on 04/02/22.
//

import UIKit

public final class LaunchBuilder: LaunchBuilderInput {
    // MARK: - CONSTRUCTOR -
    public init() {}

    public func make(with type: LaunchType) -> LaunchViewController {
        let launchViewController = LaunchViewController()
        launchViewController.homeSections = [
            HomeLaunchSectionBuilder().make(with: type, output: launchViewController)
        ]
        return launchViewController
    }
}
