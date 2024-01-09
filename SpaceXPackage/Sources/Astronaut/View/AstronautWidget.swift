//
//  File.swift
//  
//
//  Created by Hugo on 29/09/2022.
//

import UIKit
import UIComponent
import Nuke

public class AstronautWidget: UIView {
    // MARK: - DEFINING UI ELEMENTS -
    private lazy var homeHeader: HeaderWidget = {
        let header = HeaderWidget()
        header.setupHeaderDescription(text: "Brazilian Astronauts")
        header.translatesAutoresizingMaskIntoConstraints = false
        return header
    }()

    private lazy var bodyView: UIView = {
        let bodyView = UIView()
        bodyView.translatesAutoresizingMaskIntoConstraints = false
        return bodyView
    }()

    private lazy var loading: UIActivityIndicatorView = {
        let loading = UIActivityIndicatorView()
        loading.translatesAutoresizingMaskIntoConstraints = false
        loading.startAnimating()
        return loading
    }()

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = true
        return scrollView
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        return stackView
    }()

    // MARK: - PROPERTY DECLARATION -
    public var presenter: AstronautPresenterInput?

    // MARK: - INITS -
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupComponents()
    }
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - PUBLIC FUNCTIONS -
    public func setupAstronauts() {
        presenter?.getAstronauts()
    }
}

// MARK: - UI -
extension AstronautWidget {
    private func setupComponents() {
        setupLoadingScene()
    }

    private func setupLoadingScene() {
        subviews.forEach { $0.removeFromSuperview() }
        addSubview(loading)
        setupLoadingSceneConstraints()
    }

    private func setupSuccessScene(domain: AstronautDomain) {
        subviews.forEach { $0.removeFromSuperview() }
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }

        addSubview(homeHeader)
        addSubview(bodyView)
        bodyView.addSubview(scrollView)
        scrollView.addSubview(stackView)

        domain.astronauts.forEach({
            addAstronautView(astronaut: $0)
        })

        setupSuccessSceneConstraints()
    }
}

// MARK: - ASSISTANT -
extension AstronautWidget {
    private func addAstronautView(astronaut: Astronaut) {
        let astronautView = UIView()
        let profileImage = UIImageView()
        let name = UILabel()

        astronautView.translatesAutoresizingMaskIntoConstraints = false
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        name.translatesAutoresizingMaskIntoConstraints = false

        name.textAlignment = .center

        astronautView.addSubview(profileImage)
        astronautView.addSubview(name)

        Nuke.loadImage(with: astronaut.profile, into: profileImage)
        name.text = astronaut.name.extractFirstTwoNames()

        stackView.addArrangedSubview(astronautView)

        NSLayoutConstraint.activate([
            astronautView.widthAnchor.constraint(equalToConstant: 150),

            profileImage.topAnchor.constraint(equalTo: astronautView.topAnchor),
            profileImage.leadingAnchor.constraint(equalTo: astronautView.leadingAnchor),
            profileImage.trailingAnchor.constraint(equalTo: astronautView.trailingAnchor),
            profileImage.heightAnchor.constraint(equalToConstant: 150),

            name.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 8),
            name.leadingAnchor.constraint(equalTo: astronautView.leadingAnchor),
            name.trailingAnchor.constraint(equalTo: astronautView.trailingAnchor),
            name.bottomAnchor.constraint(equalTo: astronautView.bottomAnchor),
            name.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
}

// MARK: - CONSTRAINTS -
extension AstronautWidget {
    private func setupSuccessSceneConstraints() {
        setupHeaderConstraints()
        setupBodyConstraints()
        setupScrollViewConstraints()
        setupStackViewConstraints()
    }

    private func setupHeaderConstraints() {
        NSLayoutConstraint.activate([
            homeHeader.topAnchor.constraint(equalTo: topAnchor),
            homeHeader.leadingAnchor.constraint(equalTo: leadingAnchor),
            homeHeader.trailingAnchor.constraint(equalTo: trailingAnchor),
            homeHeader.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    private func setupBodyConstraints() {
        NSLayoutConstraint.activate([
            bodyView.topAnchor.constraint(equalTo: homeHeader.bottomAnchor, constant: 16),
            bodyView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bodyView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bodyView.bottomAnchor.constraint(equalTo: bottomAnchor),
            bodyView.heightAnchor.constraint(equalToConstant: 230)
        ])
    }

    private func setupScrollViewConstraints() {
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(greaterThanOrEqualTo: bodyView.leadingAnchor),
            scrollView.trailingAnchor.constraint(greaterThanOrEqualTo: bodyView.trailingAnchor),
            scrollView.topAnchor.constraint(greaterThanOrEqualTo: bodyView.topAnchor),
            scrollView.bottomAnchor.constraint(greaterThanOrEqualTo: bodyView.bottomAnchor),
            scrollView.centerYAnchor.constraint(equalTo: bodyView.centerYAnchor),
            scrollView.centerXAnchor.constraint(equalTo: bodyView.centerXAnchor)
        ])
    }

    private func setupStackViewConstraints() {
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ])

        let widthConstraint = stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        widthConstraint.priority = .defaultLow
        widthConstraint.isActive = true
    }

    private func setupLoadingSceneConstraints() {
        NSLayoutConstraint.activate([
            loading.centerYAnchor.constraint(equalTo: centerYAnchor),
            loading.centerXAnchor.constraint(equalTo: centerXAnchor),
            loading.heightAnchor.constraint(equalToConstant: 35),
            loading.widthAnchor.constraint(equalToConstant: 35)
        ])
    }
}

// MARK: - APPLYING ACCESSIBILITY -
extension AstronautWidget {
    private func applyAccessibility(value: String) {
//        infoLabel.accessibilityValue = value
    }
}

// MARK: - PRESENTER OUTPUT -
extension AstronautWidget: AstronautPresenterOutput {
    public func handleSuccess(domain: AstronautDomain) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.setupSuccessScene(domain: domain)
//            self.applyAccessibility(value: domain)
        }
    }

    public func removeSection() {}
}
