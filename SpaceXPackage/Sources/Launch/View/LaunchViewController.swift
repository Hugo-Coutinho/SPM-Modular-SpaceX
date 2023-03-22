//
//  ViewController.swift
//  SpaceX
//
//  Created by Ivo Silva on 18/09/2020.
//  Copyright © 2020 . All rights reserved.
//

import UIKit
import UIComponent

public class LaunchViewController: TableViewController {

    // MARK: - HOME PROPERTIES -
    private let searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.showsScopeBar = true
        searchController.searchBar.placeholder = Constant.Launch.searchBarPlaceHolder
        searchController.searchBar.scopeButtonTitles = [
            Constant.Launch.ScopeButtons.asc.name,
            Constant.Launch.ScopeButtons.desc.name
        ]
        searchController.isAccessibilityElement = true
        searchController.accessibilityTraits = .searchField
        searchController.accessibilityLabel = Constant.Launch.searchBarPlaceHolder
        return searchController
    }()

    public var homeSections: [Section] = []

    private var launchSection: HomeLaunchSection? {
        return homeSections.compactMap({
            guard let launch = $0 as? HomeLaunchSection else { return nil }
            return launch
        }).first
    }

    // MARK: - LIFE CYCLE -
    public override func viewWillLayoutSubviews() {
        title = Constant.Launch.launchTitle
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        definesPresentationContext = true
        navigationItem.hidesSearchBarWhenScrolling = false
    }

    public override func viewWillAppear(_ animated: Bool) {
        homeSections.forEach({ sections.append($0) })
        tableView.reloadData()
    }
}

// MARK: - SEARCHING UPDATING -
extension LaunchViewController: UISearchResultsUpdating {
    public func updateSearchResults(for searchController: UISearchController) {
      launchSection?.updateSearchResults(for: searchController)
  }
}

// MARK: - SEARCHBAR DELEGATE
extension LaunchViewController: UISearchBarDelegate {
    public func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        launchSection?.searchBar(searchBar: searchBar, selectedScopeButtonIndexDidChange: selectedScope)
    }
}

// MARK: - LAUNCH SECTION OUTPUT -
extension LaunchViewController: HomeLaunchSectionOutput {
    public func openBrowserWith(articleLink: URL) {
        UIApplication.shared.open(articleLink, options: [:], completionHandler: nil)
    }
}


