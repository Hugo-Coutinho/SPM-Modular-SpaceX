//
//  HomeLaunchSectionService.swift
//  SpaceX
//
//  Created by hugo.coutinho on 16/12/21.
//  Copyright © 2021 . All rights reserved.
//

import Foundation
import Network

public class HomeLaunchSectionService: HomeLaunchSectionServiceInput {
    
    // MARK: - CONSTANT -
    private let launchQueryString = "?limit=20&offset=%@"
    
    // MARK: - VARIABLES -
    public var baseRequest: BaseRequestInput
    private var launchType: LaunchType
    
    // MARK: - CONSTRUCTOR -
    public init(baseRequest: BaseRequestInput,
                launchType: LaunchType = .all) {
        self.baseRequest = baseRequest
        self.launchType = launchType
    }
    
    public func getLaunches(offSet: Int, completionHandler: @escaping (Data?) -> Void) {
        baseRequest.doRequest(urlString: getUrlString(offSet: offSet)) { resultData in
            completionHandler(resultData)
        }
    }
}

// MARK: - ASSISTANT METHODS -
extension HomeLaunchSectionService {
    private func getUrlString(offSet: Int) -> String {
        switch launchType {
        case .all:
            return APIConstant.baseURLString + APIConstant.launches + String(format: launchQueryString, "\(offSet)")
        case .past:
            return APIConstant.baseURLString + APIConstant.pastLaunches + String(format: launchQueryString, "\(offSet)")
        case .upcoming:
            return APIConstant.baseURLString + APIConstant.upcomingLaunches + String(format: launchQueryString, "\(offSet)")
        }
    }
}
