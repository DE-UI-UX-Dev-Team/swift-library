//
//  BorderTokenManager .swift
//  ComponentLibrary
//
//  Created by UI/UX Development Team on 1/29/25.
//

import SwiftUI

// MARK: - Manager
class BorderManager: ObservableObject {
    static let shared = BorderManager()
    
    @Published private(set) var allBrands: [String: BrandBorderTokens] = [:]
    
    private init() {
        loadBorderTokens()
    }
    
    private func loadBorderTokens() {
        guard let url = Bundle.main.url(forResource: "BorderTokens", withExtension: "json") else {
            fatalError("borderTokens.json not found in the app bundle.")
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoded = try JSONDecoder().decode(BorderBrandTokens.self, from: data)
            self.allBrands = decoded.brands
        } catch {
            fatalError("Failed to load/parse borderTokens.json: \(error)")
        }
    }
    
    func tokens(for brandKey: String) -> BrandBorderTokens? {
        return allBrands[brandKey]
    }
}
