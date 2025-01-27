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
}

extension Text {
    func typographyStyle(_ style: MyTextStyle, brand: String) -> some View {
        let manager = TypographyTokenManager.shared
        let styleToken = manager.tokens?.value(for: brand, style: style.rawValue)
        
        let font = manager.font(for: brand, styleName: style.rawValue)
        let kerning = manager.letterSpacing(for: brand, styleName: style.rawValue)
        
        let lineHeight = styleToken?.lineHeight ?? 0
        let fontSize = styleToken?.fontSize ?? 0
        let spacing = max(0, lineHeight - fontSize)
        
        return self
            .font(font)
            .kerning(kerning)
            .lineSpacing(spacing)
    }
}

