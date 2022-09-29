//
//  HomeCompanySectionPresenter.swift
//  SpaceX
//
//  Created by hugo.coutinho on 16/12/21.
//  Copyright © 2021 . All rights reserved.
//

import Foundation

public class CompanyPresenter: CompanyPresenterInput {

    // MARK: - VARIABLES -
    public weak var output: CompanyPresenterOutput?
    public var input: CompanyInteractorInput

    // MARK: - CONSTRUCTORS -
    public init(input: CompanyInteractorInput) {
        self.input = input
    }

    // MARK: - INPUT -
    public func getInfo() {
        self.input.getInfo()
    }
}

// MARK: - INTERACTOR OUTPUT -
extension CompanyPresenter: CompanyInteractorOutput {
    public func handleSuccess(info: InfoEntity) {
        self.output?.handleSuccess(domain: CompanyDomain(info: info))
    }

    public func removeSection() {
        self.output?.removeSection()
    }
}


