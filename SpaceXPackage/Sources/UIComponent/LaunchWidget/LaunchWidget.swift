//
//  File.swift
//  
//
//  Created by Hugo on 30/09/2022.
//

import UIKit

public class LaunchWidget: UIView {

    // MARK: - DEFINING UI ELEMENTS -
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var headerView: UIView = {
        let header = HeaderWidget()
        header.setupHeaderDescription(text: "Launches")
        header.translatesAutoresizingMaskIntoConstraints = false
        return header
    }()

    private lazy var upcomingLaunchImageView: BannerView = {
        let bannerView = BannerView()
        bannerView.contentMode = .scaleToFill
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        bannerView.layer.cornerRadius = 20
        bannerView.layer.masksToBounds = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.didSelectUpcomingLaunches))
        bannerView.addGestureRecognizer(tapGesture)
        return bannerView
    }()

    private lazy var pastLaunchImageView: BannerView = {
        let imageView = BannerView()
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.didSelectPastLaunches))
        imageView.addGestureRecognizer(tapGesture)
        return imageView
    }()

    private lazy var allLaunchImageView: BannerView = {
        let imageView = BannerView()
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.didSelectAllLaunches))
        imageView.addGestureRecognizer(tapGesture)
        return imageView
    }()

    private var domain: LaunchWidgetDomain?

    // MARK: - INITS -
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupComponents()
    }

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - PUBLIC FUNCTIONS -
    public func setupInfo(domain: LaunchWidgetDomain,
                          upcomingLaunchDomain: BannerDomain,
                          pastLaunchDomain: BannerDomain,
                          allLaunchDomain: BannerDomain) {
        self.domain = domain
        upcomingLaunchImageView.setupBanner(domain: upcomingLaunchDomain)
        pastLaunchImageView.setupBanner(domain: pastLaunchDomain)
        allLaunchImageView.setupBanner(domain: allLaunchDomain)
    }
}

// MARK: - UI -
extension LaunchWidget {
    private func setupComponents() {
        addSubview(headerView)
        addSubview(stackView)
        stackView.addArrangedSubview(upcomingLaunchImageView)
        stackView.addArrangedSubview(pastLaunchImageView)
        stackView.addArrangedSubview(allLaunchImageView)
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: topAnchor),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 50),
            stackView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

// MARK: - DID SELECT FUNCTIONS -
extension LaunchWidget {
    @objc private func didSelectUpcomingLaunches() {
        domain?.didSelectUpcomingLaunches()
    }

    @objc private func didSelectPastLaunches() {
        domain?.didSelectPastLaunches()
    }

    @objc private func didSelectAllLaunches() {
        domain?.didSelectAllLaunches()
    }
}
