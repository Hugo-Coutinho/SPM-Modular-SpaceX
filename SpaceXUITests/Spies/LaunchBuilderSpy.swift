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
        let vc = LaunchViewController()
        vc.homeSections = [
            HomeLaunchSectionBuilderSpy().make(output: vc)
        ]
        return vc
    }
}
