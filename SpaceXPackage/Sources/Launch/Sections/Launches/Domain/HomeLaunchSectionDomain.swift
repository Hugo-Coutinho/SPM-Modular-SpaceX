//
//  HomeLaunchSectionDomain.swift
//  SpaceX
//
//  Created by hugo.coutinho on 16/12/21.
//  Copyright © 2021 . All rights reserved.
//

import Foundation
import Core
import Network

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
        return launches.compactMap({ (current) -> LaunchDomain? in
            guard let missionName = current.missionName,
                  let launchDateString = current.launchDate,
                  let details = current.details,
                  let year = current.launchYear,
                  let launchDate = dateHelper.fromUTCToDate(dateString: launchDateString),
                  let rocket = current.rocket,
                  let rocketName = rocket.rocketName,
                  let RocketType = rocket.rocketType,
                  let link = current.links,
                  let patch = link.missionPatch,
                  let imageURL = URL(string: patch),
                  let articleURL = URL(string: link.articleUrl ?? APIConstant.spaceXHomeURLString) else { return nil }
            let isLaunchSuccess = current.launchSuccess ?? false
            let days = getDaysMessage(launchDate: launchDate, dateHelper: dateHelper)
            let daysDescription = getDaysDescriptionMessage(launchDate: launchDate, dateHelper: dateHelper)
            let date = dateHelper.getUTCDayFormatted(dateString: launchDateString)
            let rocketString = "\(rocketName) / \(RocketType)"

            return LaunchDomain(missionName: missionName,
                                date: date,
                                details: details,
                                rocket: rocketString,
                                days: days,
                                daysDescription: daysDescription,
                                launchYear: year,
                                isLaunchSuccess: isLaunchSuccess,
                                imageURL: imageURL,
                                articleURL: articleURL)
        })
    }

    private func getDaysDescriptionMessage(launchDate: Date, dateHelper: DateHelper) -> String {
        let today = Date()
        let totalDays = dateHelper.numberOfDaysBetween(launchDate, and: today)
        if totalDays > 0 {
            return "\(totalDays) days\n since now:"

        } else if totalDays == 0 {
            return "now"
        }
        else {
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
        }
        else {
            return "\(dateHelper.getDateString(date: launchDate)) - \(dateHelper.getDateString(date: today))"
        }
    }
}

// MARK: - LAUNCH ITEM -
public struct LaunchDomain {
    public let missionName, date, details, rocket, days, daysDescription, launchYear: String
    public let isLaunchSuccess: Bool
    public let imageURL, articleURL: URL
}

public typealias LaunchDomainItems = [LaunchDomain]

public enum LaunchType {
    case upcoming, past, all
}
