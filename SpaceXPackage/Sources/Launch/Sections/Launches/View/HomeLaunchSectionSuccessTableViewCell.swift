//
//  HomeLaunchSectionSuccessTableViewCell.swift
//  SpaceX
//
//  Created by hugo.coutinho on 16/12/21.
//  Copyright © 2021 . All rights reserved.
//

import UIKit
import Nuke

class HomeLaunchSectionSuccessTableViewCell: UITableViewCell {

    // MARK: - DEFINING UI ELEMENTS -
    private lazy var rocketImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.accessibilityIdentifier = "rocketImageViewID"
        imageView.isAccessibilityElement = true
        imageView.accessibilityTraits = .image
        imageView.accessibilityIgnoresInvertColors = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var missionDescLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.text = "Mission:"
        label.accessibilityIdentifier = "missionDescID"
        label.isAccessibilityElement = true
        label.accessibilityTraits = .staticText
        label.adjustsFontForContentSizeCategory = true
        label.accessibilityIgnoresInvertColors = true
        return label
    }()

    private lazy var dateTimeDescLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.text = "Date/Time:"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.accessibilityIdentifier = "dateTimeDescID"
        label.isAccessibilityElement = true
        label.accessibilityTraits = .staticText
        label.adjustsFontForContentSizeCategory = true
        label.accessibilityIgnoresInvertColors = true
        return label
    }()

    private lazy var rocketDescLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.text = "Rocket:"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.accessibilityIdentifier = "rocketDescID"
        label.isAccessibilityElement = true
        label.accessibilityTraits = .staticText
        label.adjustsFontForContentSizeCategory = true
        label.accessibilityIgnoresInvertColors = true
        return label
    }()

    private lazy var daysDescLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.accessibilityIdentifier = "daysDescID"
        label.isAccessibilityElement = true
        label.accessibilityTraits = .staticText
        label.adjustsFontForContentSizeCategory = true
        label.accessibilityIgnoresInvertColors = true
        return label
    }()

    private lazy var missionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "missionID"
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.isAccessibilityElement = true
        label.accessibilityTraits = .staticText
        label.adjustsFontForContentSizeCategory = true
        label.accessibilityIgnoresInvertColors = true
        return label
    }()

    private lazy var dateInfoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "dateInfoID"
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.isAccessibilityElement = true
        label.accessibilityTraits = .staticText
        label.adjustsFontForContentSizeCategory = true
        label.accessibilityIgnoresInvertColors = true
        return label
    }()

    private lazy var rocketLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.accessibilityIdentifier = "rocketID"
        label.isAccessibilityElement = true
        label.accessibilityTraits = .staticText
        label.adjustsFontForContentSizeCategory = true
        label.accessibilityIgnoresInvertColors = true
        return label
    }()

    private lazy var daysLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.accessibilityIdentifier = "daysID"
        label.isAccessibilityElement = true
        label.accessibilityTraits = .staticText
        label.adjustsFontForContentSizeCategory = true
        label.accessibilityIgnoresInvertColors = true
        return label
    }()

    private lazy var checkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.accessibilityIdentifier = "checkImageViewID"
        imageView.isAccessibilityElement = true
        imageView.accessibilityTraits = .image
        imageView.accessibilityIgnoresInvertColors = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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

    // MARK: - SETUP -
    func setup(launch: LaunchDomain) {
        setupAccessibilities(launch: launch)
        Nuke.loadImage(with: launch.imageURL, into: rocketImageView)
        checkImageView.image = UIImage(named: launch.isLaunchSuccess ? "check" : "close")
        missionLabel.text = launch.missionName
        dateInfoLabel.text = launch.date
        rocketLabel.text = launch.rocket
        daysLabel.text = launch.days
        daysDescLabel.text = launch.daysDescription
    }
}

// MARK: - CONFIGURING CELL ACCESSIBILITY -
extension HomeLaunchSectionSuccessTableViewCell {
    private func setupAccessibilities(launch: LaunchDomain) {
        contentView.accessibilityLabel = launch.missionName
        contentView.accessibilityHint = "Double tap to enter the \(launch.missionName) details"
        rocketImageView.accessibilityLabel = launch.missionName

        // MARK: - MISSION -
        missionLabel.accessibilityLabel = launch.missionName
        missionLabel.accessibilityHint = "mission"

        // MARK: - DATE INFO -
        dateInfoLabel.accessibilityLabel = launch.date
        dateInfoLabel.accessibilityHint = "date info"

        // MARK: - ROCKET -
        rocketLabel.accessibilityLabel = launch.rocket
        rocketLabel.accessibilityHint = "rocket"

        // MARK: - DAYS -
        missionLabel.accessibilityLabel = launch.days
        missionLabel.accessibilityHint = launch.daysDescription
    }
}

// MARK: - UI -
extension HomeLaunchSectionSuccessTableViewCell {
    private func setupComponents() {
        accessibilityIdentifier = "HomeLaunchSuccessCellID"
        contentView.isAccessibilityElement = true
        contentView.accessibilityTraits = .selected
        contentView.addSubview(rocketImageView)
        contentView.addSubview(missionDescLabel)
        contentView.addSubview(dateTimeDescLabel)
        contentView.addSubview(rocketDescLabel)
        contentView.addSubview(daysDescLabel)
        contentView.addSubview(missionLabel)
        contentView.addSubview(dateInfoLabel)
        contentView.addSubview(rocketLabel)
        contentView.addSubview(daysLabel)
        contentView.addSubview(checkImageView)
        activateConstraints()
    }

    private func activateConstraints() {
        activateRocketImageViewConstraints()
        activateMissionDescConstraints()
        activateDateTimeDescConstraints()
        activateRocketDescConstraints()
        activateDaysDescConstraints()
        activateMissionConstraints()
        activateDateInfoConstraints()
        activateRocketConstraints()
        activateDaysConstraints()
        activateCheckImageConstraints()
    }
}

// MARK: - CONSTRAINTS -
extension HomeLaunchSectionSuccessTableViewCell {
    private func activateMissionDescConstraints() {
        NSLayoutConstraint.activate([
            missionDescLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            missionDescLabel.leadingAnchor.constraint(equalTo: rocketImageView.trailingAnchor, constant: 8),
            missionDescLabel.widthAnchor.constraint(equalToConstant: 70)
        ])
    }

    private func activateDateTimeDescConstraints() {
        NSLayoutConstraint.activate([
            dateTimeDescLabel.topAnchor.constraint(equalTo: missionDescLabel.bottomAnchor, constant: 8),
            dateTimeDescLabel.leadingAnchor.constraint(equalTo: rocketImageView.trailingAnchor, constant: 8),
            dateTimeDescLabel.widthAnchor.constraint(equalToConstant: 90)
        ])
    }

    private func activateRocketDescConstraints() {
        NSLayoutConstraint.activate([
            rocketDescLabel.topAnchor.constraint(equalTo: dateTimeDescLabel.bottomAnchor, constant: 8),
            rocketDescLabel.leadingAnchor.constraint(equalTo: rocketImageView.trailingAnchor, constant: 8),
            rocketDescLabel.widthAnchor.constraint(equalToConstant: 65)
        ])
    }

    private func activateDaysDescConstraints() {
        NSLayoutConstraint.activate([
            daysDescLabel.topAnchor.constraint(equalTo: rocketDescLabel.bottomAnchor, constant: 8),
            daysDescLabel.centerXAnchor.constraint(equalTo: rocketDescLabel.centerXAnchor),
            daysDescLabel.heightAnchor.constraint(equalToConstant: 50),
            daysDescLabel.widthAnchor.constraint(equalToConstant: 90)
        ])
    }

    private func activateRocketImageViewConstraints() {
        NSLayoutConstraint.activate([
            rocketImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            rocketImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            rocketImageView.heightAnchor.constraint(equalToConstant: 50),
            rocketImageView.widthAnchor.constraint(equalToConstant: 50)
        ])
    }

    private func activateMissionConstraints() {
        NSLayoutConstraint.activate([
            missionLabel.centerYAnchor.constraint(equalTo: missionDescLabel.centerYAnchor),
            missionLabel.leadingAnchor.constraint(equalTo: missionDescLabel.trailingAnchor),
            missionLabel.trailingAnchor.constraint(equalTo: checkImageView.leadingAnchor)
        ])
    }

    private func activateDateInfoConstraints() {
        NSLayoutConstraint.activate([
            dateInfoLabel.centerYAnchor.constraint(equalTo: dateTimeDescLabel.centerYAnchor),
            dateInfoLabel.leadingAnchor.constraint(equalTo: dateTimeDescLabel.trailingAnchor),
            dateInfoLabel.trailingAnchor.constraint(equalTo: checkImageView.trailingAnchor)
        ])
    }

    private func activateRocketConstraints() {
        NSLayoutConstraint.activate([
            rocketLabel.centerYAnchor.constraint(equalTo: rocketDescLabel.centerYAnchor),
            rocketLabel.leadingAnchor.constraint(equalTo: rocketDescLabel.trailingAnchor),
            rocketLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }

    private func activateDaysConstraints() {
        NSLayoutConstraint.activate([
            daysLabel.centerYAnchor.constraint(equalTo: daysDescLabel.centerYAnchor),
            daysLabel.leadingAnchor.constraint(equalTo: daysDescLabel.trailingAnchor),
            daysLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }

    private func activateCheckImageConstraints() {
        NSLayoutConstraint.activate([
            checkImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            checkImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            checkImageView.heightAnchor.constraint(equalToConstant: 32),
            checkImageView.widthAnchor.constraint(equalToConstant: 32)
        ])
    }
}
