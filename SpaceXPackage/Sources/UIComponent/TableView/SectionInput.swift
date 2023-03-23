//
//  SectionInput.swift
//  SpaceX
//
//  Created by hugo.coutinho on 16/12/21.
//  Copyright © 2021 . All rights reserved.
//

import UIKit

@objc public protocol SectionInput: AnyObject { }

@objc public protocol SectionStateInput: SectionInput {
    @objc optional func viewDidLoad()
    @objc optional func viewWillAppear()
    @objc optional func viewWillDisappear()
}

@objc public protocol TableSectionCellInput: SectionInput {
    @objc func cell(for indexPath: IndexPath) -> UITableViewCell.Type
    @objc func willDisplayCell(_ cell: UITableViewCell, at indexPath: IndexPath)
    @objc func didSelectCell(_ cell: UITableViewCell, at indexPath: IndexPath)
    @objc optional func heightForRowInSection(indexPath: IndexPath) -> CGFloat
    @objc optional func estimatedRowHeight() -> CGFloat
}

@objc public protocol TableSectionHeaderInput: SectionInput {
    @objc func header() -> UITableViewHeaderFooterView.Type
    @objc func shouldDisplayHeader() -> Bool
    @objc optional func didSelectHeader(_ header: UITableViewHeaderFooterView)
    @objc optional func willDisplayHeader(_ headerView: UIView)
    @objc optional func viewForHeaderInSection(tableView: UITableView) -> UIView?
    @objc optional func heightForHeaderInSection() -> CGFloat
}
