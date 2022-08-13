//
//  BaseRequestInput.swift
//  SpaceX
//
//  Created by hugo.coutinho on 16/12/21.
//  Copyright © 2021 . All rights reserved.
//

import Foundation

public protocol BaseRequestInput: AnyObject {
    // MARK: - INPUT METHODS -
    func doRequest(urlString: String, completionHandler: @escaping (Data?) -> Void)
}

public struct APIConstant {
    public static let baseURLString = "https://api.spacexdata.com/v3"
    public static let info = "/info"
}
