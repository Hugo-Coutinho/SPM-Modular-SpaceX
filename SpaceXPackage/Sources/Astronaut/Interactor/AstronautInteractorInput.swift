//
//  AstronautInteractorInput.swift
//  SpaceX
//
//  Created by hugo.coutinho on 16/12/21.
//  Copyright © 2021 . All rights reserved.
//

import Foundation

// MARK: - INTERACTOR INPUT PROTOCOL -
public protocol AstronautInteractorInput: AnyObject {

    // MARK: - VARIABLES -
    var output: AstronautInteractorOutput? { get set }
    var service: AstronautServiceInput { get set }

    // MARK: - INPUT METHODS -
    func getAstronauts()
}

// MARK: - INTERACTOR OUTPUT PROTOCOL -
public protocol AstronautInteractorOutput: AnyObject {
    // MARK: - OUTPUT METHODS -
    func handleSuccess(astronauts: AstronautsEntity)
    func removeSection()
}
