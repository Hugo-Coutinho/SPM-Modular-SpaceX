//
//  ReusableCellIdentifiable.swift
//  SpaceX
//
//  Created by hugo.coutinho on 16/12/21.
//  Copyright © 2021 . All rights reserved.
//

import Foundation
import UIKit

protocol ReusableCellIdentifiable {
    static var reusableIdentifier: String { get }
}

extension ReusableCellIdentifiable {
    static var reusableIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReusableCellIdentifiable {}
extension UICollectionReusableView: ReusableCellIdentifiable {}


