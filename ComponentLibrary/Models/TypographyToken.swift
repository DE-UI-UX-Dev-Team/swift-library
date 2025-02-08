//
//  TypographyToken.swift
//  ComponentLibrary
//
//  Created by UI/UX Development Team on 1/14/25.
//

import SwiftUI


// MARK: - Text Extension
enum MyTextStyle: String {
    case h1, h2, h3, h4, h5, h6
    case p1, p2, p3
    case primaryButton, secondaryButton, tertiaryButton
    case link
}

extension View {
    func typographyStyle(_ style: MyTextStyle, brand: Brand) -> some View {
        let manager = TypographyTokenManager.shared
        let styleToken = manager.tokens?.value(for: brand.rawValue, style: style.rawValue)
        
        let font = manager.font(for: brand.rawValue, styleName: style.rawValue)
        let kerning = manager.letterSpacing(for: brand.rawValue, styleName: style.rawValue)
        
        let lineHeight = styleToken?.lineHeight ?? 0
        let fontSize = styleToken?.fontSize ?? 0
        let spacing = max(0, lineHeight - fontSize)
        
        return self
            .font(font)
            .kerning(kerning)
            .lineSpacing(spacing)
    }
}

