//
//  HomeCompanySectionInteractor.swift
//  SpaceX
//
//  Created by hugo.coutinho on 16/12/21.
//  Copyright © 2021 . All rights reserved.
//

import Foundation

public class CompanyInteractor: CompanyInteractorInput {

    // MARK: - VARIABLES -
    public weak var output: CompanyInteractorOutput?
    public var service: CompanyServiceInput

    // MARK: - CONSTRUCTOR -
    public init(service: CompanyServiceInput) {
        self.service = service
    }
    public func getInfo() {
        service.getInfo { [weak self] dataResult in
            guard let strongSelf = self else { return }
            if let data = dataResult {
                strongSelf.decodeInfo(data: data)
            } else {
                strongSelf.output?.removeSection()
            }
        }
    }
}

// MARK: - AUX METHODS -
extension CompanyInteractor {
    private func decodeInfo(data: Data) {
        do {
            let info = try JSONDecoder().decode(InfoEntity.self, from: data)
            output?.handleSuccess(info: info)

        } catch {
            print("error scene")
            output?.removeSection()
        }
    }
}
