//
//  HomeBuilder.swift
//  SpaceX
//
//  Created by hugo.coutinho on 04/02/22.
//

import UIKit

public final class HomeBuilder: HomeBuilderInput {
    // MARK: - CONSTRUCTOR -
    public init() {}

    public func make() -> UIViewController {
        return HomeViewController()
    }
}
