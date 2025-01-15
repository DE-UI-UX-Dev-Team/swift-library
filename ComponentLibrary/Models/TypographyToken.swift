//
//  TypographyToken.swift
//  ComponentLibrary
//
//  Created by UI/UX Development Team on 1/14/25.
//

import SwiftUI

// 1) Enums for clarity (text style & color usage)
enum TypographyTextStyle: String {
    case h1
    case h2
    case h3
    case h4
    case h5
    case h6
    case p1
    case p2
    case p3
    case link
    case primaryButton
    case secondaryButton
    case tertiaryButton
}

enum TypographyColorUsage: String {
    case headingDefault
    case headingSecondary
    case headingInverse
    case paragraphDefault
    case paragraphSecondary
    case paragraphLegal
    case paragraphDisabled
    case paragraphInverse
    case paragraphError
    case paragraphSuccess
    case paragraphWarning
    case link
    case primaryButton
    case secondaryButton
    case tertiaryButton
    case disabledButton
}

// 2) A ViewModifier that applies the style + color
struct TypographyModifier: ViewModifier {
    @Environment(\.colorScheme) private var colorScheme
    let textStyle: TypographyTextStyle
    let colorUsage: TypographyColorUsage
    let brand: String

    func body(content: Content) -> some View {
        let manager = TypographyTokenManager.shared
        
        // 1. Retrieve font
        let font = manager.font(
            for: brand,
            styleName: textStyle.rawValue,
            colorScheme: colorScheme
        )
        
        // 2. Retrieve color
        let textColor = manager.color(
            for: brand,
            usageName: colorUsage.rawValue,
            colorScheme: colorScheme
        )
        
        // 3. Letter spacing
        let spacing = manager.letterSpacing(
            for: brand,
            styleName: textStyle.rawValue,
            colorScheme: colorScheme
        )
        
        // 4. Underline
        let underlined = manager.isUnderlined(
            for: brand,
            styleName: textStyle.rawValue,
            colorScheme: colorScheme
        )
        
        return content
            .font(font)
            .foregroundColor(textColor)
            .kerning(spacing)
            .underline(underlined, color: textColor)
    }
}

// 3) Text extension for the desired syntax
extension Text {
    func TypographyStyle(
        _ style: TypographyTextStyle,
        colorUsage: TypographyColorUsage,
        brand: String = "brandDE"
    ) -> some View {
        modifier(TypographyModifier(
            textStyle: style,
            colorUsage: colorUsage,
            brand: brand
        ))
    }
}
