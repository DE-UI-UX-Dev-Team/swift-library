//
//  TypographyTokenModels.swift
//  ComponentLibrary
//
//  Created by UI/UX Development Team on 1/14/25.
//

import SwiftUI

// 1) Represents a single text style from JSON
struct TextStyleToken: Decodable {
    let fontName: String
    let weight: String
    let fontSize: CGFloat
    let lineHeight: CGFloat
    let letterSpacing: CGFloat
    let underlined: Bool
}

// 2) One theme (light/dark) with textStyles + colors
struct ThemeAttributes: Decodable {
    let textStyles: [String: TextStyleToken]
    let colors: [String: String]
}

// 3) Each brand has light/dark
struct TypographyBrandThemes: Decodable {
    let light: ThemeAttributes
    let dark: ThemeAttributes
}

// 4) Top-level with brandA, brandB
struct AllTypographyTokens: Decodable {
    let brandDE: TypographyBrandThemes
    let brandReliant: TypographyBrandThemes
}
