//
//  ColorTokenManager.swift
//  ComponentLibrary
//
//  Created by susan ruan on 1/9/25.
//

import SwiftUI

final class ColorTokenManager: ObservableObject {
    static let shared = ColorTokenManager()
    
    private(set) var tokens: ColorTokens?

    private init() {
        loadColorTokens()
    }

    private func loadColorTokens() {
        guard let url = Bundle.main.url(forResource: "ColorTokens", withExtension: "json") else {
            print("ColorTokens.json not found in Bundle.")
            return
        }

        do {
            let data = try Data(contentsOf: url)
            tokens = try JSONDecoder().decode(ColorTokens.self, from: data)
        } catch {
            print("Failed to decode ColorTokens.json: \(error)")
        }
    }
    
    /// Return the correct theme colors (light or dark) for the current color scheme.
    private func currentThemeColors(for colorScheme: ColorScheme) -> ThemeColors? {
        guard let tokens = tokens else { return nil }
        
        switch colorScheme {
        case .light:
            return tokens.light
        case .dark:
            return tokens.dark
        @unknown default:
            // Fallback or handle future color schemes
            return tokens.light
        }
    }
    
    /// Get a SwiftUI Color for a given token name in the current (light/dark) theme.
    func color(for tokenName: String, colorScheme: ColorScheme) -> Color {
        guard
            let themeColors = currentThemeColors(for: colorScheme),
            let hexValue = themeColors.colors[tokenName]
        else {
            // Token name not found or tokens not loaded
            return Color.gray
        }
        return Color(hex: hexValue) ?? Color.gray
    }
}

extension Color {
    /// Initialize a SwiftUI Color from a hex string like "#RRGGBB" or "#RRGGBBAA".
    init?(hex: String) {
        // Remove '#' or any non-hex characters
        let sanitizedHex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        
        var rgbValue: UInt64 = 0
        guard Scanner(string: sanitizedHex).scanHexInt64(&rgbValue) else {
            return nil
        }
        
        let length = sanitizedHex.count
        switch length {
        case 6:
            let r = Double((rgbValue & 0xFF0000) >> 16) / 255.0
            let g = Double((rgbValue & 0x00FF00) >> 8) / 255.0
            let b = Double(rgbValue & 0x0000FF) / 255.0
            self = Color(red: r, green: g, blue: b)
            
        case 8:
            let r = Double((rgbValue & 0xFF000000) >> 24) / 255.0
            let g = Double((rgbValue & 0x00FF0000) >> 16) / 255.0
            let b = Double((rgbValue & 0x0000FF00) >> 8) / 255.0
            let a = Double(rgbValue & 0x000000FF) / 255.0
            self = Color(red: r, green: g, blue: b, opacity: a)
            
        default:
            return nil
        }
    }
}
