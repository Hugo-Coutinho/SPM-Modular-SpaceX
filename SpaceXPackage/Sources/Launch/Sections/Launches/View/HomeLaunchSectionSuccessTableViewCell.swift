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
    
    private lazy var missionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.accessibilityIdentifier = "missionID"
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        label.isAccessibilityElement = true
        label.accessibilityTraits = .staticText
        label.adjustsFontForContentSizeCategory = true
        label.accessibilityIgnoresInvertColors = true
        return label
    }()
    
    private lazy var calendarIconImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "calendar")?.withRenderingMode(.alwaysTemplate))
        imageView.accessibilityIdentifier = "rocketIconImageViewID"
        imageView.isAccessibilityElement = true
        imageView.accessibilityTraits = .image
        imageView.accessibilityIgnoresInvertColors = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .darkText
        return imageView
    }()
    
    private lazy var dateInfoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "dateInfoID"
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.isAccessibilityElement = true
        label.accessibilityTraits = .staticText
        label.adjustsFontForContentSizeCategory = true
        label.accessibilityIgnoresInvertColors = true
        return label
    }()
    
    private lazy var rocketIconImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "rocket")?.withRenderingMode(.alwaysTemplate))
        imageView.accessibilityIdentifier = "rocketIconImageViewID"
        imageView.isAccessibilityElement = true
        imageView.accessibilityTraits = .image
        imageView.accessibilityIgnoresInvertColors = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .darkText
        return imageView
    }()
    
    private lazy var rocketLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.accessibilityIdentifier = "missionID"
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.isAccessibilityElement = true
        label.accessibilityTraits = .staticText
        label.adjustsFontForContentSizeCategory = true
        label.accessibilityIgnoresInvertColors = true
        return label
    }()
    
    private lazy var addressIconImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "location")?.withRenderingMode(.alwaysTemplate))
        imageView.accessibilityIdentifier = "rocketIconImageViewID"
        imageView.isAccessibilityElement = true
        imageView.accessibilityTraits = .image
        imageView.accessibilityIgnoresInvertColors = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .darkText
        return imageView
    }()
    
    private lazy var siteNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.accessibilityIdentifier = "missionID"
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.isAccessibilityElement = true
        label.accessibilityTraits = .staticText
        label.adjustsFontForContentSizeCategory = true
        label.accessibilityIgnoresInvertColors = true
        return label
    }()
    
    private lazy var rocketStatusIconImageview: UIImageView = {
        let imageView = UIImageView()
        imageView.accessibilityIdentifier = "rocketIconImageViewID"
        imageView.isAccessibilityElement = true
        imageView.accessibilityTraits = .image
        imageView.accessibilityIgnoresInvertColors = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .darkText
        return imageView
    }()
    
    private lazy var rocketStatusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.accessibilityIdentifier = "missionID"
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.isAccessibilityElement = true
        label.accessibilityTraits = .staticText
        label.adjustsFontForContentSizeCategory = true
        label.accessibilityIgnoresInvertColors = true
        return label
    }()
    
    private lazy var moreDetailsLinkLabel: UILabel = {
        let label = UILabel()
        label.text = "More"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.accessibilityIdentifier = "missionID"
        label.font = UIFont.preferredFont(forTextStyle: .callout)
        label.isAccessibilityElement = true
        label.textColor = .link
        label.accessibilityTraits = .staticText
        label.adjustsFontForContentSizeCategory = true
        label.accessibilityIgnoresInvertColors = true
        label.textAlignment = .right
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
    
    // MARK: - SETUP -
    func setup(launch: LaunchDomain) {
        setupAccessibilities(launch: launch)
        Nuke.loadImage(with: launch.imageURL, into: rocketImageView)
        rocketStatusIconImageview.image = UIImage(systemName: launch.isLaunchSuccess ? "checkmark.circle" : "xmark.circle.fill")?.withRenderingMode(.alwaysTemplate)
        missionLabel.text = launch.missionName
        dateInfoLabel.text = launch.date
        rocketLabel.text = launch.rocket
        siteNameLabel.text = launch.siteName
        rocketStatusLabel.text = launch.isLaunchSuccess ? "Successed" : "Failed"
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
        //        missionLabel.accessibilityLabel = launch.days
        //        missionLabel.accessibilityHint = launch.daysDescription
    }
}

// MARK: - UI -
extension HomeLaunchSectionSuccessTableViewCell {
    private func setupComponents() {
        accessibilityIdentifier = "HomeLaunchSuccessCellID"
        contentView.isAccessibilityElement = true
        contentView.accessibilityTraits = .selected
        contentView.addSubview(rocketImageView)
        contentView.addSubview(missionLabel)
        contentView.addSubview(calendarIconImageView)
        contentView.addSubview(dateInfoLabel)
        contentView.addSubview(rocketIconImageView)
        contentView.addSubview(rocketLabel)
        contentView.addSubview(addressIconImageView)
        contentView.addSubview(siteNameLabel)
        contentView.addSubview(rocketStatusIconImageview)
        contentView.addSubview(rocketStatusLabel)
        contentView.addSubview(moreDetailsLinkLabel)
        activateConstraints()
    }
    
    private func activateConstraints() {
        activateRocketImageViewConstraints()
        activateMissionConstraints()
        activateCalendarIconImageViewConstraints()
        activateDateInfoConstraints()
        activateRocketIconImageViewConstraints()
        activateRocketConstraints()
        activateAddressImageConstraints()
        activateSiteNameConstraints()
        activateRocketStatusIconConstraints()
        activateRocketStatusConstraints()
        activateMoreConstraints()
    }
}

// MARK: - CONSTRAINTS -
extension HomeLaunchSectionSuccessTableViewCell {
    private func activateRocketImageViewConstraints() {
        NSLayoutConstraint.activate([
            rocketImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            rocketImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 48),
            rocketImageView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -48),
            rocketImageView.heightAnchor.constraint(equalToConstant: 75),
            rocketImageView.widthAnchor.constraint(equalToConstant: 75)
            
        ])
    }
    
    private func activateMissionConstraints() {
        NSLayoutConstraint.activate([
            missionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            missionLabel.leadingAnchor.constraint(equalTo: rocketImageView.trailingAnchor, constant: 32),
            missionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
    
    private func activateCalendarIconImageViewConstraints() {
        NSLayoutConstraint.activate([
            calendarIconImageView.topAnchor.constraint(equalTo: missionLabel.bottomAnchor, constant: 16),
            calendarIconImageView.leadingAnchor.constraint(equalTo: rocketImageView.trailingAnchor, constant: 32),
            calendarIconImageView.heightAnchor.constraint(equalToConstant: 16),
            calendarIconImageView.widthAnchor.constraint(equalToConstant: 16),
        ])
    }
    
    private func activateDateInfoConstraints() {
        NSLayoutConstraint.activate([
            dateInfoLabel.topAnchor.constraint(equalTo: missionLabel.bottomAnchor, constant: 16),
            dateInfoLabel.leadingAnchor.constraint(equalTo: calendarIconImageView.trailingAnchor, constant: 8),
            dateInfoLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
    
    private func activateRocketIconImageViewConstraints() {
        NSLayoutConstraint.activate([
            rocketIconImageView.topAnchor.constraint(equalTo: dateInfoLabel.bottomAnchor, constant: 8),
            rocketIconImageView.leadingAnchor.constraint(equalTo: rocketImageView.trailingAnchor, constant: 32),
            rocketIconImageView.heightAnchor.constraint(equalToConstant: 16),
            rocketIconImageView.widthAnchor.constraint(equalToConstant: 16),
        ])
    }
    
    private func activateRocketConstraints() {
        NSLayoutConstraint.activate([
            rocketLabel.topAnchor.constraint(equalTo: dateInfoLabel.bottomAnchor, constant: 8),
            rocketLabel.leadingAnchor.constraint(equalTo: rocketIconImageView.trailingAnchor, constant: 8),
            rocketLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
    
    private func activateAddressImageConstraints() {
        NSLayoutConstraint.activate([
            addressIconImageView.topAnchor.constraint(equalTo: rocketLabel.bottomAnchor, constant: 8),
            addressIconImageView.leadingAnchor.constraint(equalTo: rocketImageView.trailingAnchor, constant: 32),
            addressIconImageView.heightAnchor.constraint(equalToConstant: 16),
            addressIconImageView.widthAnchor.constraint(equalToConstant: 16),
        ])
    }
    
    private func activateSiteNameConstraints() {
        NSLayoutConstraint.activate([
            siteNameLabel.topAnchor.constraint(equalTo: rocketLabel.bottomAnchor, constant: 8),
            siteNameLabel.leadingAnchor.constraint(equalTo: rocketIconImageView.trailingAnchor, constant: 8),
            siteNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
    
    private func activateRocketStatusIconConstraints() {
        NSLayoutConstraint.activate([
            rocketStatusIconImageview.topAnchor.constraint(equalTo: siteNameLabel.bottomAnchor, constant: 8),
            rocketStatusIconImageview.leadingAnchor.constraint(equalTo: rocketImageView.trailingAnchor, constant: 32),
            rocketStatusIconImageview.heightAnchor.constraint(equalToConstant: 16),
            rocketStatusIconImageview.widthAnchor.constraint(equalToConstant: 16),
        ])
    }
    
    private func activateRocketStatusConstraints() {
        NSLayoutConstraint.activate([
            rocketStatusLabel.topAnchor.constraint(equalTo: siteNameLabel.bottomAnchor, constant: 8),
            rocketStatusLabel.leadingAnchor.constraint(equalTo: rocketIconImageView.trailingAnchor, constant: 8),
            rocketStatusLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
    
    private func activateMoreConstraints() {
        NSLayoutConstraint.activate([
            moreDetailsLinkLabel.topAnchor.constraint(equalTo: rocketStatusLabel.bottomAnchor, constant: 8),
            moreDetailsLinkLabel.leadingAnchor.constraint(equalTo: rocketIconImageView.trailingAnchor, constant: 8),
            moreDetailsLinkLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            moreDetailsLinkLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
        ])
    }
}
