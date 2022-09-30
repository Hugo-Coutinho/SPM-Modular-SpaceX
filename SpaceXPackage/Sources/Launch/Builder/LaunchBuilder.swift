//
//  HomeBuilder.swift
//  SpaceX
//
//  Created by hugo.coutinho on 04/02/22.
//

import UIKit

public final class LaunchBuilder: LaunchBuilderInput {
    // MARK: - CONSTRUCTOR -
    public init(){}

    public func make(with type: LaunchType) -> LaunchViewController {
        let vc = LaunchViewController()
        vc.homeSections = [
            HomeLaunchSectionBuilder().make(with: type, output: vc)
        ]
        return vc
    }
}
