//
//  LaunchWidgetBuilder.swift
//  SpaceX
//
//  Created by Hugo on 30/09/2022.
//

import UIKit
import UIComponent
import Network

public final class LaunchWidgetBuilder {
    
    // MARK: - CONSTRUCTOR -
    public init(){}
    
    public func make(domain: LaunchWidgetDomain) -> LaunchWidget? {
        guard let upcomingLaunchImageURL = URL(string: APIConstant.upcomingImageUrlString),
              let pastLaunchImageURL = URL(string: APIConstant.pastImageUrlString),
              let allLaunchImageURL = URL(string: APIConstant.allImageUrlString) else { return nil }
        let launchWidget = LaunchWidget()
        let upcomingLaunchDomain = BannerDomain(imageURL: upcomingLaunchImageURL, title: Constant.Home.upcomingLaunchBannerTitle)
        let pastLaunchDomain = BannerDomain(imageURL: pastLaunchImageURL, title: Constant.Home.pastLaunchBannerTitle)
        let allLaunchDomain = BannerDomain(imageURL: allLaunchImageURL, title: Constant.Home.allLaunchBannerTitle)
        
        launchWidget.setupInfo(domain: domain,
                               upcomingLaunchDomain: upcomingLaunchDomain,
                               pastLaunchDomain: pastLaunchDomain,
                               allLaunchDomain: allLaunchDomain)
        return launchWidget
    }
}
