//
//  AstronautDomain.swift
//  SpaceX
//
//  Created by hugo.coutinho on 16/12/21.
//  Copyright © 2021 . All rights reserved.
//

import Foundation

public struct AstronautDomain {
    public var profiles: [URL] = []
    
    public init() {}
    
    public init(astronauts: AstronautsEntity) {
        self.profiles = astronauts.compactMap({ (astronaut) -> URL? in
            return URL(string: astronaut.profileImage)
        })
    }
}

