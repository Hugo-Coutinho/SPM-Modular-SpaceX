//
//  LaunchUITests.swift
//  LaunchUITests
//
//  Created by Hugo on 02/04/2022.
//

import XCTest
import KIF
import SpaceX
import SnapshotTesting
import UIComponent
@testable import Launch

class SpaceXKifTests: XCTestCase {
    // MARK: - DECLARATIONS -
    var tester: KIFUITestActor!

    // MARK: - OVERRIDE -
    override func setUp() {
        tester = tester()
    }

    override func tearDown() {
        tester = nil
    }
    
    func test_launchView() {
        let cell = HomeLaunchSectionSuccessTableViewCell()
                cell.setup(launch: LaunchDomain(missionName: "FalconSat",
                                          date: "2007/03/20 - 7:30 pm",
                                          rocket: "Falcon 1 / Merlin A",
                                          days: "2022/12/27 - 2006/03/24",
                                          daysDescription: "5757 days since now:",
                                          launchYear: "launchYear",
                                          isLaunchSuccess: false,
                                          imageURL: URL(string: "https://s2.glbimg.com/qZX0NZ3-UpJDv76rR9Rx5UkZEEw=/0x0:4928x3192/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_bc8228b6673f488aa253bbcb03c80ec5/internal_photos/bs/2022/Z/B/E9A7RJRtOdW3ymwgkg8Q/rib3867-3.jpg")!,
                                          articleURL: URL(string: "https://s2.glbimg.com/qZX0NZ3-UpJDv76rR9Rx5UkZEEw=/0x0:4928x3192/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_bc8228b6673f488aa253bbcb03c80ec5/internal_photos/bs/2022/Z/B/E9A7RJRtOdW3ymwgkg8Q/rib3867-3.jpg")!))
        
        let vc = UIViewController()
        vc.view = cell.contentView
        vc.view.backgroundColor = .white
        
        setRootViewController(UINavigationController(rootViewController: vc))
        
        assertSnapshot(matching: vc, as: .image(on: .iPhone13), named: "launchCellTest", record: false)
    }
    
    func test_companyWidget() {
        let widget = HomeCompanySectionBuilderSpy().make()
            widget.setupInfo()
        
        let vc = UIViewController()
        vc.view = widget
        vc.view.backgroundColor = .white
        
        setRootViewController(UINavigationController(rootViewController: vc))
        
        assertSnapshot(matching: vc, as: .image(on: .iPhone13), named: "CompanyWidgetTest", record: false)
    }
    
 
    func test_launchBannerWidget() {
        let domain = LaunchWidgetDomain(didSelectUpcomingLaunches: {},
                                        didSelectPastLaunches: {},
                                        didSelectAllLaunches: {})
        guard let launchWidget = LaunchWidgetBuilder().make(domain: domain) else { return }
        
        let vc = UIViewController()
        vc.view = launchWidget
        vc.view.backgroundColor = .white
        
        setRootViewController(UINavigationController(rootViewController: vc))
        
        assertSnapshot(matching: vc, as: .image(on: .iPhone13), named: "LaunchWidgetTest", record: false)
    }
}

