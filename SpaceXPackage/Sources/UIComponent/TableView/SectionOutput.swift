//
//  SectionOutput.swift
//  SpaceX
//
//  Created by hugo.coutinho on 16/12/21.
//  Copyright © 2021 . All rights reserved.
//

import Foundation
import UIKit

public protocol SectionOutput: AnyObject {
    func endRefreshing(error: String?)
    func reloadSection(section: Section, animation: UITableView.RowAnimation)
    func setSelectedCell(from index: Int,
                         in section: Section,
                         animated: Bool,
                         scrollPosition: UITableView.ScrollPosition)
    func removeItem(from index: Int,
                    in section: Section,
                    animation: UITableView.RowAnimation,
                    completion: (() -> Void)?)
}
