import SwiftUI
import os.log

final class ColorTokenManager: ObservableObject {
    static let shared = ColorTokenManager()
    @Published private(set) var tokens: AllBrandTokens?

    private init() {
        if case .success(let decoded) = JSONTokenLoader.load(fileName: "ColorTokens", type: AllBrandTokens.self) {
            self.tokens = decoded
            os_log(.info, "Successfully loaded ColorTokens.json")
        } else {
            os_log(.error, "Failed to load ColorTokens.json")
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
