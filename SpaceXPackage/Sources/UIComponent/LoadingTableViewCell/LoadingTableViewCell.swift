//
//  LoadingTableViewCell.swift
//  SpaceX
//
//  Created by hugo.coutinho on 16/12/21.
//  Copyright © 2021 . All rights reserved.
//

import UIKit

public class LoadingTableViewCell: UITableViewCell {
    // MARK: - UI ELEMENTS -
    private lazy var spinner: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.startAnimating()
        return activityIndicator
    }()

    // MARK: - OVERRIDE -
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupComponents()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupComponents()
    }
}

// MARK: - UI -
extension LoadingTableViewCell {
    private func setupComponents() {
        contentView.addSubview(spinner)
        activateConstraints()
    }

    private func activateConstraints() {
        NSLayoutConstraint.activate([
            spinner.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            spinner.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
