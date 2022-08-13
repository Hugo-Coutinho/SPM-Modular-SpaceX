//
//  HomeLaunchSectionHeaderView.swift
//  SpaceX
//
//  Created by hugo.coutinho on 18/12/21.
//  Copyright © 2021 . All rights reserved.
//

import UIKit

class HomeSectionHeaderView: UITableViewHeaderFooterView {

    // MARK: - DEFINING UI ELEMENTS -
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "HomeHeaderID"
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.textColor = .white
        label.accessibilityTraits = .staticText
        label.adjustsFontForContentSizeCategory = true
        label.accessibilityIgnoresInvertColors = true
        return label
    }()

    // MARK: - INITS -
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupView()
    }

    // MARK: - PUBLIC FUNCTIONS -
    func setupHeaderDescription(text: String) {
        setupAccessibilities(text: text)
        headerLabel.text = text
    }
}

// MARK: - SETTING VIEW -
extension HomeSectionHeaderView {
    private func setupView() {
        contentView.backgroundColor = .black
        self.addSubview(headerLabel)
        self.activateHeaderConstraints()
    }
}

// MARK: - CONFIGURING CELL ACCESSIBILITY -
extension HomeSectionHeaderView {
    private func setupAccessibilities(text: String) {
        accessibilityIdentifier = "HomeHeaderViewID"
        accessibilityLabel = text
    }
}

// MARK: - CONSTRAINTS -
extension HomeSectionHeaderView {
    private func activateHeaderConstraints() {
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: topAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

