//
//  HomeLaunchSectionPresenter.swift
//  SpaceX
//
//  Created by hugo.coutinho on 16/12/21.
//  Copyright © 2021 . All rights reserved.
//

import Foundation
import Core

public class HomeLaunchSectionPresenter: HomeLaunchSectionPresenterInput {

    // MARK: - VARIABLES -
    public weak var output: HomeLaunchSectionPresenterOutput?
    public var input: HomeLaunchSectionInteractorInput

    // MARK: - CONSTRUCTORS -
    public init(input: HomeLaunchSectionInteractorInput) {
        self.input = input
    }

    // MARK: - INPUT -
    public func getLaunch(offSet: Int) {
        self.input.getLaunches(offSet: offSet)
    }
}

// MARK: - INTERACTOR OUTPUT -
extension HomeLaunchSectionPresenter: HomeLaunchSectionInteractorOutput {
    public func handleSuccess(launches: Launches) {
        self.output?.handleSuccess(domain: HomeLaunchSectionDomain(launches: launches, dateHelper: DateHelper()))
    }

    public func removeSection() {
        self.output?.removeSection()
    }
}
