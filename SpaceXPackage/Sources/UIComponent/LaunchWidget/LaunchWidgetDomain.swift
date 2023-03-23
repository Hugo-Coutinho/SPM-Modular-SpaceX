//
//  File.swift
//  
//
//  Created by Hugo on 30/09/2022.
//

import Foundation

public struct LaunchWidgetDomain {
    public let didSelectUpcomingLaunches: () -> Void
    public let didSelectPastLaunches: () -> Void
    public let didSelectAllLaunches: () -> Void

    public init(didSelectUpcomingLaunches: @escaping () -> Void,
                didSelectPastLaunches: @escaping () -> Void,
                didSelectAllLaunches: @escaping () -> Void) {
        self.didSelectUpcomingLaunches = didSelectUpcomingLaunches
        self.didSelectPastLaunches = didSelectPastLaunches
        self.didSelectAllLaunches = didSelectAllLaunches
    }
}
