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
    public static let upcomingImageUrlString = "https://ychef.files.bbci.co.uk/976x549/p0bgc3nn.jpg"
    public static let pastImageUrlString = "https://www.grunge.com/img/gallery/the-unexpected-creature-caught-on-film-during-a-rocket-launch/l-intro-1662747807.jpg"
    public static let allImageUrlString = "https://img.freepik.com/premium-photo/space-rocket-launch-ship-concept-business-product-market-spaceship-takes-off-starry-sky-rocket-space-ship-mixed-media_338491-12881.jpg"
}
