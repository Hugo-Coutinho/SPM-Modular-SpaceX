//
//  AstronautPresenter.swift
//  SpaceX
//
//  Created by hugo.coutinho on 16/12/21.
//  Copyright © 2021 . All rights reserved.
//

import Foundation

public class AstronautPresenter: AstronautPresenterInput {

    // MARK: - VARIABLES -
    public weak var output: AstronautPresenterOutput?
    public var input: AstronautInteractorInput

    // MARK: - CONSTRUCTORS -
    public init(input: AstronautInteractorInput) {
        self.input = input
    }

    // MARK: - INPUT -
    public func getAstronauts() {
        self.input.getAstronauts()
    }
}

// MARK: - INTERACTOR OUTPUT -
extension AstronautPresenter: AstronautInteractorOutput {
    public func handleSuccess(astronauts: AstronautsEntity) {
        self.output?.handleSuccess(domain: AstronautDomain(astronauts: astronauts))
    }

    public func removeSection() {
        self.output?.removeSection()
    }
}
