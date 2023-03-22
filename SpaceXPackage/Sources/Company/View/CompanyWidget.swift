//
//  File.swift
//  
//
//  Created by Hugo on 29/09/2022.
//

import UIKit
import UIComponent

public class CompanyWidget: UIView {
    
    // MARK: - DEFINING UI ELEMENTS -
    private lazy var homeHeader: HeaderWidget = {
        let header = HeaderWidget()
        header.setupHeaderDescription(text: "Company Info")
        header.translatesAutoresizingMaskIntoConstraints = false
        return header
    }()
    
    private lazy var loading: UIActivityIndicatorView = {
        let loading = UIActivityIndicatorView()
        loading.translatesAutoresizingMaskIntoConstraints = false
        loading.startAnimating()
        return loading
    }()
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.isAccessibilityElement = true
        label.accessibilityTraits = .staticText
        label.adjustsFontForContentSizeCategory = true
        label.accessibilityIgnoresInvertColors = true
        label.accessibilityLabel = "SpaceX Description"
        return label
    }()
    
    // MARK: - PROPERTY DECLARATION -
    public var presenter: CompanyPresenterInput?
    
    // MARK: - INITS -
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupComponents()
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - PUBLIC FUNCTIONS -
    public func setupInfo() {
        presenter?.getInfo()
    }
}

// MARK: - UI -
extension CompanyWidget {
    private func setupComponents() {
        setupLoadingScene()
        
    }
    
    private func setupLoadingScene() {
        subviews.forEach { $0.removeFromSuperview() }
        addSubview(loading)
        setupLoadingSceneConstraints()
    }
    
    private func setupSuccessScene() {
        subviews.forEach { $0.removeFromSuperview() }
        addSubview(homeHeader)
        addSubview(infoLabel)
        setupSuccessSceneConstraints()
    }
}

// MARK: - CONSTRAINTS -
extension CompanyWidget {
    private func setupSuccessSceneConstraints() {
        NSLayoutConstraint.activate([
            homeHeader.topAnchor.constraint(equalTo: topAnchor),
            homeHeader.leadingAnchor.constraint(equalTo: leadingAnchor),
            homeHeader.trailingAnchor.constraint(equalTo: trailingAnchor),
            homeHeader.heightAnchor.constraint(equalToConstant: 50),
            
            infoLabel.topAnchor.constraint(equalTo: homeHeader.bottomAnchor, constant: 16),
            infoLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            infoLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            infoLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    private func setupLoadingSceneConstraints() {
        NSLayoutConstraint.activate([
            loading.centerYAnchor.constraint(equalTo: centerYAnchor),
            loading.centerXAnchor.constraint(equalTo: centerXAnchor),
            loading.heightAnchor.constraint(equalToConstant: 35),
            loading.widthAnchor.constraint(equalToConstant: 35),
        ])
    }
}

// MARK: - APPLYING ACCESSIBILITY -
extension CompanyWidget {
    private func applyAccessibility(value: String) {
        infoLabel.accessibilityValue = value
    }
}

// MARK: - PRESENTER OUTPUT -
extension CompanyWidget: CompanyPresenterOutput {
    public func handleSuccess(domain: CompanyDomain) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.infoLabel.text = domain.info
            self.setupSuccessScene()
            self.applyAccessibility(value: domain.info)
        }
    }
    
    public func removeSection() {
        
    }
}
