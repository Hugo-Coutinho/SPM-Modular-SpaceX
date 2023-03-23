//
//  BaseXcTestCase.swift
//  SpaceXUITests
//
//  Created by Hugo Coutinho on 2023-03-23.
//
import XCTest
import KIF
import SnapshotTesting

class BaseXCTestCase: XCTestCase {
    // MARK: - DECLARATIONS -
    var tester: KIFUITestActor!
    
    lazy var testContentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        return view
    }()
    
    lazy var testRootViewController: UIViewController = {
        let viewController = UIViewController()
        viewController.view.translatesAutoresizingMaskIntoConstraints = false
        viewController.view = testContentView
        return viewController
    }()
    
    // MARK: - OVERRIDE -
    override func setUp() {
        tester = tester()
    }
    
    override func tearDown() {
        tester = nil
    }
    
    func activateTestConstraints(component: UIView,
                                 contentViewHeight: CGFloat = 600,
                                 componentHeight: CGFloat) {
        testContentView.addSubview(component)
        component.translatesAutoresizingMaskIntoConstraints = false
        activateContentViewConstraints(height: contentViewHeight)
        activateComponentConstraints(component: component, componentHeight: componentHeight)
    }
    
    func assertSnapshotTest(named: String, record: Bool = false) {
        setRootViewController(UINavigationController(rootViewController: testRootViewController))
        assertSnapshot(matching: testRootViewController, as: .image(on: .iPhone13), named: named, record: record)
    }
}

// MARK: - ASSISTANT METHODS -
extension BaseXCTestCase {
    private func activateContentViewConstraints(height: CGFloat) {
        NSLayoutConstraint.activate([
            testContentView.heightAnchor.constraint(equalToConstant: height),
            testContentView.leadingAnchor.constraint(equalTo: testRootViewController.view.leadingAnchor, constant: 0),
            testContentView.trailingAnchor.constraint(equalTo: testRootViewController.view.trailingAnchor, constant: 0),
        ])
    }
    
    private func activateComponentConstraints(component: UIView, componentHeight: CGFloat) {
        NSLayoutConstraint.activate([
            component.centerYAnchor.constraint(equalTo: testContentView.centerYAnchor),
            component.centerXAnchor.constraint(equalTo: testContentView.centerXAnchor),
            component.heightAnchor.constraint(equalToConstant: componentHeight),
            component.leadingAnchor.constraint(equalTo: testContentView.leadingAnchor),
            component.trailingAnchor.constraint(equalTo: testContentView.trailingAnchor),
        ])
    }
}
