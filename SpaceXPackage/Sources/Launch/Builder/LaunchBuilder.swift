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

    public func make() -> ViewController {
        let vc = ViewController()
        vc.homeSections = [
            HomeLaunchSectionBuilder().make(output: vc)
        ]
        return vc
    }
}
