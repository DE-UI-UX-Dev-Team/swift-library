////
////  TypographyTokenManager.swift
////  ComponentLibrary
////
////  Created by UI/UX Development Team on 1/14/25.
////
//
import SwiftUI
import os.log

final class TypographyTokenManager: ObservableObject {
    static let shared = TypographyTokenManager()
    @Published private(set) var tokens: TypographyTokens?

    private init() {
           if case .success(let decoded) = JSONTokenLoader.load(fileName: "TypographyTokens", type: TypographyTokens.self) {
               self.tokens = decoded
               os_log(.info, "Successfully loaded TypographyTokens.json")
           } else {
               os_log(.error, "Failed to load TypographyTokens.json")
           }
       }

    func font(for brand: Brand, styleName: String) -> Font {
        guard let styleToken = tokens?.value(for: brand, style: styleName) else {
            return .system(size: 16)
        }
        return Font.custom(styleToken.fontName, size: styleToken.fontSize)
            .weight(fontWeight(from: styleToken.weight) ?? .regular)
    }

    func letterSpacing(for brand: Brand, styleName: String) -> CGFloat {
        tokens?.value(for: brand, style: styleName)?.letterSpacing ?? 0
    }

    func lineSpacing(for brand: Brand, styleName: String) -> CGFloat {
        guard let styleToken = tokens?.value(for: brand, style: styleName) else { return 0 }
        return styleToken.lineHeight - styleToken.fontSize
    }

    private func fontWeight(from str: String) -> Font.Weight? {
        switch str.lowercased() {
        case "ultralight": return .ultraLight
        case "thin": return .thin
        case "light": return .light
        case "regular": return .regular
        case "medium": return .medium
        case "semibold": return .semibold
        case "bold": return .bold
        case "heavy": return .heavy
        case "black": return .black
        default: return nil
        }
    }
}
