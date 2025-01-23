//
//  TypographyTokenModels.swift
//  ComponentLibrary
//
//  Created by UI/UX Development Team on 1/14/25.
//

import SwiftUI


struct TextStyleToken: Decodable {
    let fontName: String
    let weight: String
    let fontSize: CGFloat
    let lineHeight: CGFloat
    let letterSpacing: CGFloat
    let underlined: Bool
}


struct ThemeAttributes: Decodable {
    let textStyles: [String: TextStyleToken]
    let colors: [String: String]
}


struct TypographyBrandThemes: Decodable {
    let light: ThemeAttributes
    let dark: ThemeAttributes
}


struct AllTypographyTokens: Decodable {
    let brandDE: TypographyBrandThemes
    let brandReliant: TypographyBrandThemes
}
