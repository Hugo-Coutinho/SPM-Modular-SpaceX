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
    // MARK: - SPACEX PATH -
    public static let info = "/info"
    public static let launches = "/launches"
    public static let upcomingLaunches = "/launches/upcoming"
    public static let pastLaunches = "/launches/past"
    
    // MARK: - SPACEX URL -
    public static let baseURLString = "https://api.spacexdata.com/v3"
    public static let spaceXHomeURLString = "https://www.space.com"
    
    // MARK: - SPACEX BANNER URL -
    public static let upcomingImageUrlString = "https://media.timeout.com/images/105653190/image.jpg"
    public static let pastImageUrlString = "https://www.grunge.com/img/gallery/the-unexpected-creature-caught-on-film-during-a-rocket-launch/l-intro-1662747807.jpg"
    public static let allImageUrlString = "https://www.cnet.com/a/img/resize/8d22add9ceea83a850ccbb4adcf2ef7e5ec6eb7a/hub/2022/12/15/c15bb709-6ace-41b9-8747-812bb240a5bb/starship24staticfire.jpg?auto=webp&fit=crop&height=675&width=1200"
}
