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
    private let launch = "/launches"
    private let launchQueryString = "?limit=20&offset=%@"
    
    // MARK: - VARIABLES -
    public var baseRequest: BaseRequestInput

    // MARK: - CONSTRUCTOR -
    public init(baseRequest: BaseRequestInput) {
        self.baseRequest = baseRequest
    }

    public func getLaunches(offSet: Int, completionHandler: @escaping (Data?) -> Void) {
        let urlString = APIConstant.baseURLString + launch + String(format: launchQueryString, "\(offSet)")
        baseRequest.doRequest(urlString: urlString) { resultData in
            completionHandler(resultData)
        }
    }
}
