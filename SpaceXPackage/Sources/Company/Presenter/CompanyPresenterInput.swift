//
//  HomeCompanySectionPresenterInput.swift
//  SpaceX
//
//  Created by hugo.coutinho on 16/12/21.
//  Copyright © 2021 . All rights reserved.
//

// MARK: - PRESENTER INPUT PROTOCOL -
public protocol CompanyPresenterInput: AnyObject {

    // MARK: - VARIABLES -
    var output: CompanyPresenterOutput? { get set }
    var input: CompanyInteractorInput { get set }

    // MARK: - INPUT METHODS -
    func getInfo()
}

// MARK: - PRESENTER OUTPUT PROTOCOL -
public protocol CompanyPresenterOutput: AnyObject {

    // MARK: - OUTPUT METHODS -
    func handleSuccess(domain: CompanyDomain)
    func removeSection()
}


