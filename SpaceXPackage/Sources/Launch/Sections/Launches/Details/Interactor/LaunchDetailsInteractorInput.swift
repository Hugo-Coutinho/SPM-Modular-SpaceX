//
//  File.swift
//  
//
//  Created by Hugo on 26/09/2022.
//

import Foundation

// MARK: - INTERACTOR INPUT PROTOCOL -
public protocol LaunchDetailsInteractorInput: AnyObject {

    // MARK: - VARIABLES -
    var output: LaunchDetailsInteractorOutput? { get set }
    var service: LaunchDetailsServiceInput { get set }

    // MARK: - INPUT METHODS -
    func getDetails(flightNumber: Int)
}

// MARK: - INTERACTOR OUTPUT PROTOCOL -
public protocol LaunchDetailsInteractorOutput: AnyObject {

    // MARK: - OUTPUT METHODS -
    func handleSuccess(launch: LaunchEntity)
    func removeSection()
}
