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


struct BrandThemes: Decodable {
    let light: ThemeColors
    let dark: ThemeColors
}

struct AllBrandTokens: Decodable {
    let brandDE: BrandThemes
    let brandReliant: BrandThemes

}
