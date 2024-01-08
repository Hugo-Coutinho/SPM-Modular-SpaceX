//
//  AstronautPresenterInput.swift
//  SpaceX
//
//  Created by hugo.coutinho on 16/12/21.
//  Copyright © 2021 . All rights reserved.
//

// MARK: - PRESENTER INPUT PROTOCOL -
public protocol AstronautPresenterInput: AnyObject {

    // MARK: - VARIABLES -
    var output: AstronautPresenterOutput? { get set }
    var input: AstronautInteractorInput { get set }

    // MARK: - INPUT METHODS -
    func getAstronauts()
}

// MARK: - PRESENTER OUTPUT PROTOCOL -
public protocol AstronautPresenterOutput: AnyObject {

    // MARK: - OUTPUT METHODS -
    func handleSuccess(domain: AstronautDomain)
    func removeSection()
}
