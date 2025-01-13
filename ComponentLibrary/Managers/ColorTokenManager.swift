//
//  ColorTokenManager.swift
//  ComponentLibrary
//
//  Created by UI/UX Development Team on 1/9/25.
//

import SwiftUI
import os.log // for logging purposes. Good practice just in case we run into issues
 
 
final class ColorTokenManager: ObservableObject {
    static let shared = ColorTokenManager()
   // Add @Published usually paired with Observable Object  making intergration with swift state manangement easy. Helps notify prop changes to other views or objects
    @Published private(set) var tokens: AllBrandTokens? // Color tokens loaded from JSON
 
    private init() {
        loadColorTokens()
    }
 
    /// Loads the `ColorTokens.json` file and decodes it into `AllBrandTokens`.
    private func loadColorTokens() {
        guard let url = Bundle.main.url(forResource: "ColorTokens", withExtension: "json") else {
            os_log(.error, "ColorTokens.json not found in the app bundle.")
            return
        }
        do {
            let data = try Data(contentsOf: url)
            tokens = try JSONDecoder().decode(AllBrandTokens.self, from: data)
            os_log(.info, "Color tokens successfully loaded.")
        } catch {
            os_log(.error, "Failed to decode ColorTokens.json: %@", error.localizedDescription)
        }
    }
 
    /// Returns the SwiftUI `Color` for a specific brand, token, and color scheme.
    /// - Parameters:
    ///   - brand: The brand name ("brandDE", "brandReliant").
    ///   - tokenName: The name of the color token.
    ///   - colorScheme: The current color scheme (`.light` or `.dark`).
    /// - Returns: A `Color` object or a default gray color if no match is found.
    func color(for brand: String, tokenName: String, colorScheme: ColorScheme) -> Color {
        guard tokens != nil else  {
            os_log(.error, "Color tokens not loaded. Returning default gray color.")
            return .gray
        }
 
        // Retrieve themes for the brand
        guard let brandThemes = themes(for: brand) else {
            os_log(.error, "Invalid brand name: %@", brand)
            return .gray
        }
 
        // Select the theme (light or dark)
        let themeColors = colorScheme == .light ? brandThemes.light : brandThemes.dark
 
        // Retrieve the color token's hex value
        guard let hexValue = themeColors.colors[tokenName] else {
            os_log(.error, "Token name '%@' not found for brand: %@", tokenName, brand)
            return .gray
        }
 
        return Color(hex: hexValue) ?? .gray
    }
 
    /// Retrieves themes for the specified brand.
    /// - Parameter brand: The name of the brand.
    /// - Returns: The `BrandThemes` object or `nil` if the brand is invalid.
    private func themes(for brand: String) -> BrandThemes? {
        switch brand {
        case "brandDE":
            return tokens?.brandDE
        case "brandReliant":
            return tokens?.brandReliant
        default:
            return nil
        }
    }
}
 
extension Color {
    /// Initializes a SwiftUI `Color` from a hex string.
    init?(hex: String) {
        let sanitizedHex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var rgbValue: UInt64 = 0
        guard Scanner(string: sanitizedHex).scanHexInt64(&rgbValue) else {
            return nil
        }
 
        let length = sanitizedHex.count
        switch length {
        case 6: // #RRGGBB
            let r = Double((rgbValue & 0xFF0000) >> 16) / 255.0
            let g = Double((rgbValue & 0x00FF00) >> 8) / 255.0
            let b = Double(rgbValue & 0x0000FF) / 255.0
            self = Color(red: r, green: g, blue: b)
        case 8: // #RRGGBBAA
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
