//
//  HomeCompanySectionSuccessTableViewCell.swift
//  SpaceX
//
//  Created by hugo.coutinho on 16/12/21.
//  Copyright © 2021 . All rights reserved.
//

import UIKit

class HomeCompanySectionSuccessTableViewCell: UITableViewCell {

    // MARK: - DEFINING UI ELEMENTS -
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.accessibilityIdentifier = "SpaceXInfoID"
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.isAccessibilityElement = true
        label.accessibilityTraits = .staticText
        label.adjustsFontForContentSizeCategory = true
        label.accessibilityIgnoresInvertColors = true
        return label
    }()

    // MARK: - OVERRIDE -
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupComponents()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupComponents()
    }

    // MARK: - PUBLIC FUNCTIONS -
    func setupInfo(description: String) {
        setupAccessibilities(info: description)
        infoLabel.text = description
    }
}

// MARK: - CONFIGURING CELL ACCESSIBILITY -
extension HomeCompanySectionSuccessTableViewCell {
    private func setupAccessibilities(info: String) {
        accessibilityIdentifier = "HomeCompanySuccessCellID"
        contentView.accessibilityLabel = info
        contentView.accessibilityHint = "Here are the SpaceX description"
    }
}

// MARK: - UI -
extension HomeCompanySectionSuccessTableViewCell {
    private func setupComponents() {
        contentView.addSubview(infoLabel)
        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            infoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            infoLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            infoLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}
