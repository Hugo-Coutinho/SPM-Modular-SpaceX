//
//  HomeCompanySectionInteractorInput.swift
//  SpaceX
//
//  Created by hugo.coutinho on 16/12/21.
//  Copyright © 2021 . All rights reserved.
//

import Foundation

// MARK: - INTERACTOR INPUT PROTOCOL -
public protocol CompanyInteractorInput: AnyObject {

    // MARK: - VARIABLES -
    var output: CompanyInteractorOutput? { get set }
    var service: CompanyServiceInput { get set }

    // MARK: - INPUT METHODS -
    func getInfo()
}

// MARK: - INTERACTOR OUTPUT PROTOCOL -
public protocol CompanyInteractorOutput: AnyObject {
    // MARK: - OUTPUT METHODS -
    func handleSuccess(info: InfoEntity)
    func removeSection()
}
