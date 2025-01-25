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
}

struct TypographyTokens: Decodable {
    let brandDE: [String: TextStyleToken]
    let brandReliant: [String: TextStyleToken]
    
    // Helper method to retrieve a token by brand + style key.
    func value(for brand: String, style: String) -> TextStyleToken? {
        switch brand.lowercased() {
        case "brandde":
            return brandDE[style]
        case "brandreliant":
            return brandReliant[style]
        default:
            return nil
        }
    }
}
