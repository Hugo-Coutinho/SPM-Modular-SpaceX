//
//  HomeCompanySectionDomain.swift
//  SpaceX
//
//  Created by hugo.coutinho on 16/12/21.
//  Copyright © 2021 . All rights reserved.
//

import Foundation

// MARK: - Info -
public struct CompanyDomain {
    public var info: String = ""

    public init() {}

    public init(info: InfoEntity) {
        let foundedInfo = "\(info.name ?? "") was founded by \(info.founder ?? "") in \(info.founded ?? 0).\n\n"
        let employeeAndSite = "It has now \(info.employees ?? 0) employees, \(info.launchSites ?? 0) Company sites,"
        let valuation = " and is valued at USD \(String(format: "$%.02f", info.valuation ?? 0))"
        self.info = foundedInfo + employeeAndSite + valuation
    }
}
