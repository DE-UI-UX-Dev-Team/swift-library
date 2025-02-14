//
//  TypographyTokenManager.swift
//  ComponentLibrary
//
//  Created by UI/UX Development Team on 1/14/25.
//

import SwiftUI
import os.log


final class TypographyTokenManager: ObservableObject {
    static let shared = TypographyTokenManager()
    
    @Published private(set) var tokens: TypographyTokens?
    
    private init() {
        loadTokens()
    }
    
    private func loadTokens() {
        guard let url = Bundle.main.url(forResource: "TypographyTokens", withExtension: "json") else {
            os_log("TypographyTokens.json not found.")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            tokens = try JSONDecoder().decode(TypographyTokens.self, from: data)
            os_log("Typography tokens loaded.")
        } catch {
            os_log("Error decoding TypographyTokens.json: \(error)")
        }
    }
    
    func font(for brand: Brand, styleName: String) -> Font {
            guard let styleToken = tokens?.value(for: brand, style: styleName) else {
                return .system(size: 16)
            }
            var font = Font.custom(styleToken.fontName, size: styleToken.fontSize)
            
            if let weight = fontWeight(from: styleToken.weight) {
                font = font.weight(weight)
            }
            return font
        }
        
        func letterSpacing(for brand: Brand, styleName: String) -> CGFloat {
            guard let styleToken = tokens?.value(for: brand, style: styleName) else {
                return 0
            }
            return styleToken.letterSpacing
        }
        
        func lineSpacing(for brand: Brand, styleName: String) -> CGFloat {
            guard let styleToken = tokens?.value(for: brand, style: styleName) else {
                return 0
            }
            return styleToken.lineHeight - styleToken.fontSize
        }
        
        
        private func fontWeight(from str: String) -> Font.Weight? {
            switch str.lowercased() {
            case "ultralight": return .ultraLight
            case "thin":       return .thin
            case "light":      return .light
            case "regular":    return .regular
            case "medium":     return .medium
            case "semibold":   return .semibold
            case "bold":       return .bold
            case "heavy":      return .heavy
            case "black":      return .black
            default:           return nil
            }
        }
    }
