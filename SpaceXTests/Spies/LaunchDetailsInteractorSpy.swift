//
//  LaunchDetailsInteractorSpy.swift
//  SpaceXTests
//
//  Created by Hugo on 26/09/2022.
//

import Foundation
import Launch

class LaunchDetailsInteractorOutputSpy: LaunchDetailsInteractorOutput {
    func handleSuccess(launch: LaunchEntity) {}
    func removeSection() {}
}
