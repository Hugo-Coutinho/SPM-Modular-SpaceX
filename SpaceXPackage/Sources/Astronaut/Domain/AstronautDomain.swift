//
//  AstronautDomain.swift
//  SpaceX
//
//  Created by hugo.coutinho on 16/12/21.
//  Copyright © 2021 . All rights reserved.
//

import Foundation

public struct AstronautDomain {
    public var astronauts: Astronauts = []

    public init() {}

    public init(astronauts: AstronautsEntity) {
        self.astronauts = astronauts.compactMap({ (astronaut) -> Astronaut? in
            guard let profile = URL(string: astronaut.profileImage) else { return nil }
            return Astronaut(name: astronaut.name, profile: profile)
        })
    }
}

public struct Astronaut {
    public let name: String
    public let profile: URL
}

public typealias Astronauts = [Astronaut]
