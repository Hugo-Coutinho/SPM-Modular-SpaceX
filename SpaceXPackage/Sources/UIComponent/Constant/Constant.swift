//
//  Constant.swift
//  SpaceX
//
//  Created by hugo.coutinho on 16/12/21.
//  Copyright © 2021 . All rights reserved.
//

import Foundation

public struct Constant {
    public struct Home {
        public static let homeTitle = "Home"
    }

    public struct Launch {
        public static let launchTitle = "SpaceX"
        public static let searchBarPlaceHolder = "Search launches by year"
        public static let searchBarScopeASCButton = "ASC"
        public static let searchBarScopeDESCButton = "DESC"
    }

    public enum ScopeButtons: Int {
        case asc = 0
        case desc = 1
        public var name: String {
            switch self {
            case .desc:
                return Constant.Launch.searchBarScopeDESCButton
            case .asc:
                return Constant.Launch.searchBarScopeASCButton
            }
        }
    }
}
