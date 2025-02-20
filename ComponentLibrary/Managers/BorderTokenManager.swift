////
////  BorderTokenManager .swift
////  ComponentLibrary
////
////  Created by UI/UX Development Team on 1/29/25.
////
//
import SwiftUI
import os.log


final class BorderTokenManager: ObservableObject {
    static let shared = BorderTokenManager()
    @Published private(set) var allBrands: [String: BrandBorderTokens] = [:]

    private init() {
        loadTokens()
    }

    private func loadTokens() {
        guard let url = Bundle.main.url(forResource: "BorderTokens", withExtension: "json") else {
            os_log(.error, "BorderTokens.json not found in the app bundle.")
            return
        }
        do {
            let data = try Data(contentsOf: url)
            let decoded = try JSONDecoder().decode(BorderBrandTokens.self, from: data)
            self.allBrands = decoded.brands
        } catch {
            os_log(.error, "Failed to load/parse BorderTokens.json: %@", error.localizedDescription)
        }
    }

    func tokens(for brand: Brand) -> BrandBorderTokens? {
        allBrands[brand.identifier]
    }
}
