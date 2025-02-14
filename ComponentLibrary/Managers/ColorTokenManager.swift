//
//  ColorTokenManager.swift
//  ComponentLibrary
//
//  Created by UI/UX Development Team on 1/9/25.
//

import SwiftUI
import os.log
 
 
final class ColorTokenManager: ObservableObject {
    static let shared = ColorTokenManager()
   // Add @Published usually paired with Observable Object  making intergration with swift state manangement easy. Helps notify prop changes to other views or objects
    @Published private(set) var tokens: AllBrandTokens?
 
    private init() {
        loadColorTokens()
    }
 
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
 
    func color(for brand: Brand, tokenName: String, colorScheme: ColorScheme) -> Color {
        guard tokens != nil else  {
            os_log(.error, "Color tokens not loaded. Returning default gray color.")
            return .gray
        }
 
        guard let brandThemes = themes(for: brand) else {
            os_log(.error, "Invalid brand name: %@", brand.identifier)
            return .gray
        }
 
        let themeColors = colorScheme == .light ? brandThemes.light : brandThemes.dark
 
        guard let hexValue = themeColors.colors[tokenName] else {
            os_log(.error, "Token name '%@' not found for brand: %@", tokenName, brand.identifier)
            return .gray
        }
 
        return Color(hex: hexValue) ?? .gray
    }
 
    private func themes(for brand: Brand) -> BrandThemes? {
        guard let tokens = tokens else { return nil }

        // Create a Mirror of the tokens object, which lets us inspect its properties at runtime.
        let mirror = Mirror(reflecting: tokens)
        
        // Iterate over the properties (children) of the tokens object.
        // Find the first property whose label (name) matches the brand's identifier.
        return mirror.children.first { $0.label == brand.identifier }?.value as? BrandThemes
    }

}
