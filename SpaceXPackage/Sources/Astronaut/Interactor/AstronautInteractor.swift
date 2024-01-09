//
//  AstronautInteractor.swift
//  SpaceX
//
//  Created by hugo.coutinho on 16/12/21.
//  Copyright © 2021 . All rights reserved.
//

import Foundation

public class AstronautInteractor: AstronautInteractorInput {

    // MARK: - VARIABLES -
    public weak var output: AstronautInteractorOutput?
    public var service: AstronautServiceInput

    // MARK: - CONSTRUCTOR -
    public init(service: AstronautServiceInput) {
        self.service = service
    }
    public func getAstronauts() {
        service.getAstronauts { [weak self] dataResult in
            guard let strongSelf = self else { return }
            if let data = dataResult {
                strongSelf.decode(data: data)
            } else {
                strongSelf.output?.removeSection()
            }
        }
    }
}

// MARK: - ASSISTANT METHODS -
extension AstronautInteractor {
    private func decode(data: Data) {
        do {
            let result = try JSONDecoder().decode(AstronautResult.self, from: data)
            output?.handleSuccess(astronauts: result.astronauts)

        } catch {
            print("error scene")
            output?.removeSection()
        }
    }
}
