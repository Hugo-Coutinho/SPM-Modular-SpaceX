//
//  UIExtension.swift
//  KIFSpaceXTests
//
//  Created by Hugo on 19/03/2022.
//

import KIF
@testable import SpaceX

extension XCTestCase {
    func setRootViewController(_ viewController: UIViewController, waitForTimeInterval: CGFloat) {
        UIApplication.shared.windows.first?.rootViewController?.dismiss(animated: false, completion: {
            self.tester().wait(forTimeInterval: waitForTimeInterval)
            UIApplication.shared.windows.first?.rootViewController = viewController
            UIApplication.shared.windows.first?.makeKeyAndVisible()
        })
    }

    func tester(file: String = #file, _ line: Int = #line) -> KIFUITestActor {
        return KIFUITestActor(inFile: file, atLine: line, delegate: self)
    }

    func system(file: String = #file, _ line: Int = #line) -> KIFSystemTestActor {
        return KIFSystemTestActor(inFile: file, atLine: line, delegate: self)
    }
}

extension KIFTestActor {
    func tester(file: String = #file, _ line: Int = #line) -> KIFUITestActor {
        return KIFUITestActor(inFile: file, atLine: line, delegate: self)
    }

    func system(file: String = #file, _ line: Int = #line) -> KIFSystemTestActor {
        return KIFSystemTestActor(inFile: file, atLine: line, delegate: self)
    }
}
