//
//  File.swift
//  
//
//  Created by Hugo on 23/09/2022.
//

import Foundation
import Network

public class LaunchDetailsService: LaunchDetailsServiceInput {

    // MARK: - VARIABLES -
    public var baseRequest: BaseRequestInput

    // MARK: - CONSTRUCTOR -
    public init(baseRequest: BaseRequestInput) {
        self.baseRequest = baseRequest
    }

    public func getDetails(flightNumber: Int, completionHandler: @escaping (Data?) -> Void) {
        baseRequest.doRequest(urlString: getUrlString(flightNumber: flightNumber)) { resultData in
            completionHandler(resultData)
        }
    }
}

// MARK: - ASSISTANT METHODS -
extension LaunchDetailsService {
    private func getUrlString(flightNumber: Int) -> String {
        let flightNumberPath = "/\(flightNumber)"
        return APIConstant.baseURLString + APIConstant.launches + flightNumberPath
    }
}
