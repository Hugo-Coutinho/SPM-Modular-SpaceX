//
//  Section.swift
//  SpaceX
//
//  Created by hugo.coutinho on 16/12/21.
//  Copyright © 2021 . All rights reserved.
//

import Foundation

open class Section: NSObject {
    public weak var output: SectionOutput?
    public var items: [Any] = []
    public var scene: SectionsScenes = .sceneloading
}

public enum SectionsScenes {
    case sceneloading
    case sceneError
    case sceneSuccess
}
