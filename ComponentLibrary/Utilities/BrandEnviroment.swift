//
//  BrandEnviroment.swift
//  ComponentLibrary
//
//  Created by Christopher Coleman on 2/19/25.
//

import SwiftUI

private struct BrandKey: EnvironmentKey {
    static let defaultValue: Brand = .de
}

extension EnvironmentValues {
    var brand: Brand {
        get { self[BrandKey.self] }
        set { self[BrandKey.self] = newValue }
    }
}
