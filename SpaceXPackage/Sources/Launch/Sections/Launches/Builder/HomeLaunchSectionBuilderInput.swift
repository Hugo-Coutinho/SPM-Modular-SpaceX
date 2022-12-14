//
//  HomeLaunchSectionBuilderInput.swift
//  SpaceX
//
//  Created by Hugo on 19/03/2022.
//

import Foundation

public protocol HomeLaunchSectionBuilderInput {
    func make(with type: LaunchType,
              output: HomeLaunchSectionOutput) -> HomeLaunchSection
}
