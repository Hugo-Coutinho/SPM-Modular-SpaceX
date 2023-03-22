//
//  File.swift
//  
//
//  Created by Hugo on 30/09/2022.
//

import UIKit
import Nuke

class BannerView: UIView {
    // MARK: - DEFINING UI ELEMENTS -
    private lazy var bannerTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.textColor = .black
        label.backgroundColor = .white.withAlphaComponent(0.5)
        label.numberOfLines = 0
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        label.adjustsFontForContentSizeCategory = true
        label.isAccessibilityElement = true
        label.accessibilityIgnoresInvertColors = true
        label.accessibilityTraits = .button
        label.accessibilityLabel = "Banner Title"
        return label
    }()
    
    private lazy var bannerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        imageView.isAccessibilityElement = true
        imageView.accessibilityTraits = .image
        imageView.accessibilityLabel = "Rocket Launching"
        return imageView
    }()
    
    // MARK: - INITS -
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - PUBLIC FUNCTIONS -
    func setupBanner(domain: BannerDomain) {
        applyAccessibility(value: domain.title)
        Nuke.loadImage(with: domain.imageURL, into: bannerImageView)
        bannerTitle.text = domain.title
    }
}

// MARK: - UI -
extension BannerView {
    private func setupComponents() {
        addSubview(bannerImageView)
        addSubview(bannerTitle)
        NSLayoutConstraint.activate([
            bannerImageView.topAnchor.constraint(equalTo: topAnchor),
            bannerImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bannerImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bannerImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            bannerTitle.topAnchor.constraint(equalTo: topAnchor, constant: 80),
            bannerTitle.centerXAnchor.constraint(equalTo: bannerImageView.centerXAnchor),
            bannerTitle.leadingAnchor.constraint(equalTo: bannerImageView.leadingAnchor),
            bannerTitle.trailingAnchor.constraint(equalTo: bannerImageView.trailingAnchor),
            bannerTitle.bottomAnchor.constraint(equalTo: bannerImageView.bottomAnchor, constant: -8),
        ])
    }
}

// MARK: - APPLYING ACCESSIBILITY -
extension BannerView {
    private func applyAccessibility(value: String) {
        bannerTitle.accessibilityValue = value
    }
}
