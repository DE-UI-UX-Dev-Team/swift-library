//
//  ColorTokenManager.swift
//  ComponentLibrary
//
//  Created by UI/UX Development Team on 1/9/25.
//

import SwiftUI



final class ColorTokenManager: ObservableObject {
    static let shared = ColorTokenManager()
    
    private(set) var tokens: AllBrandTokens?

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
            tokens = try JSONDecoder().decode(AllBrandTokens.self, from: data)
        } catch {
            print("Failed to decode ColorTokens.json: \(error)")
        }
    }
    
    // Return the SwiftUI Color for a specific brand, token, and color scheme.
    func color(for brand: String, tokenName: String, colorScheme: ColorScheme) -> Color {
        guard let tokens = tokens else { return .gray }

        // Get the BrandThemes for the requested brand
        let brandThemes: BrandThemes?
        switch brand {
        case "brandDE":
            brandThemes = tokens.brandDE
        case "brandReliant":
            brandThemes = tokens.brandReliant
        default:
            brandThemes = nil
        }
        

        guard let brandThemes = brandThemes else {
            return .gray
        }

        //  Pick light or dark
        let themeColors: ThemeColors
        switch colorScheme {
        case .light:
            themeColors = brandThemes.light
        case .dark:
            themeColors = brandThemes.dark
        @unknown default:
            themeColors = brandThemes.light
        }
        guard let hexValue = themeColors.colors[tokenName] else {
            return .gray
        }
        
        return Color(hex: hexValue) ?? .gray
    }
}


extension Color {
    // Initialize a SwiftUI Color from a hex string like "#RRGGBB" or "#RRGGBBAA".
    init?(hex: String) {
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
