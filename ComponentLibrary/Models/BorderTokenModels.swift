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
    let full: CGFloat
}

enum BorderStrokeKey {
    case none, thin, regular, thick, bar
}

enum BorderRadiusKey {
    case none, xs, s, m, full
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
        case .full:
            return borderRadius.full
        }
    }
}


extension View {
    func brandBorderOverlay(
        brand: Brand,
        radiusKey: BorderRadiusKey,
        strokeKey: BorderStrokeKey,
        color: Color
    ) -> some View {
        let tokens = BorderManager.shared.tokens(for: brand)
        let cornerRadius = tokens?.radiusValue(radiusKey) ?? 0
        let strokeWidth  = tokens?.strokeValue(strokeKey) ?? 0
        
        return self.overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(color, lineWidth: strokeWidth)
        )
    }
}

