//
//  HomeCompanySection.swift
//  SpaceX
//
//  Created by hugo.coutinho on 18/12/21.
//  Copyright © 2021 . All rights reserved.
//

import Foundation
import UIKit
import UIComponent

// MARK: - COMPANY SECTION OUTPUT -
public protocol HomeCompanySectionOutput: SectionOutput {
}

public final class HomeCompanySection: Section {

    // MARK: - VARIABLES -
    public weak var delegate: HomeCompanySectionOutput?
    public var presenter: HomeCompanySectionPresenterInput!
    private var companyInfo: String!
    
    // MARK: - CONSTANT -
    private let homeCompanySection = "COMPANY"

    // MARK: - CONSTRUCTORS -
    public override init() {
        super.init()
        self.items = [NSObject()]
        self.companyInfo = ""
    }

    // MARK: - INPUT METHODS -
    public func startSection() {
        presenter.getInfo()
    }
}

// MARK: - TABLEVIEW SECTION INPUT -
extension HomeCompanySection: TableSectionCellInput {
    public func didSelectCell(_ cell: UITableViewCell, at indexPath: IndexPath) {}

    public func cell(for indexPath: IndexPath) -> UITableViewCell.Type {
        switch self.scene {
        default:
            return HomeCompanySectionSuccessTableViewCell.self
        }
    }

    public func willDisplayCell(_ cell: UITableViewCell, at indexPath: IndexPath) {
        guard let cell = cell as? HomeCompanySectionSuccessTableViewCell else { return }
        cell.setupInfo(description: self.companyInfo)
    }

    public func heightForRowInSection(indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

// MARK: - HEADER OUTPUT -
extension HomeCompanySection: TableSectionHeaderInput {
    public func header() -> UITableViewHeaderFooterView.Type {
        return HomeSectionHeaderView.self
    }

    public func heightForHeaderInSection() -> CGFloat {
        return 50
    }

    public func willDisplayHeader(_ headerView: UIView) {
        guard let headerView = headerView as? HomeSectionHeaderView else { return }
        headerView.setupHeaderDescription(text: homeCompanySection)
    }

    public func shouldDisplayHeader() -> Bool {
        return true
    }
}

// MARK: - PRESENTER OUTPUT -
extension HomeCompanySection : HomeCompanySectionPresenterOutput {
    public func handleSuccess(domain: HomeCompanySectionDomain) {
        self.scene = .sceneSuccess
        self.companyInfo = domain.info
        self.output?.reloadSection(section: self, animation: .automatic)
    }

    public func removeSection() {
        self.output?.removeItem(from: 0, in: self, animation: .fade, completion: nil)
    }
}



