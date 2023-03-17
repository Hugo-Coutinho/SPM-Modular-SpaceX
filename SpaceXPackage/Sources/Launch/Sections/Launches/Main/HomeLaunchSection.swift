//
//  HomeLaunchSection.swift
//  SpaceX
//
//  Created by hugo.coutinho on 16/12/21.
//  Copyright © 2021 . All rights reserved.
//

import Foundation
import UIKit
import UIComponent


// MARK: - LAUNCH SECTION OUTPUT -
public protocol HomeLaunchSectionOutput: SectionOutput {
    func openBrowserWith(articleLink: URL)
}

public final class HomeLaunchSection: Section {

    // MARK: - VARIABLE DELCARATIONS -
    public weak var delegate: HomeLaunchSectionOutput?
    public var presenter: HomeLaunchSectionPresenterInput!
    public var launchType: LaunchType!
    private var launch: HomeLaunchSectionDomain!
    private lazy var isLastPage: Bool = false
    private var currentScopeButton = Constant.Launch.ScopeButtons.asc
    
    // MARK: - CONSTANT -
    private let homeLaunchSection = "LAUNCHES"

    // MARK: - CONSTRUCTORS -
    public override init() {
        super.init()
        self.items = [NSObject()]
        self.launch = HomeLaunchSectionDomain()
    }

    // MARK: - INPUT METHODS -
    public func startSection() {
        loadMoreItems()
    }

    public func loadMoreItems() {
        presenter?.getLaunch(offSet: launch.launches.count)
    }

    public func searchBar(searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        switch selectedScope {
        case Constant.Launch.ScopeButtons.asc.rawValue:
            currentScopeButton = .asc
            self.output?.reloadSection(section: self, animation: .automatic)
        default:
            currentScopeButton = .desc
            self.output?.reloadSection(section: self, animation: .automatic)
        }
    }

    public func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let text = searchBar.text ?? ""
        let isTextNotEmpty = !text.isEmpty
        switch currentScopeButton {
        case .desc:
            if isTextNotEmpty {
                filterContentForSearchText(text)
            } else {
                items = sortingContentForScopeButton()
                self.output?.reloadSection(section: self, animation: .automatic)
            }
        case .asc:
            if isTextNotEmpty {
                filterContentForSearchText(text)
            } else {
                items = sortingContentForScopeButton()
                self.output?.reloadSection(section: self, animation: .automatic)
            }
        }
    }
}

// MARK: - ASSISTANT METHODS -
extension HomeLaunchSection {
    private func handleScroll(row: Int) {
        if row == items.count - 1 {
            if items.count == launch.launches.count && !isLastPage {
                loadMoreItems()
            }
        }
    }

    private func filterContentForSearchText(_ searchText: String) {
        guard var domain = self.launch else { return }
        domain.launches = sortingContentForScopeButton()
        domain.getLaunchesFilteredBy(text: searchText)
        items = domain.launches
        self.output?.reloadSection(section: self, animation: .automatic)
    }

    private func sortingContentForScopeButton() -> LaunchDomainItems {
        guard var domain = self.launch else { return launch.launches }
        switch currentScopeButton {
        case .asc:
            domain.getLaunchesAscendingOrder()
            return domain.launches

        case .desc:
            domain.getLaunchesDescendingOrder()
            return domain.launches
        }
    }

    private func sortingNewItemsByScope() -> LaunchDomainItems {
        guard var domain = self.launch,
        let newItems = items as? LaunchDomainItems else { return launch.launches }
        domain.launches = newItems
        switch currentScopeButton {
        case .asc:
            domain.getLaunchesAscendingOrder()
            return domain.launches

        case .desc:
            domain.getLaunchesDescendingOrder()
            return domain.launches
        }
    }
}

// MARK: - TABLEVIEW SECTION INPUT -
extension HomeLaunchSection: TableSectionCellInput {
    public func didSelectCell(_ cell: UITableViewCell, at indexPath: IndexPath) {
        guard let launch = items[indexPath.row] as? LaunchDomain else { return }
        delegate?.openBrowserWith(articleLink: launch.articleURL)
    }

    public func cell(for indexPath: IndexPath) -> UITableViewCell.Type {
        switch self.scene {
        case .sceneloading:
            return LoadingTableViewCell.self
        default:
            return HomeLaunchSectionSuccessTableViewCell.self
        }
    }

    public func willDisplayCell(_ cell: UITableViewCell, at indexPath: IndexPath) {
        guard let cell = cell as? HomeLaunchSectionSuccessTableViewCell else { return }
        if launchType != .upcoming { handleScroll(row: indexPath.row) }
        guard items.count > 0,
        indexPath.row < items.count,
        let launch = items[indexPath.row] as? LaunchDomain else { return }
        cell.setup(launch: launch)
    }

    public func heightForRowInSection(indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    public func estimatedRowHeight() -> CGFloat {
        return 150
    }
}

// MARK: - HEADER OUTPUT -
extension HomeLaunchSection: TableSectionHeaderInput {
    public func header() -> UITableViewHeaderFooterView.Type {
        return HomeSectionHeaderView.self
    }

    public func heightForHeaderInSection() -> CGFloat {
        return 50
    }

    public func willDisplayHeader(_ headerView: UIView) {
        guard let headerView = headerView as? HomeSectionHeaderView else { return }
        headerView.setupHeaderDescription(text: homeLaunchSection)
    }

    public func shouldDisplayHeader() -> Bool {
        return true
    }
}

// MARK: - PRESENTER OUTPUT -
extension HomeLaunchSection : HomeLaunchSectionPresenterOutput {
    public func handleSuccess(domain: HomeLaunchSectionDomain) {
        if self.items.first as? LaunchDomain  == nil && !self.items.isEmpty { self.items.removeFirst() }
        guard !domain.launches.isEmpty else { isLastPage = true; return }
        scene = .sceneSuccess
        launch.launches.append(contentsOf: domain.launches)
        items.append(contentsOf: domain.launches)
        items = sortingNewItemsByScope()
        output?.reloadSection(section: self, animation: .automatic)
    }

    public func removeSection() {
        self.output?.removeItem(from: 0, in: self, animation: .fade, completion: nil)
    }
}


