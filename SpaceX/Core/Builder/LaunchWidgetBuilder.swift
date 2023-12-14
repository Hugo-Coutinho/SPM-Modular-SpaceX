//
//  LaunchWidgetBuilder.swift
//  SpaceX
//
//  Created by Hugo on 30/09/2022.
//

import UIKit
import UIComponent
import HGNetworkLayer
import Launch
import Core

public final class LaunchWidgetBuilder {

    // MARK: - CONSTRUCTOR -
    public init() {}

    public func make(domain: LaunchWidgetDomain) -> LaunchWidget? {
        guard let upcomingLaunchImageURL = URL(string: APIConstant.upcomingImageUrlString),
              let pastLaunchImageURL = URL(string: APIConstant.pastImageUrlString),
              let allLaunchImageURL = URL(string: APIConstant.allImageUrlString) else { return nil }
        let launchWidget = LaunchWidget()
        let upcomingLaunchDomain = BannerDomain(imageURL: upcomingLaunchImageURL, title: LaunchType.upcoming.longTitle)
        let pastLaunchDomain = BannerDomain(imageURL: pastLaunchImageURL, title: LaunchType.past.longTitle)
        let allLaunchDomain = BannerDomain(imageURL: allLaunchImageURL, title: LaunchType.all.longTitle)
        launchWidget.setupInfo(domain: domain,
                               upcomingLaunchDomain: upcomingLaunchDomain,
                               pastLaunchDomain: pastLaunchDomain,
                               allLaunchDomain: allLaunchDomain)
        return launchWidget
    }
}
