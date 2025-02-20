//
//  BrandEnviroment.swift
//  ComponentLibrary
//
//  Created by UI/UX Development on 2/19/25.
//

import SwiftUI


private struct BrandKey: EnvironmentKey {
    static let defaultValue: Brand = .de
}

private struct BrandSpacingKey: EnvironmentKey {
    static let defaultValue: BrandSpacing = SpacingTokenManager.shared.spacing(for: .de)
}


extension EnvironmentValues {
    var brand: Brand {
        get { self[BrandKey.self] }
        set {
            self[BrandKey.self] = newValue
            self[BrandSpacingKey.self] = SpacingTokenManager.shared.spacing(for: newValue)
        }
    }
    
    var brandSpacing: BrandSpacing {
        get { self[BrandSpacingKey.self] }
    }
}

struct ApplyBrandAttributes: ViewModifier {
    let brand: Brand
    
    func body(content: Content) -> some View {
        content.environment(\ .brand, brand)
    }
}

extension View {
    func applyBrandAttributes(brand: Brand) -> some View {
        self.modifier(ApplyBrandAttributes(brand: brand))
    }
}
