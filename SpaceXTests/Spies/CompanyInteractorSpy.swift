//
//  HomeCompanySectionInteractorSpy.swift
//  SpaceXTests
//
//  Created by hugo.coutinho on 18/12/21.
//  Copyright © 2021 . All rights reserved.
//

import Foundation
import Company

public class CompanyInteractorOutputSpy: CompanyInteractorOutput {
    public func handleSuccess(info: InfoEntity) {}
    public func removeSection() {}
}
