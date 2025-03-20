import SwiftUI
import Foundation
import os.log

enum IconType: String {
    case utility, illustrative
}

enum IconSize: String {
    case small, medium, large, xLarge
}

final class IconTokenManager: ObservableObject {
    static let shared = IconTokenManager()

    @Published private(set) var allBrands: [String: BrandIconTokens] = [:]
    @Published private(set) var iconLists: [String: [String]] = [:]

    private init() {
        if case .success(let decoded) = JSONTokenLoader.load(fileName: "IconTokens", type: IconBrandTokens.self) {
            self.allBrands = decoded.brands
            os_log(.info, "Successfully loaded IconTokens.json")
        } else {
            os_log(.error, "Failed to load IconTokens.json")
        }

        if case .success(let decodedIcons) = JSONTokenLoader.load(fileName: "IconList", type: [String: [String: [String]]].self) {
            for (brand, brandIcons) in decodedIcons {
                if let icons = brandIcons["icons"] {
                    iconLists[brand] = icons
                }
            }
            os_log(.info, "Successfully loaded IconList.json")
        } else {
            os_log(.error, "Failed to load IconList.json")
        }
    }

   
    func getIconSize(for brand: String, type: IconType, size: IconSize) -> CGFloat? {
        allBrands[brand].flatMap { tokens in
            type == .utility ? tokens.utility[size.rawValue] : tokens.illustrative[size.rawValue]
        }
    }

  
    func iconExists(for brand: String, iconName: String) -> Bool {
        iconLists[brand]?.contains(iconName) ?? false
    }
}

