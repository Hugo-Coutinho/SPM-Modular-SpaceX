//
//  HomeLaunchSectionDomain.swift
//  SpaceX
//
//  Created by hugo.coutinho on 16/12/21.
//  Copyright © 2021 . All rights reserved.
//

import Foundation
import Core
import HGNetworkLayer

public struct HomeLaunchSectionDomain {
    // MARK: - PROPERTIES -
    public var launches: LaunchDomainItems = []

    // MARK: - INITIALIZATION -
    public init() {}

    public init(launches: Launches, dateHelper: DateHelper) {
        self.launches = self.mapLaunches(launches: launches, dateHelper: dateHelper)
    }

    // MARK: - EXPOSED METHODS -
    public mutating func getLaunchesFilteredBy(text: String) {
        launches = launches.filter({ $0.launchYear.lowercased().contains(text.lowercased()) })
    }

    public mutating func getLaunchesAscendingOrder() {
        launches =  launches.sorted(by: { (lItem: LaunchDomain, rItem: LaunchDomain) -> Bool in
            return lItem.launchYear < rItem.launchYear })
    }

    public mutating func getLaunchesDescendingOrder() {
        launches = launches.sorted(by: { (lItem: LaunchDomain, rItem: LaunchDomain) -> Bool in
            return lItem.launchYear > rItem.launchYear })
    }
}

// MARK: - AUX METHODS -
extension HomeLaunchSectionDomain {
    private func mapLaunches(launches: Launches, dateHelper: DateHelper) -> LaunchDomainItems {
        return launches.compactMap { current in
            guard
                let mission = current.mission,
                let missionName = mission.name,
                let launchDateString = current.net,
                let launchDate = dateHelper.fromUTCToDate(dateString: launchDateString),
                let pad = current.pad,
                let site = pad.location,
                let siteName = site.name,
                let year = current.windowEnd,
                let rocket = current.rocket,
                let configuration = rocket.configuration,
                let rocketName = configuration.name,
                let imageURL = URL(string: current.image ?? APIConstant.defaultRocketURLString),
                let articleURL = URL(string: current.url ?? APIConstant.spaceXHomeURLString),
                let status = current.status
            else { return nil }

            let isLaunchSuccess = status.id == 3
            let date = dateHelper.getUTCDayFormatted(dateString: launchDateString)
            let launchYear = dateHelper.getUTCDayFormatted(dateString: launchDateString, onlyYear: true)

            return LaunchDomain(
                missionName: missionName,
                date: date,
                rocket: rocketName,
                launchYear: launchYear,
                siteName: siteName,
                isLaunchSuccess: isLaunchSuccess,
                isUpcomingLaunch: dateHelper.isUpcomingDate(launchDate: launchDate),
                imageURL: imageURL,
                articleURL: articleURL
            )
        }
    }

    private func getDaysDescriptionMessage(launchDate: Date, dateHelper: DateHelper) -> String {
        let today = Date()
        let totalDays = dateHelper.numberOfDaysBetween(launchDate, and: today)
        if totalDays > 0 {
            return "\(totalDays) days\n since now:"
        } else if totalDays == 0 {
            return "now"
        } else {
            return "\(abs(totalDays)) days\n from now:"
        }
    }

    private func getDaysMessage(launchDate: Date, dateHelper: DateHelper) -> String {
        let today = Date()
        let totalDays = dateHelper.numberOfDaysBetween(launchDate, and: today)
        if totalDays > 0 {
            return "\(dateHelper.getDateString(date: today)) - \(dateHelper.getDateString(date: launchDate))"
        } else if totalDays == 0 {
            return "today"
        } else {
            return "\(dateHelper.getDateString(date: launchDate)) - \(dateHelper.getDateString(date: today))"
        }
    }
}

// MARK: - LAUNCH ITEM -
public struct LaunchDomain {
    public let missionName, date, rocket, launchYear, siteName: String
    public let isLaunchSuccess, isUpcomingLaunch: Bool
    public let imageURL, articleURL: URL
}

public typealias LaunchDomainItems = [LaunchDomain]

public enum LaunchType {
    case upcoming, past, all
    public var longTitle: String {
        switch self {
        case .upcoming:
            return "Upcoming Launches"
        case .past:
            return "Past Launches"
        case .all:
            return "All Launches"
        }
    }
}
