//
//  BrandBorderTokens.swift
//  ComponentLibrary
//
//  Created by UI/UX Development Team on 1/29/25.
//

import SwiftUI


struct BorderBrandTokens: Decodable {
    let brands: [String: BrandBorderTokens]
}

struct BrandBorderTokens: Decodable {
    let borderStroke: BorderStroke
    let borderRadius: BorderRadius
}

struct BorderStroke: Decodable {
    let none: CGFloat
    let thin: CGFloat
    let regular: CGFloat
    let thick: CGFloat
    let bar: CGFloat
}

struct BorderRadius: Decodable {
    let none: CGFloat
    let xs: CGFloat
    let s: CGFloat
    let m: CGFloat
    let l: CGFloat
    let full: CGFloat
}

enum BorderStrokeKey {
    case none, thin, regular, thick, bar
}

enum BorderRadiusKey {
    case none, xs, s, m, l, full
}

extension BrandBorderTokens {
    func strokeValue(_ key: BorderStrokeKey) -> CGFloat {
        switch key {
        case .none:
            return borderStroke.none
        case .thin:
            return borderStroke.thin
        case .regular:
            return borderStroke.regular
        case .thick:
            return borderStroke.thick
        case .bar:
            return borderStroke.bar
        }
    }
    
    func radiusValue(_ key: BorderRadiusKey) -> CGFloat {
        switch key {
        case .none:
            return borderRadius.none
        case .xs:
            return borderRadius.xs
        case .s:
            return borderRadius.s
        case .m:
            return borderRadius.m
        case .l:
            return borderRadius.l
        case .full:
            return borderRadius.full
        }
    }
}

struct BrandBorderOverlayModifier: ViewModifier {
    let radiusKey: BorderRadiusKey
    let strokeKey: BorderStrokeKey
    let color: Color
    @Environment(\.brand) private var brand

    func body(content: Content) -> some View {
        let tokens = BorderTokenManager.shared.tokens(for: brand)
        let cornerRadius = tokens?.radiusValue(radiusKey) ?? 0
        let strokeWidth = tokens?.strokeValue(strokeKey) ?? 0

        return content.overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(color, lineWidth: strokeWidth)
        )
    }
}

extension View {
    func brandBorderOverlay(radiusKey: BorderRadiusKey, strokeKey: BorderStrokeKey, color: Color? = nil) -> some View {
        modifier(BrandBorderOverlayModifier(radiusKey: radiusKey, strokeKey: strokeKey, color: color ?? .clear))
    }
}


// Shared border utilities for Corner radius
enum BorderUtilities {
    static var borderManager: BorderTokenManager {
        BorderTokenManager.shared
    }
    
    static func cornerRadius(for brand: Brand) -> BorderRadius {
        guard let borderTokens = borderManager.tokens(for: brand) else {
            return BorderRadius(none: 0, xs: 2, s: 4, m: 6, l: 8, full: 999)
        }
        return borderTokens.borderRadius
    }
}
