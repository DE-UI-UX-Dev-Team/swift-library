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
    
    func value(for brand: Brand, style: String) -> TextStyleToken? {
        switch brand {
        case .de:
            return brandDE[style]
        case .reliant:
            return brandReliant[style]
        }
    }
}

enum MyTextStyle: String {
    case h1, h2, h3, h4, h5, h6
    case p1, p2, p3,p4
    case button
    case link
    case cardRate
}


struct TypographyStyleModifier: ViewModifier {
    let style: MyTextStyle
    @Environment(\.brand) private var brand

    func body(content: Content) -> some View {
        let manager = TypographyTokenManager.shared
        let font = manager.font(for: brand, styleName: style.rawValue)
        let kerning = manager.letterSpacing(for: brand, styleName: style.rawValue)
        let lineSpacing = manager.lineSpacing(for: brand, styleName: style.rawValue)

        return content
            .font(font)
            .kerning(kerning)
            .lineSpacing(lineSpacing)
    }
}

extension View {
    func typographyStyle(_ style: MyTextStyle) -> some View {
        modifier(TypographyStyleModifier(style: style))
    }
}
