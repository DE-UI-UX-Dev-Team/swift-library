//
//  ColorHexExtensions.swift
//  ComponentLibrary
//
//  Created by UI/UX Development Team on 1/14/25.
//

import SwiftUI

// Hex -> Color
extension Color {
    init?(hex: String) {
        let sanitizedHex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var rgbValue: UInt64 = 0
        guard Scanner(string: sanitizedHex).scanHexInt64(&rgbValue) else {
            return nil
        }
 
        let length = sanitizedHex.count
        switch length {
        case 6:
            let r = Double((rgbValue & 0xFF0000) >> 16) / 255.0
            let g = Double((rgbValue & 0x00FF00) >> 8) / 255.0
            let b = Double(rgbValue & 0x0000FF) / 255.0
            self = Color(red: r, green: g, blue: b)
        case 8:
            let r = Double((rgbValue & 0xFF000000) >> 24) / 255.0
            let g = Double((rgbValue & 0x00FF0000) >> 16) / 255.0
            let b = Double((rgbValue & 0x0000FF00) >> 8) / 255.0
            let a = Double(rgbValue & 0x000000FF) / 255.0
            self = Color(red: r, green: g, blue: b, opacity: a)
        default:
            return nil
        }
    }
}
