import SwiftUI
import os.log

final class BorderTokenManager: ObservableObject {
    static let shared = BorderTokenManager()
    @Published private(set) var allBrands: [String: BrandBorderTokens] = [:]

    private init() {
        if case .success(let decoded) = JSONTokenLoader.load(fileName: "BorderTokens", type: BorderBrandTokens.self) {
            self.allBrands = decoded.brands
            os_log(.info, "Successfully loaded BorderTokens.json")
        } else {
            os_log(.error, "Failed to load BorderTokens.json")
        }
    }

    func tokens(for brand: Brand) -> BrandBorderTokens? {
        allBrands[brand.identifier]
    }
}
