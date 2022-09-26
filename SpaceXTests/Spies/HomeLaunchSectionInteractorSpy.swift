//
//  HomeLaunchSectionInteractorMock.swift
//  SpaceXTests
//
//  Created by hugo.coutinho on 16/12/21.
//  Copyright © 2021 . All rights reserved.
//

import Foundation
import Launch

class HomeLaunchSectionInteractorOutputSpy: HomeLaunchSectionInteractorOutput {
    func handleSuccess(launches: Launches) {}
    func removeSection() {}
}
