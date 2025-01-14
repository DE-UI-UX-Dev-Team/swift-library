//
//  ColorTokenModels.swift
//  ComponentLibrary
//
//  Created by UI/UX Development Team on 1/9/25.
//

import SwiftUI

struct ThemeColors: Decodable {
    let colors: [String: String]
}


// Represents the "light" and "dark" themes for a single brand.
struct BrandThemes: Decodable {
    let light: ThemeColors
    let dark: ThemeColors
}

// Represents all brands at the top level of the JSON.
struct AllBrandTokens: Decodable {
    let brandDE: BrandThemes
    let brandReliant: BrandThemes

}
