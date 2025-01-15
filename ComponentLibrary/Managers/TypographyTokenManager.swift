//
//  TypographyTokenManager.swift
//  ComponentLibrary
//
//  Created by UI/UX Development Team on 1/14/25.
//

import SwiftUI
import os.log

final class TypographyTokenManager: ObservableObject {
    static let shared = TypographyTokenManager()
    
    @Published private(set) var tokens: AllTypographyTokens?
    
    private init() {
        loadTokens()
    }
    
    private func loadTokens() {
        guard let url = Bundle.main.url(forResource: "TypographyTokens", withExtension: "json") else {
            os_log(.error, "TypographyTokens.json not found in the app bundle.")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            tokens = try JSONDecoder().decode(AllTypographyTokens.self, from: data)
            os_log(.info, "Typography tokens successfully loaded.")
        } catch {
            os_log(.error, "Failed to decode TypographyTokens.json: %@", error.localizedDescription)
        }
    }
    
    // Helper: get the correct theme for brand + light/dark
    private func getThemeAttributes(
        for brand: String,
        colorScheme: ColorScheme
    ) -> ThemeAttributes? {
        guard let tokens = tokens else { return nil }
        
        let typographyBrandThemes: TypographyBrandThemes?
        switch brand.lowercased() {
        case "brandde":
            typographyBrandThemes = tokens.brandDE
        case "brandreliant":
            typographyBrandThemes = tokens.brandReliant
        default:
            typographyBrandThemes = nil
        }
        
        guard let brandData = typographyBrandThemes else { return nil }
        
        switch colorScheme {
        case .light:
            return brandData.light
        case .dark:
            return brandData.dark
        @unknown default:
            return brandData.light
        }
    }
    
    // MARK: - Font Lookups
    
    func font(for brand: String, styleName: String, colorScheme: ColorScheme) -> Font {
        guard let theme = getThemeAttributes(for: brand, colorScheme: colorScheme),
              let token = theme.textStyles[styleName] else {
            return .system(size: 16)
        }
        // Build a SwiftUI Font from the token
        var font = Font.custom(token.fontName, size: token.fontSize)
        
        if let weightVal = fontWeight(from: token.weight) {
            font = font.weight(weightVal)
        }
        // lineHeight not directly applied to Font in SwiftUI,
        // we handle letterSpacing with .kerning(...) in a modifier.
        
        return font
    }
    
    func isUnderlined(for brand: String, styleName: String, colorScheme: ColorScheme) -> Bool {
        guard let theme = getThemeAttributes(for: brand, colorScheme: colorScheme),
              let token = theme.textStyles[styleName] else {
            return false
        }
        return token.underlined
    }
    
    func letterSpacing(for brand: String, styleName: String, colorScheme: ColorScheme) -> CGFloat {
        guard let theme = getThemeAttributes(for: brand, colorScheme: colorScheme),
              let token = theme.textStyles[styleName] else {
            return 0
        }
        return token.letterSpacing
    }
    
    // MARK: - Color Lookups
    
    func color(for brand: String, usageName: String, colorScheme: ColorScheme) -> Color {
        guard let theme = getThemeAttributes(for: brand, colorScheme: colorScheme),
              let hexString = theme.colors[usageName] else {
            return .gray
        }
        return Color(hex: hexString) ?? .gray
    }
    
    // Convert "bold"/"heavy"/"regular" -> Font.Weight
    private func fontWeight(from str: String) -> Font.Weight? {
        switch str.lowercased() {
        case "ultralight": return .ultraLight
        case "thin":       return .thin
        case "light":      return .light
        case "regular":    return .regular
        case "medium":     return .medium
        case "semibold":   return .semibold
        case "bold":       return .bold
        case "heavy":      return .heavy
        case "black":      return .black
        default:           return nil
        }
    }
}

