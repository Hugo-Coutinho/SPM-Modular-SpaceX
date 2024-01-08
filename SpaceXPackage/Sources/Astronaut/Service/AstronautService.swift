//
//  AstronautService.swift
//  SpaceX
//
//  Created by hugo.coutinho on 16/12/21.
//  Copyright © 2021 . All rights reserved.
//

import Foundation
import HGNetworkLayer
import Core

public class AstronautService: AstronautServiceInput {

    // MARK: - VARIABLES -
    public var baseRequest: BaseRequestInput

    // MARK: - CONSTRUCTOR -
    public init(baseRequest: BaseRequestInput) {
        self.baseRequest = baseRequest
    }

    public func getAstronauts(completionHandler: @escaping (Data?) -> Void) {
        baseRequest.doRequest(urlString: APIConstant.baseURLString + APIConstant.astronaut) { resultData in
            completionHandler(resultData)
        }
    }
}
