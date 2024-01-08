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

class SpaceXKifTests: BaseXCTestCase {
    func test_launchView() {
        let imageStringURL = ["https://s2.glbimg.com/qZX0NZ3-UpJDv76rR9Rx5UkZEEw=/0x0:4928x3192/984x0/",
                              "smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_bc8228b6673f488aa253bbcb03c80ec5/",
                              "internal_photos/bs/2022/Z/B/E9A7RJRtOdW3ymwgkg8Q/rib3867-3.jpg"].joined()
        let cell = HomeLaunchSectionSuccessTableViewCell()
        cell.setup(launch: LaunchDomain(missionName: "FalconSat",
                                        date: "2007/03/20 - 7:30 pm",
                                        rocket: "Falcon 1 / Merlin A",
                                        siteName: "Maracana",
                                        isLaunchSuccess: false,
                                        isUpcomingLaunch: false,
                                        imageURL: URL(string: imageStringURL)!,
                                        articleURL: URL(string: imageStringURL)!))
        activateTestConstraints(component: cell.contentView, componentHeight: 172)
        assertSnapshotTest(named: "launchCellTest", waitForTimeInteval: 5.0)
    }

    func test_astronautWidget() {
        let widget = AstronautSectionBuilderSpy().make()
        widget.setupAstronauts()
        activateTestConstraints(component: widget, componentHeight: 204)
        assertSnapshotTest(named: "AstronautWidgetTest", waitForTimeInteval: 5.0)
    }

    func test_launchBannerWidget() {
        let domain = LaunchWidgetDomain(didSelectUpcomingLaunches: {},
                                        didSelectPastLaunches: {},
                                        didSelectAllLaunches: {})
        guard let launchWidget = LaunchWidgetBuilder().make(domain: domain) else { return }

        activateTestConstraints(component: launchWidget, componentHeight: 439)
        assertSnapshotTest(named: "LaunchWidgetTest", waitForTimeInteval: 5.0)
    }

    func test_headerWidget() {
        let widget = HeaderWidget()
        widget.setupHeaderDescription(text: "Header view testing case")
        activateTestConstraints(component: widget, componentHeight: 50)
        assertSnapshotTest(named: "HeaderWidgetTest")
    }
}
