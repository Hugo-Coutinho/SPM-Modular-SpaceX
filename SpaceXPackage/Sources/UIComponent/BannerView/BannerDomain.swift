//
//  File.swift
//  
//
//  Created by Hugo on 30/09/2022.
//

import Foundation

public struct BannerDomain {
    public let imageURL: URL
    public let title: String
    
    public init(imageURL: URL, title: String) {
        self.imageURL = imageURL
        self.title = title
    }
}
