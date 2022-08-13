//
//  HomeLaunchSectionInteractorInput.swift
//  SpaceX
//
//  Created by hugo.coutinho on 16/12/21.
//  Copyright © 2021 . All rights reserved.
//

import Foundation

// MARK: - INTERACTOR INPUT PROTOCOL -
public protocol HomeLaunchSectionInteractorInput: AnyObject {

    // MARK: - VARIABLES -
    var output: HomeLaunchSectionInteractorOutput? { get set }
    var service: HomeLaunchSectionServiceInput { get set }

    // MARK: - INPUT METHODS -
    func getLaunches(offSet: Int)
}

// MARK: - INTERACTOR OUTPUT PROTOCOL -
public protocol HomeLaunchSectionInteractorOutput: AnyObject {

    // MARK: - OUTPUT METHODS -
    func handleSuccess(launches: Launches)
    func removeSection()
}

