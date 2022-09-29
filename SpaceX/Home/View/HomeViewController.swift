//
//  HomeViewController.swift
//  SpaceX
//
//  Created by Hugo on 28/09/2022.
//

import UIKit
import Company
import UIComponent

public class HomeViewController: UIViewController {
    
    // MARK: - UI ELEMENTS DELCARATIONS -
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public override func viewDidLoad() {
        setupWidgets()
    }
}

// MARK: - SETUP UI -
extension HomeViewController {
    private func setupWidgets() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stackView)
        addCompanyInfoWidget()
        addLaunchesWidget()
        setupConstraints()
    }
    
    private func addCompanyInfoWidget() {
        let companyWidget = CompanyBuilder().make()
        companyWidget.tag = 0
        companyWidget.translatesAutoresizingMaskIntoConstraints = false
        companyWidget.heightAnchor.constraint(equalToConstant: 200.0).isActive = true
        stackView.addArrangedSubview(companyWidget)
    }
    
    private func addLaunchesWidget() {
        let view = UIView()
        view.tag = 1
        view.backgroundColor = .yellow
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 35.0).isActive = true
        stackView.addArrangedSubview(view)
    }
}

// MARK: - SETUP UI CONSTRAINTS -
extension HomeViewController {
    private func setupConstraints() {
        setupScrollViewConstraints()
        setupContentViewConstraints()
        setupStackViewConstraints()
    }
    
    private func setupScrollViewConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor),
        ])
    }
    
    private func setupContentViewConstraints() {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    private func setupStackViewConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
