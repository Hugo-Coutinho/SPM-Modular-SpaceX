//
//  File.swift
//  
//
//  Created by Hugo on 28/09/2022.
//

import UIKit

public class HeaderWidget: UIView {

    // MARK: - DEFINING UI ELEMENTS -
    private lazy var headerDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.textColor = .white
        label.isAccessibilityElement = true
        label.accessibilityTraits = .staticText
        label.adjustsFontForContentSizeCategory = true
        label.accessibilityIgnoresInvertColors = true
        label.accessibilityLabel = "Section Header"
        return label
    }()

    // MARK: - INITS -
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - PUBLIC FUNCTIONS -
    public func setupHeaderDescription(text: String) {
        setupAccessibility(headerTitle: text)
        headerDescription.text = text
    }
}

// MARK: - SETTING VIEW -
extension HeaderWidget {
    private func setupView() {
        backgroundColor = .black
        self.addSubview(headerDescription)
        self.activateHeaderConstraints()
    }
    private func setupAccessibility(headerTitle: String) {
        headerDescription.accessibilityValue = headerTitle
    }
}

// MARK: - CONSTRAINTS -
extension HeaderWidget {
    private func activateHeaderConstraints() {
        NSLayoutConstraint.activate([
            headerDescription.topAnchor.constraint(equalTo: topAnchor),
            headerDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            headerDescription.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerDescription.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
