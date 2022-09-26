//
//  File.swift
//  
//
//  Created by Hugo on 26/09/2022.
//

import Foundation
import Network

// MARK: - SERVICE INPUT PROTOCOL -
public protocol LaunchDetailsServiceInput: AnyObject {
    // MARK: - VARIABLES -
    var baseRequest: BaseRequestInput { get set }

    // MARK: - INPUT METHODS -
    func getDetails(flightNumber: Int, completionHandler: @escaping (Data?) -> Void)
}
