import SwiftUI
import Foundation
import os.log

// ✅ Global Enums for IconType & IconSize
enum IconType: String {
    case utility, illustrative
}

enum IconSize: String {
    case small, medium, large, xLarge
}

class IconTokenManager: ObservableObject {
    static let shared = IconTokenManager()

    @Published private(set) var allBrands: [String: BrandIconTokens] = [:] // Stores icon size tokens
    private(set) var iconLists: [String: [String]] = [:] // Stores icons per brand

    private init() {
        loadIconTokens()
        loadIcons()
    }

    // Load icon size tokens from JSON
    private func loadIconTokens() {
        guard let url = Bundle.main.url(forResource: "IconTokens", withExtension: "json") else {
            os_log(.error, "iconTokens.json not found in the app bundle.")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoded = try JSONDecoder().decode(IconBrandTokens.self, from: data)
            self.allBrands = decoded.brands
        } catch {
            os_log(.error, "Failed to decode iconTokens.json: %@", error.localizedDescription)
        }
    }

    // Load icons per brand from JSON
    private func loadIcons() {
        guard let url = Bundle.main.url(forResource: "IconList", withExtension: "json") else {
            return
        }

        do {
            let data = try Data(contentsOf: url)
            let decodedData = try JSONDecoder().decode([String: [String: [String]]].self, from: data)

            for (brand, brandIcons) in decodedData {
                if let icons = brandIcons["icons"] {
                    iconLists[brand] = icons
                }
            }
        } catch {
            return
        }
    }

    // Get icon size for a brand & type
    func getIconSize(for brand: String, type: IconType, size: IconSize) -> CGFloat? {
        guard let tokens = allBrands[brand] else { return nil }
        return type == .utility ? tokens.utility[size.rawValue] : tokens.illustrative[size.rawValue]
    }

    // Check if an icon exists for a brand
    func iconExists(for brand: String, iconName: String) -> Bool {
        return iconLists[brand]?.contains(iconName) ?? false
    }
}

