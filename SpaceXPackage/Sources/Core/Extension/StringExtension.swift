//
//  File.swift
//
//
//  Created by Hugo Coutinho on 2024-01-08.
//

import Foundation

extension String {
    public func extractFirstTwoNames() -> String {
        let components = self.components(separatedBy: " ")

        guard components.count >= 2 else {
            return self
        }

        let firstName = components[0]

        if let hyphenIndex = components[1].firstIndex(of: "-") {
            let secondName = components[1].prefix(upTo: hyphenIndex)
            return "\(firstName) \(secondName)"
        }

        if components[1].firstIndex(of: ".") != nil {
            return "\(firstName)"
        }

        let secondName = components[1]
        return "\(firstName) \(secondName)"
    }
}
