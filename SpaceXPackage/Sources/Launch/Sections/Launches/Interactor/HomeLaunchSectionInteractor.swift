//
//  HomeLaunchSectionInteractor.swift
//  SpaceX
//
//  Created by hugo.coutinho on 16/12/21.
//  Copyright © 2021 . All rights reserved.
//

import Foundation

public class HomeLaunchSectionInteractor: HomeLaunchSectionInteractorInput {

    // MARK: - VARIABLES -
    public weak var output: HomeLaunchSectionInteractorOutput?
    public var service: HomeLaunchSectionServiceInput

    // MARK: - CONSTRUCTOR -
    public init(service: HomeLaunchSectionServiceInput) {
        self.service = service
    }

    // MARK: - INPUT METHODS -
    public func getLaunches(offSet: Int) {
        service.getLaunches(offSet: offSet) { [weak self] dataResult in
            guard let strongSelf = self else { return }
            if let data = dataResult {
                strongSelf.decodeLaunches(data: data)
            } else {
                strongSelf.output?.removeSection()
            }
        }
    }
}

// MARK: - ASSISTANT METHODS -
extension HomeLaunchSectionInteractor {
    private func decodeLaunches(data: Data) {
        do {
            let result = try JSONDecoder().decode(LaunchResult.self, from: data)
            output?.handleSuccess(launches: result.launches)

        } catch {
            print("error scene")
            output?.removeSection()
        }
    }
}
