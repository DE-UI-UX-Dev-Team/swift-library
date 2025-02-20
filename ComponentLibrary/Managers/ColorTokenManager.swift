////
////  ColorTokenManager.swift
////  ComponentLibrary
////
////  Created by UI/UX Development Team on 1/9/25.
////
//
import SwiftUI
import os.log

final class ColorTokenManager: ObservableObject {
    static let shared = ColorTokenManager()
    @Published private(set) var tokens: AllBrandTokens?

    private init() {
        loadTokens()
    }

    private func loadTokens() {
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
        guard let brandThemes = themes(for: brand) else {
            os_log(.error, "Invalid brand name: %@", brand.identifier)
            return .gray
        }
        let themeColors = colorScheme == .light ? brandThemes.light : brandThemes.dark

        return Color(hex: themeColors.colors[tokenName] ?? "#808080") ?? .gray


    }

    private func themes(for brand: Brand) -> BrandThemes? {
        guard let tokens = tokens else { return nil }
        return Mirror(reflecting: tokens)
            .children
            .first { $0.label == brand.identifier }?
            .value as? BrandThemes

    }
}
