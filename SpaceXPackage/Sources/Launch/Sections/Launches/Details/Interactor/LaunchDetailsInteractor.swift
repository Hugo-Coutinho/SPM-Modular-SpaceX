//
//  File.swift
//  
//
//  Created by Hugo on 26/09/2022.
//

import Foundation

public class LaunchDetailsInteractor: LaunchDetailsInteractorInput {

    // MARK: - VARIABLES -
    public weak var output: LaunchDetailsInteractorOutput?
    public var service: LaunchDetailsServiceInput

    // MARK: - CONSTRUCTOR -
    public init(service: LaunchDetailsServiceInput) {
        self.service = service
    }

    // MARK: - INPUT METHODS -
    public func getDetails(flightNumber: Int) {
        service.getDetails(flightNumber: flightNumber) { [weak self] dataResult in
            guard let strongSelf = self else { return }
            if let data = dataResult {
                strongSelf.decodeLaunches(data: data)
            } else {
                strongSelf.output?.removeSection()
            }
        }
    }
}

// MARK: - AUX METHODS -
extension LaunchDetailsInteractor {
    private func decodeLaunches(data: Data) {
        do {
            let launch = try JSONDecoder().decode(LaunchEntity.self, from: data)
            output?.handleSuccess(launch: launch)

        } catch {
            print("error scene")
            output?.removeSection()
        }
    }
}

