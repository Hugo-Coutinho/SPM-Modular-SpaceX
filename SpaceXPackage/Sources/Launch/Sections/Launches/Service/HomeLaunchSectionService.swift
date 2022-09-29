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
    
    // MARK: - CONSTRUCTOR -
    public init(baseRequest: BaseRequestInput) {
        self.baseRequest = baseRequest
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
        return APIConstant.baseURLString + APIConstant.launches + String(format: launchQueryString, "\(offSet)")
    }
}
