//
//  File.swift
//  
//
//  Created by Hugo Coutinho on 2023-12-14.
//

public struct APIConstant {
    // MARK: - SPACEX PATH -
    public static let brazilianAstronaut = "/?nationality=Brazilian"
    public static let astronaut = "/astronaut" + brazilianAstronaut
    public static let launches = "/launch"
    public static let upcomingLaunches = launches + "/upcoming"
    public static let pastLaunches = launches + "/previous"
    // MARK: - SPACEX URL -
    public static let baseURLString = "https://lldev.thespacedevs.com/2.2.0"
    public static let spaceXHomeURLString = "https://www.space.com"
    public static let defaultRocketURLString = "https://storage.googleapis.com/pod_public/1300/150491.jpg"
    // MARK: - SPACEX BANNER URL -
    public static let upcomingImageUrlString = "https://media.timeout.com/images/105653190/image.jpg"
    public static let pastImageUrlString =
    ["https://www.grunge.com/img/gallery/",
     "the-unexpected-creature-caught-on-film-during-a-rocket-launch/l-intro-1662747807.jpg"].joined()
    public static let allImageUrlString =
    ["https://www.cnet.com/a/img/resize/8d22add9ceea83a850ccbb4adcf2ef7e5ec6eb7a/hub/",
       "2022/12/15/c15bb709-6ace-41b9-8747-812bb240a5bb/",
       "starship24staticfire.jpg?auto=webp&fit=crop&height=675&width=1200"].joined()
}
